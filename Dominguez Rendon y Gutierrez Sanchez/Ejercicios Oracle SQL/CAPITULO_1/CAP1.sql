spool C:\Users\melis\OneDrive\Escritorio\Cap1.txt

PROMPT CAP UNO 

PROMPT "Ejercicio 1"
CREATE table USUARIOS(
    id_usuario int,
    nombre char(10),
    fecha_nacimiento date,
    telefono char(10),
    salario number(6,2)
);

PROMPT "TABLA CREADA"

PROMPT "Ejercicio 2"
create table DEPARTAMENTOS(
    id_departamento int,
    nombre1 char(10),
    id2_usuario int
);
PROMPT "TABLA CREADA"

PROMPT "Ejercicio 3"
create table PRODUCTOS(
    id_producto int,
    nombre2 char(10),
    precio number(6,2),
    id3_usuario int
);
PROMPT "TABLA CREADA"

PROMPT "Ejercicio 4"
SELECT * FROM USUARIOS;
PROMPT "SELECT REALIZADO"

PROMPT"Ejercicio 5"
SELECT * FROM DEPARTAMENTOS;
PROMPT "SELECT REALIZADO"

PROMPT "Ejercicio 6"    
SELECT * FROM PRODUCTOS;
PROMPT "SELECT REALIZADO"


            
spool off

