create database datasus;

CREATE USER datasus_user WITH PASSWORD '12345';

GRANT ALL PRIVILEGES ON DATABASE "datasus" to datasus_user;