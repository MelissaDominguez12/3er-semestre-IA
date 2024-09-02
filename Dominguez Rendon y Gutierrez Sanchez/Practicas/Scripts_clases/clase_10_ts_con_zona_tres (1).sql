rem tipos de datos TIMESTAMP
SET PAGESIZE 99;
SET LINESIZE 150;
COL PARAMETER FORMAT A29;
COL VALUE     FORMAT A29;

SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
     ORDER BY 1;
/*
select to_char(sysdate, "fmday dd/Mon/yyyy HH:MI:SSFXX TZR")  fecha
from dual;
*/

select systimestamp from dual;
select dump(systimestamp) from dual;


DROP TABLE DATE_EXAMPLE_2;
CREATE TABLE date_example_2
  ( col_timestamp_w_tz tIMESTAMP WITH TIME ZONE
   );
   
INSERT INTO date_example_2
VALUES
  ( TO_TIMESTAMP_TZ('19-SEP-2023 16:25:32.0000000 -5:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'));
INSERT INTO date_example_2
VALUES
  ( TO_TIMESTAMP_TZ('20-SEP-2023 16:25:32.0000000 -5:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'));
INSERT INTO date_example_2
VALUES
  ( TO_TIMESTAMP_TZ('21-SEP-2023 16:25:32.0000000 -5:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'));
INSERT INTO date_example_2
VALUES
  ( TO_TIMESTAMP_TZ('22-SEP-2023 16:25:32.0000000 -5:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'));
INSERT INTO date_example_2
VALUES
  ( TO_TIMESTAMP_TZ('23-SEP-2023 16:25:32.0000000 -5:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'));
  
  
COMMIT;
col tz1 format a40
SELECT * FROM DATE_EXAMPLE_2;
col tz1 format a40
SELECT col_timestamp_w_tz tz1 FROM DATE_EXAMPLE_2;

SELECT col_timestamp_w_tz
FROM date_example_2
WHERE col_timestamp_w_tz >
TO_TIMESTAMP_TZ('24-FEB-2009 16:25:32 -05:00',
'DD-MON-YYYY HH24:MI:SS TZH:TZM');

SELECT col_timestamp_w_tz
FROM date_example
WHERE col_timestamp_w_tz >
TO_TIMESTAdesc v$timezone_names;
set colsep '|*|'
col tzname format a35
col tzabbrev format a35
SELECT tzname,tzabbrev
FROM v$timezone_names
where tzname like 'Mexico%';
MP_TZ('24-FEB-2009 16:25:32 EST',
'DD-MON-YYYY HH24:MI:SS TZR');

SELECT col_timestamp_w_tz,
(SYSTIMESTAMP - col_timestamp_w_tz) DAY(4) TO SECOND
"Interval Day to Second"
FROM date_example_2;


col col_timestamp_w_tz format a34
col tz_region   format a10
col tz_abbr     format a6
SELECT col_timestamp_w_tz,
EXTRACT(TIMEZONE_HOUR FROM col_timestamp_w_tz) tz_hour,
EXTRACT(TIMEZONE_MINUTE FROM col_timestamp_w_tz) tz_min,
EXTRACT(TIMEZONE_REGION FROM col_timestamp_w_tz) tz_region,
EXTRACT(TIMEZONE_ABBR FROM col_timestamp_w_tz) tz_abbr
FROM date_example_2;


SELECT col_timestamp_w_tz,
EXTRACT(YEAR FROM col_timestamp_w_tz) year,
EXTRACT(MONTH FROM col_timestamp_w_tz) month,
EXTRACT(DAY FROM col_timestamp_w_tz) day,
EXTRACT(HOUR FROM col_timestamp_w_tz) hour,
EXTRACT(MINUTE FROM col_timestamp_w_tz) min,
EXTRACT(SECOND FROM col_timestamp_w_tz) sec
FROM date_example_2;

SELECT 
EXTRACT(HOUR FROM TIMESTAMP   '2023-02-11 15:48:01.123') hour,
EXTRACT(MINUTE FROM TIMESTAMP '2023-02-11 15:48:01.123') minute,
EXTRACT(SECOND FROM TIMESTAMP '2023-02-11 15:48:01.123') second,
EXTRACT(YEAR FROM TIMESTAMP   '2023-02-11 15:48:01.123') year,
EXTRACT(MONTH FROM TIMESTAMP  '2023-02-11 15:48:01.123') month,
EXTRACT(DAY FROM TIMESTAMP    '2029-02-11 15:48:01.123') day
FROM dual;


select sys_extract_utc(timestamp '2023-03-8 11:30:00.00')
	FROM DUAL;
	
select sys_extract_utc(SYSTIMESTAMP)
	FROM DUAL;
	
select SYSTIMESTAMP - sys_extract_utc(SYSTIMESTAMP)
	FROM DUAL;

DESC v$TIMEZONE_NAMES

COL TZNAME FORMAT A15
COL TZABBREV FORMAT A6
COL CON_ID   FORMAT 9999
SELECT TZNAME, TZABBREV, CON_ID
	FROM V$TIMEZONE_NAMES
	WHERE TZNAME LIKE '%Mexi%';
	
select distinct TZABBREV 
	FROM V$TIMEZONE_NAMES
	WHERE TZNAME LIKE '%Mexi%';
	
	
rem 		LMT Local Mean Time
rem         PMT Paris Mean Time
rem 		WET western European Time
rem 		CET Central Europe Sumer Time 


