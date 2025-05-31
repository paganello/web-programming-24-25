-- Script per la configurazione del database PostgreSQL per Quiz Online

-- 1. Crea l'utente (se non esiste già)
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'quiz_user') THEN
      CREATE ROLE quiz_user WITH LOGIN PASSWORD '!*5633hH$rU7^t%65@J@';
   ELSE
      RAISE NOTICE 'Ruolo quiz_user già esistente.';
   END IF;
END
$$;

-- 2. Crea il database con encoding corretto e owner (se non esiste già)
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'quiz_online') THEN
      CREATE DATABASE quiz_online
          WITH 
          OWNER = quiz_user
          ENCODING = 'UTF8'
          LC_COLLATE = 'en_US.UTF-8'
          LC_CTYPE = 'en_US.UTF-8'
          TEMPLATE = template0;
      RAISE NOTICE 'Database quiz_online creato.';
   ELSE
      RAISE NOTICE 'Database quiz_online già esistente.';
      ALTER DATABASE quiz_online OWNER TO quiz_user;
      RAISE NOTICE 'Owner del database quiz_online impostato/confermato a quiz_user.';
   END IF;
END
$$;

-- 3. Garantisci privilegi aggiuntivi SUL DATABASE
GRANT ALL PRIVILEGES ON DATABASE quiz_online TO quiz_user;

-- Connettiti al database quiz_online per impostare i privilegi sugli schemi/tabelle
\c quiz_online;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO quiz_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO quiz_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO quiz_user;

GRANT USAGE ON SCHEMA public TO quiz_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO quiz_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO quiz_user;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO quiz_user;

RAISE NOTICE 'Privilegi concessi a quiz_user sul database quiz_online e schema public.';