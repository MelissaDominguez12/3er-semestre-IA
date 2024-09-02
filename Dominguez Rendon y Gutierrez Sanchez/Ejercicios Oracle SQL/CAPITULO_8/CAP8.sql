spool C:\Users\melis\OneDrive\Escritorio\CAP8.txt

REM  File:        CAP8.sql
REM  Description: Ejercicios del capitulo 8 del libro Oracle By Example
REM  Created:    Noviembre 2023
REM  Tittle:    Subqueries
REM ******************************************************************

PROMPT CAP 8 ORACLE BY EXAMPLE 
PROMPT NOVIEMBRE 2023
PROMPT "EJERCICIO 1: LAB 8.1 c)"
REM (Rischert, 2010, 332)
SELECT course_no, SUM(capacity)
FROM section
GROUP BY course_no
HAVING SUM(capacity) <
(SELECT AVG(capacity)
FROM section);

PROMPT "EJERCICIO 2: LAB 8.2 b)"
REM (Rischert, 2010, 347)
SELECT e.section_id, COUNT(*), s.capacity
FROM enrollment e, section s
WHERE e.section_id = s.section_id
GROUP BY e.section_id, s.capacity
HAVING COUNT(*) > s.capacity;

PROMPT "EJERCICIO 3: LAB 8.2 c)"
REM (Rischert, 2010, 347)
SELECT COUNT(*)
FROM student s
WHERE EXISTS
(SELECT NULL
FROM enrollment
WHERE student_id = s.student_id);

PROMPT "EJERCICIO 4: LAB 8.3 c)"
REM (Rischert, 2010, 310)
SELECT COUNT(*) total_students, s.course_no
FROM enrollment e, section s
WHERE e.section_id = s.section_id
GROUP BY s.course_no;

SELECT SUM(capacity) total_capacity, course_no
FROM section
GROUP BY course_no;
PROMPT "EJERCICIO 5:
 LAB 8.4 b)"
REM (Rischert, 2010, 310)
SELECT student_id, section_id, grade_type_code,
MAX(numeric_grade) max, MIN(numeric_grade) min
FROM grade
WHERE student_id = 179
AND section_id = 116
AND grade_type_code IN ('HM', 'FI')
GROUP BY student_id, section_id, grade_type_code;

PROMPT "EJERCICIO 6: LAB 8.4 c)"
REM (Rischert, 2010, 310)
SELECT student_id, section_id, grade_type_code,
numeric_grade
FROM grade
WHERE student_id = 102
AND section_id = 86
AND grade_type_code IN ('HM', 'FI')
GROUP BY student_id, section_id, grade_type_code,
numeric_grade;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 8"

spool OFF