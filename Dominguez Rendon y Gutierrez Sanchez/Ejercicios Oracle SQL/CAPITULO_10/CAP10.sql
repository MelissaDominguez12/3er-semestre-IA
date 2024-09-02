spool C:\Users\melis\OneDrive\Escritorio\CAP10.txt
REM  File:        CAP10.sql
REM  Description: Ejercicios del capitulo 10 del libro Oracle By Example
REM  Created:    Diciembre 2023
REM  Tittle:    Complex Joins
REM ******************************************************************

PROMPT CAP 10 ORACLE BY EXAMPLE 
PROMPT NOVIEMBRE 2023
PROMPT "EJERCICIO 1: LAB 10.1 a)"
REM (Rischert, 2010, 449)
SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c FULL OUTER JOIN section s
ON c.course_no = s.course_no;

PROMPT "EJERCICIO 2: LAB 10.1 c)"
REM (Rischert, 2010, 449)
SELECT c.course_no, c.description
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND s.course_no IS NULL;

PROMPT "EJERCICIO 3: LAB 10.1 e)"
REM (Rischert, 2010, 449)
SELECT course_no cou, description, cost,
location, last_name
FROM course LEFT OUTER JOIN section
USING (course_no)
LEFT OUTER JOIN instructor
USING (instructor_id)
ORDER BY course_no;

PROMPT "EJERCICIO 4: LAB 10.2 b)"
REM (Rischert, 2010, 4063)
SELECT DISTINCT a.student_id, a.first_name, a.salutation
FROM student a, student b
WHERE a.salutation <> b.salutation
AND a.first_name = b.first_name
AND a.student_id <> b.student_id
ORDER BY a.first_name;

PROMPT "EJERCICIO 5:LAB 10.2 c)"
REM (Rischert, 2010, 463)
SELECT DISTINCT a.student_id, a.last_name,
a.street_address
FROM student a, student b
WHERE a.street_address = b.street_address
AND a.zip = b.zip
AND a.student_id <> b.student_id
ORDER BY a.street_address;

PROMPT "EJERCICIO 6: LAB 10.2 d)"
REM (Rischert, 2010, 463)
SELECT c1.course_no,
SUBSTR(c1.description, 1,15) course_descr,
C1.prerequisite,
SUBSTR(c2.description,1,15) pre_req_descr
FROM course c1 LEFT OUTER JOIN course c2
ON c1.prerequisite = c2.course_no
ORDER BY 10;

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 10"

spool OFF
