 --ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
 --CREATE USER trigg IDENTIFIED by trigg
 --DEFAULT TABLESPACE users
 --TEMPORARY TABLESPACE temp;
 --GRANT CONNECT, RESOURCE TO trigg;
 --GRANT UNLIMITED TABLESPACE TO trigg;

spool C:\Users\melis\OneDrive\Escritorio\Temp1.txt
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER temp_aur
AFTER UPDATE ON TEMP1
FOR EACH ROW
BEGIN
  dbms_output.put_line('AUR old N:' || :old.N || ' M:' || :old.M);
  dbms_output.put_line('AUR new N:' || :new.N || ' M:' || :new.M);
END;
/

INSERT INTO TEMP1 (N) VALUES (1);
UPDATE TEMP1 SET N = N + 1 WHERE N >= 1;
UPDATE TEMP1 SET M = 2 WHERE M = 5;

CREATE OR REPLACE TRIGGER temp_bur
BEFORE UPDATE ON TEMP1
FOR EACH ROW
BEGIN
:NEW.N := :NEW.N + 1;
dbms_output.put_line('BUR old N:'||:old.n|| ' M:'||:old.M);
dbms_output.put_line('BUR new N:'||:new.n|| ' M:'||:new.M);
END;
/

INSERT INTO TEMP1 (n) VALUES (1);
UPDATE TEMP1 SET n=n+1 WHERE n>=1;
UPDATE TEMP1 SET m=2 WHERE M=5;

spool off;


