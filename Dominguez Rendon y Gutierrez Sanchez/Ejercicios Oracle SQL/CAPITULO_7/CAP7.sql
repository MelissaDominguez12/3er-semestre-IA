spool C:\Users\melis\OneDrive\Escritorio\Cap7.txt
REM  File:        CAP7.sql
REM  Description: Ejercicios del capitulo 7 del libro Oracle By Example
REM  Created:    Octubre 2023
REM  Tittle:     Equijoins
REM ******************************************************************

PROMPT CAP 7 ORACLE BY EXAMPLE 
PROMPT OCTUBRE 2023
PROMPT "EJERCICIO 1: LAB 7.1 a)"
REM (Rischert, 2010, 294)
SELECT s.last_name, s.zip, z.state, z.city
FROM student s, zipcode z
WHERE s.zip = z.zip
ORDER BY s.zip;

PROMPT "EJERCICIO 2: LAB 7.1 b)"
REM (Rischert, 2010, 294)
SELECT DISTINCT s.first_name, s.last_name, s.student_id
FROM student s, enrollment e
WHERE s.student_id = e.student_id
ORDER BY s.last_name;

PROMPT "EJERCICIO 3: LAB 7.1 c)"
REM (Rischert, 2010, 294)
SELECT AVG(COALESCE(cost, 0))
FROM course;

PROMPT "EJERCICIO 4: LAB 7.2 c)"
REM (Rischert, 2010, 310)
SELECT s.student_id
FROM student s, enrollment e, zipcode z
WHERE s.student_id = e.student_id
AND s.zip = z.zip
AND z.state = 'CT';
PROMPT "EJERCICIO 5: LAB 7.2 e)"
REM (Rischert, 2010, 310)
SELECT student_id, course_no, numeric_grade
FROM student JOIN zipcode
USING (zip)
JOIN enrollment
USING (student_id)
JOIN section
USING (section_id)
JOIN grade g
USING (section_id, student_id)
WHERE course_no = 420
AND grade_type_code = 'FI'
AND state = 'CT';

PROMPT "EJERCICIO 6: LAB 7.2 f)"
REM (Rischert, 2010, 310)
SELECT g.student_id, g.section_id,
gw.percent_of_final_grade pct, g.grade_type_code,
g.numeric_grade grade, s.last_name
FROM grade_type_weight gw, grade g,
enrollment e, student s
WHERE g.grade_type_code = 'PJ'
AND gw.grade_type_code = g.grade_type_code
AND gw.section_id = g.section_id
AND g.numeric_grade <= 80
AND g.section_id = e.section_id
AND g.student_id = e.student_id
AND e.student_id = s.student_id
ORDER BY s.last_name;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 8"

spool OFF
