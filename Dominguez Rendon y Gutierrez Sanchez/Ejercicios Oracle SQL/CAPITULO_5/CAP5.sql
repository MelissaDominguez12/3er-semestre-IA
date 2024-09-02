spool C:\Users\melis\OneDrive\Escritorio\Cap5.txt
REM  File:        CAP5.sql
REM  Description: Ejercicios del capitulo 5 del libro Oracle By Example
REM  Created:    Octubre 2023
REM  Tittle:     Date and Conversion Functions
REM ******************************************************************

PROMPT CAP 5 ORACLE BY EXAMPLE 
PROMPT SEPTIEMBRE 2023
PROMPT "EJERCICIO 1: LAB 5.1 a)"
REM (Rischert, 2010, 200)
SELECT course_no, section_id,
TO_CHAR(start_date_time, 'DD-MON-YYYY HH24:MI')
FROM section;

PROMPT "EJERCICIO 2: LAB 5.1 e)"
REM (Rischert, 2010, 200)
SELECT TO_CHAR(TO_DATE('31-DIC-1899', 'DD-MON-YYYY'),'Dy')
FROM dual;

PROMPT "EJERCICIO 3: LAB 5.2 c)"
REM (Rischert, 2010, 214)
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') "Current",
TO_CHAR(SYSDATE+3, 'DD-MON-YYYY HH24:MI:SS') "Answer"
FROM dual;

PROMPT "EJERCICIO 4: LAB 5.3 d)"
REM (Rischert, 2010, 229)
SELECT col_timestamp
FROM date_example
WHERE col_timestamp =
TO_TIMESTAMP('24-FEB-2009 04:25:32 PM',
'DD-MON-YYYY HH:MI:SS AM');

PROMPT "EJERCICIO 5: LAB 5.4 a)"
REM (Rischert, 2010, 289)
SELECT NUMTODSINTERVAL(360, 'SECOND'),
NUMTODSINTERVAL(360, 'MINUTE')
FROM dual;

PROMPT "EJERCICIO 6: LAB 5.5 c)"
REM (Rischert, 2010, 299)
SELECT zip, city
FROM zipcode
WHERE zip = TO_CHAR(10025);

PROMPT "FIN DE LA EJECUCION DE LOS EJERCICIOS DEL CAPITULO 4"

spool OFF
