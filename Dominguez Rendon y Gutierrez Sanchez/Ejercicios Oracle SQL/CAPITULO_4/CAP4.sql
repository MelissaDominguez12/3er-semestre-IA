REM  File:        CAP4.sql
REM  Description: Ejercicios del capitulo 4 del libro Oracle By Example
REM  Created:    Septiembre 2023
REM ******************************************************************


spool C:\Users\melis\OneDrive\Escritorio\Cap4.txt
PROMPT CAP 4 ORACLE BY EXAMPLE 
PROMPT SEPTIEMBRE 2023
PROMPT "EJERCICIO 1: LAB 4.1 a)"
rem (Rischert, 2010, 190)
SELECT description "Description",
INITCAP(description) "Initcap Description"
FROM course
WHERE description LIKE '%SQL%';

PROMPT "EJERCICIO 2: LAB 4.1 b=f)"
rem (Rischert, 2010, 191)
SELECT TRANSLATE('555-1212', '0123456789',
'##########')
FROM dual;


PROMPT "EJERCICIO 3: LAB 4.2 a)"
rem (Rischert, 2010, 206)
SELECT 10.245, ROUND(10.245, 1), ROUND(10.245, -1)
FROM dual;

PROMPT "EJERCICIO 4: LAB 4.2 b)"
rem (Rischert, 2010, 206)
SELECT DISTINCT cost, cost*1.75, ROUND(cost*1.75)
FROM course;

PROMPT "EJERCICIO 5: LAB 4.3 a)"
rem (Rischert, 2010, 222)
SELECT first_name||' '|| last_name name,
phone oldphone,
NVL(phone, '212-555-1212') newphone
FROM student
WHERE phone IS NULL;

PROMPT "EJERCICIO 6: LAB 4.3 D)"
rem (Rischert, 2010, 169)
SELECT student_id, first_name||' '|| last_name name,
phone,
DECODE(phone, NULL, 'No phone# exists.', 'Phone# exists.')
"Get this result"
FROM student
WHERE student_id IN (111, 112)
ORDER BY 1 DESC;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 4"
spool off