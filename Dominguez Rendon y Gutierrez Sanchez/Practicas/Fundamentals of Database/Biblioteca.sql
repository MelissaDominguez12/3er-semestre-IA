--Crear usuario
--ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
--CREATE USER libro IDENTIFIED by libro
--DEFAULT TABLESPACE users
--TEMPORARY TABLESPACE temp;
--GRANT CONNECT, RESOURCE TO libro;
--GRANT UNLIMITED TABLESPACE TO libro;

--Ajustes de sistema
set linesize 300
set pagesize 50
set feddback on
set colsep ' ||' 
set null s/dato
clear screen
--spool C:\Users\melis\OneDrive\Escritorio\Libros.txt
--Cambiar idioma 
ALTER SESSION SET NLS_DATE_LANGUAGE  = 'ENGLISH';

--BORRAR TABLAS

DROP TABLE AUTORES CASCADE CONSTRAINTS;
DROP TABLE PROVEEDORES CASCADE CONSTRAINTS;
DROP TABLE PEDIDOS CASCADE CONSTRAINTS;
DROP TABLE PEDIDOS_LIBROS CASCADE CONSTRAINTS;
DROP TABLE LIBROS CASCADE CONSTRAINTS;

--CREAR TABLAS

CREATE TABLE 

