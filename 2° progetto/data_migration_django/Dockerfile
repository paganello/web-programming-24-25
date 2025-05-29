FROM python:3.11

# Aggiungi le librerie di sistema necessarie per psycopg 3
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && apt-get clean

# Copia i file del progetto
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
