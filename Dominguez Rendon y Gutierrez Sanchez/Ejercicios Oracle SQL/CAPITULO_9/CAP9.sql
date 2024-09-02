spool C:\Users\melis\OneDrive\Escritorio\CAP9.txt
REM  File:        CAP9.sql
REM  Description: Ejercicios del capitulo 10 del libro Oracle By Example
REM  Created:    Diciembre 2023
REM  Tittle:     Set Operators
REM ******************************************************************

PROMPT CAP 9 ORACLE BY EXAMPLE 
PROMPT NOVIEMBRE 2023
PROMPT "EJERCICIO 1: LAB 9.1 a)"
REM (Rischert, 2010, 424)
SELECT first_name, last_name,
'Instructor' "Type"
FROM instructor
UNION ALL
SELECT first_name, last_name,
'Student'
FROM student;

PROMPT "EJERCICIO 2: LAB 9.1 b)"
REM (Rischert, 2010, 424)
SELECT zip
FROM instructor
UNION
SELECT zip
FROM student;

PROMPT "EJERCICIO 3: LAB 9.1 d)"
REM (Rischert, 2010, 424)
SELECT course_no, description
FROM course
WHERE prerequisite IS NOT NULL
ORDER BY 1
UNION
SELECT course_no, description
FROM course
WHERE prerequisite IS NULL;

PROMPT "EJERCICIO 4: LAB 9.2 b)"
REM (Rischert, 2010, 436)
SELECT course_no, section_no, 'No Enrollments' "Status"
FROM section
MINUS
SELECT course_no, section_no, 'No Enrollments'
FROM section s
WHERE EXISTS (SELECT section_id
FROM enrollment e
WHERE e.section_id = s.section_id)
ORDER BY 1, 2;
PROMPT "EJERCICIO 5:
 LAB 9.2 c)"
REM (Rischert, 2010, 436)
SELECT zip
FROM instructor
INTERSECT
SELECT zip
FROM student;

PROMPT "EJERCICIO 6: LAB 9.2 d)"
REM (Rischert, 2010, 436)
SELECT student_id
FROM student
INTERSECT
SELECT student_id
FROM enrollment;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 9"

spool OFF
