spool C:\Users\melis\OneDrive\Escritorio\Carro.txt

--4ta forma normal: dependencias funcionales multivaluadas 

--Crear usuario
REM ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
REM CREATE USER carro IDENTIFIED by carro
REM DEFAULT TABLESPACE users
REM TEMPORARY TABLESPACE temp;
REM GRANT CONNECT, RESOURCE TO carro;
REM GRANT UNLIMITED TABLESPACE TO carro;
--Privilegio para crear vistas (tablas temporales)
REM GRANT CREATE ANY VIEW TO carro; 

--Ajustes del sistemas 
set linesize 300
set pagesize 90
set feedback on
set colsep ' ||' 
clear screen 

--Cambiar idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE  = 'ENGLISH';

-- Borrar las tablas existentes
DROP TABLE CARRO_INTERIORES_COLORES CASCADE CONSTRAINTS;
DROP TABLE CARRO_ADORNOS CASCADE CONSTRAINTS;
DROP TABLE INTERIORES_COLORES CASCADE CONSTRAINTS;
DROP TABLE ADORNOS CASCADE CONSTRAINTS;
DROP TABLE CARROS CASCADE CONSTRAINTS;
DROP TABLE MARCAS CASCADE CONSTRAINTS;

-- Crear tablas iniciales
CREATE TABLE CARROS (
   CAR VARCHAR2(10) PRIMARY KEY,
   MODELO VARCHAR2(10),
   MOTOR VARCHAR2(7),
   COLOR VARCHAR2(10)
);

CREATE TABLE MARCAS (
   MARCA VARCHAR2(10) PRIMARY KEY,
   PAIS_ORIGEN VARCHAR2(20)
);

CREATE TABLE ADORNOS (
   ADORNO VARCHAR2(10) PRIMARY KEY,
   DESCRIPCION VARCHAR2(50)
);

CREATE TABLE INTERIORES_COLORES (
   INTERIOR_COLOR VARCHAR2(10) PRIMARY KEY,
   TONO_DE_INTERIORES VARCHAR2(20)
);

-- Poblar tablas iniciales
INSERT INTO MARCAS VALUES ('Ford', 'USA');
INSERT INTO MARCAS VALUES ('Chrysler', 'USA');
INSERT INTO MARCAS VALUES ('Toyota', 'Japan');
INSERT INTO MARCAS VALUES ('Chevrolet', 'USA');
INSERT INTO MARCAS VALUES ('Honda', 'Japan');

INSERT INTO ADORNOS VALUES ('Dash', 'Front Dashboard Ornament');
INSERT INTO ADORNOS VALUES ('Panoramic', 'Panoramic Ornament');
INSERT INTO ADORNOS VALUES ('Venture', 'Venture Ornament');
INSERT INTO ADORNOS VALUES ('Classic', 'Classic Ornament');
INSERT INTO ADORNOS VALUES ('Luxury', 'Luxury Ornament');

INSERT INTO INTERIORES_COLORES VALUES ('Black', 'Deep Black');
INSERT INTO INTERIORES_COLORES VALUES ('White', 'Pure White');
INSERT INTO INTERIORES_COLORES VALUES ('Red', 'Cherry Red');
INSERT INTO INTERIORES_COLORES VALUES ('Blue', 'Light Blue');
INSERT INTO INTERIORES_COLORES VALUES ('Green', 'Grass Green');

INSERT INTO CARROS VALUES ('Mustang1', 'Model1', 'Engine1', 'Red');
INSERT INTO CARROS VALUES ('Mustang2', 'Model1', 'Engine1', 'Red');
INSERT INTO CARROS VALUES ('Mustang3', 'Model2', 'Engine2', 'Blue');
INSERT INTO CARROS VALUES ('Cirrus1', 'Model3', 'Engine3', 'Green');
INSERT INTO CARROS VALUES ('Cirrus2', 'Model3', 'Engine3', 'Green');
INSERT INTO CARROS VALUES ('Camry1', 'Model4', 'Engine4', 'Black');
INSERT INTO CARROS VALUES ('Cruze1', 'Model5', 'Engine5', 'White');
INSERT INTO CARROS VALUES ('Accord1', 'Model6', 'Engine6', 'Blue');
INSERT INTO CARROS VALUES ('Civic1', 'Model7', 'Engine7', 'Green');
INSERT INTO CARROS VALUES ('Camry2', 'Model8', 'Engine8', 'Red');

-- Crear tablas para reflejar la 4NF
CREATE TABLE CARRO_ADORNOS (
   CAR VARCHAR2(10),
   ADORNO VARCHAR2(10),
   PRIMARY KEY (CAR, ADORNO),
   FOREIGN KEY (CAR) REFERENCES CARROS(CAR),
   FOREIGN KEY (ADORNO) REFERENCES ADORNOS(ADORNO)
);

CREATE TABLE CARRO_INTERIORES_COLORES (
   CAR VARCHAR2(10),
   INTERIOR_COLOR VARCHAR2(10),
   PRIMARY KEY (CAR, INTERIOR_COLOR),
   FOREIGN KEY (CAR) REFERENCES CARROS(CAR),
   FOREIGN KEY (INTERIOR_COLOR) REFERENCES INTERIORES_COLORES(INTERIOR_COLOR)
);

-- Poblar tablas para reflejar la 4NF
INSERT INTO CARRO_ADORNOS VALUES ('Mustang1', 'Dash');
INSERT INTO CARRO_ADORNOS VALUES ('Mustang2', 'Panoramic');
INSERT INTO CARRO_ADORNOS VALUES ('Mustang3', 'Dash');
INSERT INTO CARRO_ADORNOS VALUES ('Cirrus1', 'Venture');
INSERT INTO CARRO_ADORNOS VALUES ('Cirrus2', 'Venture');
INSERT INTO CARRO_ADORNOS VALUES ('Camry1', 'Classic');
INSERT INTO CARRO_ADORNOS VALUES ('Cruze1', 'Luxury');
INSERT INTO CARRO_ADORNOS VALUES ('Accord1', 'Panoramic');
INSERT INTO CARRO_ADORNOS VALUES ('Civic1', 'Venture');
INSERT INTO CARRO_ADORNOS VALUES ('Camry2', 'Classic');¿

INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Mustang1', 'Black');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Mustang2', 'White');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Mustang3', 'Black');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Cirrus1', 'Brown');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Cirrus2', 'White');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Camry1', 'Red');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Cruze1', 'Blue');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Accord1', 'White');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Civic1', 'Black');
INSERT INTO CARRO_INTERIORES_COLORES VALUES ('Camry2', 'White');

-- Consultas interesantes
-- 1. Obtener todos los modelos de automóviles con sus adornos
SELECT c.MODELO, ca.ADORNO
FROM CARROS c
JOIN CARRO_ADORNOS ca ON c.CAR = ca.CAR;

-- 2. Encontrar los colores únicos de los interiores y la cantidad de automóviles asociados a cada color de interiores
SELECT INTERIOR_COLOR, COUNT(CAR) AS CANTIDAD_AUTOS
FROM CARRO_INTERIORES_COLORES
GROUP BY INTERIOR_COLOR;


-- 3. Encontrar los modelos de automóviles que tienen más de un adorno
SELECT c.MODELO
FROM CARROS c
JOIN CARRO_ADORNOS ca ON c.CAR = ca.CAR
GROUP BY c.MODELO
HAVING COUNT(ca.ADORNO) > 1;


-- 4. Listar todos los adornos junto con la descripción
SELECT ADORNO, DESCRIPCION
FROM ADORNOS;

-- Mostrar tablas
SELECT * FROM CARROS;
SELECT * FROM MARCAS;
SELECT * FROM ADORNOS;
SELECT * FROM INTERIORES_COLORES;

-- Consultas para reflejar la 4NF
SELECT * FROM CARRO_ADORNOS;
SELECT * FROM CARRO_INTERIORES_COLORES;

--MOSTRAR Restricciones
prompt USER CONSTRAINTS
COLUMN CONSTRAINT_NAME FORMAT A27
column table_name format a12
column owner format a9
SELECT owner, table_name, constraint_name, constraint_type, deferrable, deferred
FROM user_constraints
WHERE table_name IN ('CARROS','MARCAS','ADORNOS','INTERIORES_COLORES','CARRO_ADORNOS','CARRO_INTERIORES_COLORES')
ORDER BY 4;

spool off
