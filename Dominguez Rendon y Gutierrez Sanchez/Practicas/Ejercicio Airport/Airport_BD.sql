
rem ************************************
rem file: AIRPORT_BD.sql
rem descripción: Base de datos de Aeropuerto
rem    creado el 20 de septiembre de 2023
rem     actualizado el 22 de septiembre de 2023
rem ************************************
prompt  ******************************
--Crear usuario
rem ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
rem CREATE USER aeromosa IDENTIFIED by aeromosa
rem DEFAULT TABLESPACE users
rem TEMPORARY TABLESPACE temp;
rem GRANT CONNECT, RESOURCE TO aeromosa;
rem GRANT UNLIMITED TABLESPACE TO aeromosa;
--Ajustes de sistema

spool C:\Users\melis\OneDrive\Escritorio\AIRPORT.txt

set linesize 300
set pagesize 90
set feddback on
set colsep ' ||' 
set null s/Registro
clear screen 


--Cambiar idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE  = 'ENGLISH';

--Borrar tablas 
DROP TABLE AIRPORT            CASCADE CONSTRAINTS;
DROP TABLE FLIGHT             CASCADE CONSTRAINTS;
DROP TABLE FLIGHT_LEG         CASCADE CONSTRAINTS;
DROP TABLE LEG_INSTANCE       CASCADE CONSTRAINTS;
DROP TABLE FARE               CASCADE CONSTRAINTS; 
DROP TABLE AIRPLANE_TYPE      CASCADE CONSTRAINTS; 
DROP TABLE CAN_LAND           CASCADE CONSTRAINTS;
DROP TABLE AIRPLANE           CASCADE CONSTRAINTS;
DROP TABLE SEAT_RESERVATION   CASCADE CONSTRAINTS; 

--Crear tablas
CREATE TABLE AIRPORT(
	AIRPORT_CODE      VARCHAR2(3),   
	AIRPORT_NAME      VARCHAR2(15),  
	CITY              VARCHAR2(10),  
	STATE             VARCHAR2(10) 
);

CREATE TABLE FLIGHT(
	FLIGHT_NUMBER     NUMBER(4,0),
	AIRLINE           VARCHAR2(10),   
	WEEKDAYS          VARCHAR2(10)  
);

CREATE TABLE FLIGHT_LEG(
	FLIGHT_NUMBER            NUMBER(4,0),   
	LEG_NUMBER               NUMBER(2,0),    
	DEPARTURE_AIRPORT_CODE   VARCHAR2(3),
	SCHEDULE_DEPARTURE_TIME  TIMESTAMP,
	ARRIVAL_AIRPORT_CODE     VARCHAR2(3), 
	SCHEDULE_ARRIVAL_TIME    TIMESTAMP
);

CREATE TABLE LEG_INSTANCE(
	FLIGHT_NUMBER           NUMBER(4,0),
	LEG_NUMBER              NUMBER(2,0),
	LEG_DATE                TIMESTAMP,
	NUMBER_OF_AVIABLE_SEATS NUMBER(4,0),
	AIRPLANE_ID             NUMBER(5,0),
	DEPARTURE_AIRPORT_CODE  VARCHAR2(3),
	DEPARTURE_TIME          TIMESTAMP,
	ARRIVAL_AIRPORT_CODE    VARCHAR2(3),
	ARRIVAL_TIME            TIMESTAMP
);

CREATE TABLE FARE(
	FLIGHT_NUMBER           NUMBER(4,0),
	FARE_CODE	            VARCHAR2(1),
	AMOUNT                  NUMBER(7,2),
	RESTRICTIONS            VARCHAR2(3)
);

CREATE TABLE AIRPLANE_TYPE(
	AIRPLANE_TYPE_NAME      VARCHAR2(5),
	MAX_SEATS               NUMBER(3,0),
	COMPANY                 VARCHAR2(2)
);

CREATE TABLE CAN_LAND(
	AIRPLANE_TYPE_NAME      VARCHAR2(5), 
	AIRPORT_CODE            VARCHAR2(3)
);

CREATE TABLE AIRPLANE(
	AIRPLANE_ID             NUMBER(5,0),
	TOTAL_NUMBER_OF_SEATS  NUMBER(3,0),
	AIRPLANE_TYPE          VARCHAR2(5)
);

CREATE TABLE SEAT_RESERVATION(
	FLIGHT_NUMBER          NUMBER(4,0),  
	LEG_NUMBER             NUMBER(2,0),
	LEG_DATE              TIMESTAMP,
	SEAT_NUMBER            VARCHAR2(4),
	CUSTOMER_NAME          VARCHAR2(18),
	CUSTOMER_PHONE         VARCHAR2(12)
);

--Restricciones NOT NULL
ALTER TABLE AIRPORT 
 	MODIFY(AIRPORT_CODE            CONSTRAINT NN_AIRPORT_CODE NOT NULL) 
 	MODIFY(AIRPORT_NAME                    CONSTRAINT NN_NAME NOT NULL)
 	MODIFY(CITY                    CONSTRAINT NN_CITY NOT NULL);

ALTER TABLE FLIGHT
	MODIFY(FLIGHT_NUMBER           CONSTRAINT NN_FLIGHT_NUMBER NOT NULL)
	MODIFY(AIRLINE                 CONSTRAINT NN_AIRLINE NOT NULL)
	MODIFY(WEEKDAYS                CONSTRAINT NN_WEEDAYS NOT NULL);

ALTER TABLE FLIGHT_LEG
	MODIFY(FLIGHT_NUMBER           CONSTRAINT NN1_FLIGHT_NUMBER NOT NULL)
	MODIFY(LEG_NUMBER              CONSTRAINT NN_LEG_NUMBER NOT NULL)
	MODIFY(DEPARTURE_AIRPORT_CODE  CONSTRAINT NN_DEPARTURE_AIRPORT_CODE NOT NULL)
	MODIFY(SCHEDULE_DEPARTURE_TIME CONSTRAINT NN_SCHEDULE_DEPARTURE_TIME NOT NULL)
	MODIFY(ARRIVAL_AIRPORT_CODE    CONSTRAINT NN_ARRIVAL_AIRPORT_CODE NOT NULL)
	MODIFY(SCHEDULE_ARRIVAL_TIME   CONSTRAINT NN_SCHEDULE_ARRIVAL_TIME NOT NULL);

ALTER TABLE LEG_INSTANCE
	MODIFY(FLIGHT_NUMBER           CONSTRAINT NN2_FLIGHT_NUMBER NOT NULL)
	MODIFY(LEG_NUMBER              CONSTRAINT NN1_LEG_NUMBER NOT NULL)
	MODIFY(LEG_DATE                CONSTRAINT NN_LEG_DATE NOT NULL)
	MODIFY(NUMBER_OF_AVIABLE_SEATS CONSTRAINT NN_NUMBER_AVIABLE_SEATS NOT NULL)
	MODIFY(AIRPLANE_ID             CONSTRAINT NN_AIRPLANE_ID NOT NULL)
	MODIFY(DEPARTURE_AIRPORT_CODE  CONSTRAINT NN1_DEPARTURE_AIRPORT_CODE NOT NULL)
	MODIFY(DEPARTURE_TIME          CONSTRAINT NN_DEPARTURE_TIME NOT NULL)
	MODIFY(ARRIVAL_AIRPORT_CODE    CONSTRAINT NN1_ARRIVAL_AIRPORT_CODE NOT NULL)
	MODIFY(ARRIVAL_TIME            CONSTRAINT NN_ARRIVAL_TIME NOT NULL);

ALTER TABLE FARE 
	MODIFY(FLIGHT_NUMBER           CONSTRAINT NN3_FLIGHT_NUMBER NOT NULL)
	MODIFY(FARE_CODE               CONSTRAINT NN_FARE_CODE NOT NULL)
	MODIFY(AMOUNT                  CONSTRAINT NN_AMOUNT NOT NULL)
	MODIFY(RESTRICTIONS            CONSTRAINT NN_RESTRICTIONS NOT NULL);

ALTER TABLE AIRPLANE_TYPE
	MODIFY(AIRPLANE_TYPE_NAME      CONSTRAINT NN_AIRPLANE_TYPE_NAME NOT NULL)
	MODIFY(MAX_SEATS               CONSTRAINT NN_MAX_SEATS NOT NULL)
	MODIFY(COMPANY                 CONSTRAINT NN_COMPANY NOT NULL);

ALTER TABLE CAN_LAND
	MODIFY(AIRPLANE_TYPE_NAME       CONSTRAINT NNATN_AIRPLANE_TYPE_NAME NOT NULL)
	MODIFY(AIRPORT_CODE            CONSTRAINT NN1_AIRPORT_CODE NOT NULL);

ALTER TABLE AIRPLANE 
	MODIFY(AIRPLANE_ID             CONSTRAINT NN1_AIRPLANE_ID NOT NULL)
	MODIFY(TOTAL_NUMBER_OF_SEATS   CONSTRAINT NN_TOTAL_NUMBER_OF_SEATS NOT NULL)
	MODIFY(AIRPLANE_TYPE           CONSTRAINT NN_AIRPLANE_TYPE NOT NULL);

ALTER TABLE SEAT_RESERVATION 
	MODIFY(FLIGHT_NUMBER           CONSTRAINT NN4_FLIGHT_NUMBER NOT NULL)
	MODIFY(LEG_NUMBER              CONSTRAINT NN2_LEG_NUMBER NOT NULL)
	MODIFY(LEG_DATE               CONSTRAINT NN_SEAT_DATE NOT NULL)
	MODIFY(SEAT_NUMBER             CONSTRAINT NN_SEAT_NUMBER NOT NULL)
	MODIFY(CUSTOMER_PHONE          CONSTRAINT NN_CUSTOMER_PHONE NOT NULL);

--Restricciones PK 

ALTER TABLE AIRPORT 
	ADD CONSTRAINT PK_AIRPORT PRIMARY KEY (AIRPORT_CODE);

ALTER TABLE FLIGHT
	ADD CONSTRAINT PK_FLIGHT PRIMARY KEY (FLIGHT_NUMBER);

ALTER TABLE FLIGHT_LEG
	ADD CONSTRAINT PK_FLIGHT_LEG PRIMARY KEY (FLIGHT_NUMBER, LEG_NUMBER);

ALTER TABLE LEG_INSTANCE
	ADD CONSTRAINT PK_LEG_INSTANCE PRIMARY KEY (FLIGHT_NUMBER, LEG_NUMBER, LEG_DATE);

ALTER TABLE FARE	
	ADD CONSTRAINT PK_FARE PRIMARY KEY (FLIGHT_NUMBER, FARE_CODE);

ALTER TABLE AIRPLANE_TYPE
	ADD CONSTRAINT PK_AIRPLANE_TYPE PRIMARY KEY (AIRPLANE_TYPE_NAME);

ALTER TABLE CAN_LAND
	ADD CONSTRAINT PK_CAN_LAND PRIMARY KEY (AIRPLANE_TYPE_NAME, AIRPORT_CODE);

ALTER TABLE AIRPLANE
	ADD CONSTRAINT PK_AIRPLANE PRIMARY KEY (AIRPLANE_ID);

ALTER TABLE SEAT_RESERVATION
	ADD CONSTRAINT PK_SEAT_RESERVATION PRIMARY KEY (FLIGHT_NUMBER, LEG_NUMBER, LEG_DATE, SEAT_NUMBER);

--Restricciones FK

ALTER TABLE FLIGHT_LEG
	ADD CONSTRAINT FK_FLIGHT_LEG FOREIGN KEY (FLIGHT_NUMBER) REFERENCES FLIGHT(FLIGHT_NUMBER)
	ADD CONSTRAINT FK_FLIGHT_LEG1 FOREIGN KEY (DEPARTURE_AIRPORT_CODE) REFERENCES AIRPORT(AIRPORT_CODE)
	ADD CONSTRAINT FK_FLIGHT_LEG2 FOREIGN KEY (ARRIVAL_AIRPORT_CODE) REFERENCES AIRPORT(AIRPORT_CODE)
	;

ALTER TABLE LEG_INSTANCE
	ADD CONSTRAINT FK_LEG_INSTANCE FOREIGN KEY (FLIGHT_NUMBER) REFERENCES FLIGHT(FLIGHT_NUMBER)
	ADD CONSTRAINT FK_LEG_INSTANCE2 FOREIGN KEY (DEPARTURE_AIRPORT_CODE) REFERENCES AIRPORT(AIRPORT_CODE)
	ADD CONSTRAINT FK_LEG_INSTANCE3 FOREIGN KEY (ARRIVAL_AIRPORT_CODE) REFERENCES AIRPORT(AIRPORT_CODE)
	ADD CONSTRAINT FK_LEG_INSTANCE4 FOREIGN KEY (FLIGHT_NUMBER, LEG_NUMBER) REFERENCES FLIGHT_LEG(FLIGHT_NUMBER, LEG_NUMBER);

ALTER TABLE FARE
	ADD CONSTRAINT FK_FARE FOREIGN KEY (FLIGHT_NUMBER) REFERENCES FLIGHT(FLIGHT_NUMBER);


ALTER TABLE CAN_LAND
	ADD CONSTRAINT FK_CAN_LAND FOREIGN KEY (AIRPLANE_TYPE_NAME) REFERENCES AIRPLANE_TYPE(AIRPLANE_TYPE_NAME)
	ADD CONSTRAINT FK_CAN_LAND1 FOREIGN KEY (AIRPORT_CODE) REFERENCES AIRPORT(AIRPORT_CODE);

ALTER TABLE AIRPLANE
	ADD CONSTRAINT FK_AIRPLANE FOREIGN KEY (AIRPLANE_TYPE) REFERENCES AIRPLANE_TYPE(AIRPLANE_TYPE_NAME);


--Restricciones CHECK

ALTER TABLE AIRPORT
	ADD CONSTRAINT CK_AIRPORT CHECK ( AIRPORT_CODE IN  ('MEX','MTY','JFK','YHU','YYZ'));


--POBLAR TABLAS

--AIRPORT
INSERT INTO AIRPORT VALUES ('MEX','MEXICO CITY','MEXICO','MEXICO');
INSERT INTO AIRPORT VALUES ('MTY','MONTERREY','MEXICO','MEXICO');
INSERT INTO AIRPORT VALUES ('JFK','NEW YORK','NEW YORK','USA');
INSERT INTO AIRPORT VALUES ('YYZ','TORONTO','ONTARIO','CANADA');
INSERT INTO AIRPORT VALUES ('YHU','MONTREAL','QUEBEC','CANADA');

--FLIGHT
INSERT INTO FLIGHT VALUES (1001,'AEROMEXICO','MONDAY');
INSERT INTO FLIGHT VALUES (1002,'AEROMEXICO','TUESDAY');
INSERT INTO FLIGHT VALUES (1003,'VOLARIS','WEDNESDAY');
INSERT INTO FLIGHT VALUES (1004,'VOLARIS','THURSDAY');
INSERT INTO FLIGHT VALUES (1005,'DELTA','FRIDAY');
INSERT INTO FLIGHT VALUES (1006,'DELTA','SATURDAY');
INSERT INTO FLIGHT VALUES (1007,'AIR CANADA','SUNDAY');
INSERT INTO FLIGHT VALUES (2001,'AIR CANADA','MONDAY');
INSERT INTO FLIGHT VALUES (2002,'AIR CANADA','TUESDAY');
INSERT INTO FLIGHT VALUES (2003,'AIR CANADA','WEDNESDAY');

--FLIGHT_LEG
INSERT INTO FLIGHT_LEG VALUES (1001,12,'MEX',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (1002,13,'MTY',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'JFK',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (1003,14,'MEX',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (1004,15,'MTY',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'JFK',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (1005,16,'JFK',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (1006,17,'JFK',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MEX',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (1007,18,'YHU',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (2001,19,'YHU',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (2002,20,'YYZ',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO FLIGHT_LEG VALUES (2003,21,'YYZ',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));


--LEG_INSTANCE

INSERT INTO LEG_INSTANCE VALUES (1001,12,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),10,12345,'MEX',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (1002,13,TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),25,12346,'MTY',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'JFK',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (1003,14,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),60,12329,'MEX',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (1004,15,TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),75,22123,'MTY',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'JFK',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (1005,16,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),40,09871,'JFK',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (1006,17,TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),60,32765,'JFK',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MEX',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (1007,18,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),50,96341,'YHU',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (2001,19,TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),55,12964,'YHU',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (2002,20,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),56,73178,'YYZ',TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 09:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO LEG_INSTANCE VALUES (2003,21,TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),43,54203,'YYZ',TO_TIMESTAMP('2023-09-20 10:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'MTY',TO_TIMESTAMP('2023-09-20 13:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'));

--FARE
INSERT INTO FARE VALUES (1001,'A',1000,'NOR');
INSERT INTO FARE VALUES (1002,'B',2000,'NOR');
INSERT INTO FARE VALUES (1003,'C',3000,'NOR');
INSERT INTO FARE VALUES (1004,'D',4000,'NOR');
INSERT INTO FARE VALUES (1005,'E',5000,'NOR');
INSERT INTO FARE VALUES (1006,'F',6000,'NOR');
INSERT INTO FARE VALUES (1007,'G',7000,'NOR');
INSERT INTO FARE VALUES (2001,'H',8000,'NOR');
INSERT INTO FARE VALUES (2002,'I',9000,'NOR');
INSERT INTO FARE VALUES (2003,'J',10000,'NOR');

--AIRPLANE_TYPE
INSERT INTO AIRPLANE_TYPE VALUES ('A320',100,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('A330',200,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('A340',300,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('B737',100,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('B747',200,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('B757',300,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('B767',100,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('B777',200,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('B787',300,'AM');
INSERT INTO AIRPLANE_TYPE VALUES ('A32',100,'AC');

--CAN_LAND
INSERT INTO CAN_LAND VALUES ('A320','MEX');
INSERT INTO CAN_LAND VALUES ('A330','MEX');
INSERT INTO CAN_LAND VALUES ('A340','MEX');
INSERT INTO CAN_LAND VALUES ('B737','MEX');
INSERT INTO CAN_LAND VALUES ('B747','MEX');
INSERT INTO CAN_LAND VALUES ('B757','MEX');
INSERT INTO CAN_LAND VALUES ('B767','MEX');
INSERT INTO CAN_LAND VALUES ('B777','MEX');
INSERT INTO CAN_LAND VALUES ('B787','MEX');
INSERT INTO CAN_LAND VALUES ('A320','MTY');

--AIRPLANE
INSERT INTO AIRPLANE VALUES (12345,100,'A320');
INSERT INTO AIRPLANE VALUES (12346,200,'A330');
INSERT INTO AIRPLANE VALUES (12329,300,'A340');
INSERT INTO AIRPLANE VALUES (22123,100,'B737');
INSERT INTO AIRPLANE VALUES (09871,200,'B747');
INSERT INTO AIRPLANE VALUES (32765,300,'B757');
INSERT INTO AIRPLANE VALUES (96341,100,'B767');
INSERT INTO AIRPLANE VALUES (12964,200,'B777');
INSERT INTO AIRPLANE VALUES (73178,300,'B787');
INSERT INTO AIRPLANE VALUES (54203,100,'A320');

--SEAT_RESERVATION
INSERT INTO SEAT_RESERVATION VALUES (1001,12,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'1A','JUAN PEREZ','5534667890');
INSERT INTO SEAT_RESERVATION VALUES (1001,13,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'1B','MARIA LOPEZ','5555555555');
INSERT INTO SEAT_RESERVATION VALUES (1001,14,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'1C','JOSE GARCIA','5512334387');
INSERT INTO SEAT_RESERVATION VALUES (1001,15,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'1D','IVAN MENDOZA','5522317658');
INSERT INTO SEAT_RESERVATION VALUES (1001,16,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'2A','MARILU SANCHEZ','5544765789');
INSERT INTO SEAT_RESERVATION VALUES (1001,16,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'2B','JIMENA LUNA','5534567890');
INSERT INTO SEAT_RESERVATION VALUES (1001,17,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'2C','JAMES JHONS','5598237645');
INSERT INTO SEAT_RESERVATION VALUES (1001,18,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'2D','HAILEY RICH','5534667890');
INSERT INTO SEAT_RESERVATION VALUES (1001,19,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'3A','LILA MENDEZ','5534663890');
INSERT INTO SEAT_RESERVATION VALUES (1001,20,TO_TIMESTAMP('2023-09-20 08:00:00.000000000','YYYY-MM-DD HH24:MI:SS.FF'),'3B','JUAN PEREZ','5534667890');


--Mostrar tablas
SELECT * FROM AIRPORT;
SELECT * FROM FLIGHT;
SELECT * FROM FLIGHT_LEG;
SELECT * FROM LEG_INSTANCE;
SELECT * FROM FARE;
SELECT * FROM AIRPLANE_TYPE;
SELECT * FROM CAN_LAND;
SELECT * FROM AIRPLANE;
SELECT * FROM SEAT_RESERVATION;


--SELECT * FROM USER_CONSTRAINTS;
	prompt USER_OBJECTS
REM ***********************
REM DESPLEGAR OBJETOS
REM ***********************
COL OBJECT_NAME FORMAT A25
COL OBJECT__TYPE FORMAT A12
COL OBJECT_ID   FORMAT 99,999	
SELECT OBJECT_NAME, OBJECT_TYPE, OBJECT_ID
	FROM USER_OBJECTS
	WHERE OBJECT_NAME IN ('AIRPORT','FLIGHT', 'FLIGHT_LEG', 'LEG_INSTANCE', 'FARE', 'AIRPLANE_TYPE', 'CAN_LAND', 'AIRPLANE', 'SEAT_RESERVATION')
	ORDER BY 2,1;

	prompt USER_TAB_COLUMNS
REM ***********************
REM DESPLEGAR USER_CONS_COLUMNS
REM ***********************
COLUMN     OWNER FORMAT A10
COLUMN     CONSTRAINT_NAME FORMAT A27
COLUMN     TABLE_NAME   FORMAT A12
COLUMN     COLUMN_NAME  FORMAT A18
COLUMN     POSITION     FORMAT 99
SELECT OWNER, CONSTRAINT_NAME, TABLE_NAME,
	COLUMN_NAME, POSITION
	FROM USER_CONS_COLUMNS
	WHERE TABLE_NAME IN ('AIRPORT','FLIGHT', 'FLIGHT_LEG', 'LEG_INSTANCE', 'FARE', 'AIRPLANE_TYPE', 'CAN_LAND', 'AIRPLANE', 'SEAT_RESERVATION'));




REM ***********************
REM DESPLEGAR USER_CONSTRAINTS
REM ***********************

prompt USER CONSTRAINTS
COLUMN CONSTRAINT_NAME FORMAT A27
column table_name format a12
column owner format a9
select owner,table_name,constraint_name,constraint_type,
	deferrable,deferred
	from user_constraints
	where table_name IN ('AIRPORT','FLIGHT', 'FLIGHT_LEG', 'LEG_INSTANCE', 'FARE', 'AIRPLANE_TYPE', 'CAN_LAND', 'AIRPLANE', 'SEAT_RESERVATION')
	ORDER BY 4;


 spool off