rem script schema CLASE 11 
rem considere el esquema relacional de la figura 4.6
defina las restricciones de integridad referencial de not null 
rem  de borrado en cascada que ean necesarios y relice querys
rem que compueben su manipulación adecuada.
rem fuentes Elmasri & Navathe, 2010, fundamentals of 
rem Database Systems.
rem (elmasri & Navathe, 2010,113)

rem fuente de datos 
rem    Lab Manual 
rem DBMS Laboratory with miniproject
rem Mrs. Divya K S   assistant Profesor 
rem MS Engeneering College
REM PARA PODER CREAR UNA VISTA ES NECESARIO 
REM   HABERLE OTORGADO PRIVILEGIO DE
REM GRANT CREATE ANY VIEW.

rem elabore el esquema relacional que indique
rem las referencias de integridad referencial
rem  separe las restricciones de PK FY NNUL CHECH
REM EN EN SECCIONES INDEPENDIENTES.
REM DESPLIEGUE LAS TABLAS DEDICCIONARIO DE DATOS 
REM QUE HACEN REFERENCIAS A LAS 
REM   RESTRICCIONES, LAS COLUMNAS DE LAS RESTRICCIONES
REM LOS OBJETOS DE LAS RELACIONES.

drop table Publisher cascade cosntraints:
drop table book cascade constraints;
drop table book_authors cascade constraints;
drop table publisher cascade constraints;
drop table book_copies cascade constraints;
drop table book_loans cascade constraints;
drop table library_branch cascade constraints;
drop table borrower cascade constraints;

CREATE TABLE PUBLISHER
(NAME VARCHAR2 (20) PRIMARY KEY, 
PHONE INTEGER,
ADDRESS VARCHAR2 (20));

CREATE TABLE BOOK
(BOOK_ID INTEGER PRIMARY KEY, 
TITLE VARCHAR2 (20),
PUB_YEAR VARCHAR2 (20),
PUBLISHER_NAME REFERENCES PUBLISHER (NAME) ON DELETE CASCADE);

CREATE TABLE BOOK_AUTHORS 
(AUTHOR_NAME VARCHAR2 (20),
BOOK_ID REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
PRIMARY KEY (BOOK_ID, AUTHOR_NAME));


CREATE TABLE LIBRARY_BRANCH 
(BRANCH_ID INTEGER PRIMARY KEY, 
BRANCH_NAME VARCHAR2 (50),
ADDRESS VARCHAR2 (50));

CREATE TABLE BOOK_COPIES 
(NO_OF_COPIES INTEGER,
BOOK_ID REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
BRANCH_ID REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE 
CASCADE,
PRIMARY KEY (BOOK_ID, BRANCH_ID));

CREATE TABLE CARD
(CARD_NO INTEGER PRIMARY KEY);

CREATE TABLE BOOK_LENDING 
(DATE_OUT DATE,
DUE_DATE DATE,
BOOK_ID REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
BRANCH_ID REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE 
CASCADE,
CARD_NO REFERENCES CARD (CARD_NO) ON DELETE CASCADE, 
PRIMARY KEY (BOOK_ID, BRANCH_ID, CARD_NO));



select * from book:
select * from Book_authors;
select * from Publisher;
select * from bool_copies;
select * from book_lending;
select * from LIBRARY_BRANCH;


rem poblar tablas
rem poblar tabla Publisher

INSERT INTO PUBLISHER VALUES (‘MCGRAW-HILL’, 9989076587, ‘BANGALORE’); 
INSERT INTO PUBLISHER VALUES (‘PEARSON’, 9889076565, ‘NEWDELHI’);
INSERT INTO PUBLISHER VALUES (‘RANDOM HOUSE’, 7455679345, ‘HYDRABAD’);
INSERT INTO PUBLISHER VALUES (‘HACHETTE LIVRE’, 8970862340, ‘CHENAI’); 
INSERT INTO PUBLISHER VALUES (‘GRUPO PLANETA’, 7756120238, ‘BANGALORE’);

rem poblar table BOOK
INSERT INTO BOOK VALUES (1,’DBMS’,’JAN-2017’, ‘MCGRAW-HILL’); 
INSERT INTO BOOK VALUES (2,’ADBMS’,’JUN-2016’, ‘MCGRAW-HILL’); 
INSERT INTO BOOK VALUES (3,’CN’,’SEP-2016’, ‘PEARSON’);
INSERT INTO BOOK VALUES (4,’CG’,’SEP-2015’, ‘GRUPO PLANETA’); 
INSERT INTO BOOK VALUES (5,’OS’,’MAY-2016’, ‘PEARSON’);

rem poblar tabla book_authors;
INSERT INTO BOOK_AUTHORS VALUES (’NAVATHE’, 1); 
INSERT INTO BOOK_AUTHORS VALUES (’NAVATHE’, 2); 
INSERT INTO BOOK_AUTHORS VALUES (’TANENBAUM’, 3); 
INSERT INTO BOOK_AUTHORS VALUES (’EDWARD ANGEL’, 4); 
INSERT INTO BOOK_AUTHORS VALUES (’GALVIN’, 5);

rem poblar la tabla library_branch
INSERT INTO LIBRARY_BRANCH VALUES (10,’RR NAGAR’,’BANGALORE’); 
INSERT INTO LIBRARY_BRANCH VALUES (11,’RNSIT’,’BANGALORE’);
INSERT INTO LIBRARY_BRANCH VALUES (12,’RAJAJI NAGAR’, ’BANGALORE’); 
INSERT INTO LIBRARY_BRANCH VALUES (13,’NITTE’,’MANGALORE’);
INSERT INTO LIBRARY_BRANCH VALUES (14,’MANIPAL’,’UDUPI’);

rem poblar la tabla book_copies
INSERT INTO BOOK_COPIES VALUES (10, 1, 10);
INSERT INTO BOOK_COPIES VALUES (5, 1, 11);
INSERT INTO BOOK_COPIES VALUES (2, 2, 12);
INSERT INTO BOOK_COPIES VALUES (5, 2, 13);
INSERT INTO BOOK_COPIES VALUES (7, 3, 14);
INSERT INTO BOOK_COPIES VALUES (1, 5, 10);
INSERT INTO BOOK_COPIES VALUES (3, 4, 11);

rem poblar la tabla card 
INSERT INTO CARD VALUES (100); 
INSERT INTO CARD VALUES (101); 
INSERT INTO CARD VALUES (102); 
INSERT INTO CARD VALUES (103); 
INSERT INTO CARD VALUES (104);

rem poblar la tabla BOOK_LENDING
INSERT INTO BOOK_LENDING VALUES (’01-JAN-17’,’01-JUN-17’, 1, 10, 101);
INSERT INTO BOOK_LENDING VALUES (’11-JAN-17’,’11-MAR-17’, 3, 14, 101);
INSERT INTO BOOK_LENDING VALUES (’21-FEB-17’,’21-APR-17’, 2, 13, 101);
INSERT INTO BOOK_LENDING VALUES (’15-MAR-17’,’15-JUL-17’, 4, 11, 101);
INSERT INTO BOOK_LENDING VALUES (‘12-APR-17’,’12-MAY-17’, 1, 11, 104);

select * from book:
select * from Book_authors;
select * from Publisher;
select * from bool_copies;
select * from book_lending;
select * from LIBRARY_BRANCH;




rem consultas a la base de datos 
rem  Despliegue todos los detalles de los libros – id, title, name of publisher, authors, 
rem  number of copies in each branch, etc.
rem      Query  1.1
SELECT B.BOOK_ID, B.TITLE, B.PUBLISHER_NAME, A.AUTHOR_NAME, 
C.NO_OF_COPIES, L.BRANCH_ID
FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_BRANCH L 
WHERE B.BOOK_ID=A.BOOK_ID
AND B.BOOK_ID=C.BOOK_ID
AND L.BRANCH_ID=C.BRANCH_ID;

rem      Query  1.2
rem   despliegue las personas que han pedido prestado mas de tres libros.



SELECT CARD_NO 
FROM BOOK_LENDING
WHERE DATE_OUT BETWEEN ’01-JAN-2017’ AND ’01-JUL-2017’ 
GROUP BY CARD_NO
HAVING COUNT (*)>3;


rem query 2.1
rem  Delete a book in BOOK table. Update the contents of other tables to reflect this data 
rem       manipulation operation.

DELETE FROM BOOK 
WHERE BOOK_ID=3;


rem Query 3   Partition the BOOK table based on year of publication.
rem  Demonstrate its working with a 
rem     simple query.
CREATE VIEW V_PUBLICATION AS 
SELECT PUB_YEAR
FROM BOOK;

rem      Query  4 
rem        Create a view of all books and its number of copies 
rem        that are currently available in the 
rem         Library.

CREATE VIEW V_BOOKS AS
SELECT B.BOOK_ID, B.TITLE, C.NO_OF_COPIES
FROM BOOK B, BOOK_COPIES C, LIBRARY_BRANCH L
WHERE B.BOOK_ID=C.BOOK_ID 
AND C.BRANCH_ID=L.BRANCH_ID;



