-- Crear base de datos para User Service
CREATE DATABASE userdb;

-- Crear base de datos para Product Service
CREATE DATABASE productdb;

-- Opcional: Conectar y crear extensiones si es necesario
\c userdb;
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c productdb;
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";