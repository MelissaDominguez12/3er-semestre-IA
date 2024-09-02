spool C:\Users\melis\OneDrive\Escritorio\Cap6.txt
REM  File:        CAP6-DRM.sql
REM  Description: Ejercicios del capitulo 6 del libro Oracle By Example
REM  Created:    Octubre 2023
REM  Tittle:   Aggregate Functions,GROUP BY, and HAVING Clauses
REM ******************************************************************

PROMPT CAP 6 ORACLE BY EXAMPLE 
PROMPT SEPTIEMBRE 2023
PROMPT "EJERCICIO 1: LAB 6.1 a)"
REM (Rischert, 2010, 268)
SELECT COUNT(*)
FROM course
WHERE prerequisite IS NULL;

PROMPT "EJERCICIO 2: LAB 6.1 b)"
REM (Rischert, 2010, 268)
SELECT COUNT(DISTINCT student_id)
FROM enrollment;

PROMPT "EJERCICIO 3: LAB 6.1 c)"
REM (Rischert, 2010, 268)
SELECT AVG(COALESCE(cost, 0))
FROM course;

PROMPT "EJERCICIO 4: LAB 6.2 a)"
REM (Rischert, 2010, 278)
SELECT prerequisite, COUNT(*)
FROM course
GROUP BY prerequisite
ORDER BY prerequisite;

PROMPT "EJERCICIO 5: LAB 5.4 b)"
REM (Rischert, 2010, 278)
SELECT student_id, COUNT(*)
FROM enrollment
GROUP BY student_id
HAVING COUNT(*) > 2;

PROMPT "EJERCICIO 6: LAB 5.5 c)"
SELECT course_no "Course #",
AVG(capacity) "Avg. Capacity",
ROUND(AVG(capacity)) "Rounded Avg. Capacity"
FROM section
GROUP BY course_no;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 4"

spool OFF
