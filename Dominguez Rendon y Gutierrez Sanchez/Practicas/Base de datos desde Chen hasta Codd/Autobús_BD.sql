--Crear usuario
 ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
 CREATE USER autobus IDENTIFIED by autobus
 DEFAULT TABLESPACE users
 TEMPORARY TABLESPACE temp;
 GRANT CONNECT, RESOURCE TO autobus;
 GRANT UNLIMITED TABLESPACE TO autobus;

--Ajustes de sistema
set linesize 300
set pagesize 50
set feddback on
set colsep ' ||' 
set null s/dato
clear screen
spool C:\Users\melis\OneDrive\Escritorio\Autobus.txt
--Cambiar idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE  = 'ENGLISH';

--Borrar tablas 
DROP TABLE AUTOBUS     CASCADE CONSTRAINTS;
DROP TABLE CONDUCTOR   CASCADE CONSTRAINTS;
DROP TABLE CONDU_AUTO  CASCADE CONSTRAINTS; 

--Crear tablas 
CREATE TABLE AUTOBUS(
	MATRICULA   VARCHAR2(6)  NOT NULL,
	LICENCIA    VARCHAR2(8)  NOT NULL,
	CATEGORIA   VARCHAR(1)   NOT NULL);

CREATE TABLE CONDUCTOR(
	NO_CARNET    NUMBER(4,0) NOT NULL,
	NOMBRE       VARCHAR(25) NOT NULL,
	EXPERIENCIA  NUMBER(2,0));

CREATE TABLE CONDU_AUTO(
	NO_CARNET    NUMBER(4,0) NOT NULL,
	MATRICULA    VARCHAR(6)  NOT NULL,
	TRAYECTO     VARCHAR(30) NOT NULL);

--Reestricciones PK 
ALTER TABLE AUTOBUS 
ADD CONSTRAINT PK_MATRICULA_AUTOBUS PRIMARY KEY (MATRICULA);

ALTER TABLE CONDUCTOR 
ADD CONSTRAINT PK_NO_CARNET_CONDUCTOR PRIMARY KEY(NO_CARNET);

ALTER TABLE CONDU_AUTO 
ADD CONSTRAINT PK_CARNET_MATRICULA_CONDU_AUTO PRIMARY KEY (NO_CARNET, MATRICULA);

--Restricciones FK
ALTER TABLE CONDU_AUTO
ADD CONSTRAINT FK_CARNET_CONDU_AUTO FOREIGN KEY (NO_CARNET) REFERENCES CONDUCTOR(NO_CARNET)
ADD CONSTRAINT FK_MATRICULA_CONDU_AUTO FOREIGN KEY (MATRICULA) REFERENCES AUTOBUS(MATRICULA);

--Restricciones CHECK 
ALTER TABLE AUTOBUS
	ADD CONSTRAINT CK_CATEGORIA CHECK ( CATEGORIA IN  ('A','B','C','D','F'));
 
--Insertar datos

INSERT INTO AUTOBUS VALUES ('123456','12345678','A');
INSERT INTO AUTOBUS VALUES ('123457','12345679','B');
INSERT INTO AUTOBUS VALUES ('123458','12345680','C');
INSERT INTO AUTOBUS VALUES ('123459','12345681','D');
INSERT INTO AUTOBUS VALUES ('123460','12345682','F');

INSERT INTO CONDUCTOR VALUES (1234,'MELISSA',2);
INSERT INTO CONDUCTOR VALUES (1235,'JUAN',3);
INSERT INTO CONDUCTOR VALUES (1236,'PEDRO',4);
INSERT INTO CONDUCTOR VALUES (1237,'MARIA',5);
INSERT INTO CONDUCTOR VALUES (1238,'JUANA',6);

INSERT INTO CONDU_AUTO VALUES (1234,'123456','SAN JOSE - CARTAGO');
INSERT INTO CONDU_AUTO VALUES (1235,'123457','SAN JOSE - HEREDIA');
INSERT INTO CONDU_AUTO VALUES (1236,'123458','SAN JOSE - ALAJUELA');
INSERT INTO CONDU_AUTO VALUES (1237,'123459','SAN JOSE - PUNTARENAS');
INSERT INTO CONDU_AUTO VALUES (1238,'123460','SAN JOSE - LIMON');

--Consultas
--1. Mostrar la matricula y la licencia de los autobuses que tengan categoria A o B
SELECT MATRICULA, LICENCIA FROM AUTOBUS WHERE CATEGORIA IN ('A','B');

--2. Mostrar el nombre y la experiencia de los conductores que tengan experiencia mayor a 3 años
SELECT NOMBRE, EXPERIENCIA FROM CONDUCTOR WHERE EXPERIENCIA > 3;

--3. Mostrar tablas
SELECT * FROM AUTOBUS;
SELECT * FROM CONDUCTOR;
SELECT * FROM CONDU_AUTO;

prompt USER CONSTRAINTS
COLUMN CONSTRAINT_NAME FORMAT A27
column table_name format a12
column owner format a9
select owner,table_name,constraint_name,constraint_type,
	deferrable,deferred
	from user_constraints
	where table_name IN ('AUTOBUS','CONDUCTOR', 'CONDU_AUTO')
	ORDER BY 4;

spool off