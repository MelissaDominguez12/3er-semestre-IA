

--Crear usuario
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
-- CREATE USER autobus2 IDENTIFIED by autobus2
-- DEFAULT TABLESPACE users
-- TEMPORARY TABLESPACE temp;
-- GRANT CONNECT, RESOURCE TO autobus2;
-- GRANT UNLIMITED TABLESPACE TO autobus2;
--Ajustes de sistema
set linesize 300
set pagesize 50
set feddback on
set colsep ' ||' 
set null s/dato
clear screen

--Cambiar idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE  = 'ENGLISH';
spool C:\Users\melis\OneDrive\Escritorio\Autobus2.txt
--Borrar tablas 
DROP TABLE AUTOBUS      CASCADE CONSTRAINTS;
DROP TABLE CONDUCTOR    CASCADE CONSTRAINTS;
DROP TABLE LUGAR        CASCADE CONSTRAINTS;
DROP TABLE AUT_CON_LUG  CASCADE CONSTRAINTS;

--Crear tablas 
CREATE TABLE AUTOBUS(
	MATRICULA    VARCHAR2(6)  NOT NULL,
	LICENCIA     VARCHAR2(8)  NOT NULL,
	CATEGORIA    VARCHAR(1)   NOT NULL);

CREATE TABLE CONDUCTOR(
	NO_CARNET    NUMBER(4,0) NOT NULL,
	NOMBRE       VARCHAR(25) NOT NULL,
	EXPERIENCIA  NUMBER(2,0));

CREATE TABLE LUGAR(
	CIUDAD       VARCHAR2(15) NOT NULL, 
	SITIO        VARCHAR(15)  NOT NULL,
	ACTIVIDAD    VARCHAR(15));

CREATE TABLE AUT_CON_LUG(
	NO_CARNET    NUMBER(4,0)  NOT NULL,
	MATRICULA    VARCHAR2(6)  NOT NULL,
	CIUDAD       VARCHAR2(15) NOT NULL,
	SITIO        VARCHAR(15)  NOT NULL,
	FECHA        TIMESTAMP    NOT NULL);

--Restricciones PK 
ALTER TABLE AUTOBUS 
ADD CONSTRAINT PK_MATRICULA_AUTOBUS PRIMARY KEY (MATRICULA);

ALTER TABLE CONDUCTOR 
ADD CONSTRAINT PK_NO_CARNET_CONDUCTOR PRIMARY KEY(NO_CARNET);

ALTER TABLE LUGAR 
ADD CONSTRAINT PK_CIUDAD_SITIO_LUGAR PRIMARY KEY(CIUDAD, SITIO);

ALTER TABLE AUT_CON_LUG
ADD CONSTRAINT PK_NO_CARNET_MATRICULA_CIUDAD_SITIO_AUT_CON_LUG PRIMARY KEY (NO_CARNET, MATRICULA, CIUDAD, SITIO);

--Restricciones FK
ALTER TABLE AUT_CON_LUG
ADD CONSTRAINT FK_NO_CARNET_AUT_CON_LUG FOREIGN KEY (NO_CARNET) REFERENCES CONDUCTOR(NO_CARNET)
ADD CONSTRAINT FK_MATRICULA_AUT_CON_LUG FOREIGN KEY (MATRICULA) REFERENCES AUTOBUS(MATRICULA)
ADD CONSTRAINT FK_CIUDAD_SITIO_AUT_CON_LUG FOREIGN KEY (CIUDAD,SITIO) REFERENCES LUGAR(CIUDAD,SITIO);

--Restricciones CHECK 
ALTER TABLE AUTOBUS
	ADD CONSTRAINT CK_CATEGORIA CHECK ( CATEGORIA IN  ('A','B','C','D','F'));

--INSERTAR DATOS
INSERT INTO AUTOBUS VALUES ('123456','12345678','A');
INSERT INTO AUTOBUS VALUES ('654321','87654321','B');
INSERT INTO AUTOBUS VALUES ('654123','12345678','C');
INSERT INTO AUTOBUS VALUES ('321654','87654321','D');
INSERT INTO AUTOBUS VALUES ('321456','12345678','F');

INSERT INTO CONDUCTOR VALUES (1234,'MELISSA',2);
INSERT INTO CONDUCTOR VALUES (4321,'JUAN',7);
INSERT INTO CONDUCTOR VALUES (1234,'MARIA',4);
INSERT INTO CONDUCTOR VALUES (4321,'JOSE',3);
INSERT INTO CONDUCTOR VALUES (1238,'PEDRO',8);

INSERT INTO LUGAR VALUES ('SAN JOSE','CARTAGO','CASA');
INSERT INTO LUGAR VALUES ('SAN JOSE','ALAJUELA','TRABAJO');
INSERT INTO LUGAR VALUES ('SAN JOSE','HEREDIA','UNIVERSIDAD');
INSERT INTO LUGAR VALUES ('SAN JOSE','SAN JOSE','CASA');
INSERT INTO LUGAR VALUES ('SAN JOSE','SAN JOSE','TRABAJO');

INSERT INTO AUT_CON_LUG VALUES (1234,'123456','SAN JOSE','CARTAGO',TO_TIMESTAMP('2020-10-10 10:10:10.123456','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO AUT_CON_LUG VALUES (4321,'654321','SAN JOSE','ALAJUELA',TO_TIMESTAMP('2020-10-10 10:10:10.123456','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO AUT_CON_LUG VALUES (1234,'654123','SAN JOSE','HEREDIA',TO_TIMESTAMP('2020-10-10 10:10:10.123456','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO AUT_CON_LUG VALUES (4321,'321654','SAN JOSE','SAN JOSE',TO_TIMESTAMP('2020-10-10 10:10:10.123456','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO AUT_CON_LUG VALUES (1238,'321456','SAN JOSE','SAN JOSE',TO_TIMESTAMP('2020-10-10 10:10:10.123456','YYYY-MM-DD HH24:MI:SS.FF'));

--CONSULTAS
--1. Mostrar la matricula y la licencia de los autobuses que tengan categoria A o B
SELECT MATRICULA, LICENCIA FROM AUTOBUS WHERE CATEGORIA IN ('A','B');




--Mostrar tablas
SELECT * FROM AUTOBUS;
SELECT * FROM CONDUCTOR;
SELECT * FROM LUGAR;

prompt USER CONSTRAINTS
COLUMN CONSTRAINT_NAME FORMAT A27
column table_name format a12
column owner format a9
select owner,table_name,constraint_name,constraint_type,
	deferrable,deferred
	from user_constraints
	where table_name IN ('AUTOBUS','CONDUCTOR', 'LUGAR', 'AUT_CON_LUG')
	ORDER BY 4;

spool off 






