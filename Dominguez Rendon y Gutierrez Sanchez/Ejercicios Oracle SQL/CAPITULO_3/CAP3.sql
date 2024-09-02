REM ******************************************************************
REM  File:        CAP3.sql
REM  Description: Ejercicios del capitulo 3 del libro Oracle By Example
REM  Created:    Septiembre 2023
REM ******************************************************************


spool C:\Users\melis\OneDrive\Escritorio\Cap3.txt

PROMPT "CAP TRES ORACLE BY EXAMPLE "
PROMPT "SEPTIEMBRE 2023" 
PROMPT "EJERCICIO 1: LAB 3.1 a)"
rem (Rischert, 2010, 154)
SELECT last_name
FROM student
WHERE zip IN ('10048', '11102', '11209');

PROMPT "EJERCICIO 2: LAB 3.1 b)"
rem (Rischert, 2010, 154)
SELECT first_name, last_name
FROM instructor
WHERE (last_name LIKE '%i%' OR last_name LIKE '%I%')
AND zip = '10025';


PROMPT "EJERCICIO 3: LAB 3.1 g)"
rem (Rischert, 2010, 155)
SELECT DISTINCT cost
FROM course
WHERE prerequisite IS NULL;

PROMPT "EJERCICIO 4: LAB 3.2 a)"
rem (Rischert, 2010, 169)
SELECT city, zip
FROM zipcode
WHERE state = 'NY'
OR state = 'CT'
ORDER BY zip;

PROMPT "EJERCICIO 5: LAB 3.2 b)"
rem (Rischert, 2010, 169)
SELECT description, prerequisite
FROM course
WHERE prerequisite IS NOT NULL
ORDER BY description;

PROMPT "EJERCICIO 6: LAB 3.2 c)"
rem (Rischert, 2010, 169)
SELECT salutation, first_name, last_name
FROM student
WHERE last_name = 'Grant'
ORDER BY salutation DESC, first_name ASC;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 3"
spool off