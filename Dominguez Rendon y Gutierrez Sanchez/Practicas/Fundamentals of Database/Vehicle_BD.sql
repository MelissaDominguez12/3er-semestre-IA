

--Natural grant, toma las dos tablas combina las columnas que se llamen igual 

--Crear usuario
--ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
--CREATE USER vehicle IDENTIFIED by vehicle
--DEFAULT TABLESPACE users
--TEMPORARY TABLESPACE temp;
--GRANT CONNECT, RESOURCE TO vehicle;
--GRANT UNLIMITED TABLESPACE TO vehicle;

--Ajustes de sistema
set linesize 300
set pagesize 50
set feddback on
set colsep ' ||' 
set null s/dato
clear screen
spool C:\Users\melis\OneDrive\Escritorio\Vehicle.txt
--Cambiar idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE  = 'ENGLISH';

--Borrar tablas 
DROP TABLE VEHICLE CASCADE CONSTRAINTS;
DROP TABLE CAR     CASCADE CONSTRAINTS;
DROP TABLE TRUCK   CASCADE CONSTRAINTS; 

--Crear tablas 

CREATE TABLE VEHICLE(
	VEHICLE_ID        VARCHAR2(8)   NOT NULL,
	PRICE             NUMBER(7,0)   NOT NULL,
	LICENSE_PLATE_NO  VARCHAR2(7)   NOT NULL);


CREATE TABLE CAR(
	MAX_SPEED         NUMBER(4,0)   NOT NULL, 
	NO_OF_PASSENGERS  NUMBER(2,0)   NOT NULL,
    VEHICLE_ID        VARCHAR(8)    NOT NULL);

CREATE TABLE TRUCK(
	NO_OF_AXLES       NUMBER(1,0)   NOT NULL,
	TONNAGE           NUMBER(4,0)   NOT NULL,
	VEHICLE_ID        VARCHAR(8)    NOT NULL);

--Restricciones PK 
ALTER TABLE VEHICLE 
	ADD CONSTRAINT PK_VEHICLE_ID_VEHICLE PRIMARY KEY (VEHICLE_ID);

ALTER TABLE CAR 
	ADD CONSTRAINT PK_VEHICLE_ID_CAR PRIMARY KEY (VEHICLE_ID);

ALTER TABLE TRUCK 
	ADD CONSTRAINT PK_VEHICLE_ID_TRUCK PRIMARY KEY (VEHICLE_ID);


--Restricciones FK 
ALTER TABLE CAR
ADD CONSTRAINT FK_VEHICLE_ID_CAR FOREIGN KEY (VEHICLE_ID) REFERENCES VEHICLE(VEHICLE_ID);

ALTER TABLE TRUCK 
ADD CONSTRAINT FK_VEHICLE_ID_TRUCK FOREIGN KEY (VEHICLE_ID) REFERENCES VEHICLE(VEHICLE_ID);


--Restricciones CHECK 
ALTER TABLE CAR 
ADD CONSTRAINT CK_MAX_SPEED CHECK (MAX_SPEED<200);

ALTER TABLE TRUCK 
ADD CONSTRAINT CK_NO_OF_AXLES CHECK (NO_OF_AXLES<6);

ALTER TABLE VEHICLE
ADD CONSTRAINT CK_PRICE CHECK (PRICE<1000000);

--Poblar tablas

INSERT INTO VEHICLE VALUES ('VEH-001', 100000, 'ABC-123');
INSERT INTO VEHICLE VALUES ('VEH-002', 200000, 'DEF-456');
INSERT INTO VEHICLE VALUES ('VEH-003', 300000, 'GHI-789');
INSERT INTO VEHICLE VALUES ('VEH-004', 400000, 'JKL-012');
INSERT INTO VEHICLE VALUES ('VEH-005', 500000, 'MNO-345');
INSERT INTO VEHICLE VALUES ('VEH-006', 600000, 'PQR-678');
INSERT INTO VEHICLE VALUES ('VEH-007', 700000, 'STU-901');
INSERT INTO VEHICLE VALUES ('VEH-008', 800000, 'VWX-234');
INSERT INTO VEHICLE VALUES ('VEH-009', 900000, 'YZA-567');
INSERT INTO VEHICLE VALUES ('VEH-010', 1000000, 'BCD-890');

INSERT INTO CAR VALUES (180, 2, 'VEH-001');
INSERT INTO CAR VALUES (220, 5, 'VEH-002');
INSERT INTO CAR VALUES (140, 2, 'VEH-003');
INSERT INTO CAR VALUES (130, 5, 'VEH-004');
INSERT INTO CAR VALUES (170, 5, 'VEH-005');

INSERT INTO TRUCK VALUES (2, 1000, 'VEH-006');
INSERT INTO TRUCK VALUES (3, 2000, 'VEH-007');
INSERT INTO TRUCK VALUES (4, 3000, 'VEH-008');
INSERT INTO TRUCK VALUES (5, 4000, 'VEH-009');
INSERT INTO TRUCK VALUES (6, 5000, 'VEH-010');

--Desplegar tablas
SELECT * FROM VEHICLE;
SELECT * FROM CAR;
SELECT * FROM TRUCK;

--Natural Join 
SELECT VEHICLE_ID, PRICE PRECIO, LICENSE_PLATE_NO PLACA,MAX_SPEED VELMAX,NO_OF_PASSENGERS PASAJEROS FROM VEHICLE NATURAL JOIN CAR;
SELECT VEHICLE_ID, PRICE PRECIO, LICENSE_PLATE_NO PLACA, NO_OF_AXLES EJES, TONNAGE TONELAJE FROM VEHICLE NATURAL JOIN TRUCK;

--MOSTRAR EL PRECIO DE LOS CARROS
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-001';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-002';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-003';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-004';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-005';

--MOSTRAR EL PRECIO DE LOS CAMIONES
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-006';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-007';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-008';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-009';
SELECT PRICE FROM VEHICLE WHERE VEHICLE_ID='VEH-010';

--MOSTRAR EL PRECIO DE LOS CARROS


--COLUMNAS DE USUARIO
SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE,DATA_TYPE_MOD,DATA_LENGTH,DATA_PRECISION,
DATA_SCALE,NULLABLE,COLUMN_ID
FROM USER_TAB_COLUMNS
ORDER BY 3;

--MOSTRAR Restricciones
prompt USER CONSTRAINTS
COLUMN CONSTRAINT_NAME FORMAT A27
column table_name format a12
column owner format a9
select owner,table_name,constraint_name,constraint_type,
	deferrable,deferred
	from user_constraints
	where table_name IN ('VEHICLE','CAR', 'TRUCK')
	ORDER BY 4;
	
spool off

















