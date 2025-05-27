# importer/views.py
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.db import transaction
from .models import User, Quiz, Question, Answer, Participation, UserQuizAnswer
from .serializers import (
    UserImportSerializer, QuizImportSerializer, QuestionImportSerializer,
    AnswerImportSerializer, ParticipationImportSerializer, UserQuizAnswerImportSerializer
)

# Mappe per ID originali -> nuovi ID Django PK
# User: original_id (nomeUtente) -> username (PK Django) -> non serve mappa se usiamo username direttamente
# Quiz: original_id (codice) -> quiz.pk (Django)
# Question: (original_quiz_id_fk, original_numero_domanda) -> question.pk (Django)
# Answer: (original_quiz_id_fk, original_domanda_numero_fk, original_numero_risposta) -> answer.pk (Django)
# Participation: original_id (codice) -> participation.pk (Django)
original_to_django_pk_map = {
    'quizzes': {},
    'questions': {},
    'answers': {},
    'participations': {},
}

class BaseImportView(APIView):
    serializer_class = None
    model_class = None

    def post(self, request, *args, **kwargs):
        data_list = request.data
        if not isinstance(data_list, list): data_list = [data_list]
        
        created_count = 0
        errors = []

        with transaction.atomic():
            for item_data_raw in data_list:
                item_data = item_data_raw.copy()
                
                # --- Gestione specifica per ogni modello ---
                # Qui dovrai mappare gli ID originali ricevuti dal JSON
                # ai campi corretti del modello Django (campi 'original_*' e FK Django)
                # e popolare la mappa original_to_django_pk_map.
                # Questa parte è specifica per ogni vista figlia.
                # Per brevità, la logica di mapping FK è omessa qui ma deve essere implementata
                # nelle viste figlie o in un metodo helper chiamato da esse.

                # Esempio concettuale di come una vista figlia potrebbe preparare i dati:
                # transformed_item_data = self.prepare_item_data(item_data.copy())
                # if transformed_item_data is None: # Errore nella preparazione
                #     errors.append(f"Error preparing data for: {item_data_raw}")
                #     continue
                # serializer = self.serializer_class(data=transformed_item_data)

                # Per questa risposta, assumeremo che `prepare_item_data` sia fatto nella vista figlia.
                # La logica di `prepare_item_data` è cruciale.

                serializer = self.serializer_class(data=item_data) # item_data deve essere già trasformato!

                if serializer.is_valid():
                    try:
                        instance = serializer.save()
                        created_count += 1
                        # Popola la mappa ID per l'istanza creata (logica in vista figlia)
                        # self.update_id_map(instance, item_data_raw)
                    except Exception as e:
                        errors.append(f"Save Error: {str(e)} for data {item_data_raw} (processed: {item_data})")
                else:
                    errors.append(f"Validation Error: {serializer.errors} for data {item_data_raw} (processed: {item_data})")
        
        if errors:
            return Response({'message': f'Importazione parziale. Creati: {created_count}. Errori:', 'errors': errors}, status=status.HTTP_400_BAD_REQUEST)
        return Response({'message': f'Importati {created_count} oggetti.'}, status=status.HTTP_201_CREATED)

# --- Viste Figlie (Devi implementare la logica di preparazione e mapping!) ---

class UserImportView(BaseImportView):
    serializer_class = UserImportSerializer
    def post(self, request, *args, **kwargs):
        # Dati da PHP: {'original_id': nomeUtente, 'nome': ..., 'cognome': ..., 'eMail': ...}
        # Modello Django: {'username': nomeUtente, 'nome': ..., 'cognome': ..., 'email': ...}
        data_list = request.data if isinstance(request.data, list) else [request.data]
        prepared_data_list = []
        for item in data_list:
            prepared_data_list.append({
                'username': item.get('original_id'), # nomeUtente
                'nome': item.get('nome'),
                'cognome': item.get('cognome'),
                'email': item.get('eMail'),
            })
        # Sovrascrivi request.data con i dati preparati per il BaseImportView.post
        request._data = prepared_data_list 
        return super().post(request, *args, **kwargs)

class QuizImportView(BaseImportView):
    serializer_class = QuizImportSerializer
    def post(self, request, *args, **kwargs):
        # Dati da PHP: {'original_id': codice_quiz, 'titolo': ..., 'creatore_original_id': nomeUtente_creatore}
        # Modello Django: {'original_id': codice_quiz, 'titolo': ..., 'creatore': User_instance}
        data_list = request.data if isinstance(request.data, list) else [request.data]
        prepared_data_list = []
        current_errors = []
        for item in data_list:
            try:
                # creatore_id nel modello Django si aspetta il username (PK di User)
                prepared_data_list.append({
                    'original_id': item.get('original_id'),
                    'titolo': item.get('titolo'),
                    'dataInizio': item.get('dataInizio'),
                    'dataFine': item.get('dataFine'),
                    'creatore': item.get('creatore_original_id'), # Django gestirà questo per FK a User.username
                })
            except Exception as e:
                current_errors.append(f"Error preparing Quiz data {item}: {str(e)}")
        
        if current_errors: # Se ci sono errori qui, non chiamare super()
             return Response({'message': 'Errori nella preparazione dati Quiz.', 'errors': current_errors}, status=status.HTTP_400_BAD_REQUEST)

        request._data = prepared_data_list
        # Dopo che super().post() ha salvato, aggiorna la mappa
        response = super().post(request, *args, **kwargs)
        if response.status_code == status.HTTP_201_CREATED: # o comunque successo
            with transaction.atomic(): # Assicurati che la lettura sia consistente
                for item in prepared_data_list: # Usa i dati preparati
                    if item.get('original_id') is not None:
                        try:
                            quiz_instance = Quiz.objects.get(original_id=item['original_id'])
                            original_to_django_pk_map['quizzes'][item['original_id']] = quiz_instance.pk
                        except Quiz.DoesNotExist:
                             # Questo non dovrebbe accadere se super().post() ha avuto successo
                            pass
        return response


class QuestionImportView(BaseImportView):
    serializer_class = QuestionImportSerializer
    def post(self, request, *args, **kwargs):
        # PHP: {'quiz_original_id': ..., 'numero_originale_domanda': ..., 'testo': ...}
        # Django: {'original_quiz_id_fk': ..., 'original_numero_domanda': ..., 'testo': ..., 'quiz': quiz_django_pk}
        data_list = request.data if isinstance(request.data, list) else [request.data]
        prepared_data_list = []
        current_errors = []
        for item in data_list:
            orig_quiz_id = item.get('quiz_original_id')
            django_quiz_pk = original_to_django_pk_map['quizzes'].get(int(orig_quiz_id))
            if not django_quiz_pk:
                current_errors.append(f"Question: Quiz Django PK not found for original Quiz ID {orig_quiz_id}")
                continue
            prepared_data_list.append({
                'original_quiz_id_fk': orig_quiz_id,
                'original_numero_domanda': item.get('numero_originale_domanda'),
                'testo': item.get('testo'),
                'quiz': django_quiz_pk,
            })
        
        if current_errors and not prepared_data_list: # Se tutti gli item hanno errori di FK
             return Response({'message': 'Errori nella preparazione dati Question (FKs).', 'errors': current_errors}, status=status.HTTP_400_BAD_REQUEST)
        elif current_errors and prepared_data_list: # Alcuni errori, ma procedi con quelli validi
             # Potresti voler loggare current_errors qui
             pass

        request._data = prepared_data_list
        response = super().post(request, *args, **kwargs)
        if response.status_code == status.HTTP_201_CREATED:
            with transaction.atomic():
                for item in prepared_data_list:
                    # Ricostruisci la chiave originale per la mappa
                    original_key = (item['original_quiz_id_fk'], item['original_numero_domanda'])
                    try:
                        # Trova l'istanza basata sui campi originali e il quiz_id Django
                        q_instance = Question.objects.get(
                            original_quiz_id_fk=item['original_quiz_id_fk'],
                            original_numero_domanda=item['original_numero_domanda'],
                            quiz_id=item['quiz'] # quiz_id è il PK Django del quiz
                        )
                        original_to_django_pk_map['questions'][original_key] = q_instance.pk
                    except Question.DoesNotExist:
                        pass # Log error
        return response

# ... Implementa AnswerImportView, ParticipationImportView, UserQuizAnswerImportView in modo simile ...
# Per AnswerImportView, dovrai cercare la PK di Question usando la mappa 'questions'.
# Per ParticipationImportView, cerca la PK di Quiz e User.
# Per UserQuizAnswerImportView, cerca la PK di Participation e Answer.

# Esempio per AnswerImportView (parte della preparazione dati)
# django_question_pk = original_to_django_pk_map['questions'].get(
#     (item.get('quiz_original_id'), item.get('domanda_original_numero'))
# )

class ClearIdMapView(APIView):
    def post(self, request, *args, **kwargs):
        global original_to_django_pk_map
        for key in original_to_django_pk_map:
            original_to_django_pk_map[key] = {}
        return Response({"message": "ID map cleared."}, status=status.HTTP_200_OK)