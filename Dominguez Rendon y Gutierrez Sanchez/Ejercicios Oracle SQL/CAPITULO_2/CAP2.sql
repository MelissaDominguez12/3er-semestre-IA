REM ******************************************************************
REM  File:        CAP2.sql
REM  Description: Ejercicios del capitulo 2 del libro Oracle By Example
REM  Created:    Septiembre 2023
REM ******************************************************************


spool C:\Users\melis\OneDrive\Escritorio\Cap2.txt
PROMPT  CAP UNO

PROMPT "Ejercicio 1"
rem (Rischert,2010,131)
 SELECT description
	FROM course;
PROMPT "Ejercicio 2"	
rem (Rischert, 2010, 131)
SELECT description
 FROM course;
 set colsep "| * |" 
col description format a36
col cost format 9999.99
col course_no format 9999
col prerequisite 9999

SELECT description, cost, course_no, prerequisite
 FROM course;
 
 set pagesize 99
 set linesize 250

PROMPT "Ejercicio 3"
rem (Rischert, 2010, 146)
SELECT first_name, last_name, phone
FROM instructor
WHERE last_name = 'Schorin';

PROMPT "Ejercicio 4"
rem (Rischert, 2010, 150)
SELECT description, cost
FROM course
WHERE cost >= 1195;

PROMPT "Ejercicio 5"
rem (Rischert, 2010, 148)
rem THE LIKE OPERATOR
SELECT first_name, last_name, phone
FROM instructor
WHERE last_name LIKE 'S%';


PROMPT "Ejercicio 6"
rem (Rischert, 2010, 148)
SELECT first_name, last_name
FROM instructor
WHERE last_name LIKE '_o%';


PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 2"
spool off