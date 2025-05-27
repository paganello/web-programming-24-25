# importer/views.py
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import User, Quiz, Question, Answer, Participation, UserQuizAnswer # Aggiungi tutti i modelli
from .serializers import (
    UserImportSerializer, QuizImportSerializer, QuestionImportSerializer,
    AnswerImportSerializer, ParticipationImportSerializer, UserQuizAnswerImportSerializer # Aggiungi tutti i serializer
)
from django.db import transaction # Per importazioni atomiche

# Mappa per recuperare gli ID originali di MySQL e trovare i corrispondenti ID di Django
# Questo è fondamentale per gestire le Foreign Keys
# Dovrai popolarle man mano che importi le entità "padre"
original_to_django_ids = {
    'users': {}, # original_mysql_user_id -> django_user_pk
    'quizzes': {}, # original_mysql_quiz_id -> django_quiz_pk
    'questions': {}, # original_mysql_question_id -> django_question_pk
    'answers': {}, # original_mysql_answer_id -> django_answer_pk
    'participations': {} # original_mysql_participation_id -> django_participation_pk
}


class BaseImportView(APIView):
    serializer_class = None
    model_class = None
    id_map_key = None # es. 'users', 'quizzes'
    foreign_key_fields = {} # es. {'creator': 'users', 'quiz': 'quizzes'}

    def post(self, request, *args, **kwargs):
        data_list = request.data
        if not isinstance(data_list, list):
            data_list = [data_list]

        created_count = 0
        errors = []

        with transaction.atomic(): # Assicura che tutti gli inserimenti abbiano successo o nessuno
            for item_data in data_list:
                # Mappa gli ID originali delle foreign key ai nuovi ID di Django
                processed_item_data = item_data.copy()
                original_item_id = processed_item_data.pop('id', None) # L'ID originale da MySQL

                for fk_field, map_key_of_related_model in self.foreign_key_fields.items():
                    original_fk_id = processed_item_data.get(fk_field + '_id') # Aspettati es. creator_id
                    if original_fk_id:
                        django_fk_pk = original_to_django_ids[map_key_of_related_model].get(int(original_fk_id))
                        if django_fk_pk:
                            processed_item_data[fk_field + '_id'] = django_fk_pk # Ora punta all'ID Django
                        else:
                            errors.append(f"FK Error: Could not find Django PK for {map_key_of_related_model} with original ID {original_fk_id} for item {original_item_id}")
                            continue # Salta questo item o gestisci l'errore diversamente

                # Aggiungi l'ID originale al record di Django per tracciamento
                if original_item_id:
                     processed_item_data['original_id'] = original_item_id

                serializer = self.serializer_class(data=processed_item_data)
                if serializer.is_valid():
                    try:
                        instance = serializer.save()
                        if self.id_map_key and original_item_id:
                            original_to_django_ids[self.id_map_key][int(original_item_id)] = instance.pk
                        created_count += 1
                    except Exception as e:
                        errors.append(f"Error saving item {original_item_id}: {str(e)} - Data: {processed_item_data}")
                else:
                    errors.append(f"Validation Error for item {original_item_id}: {serializer.errors} - Data: {processed_item_data}")
        
        if errors:
            # Se ci sono errori, potresti voler fare un rollback se @transaction.atomic() è a livello di vista
            # o semplicemente reportare gli errori.
            return Response({'message': f'Importazione parziale. Creati: {created_count}. Errori:', 'errors': errors}, status=status.HTTP_400_BAD_REQUEST)

        return Response({'message': f'Importati {created_count} oggetti.', 'id_map': original_to_django_ids.get(self.id_map_key, {})}, status=status.HTTP_201_CREATED)


class UserImportView(BaseImportView):
    serializer_class = UserImportSerializer
    model_class = User
    id_map_key = 'users'
    # Gli utenti di solito non hanno FK verso altre tabelle del quiz in questo contesto semplice

class QuizImportView(BaseImportView):
    serializer_class = QuizImportSerializer
    model_class = Quiz
    id_map_key = 'quizzes'
    foreign_key_fields = {'creator': 'users'} # 'creator' (modello Django) si aspetta un ID da 'users' (mappa ID)

class QuestionImportView(BaseImportView):
    serializer_class = QuestionImportSerializer
    model_class = Question
    id_map_key = 'questions'
    foreign_key_fields = {'quiz': 'quizzes'}

class AnswerImportView(BaseImportView):
    serializer_class = AnswerImportSerializer
    model_class = Answer
    id_map_key = 'answers'
    foreign_key_fields = {'question': 'questions'}

class ParticipationImportView(BaseImportView):
    serializer_class = ParticipationImportSerializer
    model_class = Participation
    id_map_key = 'participations'
    foreign_key_fields = {'user': 'users', 'quiz': 'quizzes'}

class UserQuizAnswerImportView(BaseImportView):
    serializer_class = UserQuizAnswerImportSerializer
    model_class = UserQuizAnswer
    # Non serve id_map_key se non ci sono altre tabelle che dipendono da questa
    foreign_key_fields = {
        'participation': 'participations',
        'question': 'questions',
        'chosen_answer': 'answers'
    }

# Vista per pulire la mappa degli ID (utile se riesegui la migrazione)
class ClearIdMapView(APIView):
    def post(self, request, *args, **kwargs):
        global original_to_django_ids
        original_to_django_ids = {key: {} for key in original_to_django_ids}
        return Response({"message": "ID map cleared."}, status=status.HTTP_200_OK)