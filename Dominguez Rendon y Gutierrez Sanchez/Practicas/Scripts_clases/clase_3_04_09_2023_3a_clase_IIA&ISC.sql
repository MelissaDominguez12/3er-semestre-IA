--ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
 --CREATE USER clases IDENTIFIED by bases
 --DEFAULT TABLESPACE users
 --TEMPORARY TABLESPACE temp;
 --GRANT CONNECT, RESOURCE TO clases;
 --GRANT UNLIMITED TABLESPACE TO clases;
spool C:\Users\ssali\salida.txt
rem (Rischert,2010,131)
 SELECT description
	FROM course;
	
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
 
rem (Rischert, 2010, 135)
 COL cost FORMAT $9,999.99
SELECT DISTINCT cost
FROM course;

rem (Rischert, 2010, 146)
SELECT first_name, last_name, phone
FROM instructor
WHERE last_name = 'Schorin';

rem (Rischert, 2010, 146)
SELECT first_name, last_name, phone
FROM instructor
WHERE last_name = 'schorin';

rem (Rischert, 2010, 146)
SELECT first_name, last_name, phone
FROM instructor
WHERE last_name <> 'Schorin';

rem (Rischert, 2010, 150)
SELECT description, cost
FROM course
WHERE cost >= 1195;

rem (Rischert, 2010, 147)
rem THE BETWEEN OPERATOR
rem The BETWEEN operator tests for a range of values.
SELECT description, cost
FROM course
WHERE cost BETWEEN 1000 AND 1100;

rem (Rischert, 2010, 148)
rem THE LIKE OPERATOR
SELECT first_name, last_name, phone
FROM instructor
WHERE last_name LIKE 'S%';

rem (Rischert, 2010, 148)
SELECT first_name, last_name
FROM instructor
WHERE last_name LIKE '_o%';


rem (Rischert, 2010, 149)
rem THE IS NULL AND IS NOT NULL OPERATORS
SELECT description, prerequisite
FROM course
WHERE prerequisite IS NULL;

rem Logical Operators
rem (Rischert, 2010, 149)
SELECT description, cost
FROM course
WHERE cost > 1095
AND description LIKE 'I%';

rem (Rischert, 2010, 151)
rem PRECEDENCE OF LOGICAL OPERATORS
SELECT description, cost, prerequisite
FROM course
WHERE cost = 1195
AND prerequisite = 20
OR prerequisite = 25;

rem (Rischert, 2010, 151)
SELECT description, cost, prerequisite
FROM course
WHERE cost = 1195
AND (prerequisite = 20
OR prerequisite = 25);

rem (Rischert, 2010, 157)
rem BETWEEN AND TEXT LITERALS
SELECT student_id, last_name
FROM student
WHERE last_name BETWEEN 'W' AND 'Z';

rem (Rischert, 2010, 157)
SELECT last_name, student_id
FROM student
WHERE ROWNUM <= 10;

rem (Rischert, 2010, 161)
rem (Rischert, 2010, 157)
SELECT course_no, description
FROM course
WHERE prerequisite IS NULL
ORDER BY description;
rem (Rischert, 2010, 161)
rem orden descendente
SELECT course_no, description
FROM course
WHERE prerequisite IS NULL
ORDER BY description DESC;

rem NULLS FIRST AND NULLS LAST
SELECT DISTINCT cost
FROM course
ORDER BY cost;

rem (Rischert, 2010, 163)
SELECT DISTINCT cost
FROM course
ORDER BY cost;


rem (Rischert, 2010, 163)
SELECT DISTINCT cost
FROM course
ORDER BY cost NULLS FIRST;

rem (Rischert, 2010, 165)
SELECT first_name first,
first_name "First Name",
first_name AS "First"
FROM student
WHERE zip = '10025';


rem (Rischert, 2010, 165)
rem You can use the column alias 
rem to order by a specific column.

SELECT first_name first, first_name "First Name",
first_name AS "First"
FROM student
WHERE zip = '10025'
ORDER BY "First Name"

rem (Rischert, 2010, 165)
SELECT city, zip
FROM zipcode
WHERE state = 'NY'
OR state = 'CT'
ORDER BY zip;

spool off

