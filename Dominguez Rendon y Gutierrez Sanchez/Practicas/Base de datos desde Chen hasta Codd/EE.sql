--Crear usuario
--ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 
 --CREATE USER chan IDENTIFIED by codd
 --DEFAULT TABLESPACE users
 --TEMPORARY TABLESPACE temp;
 --GRANT CONNECT, RESOURCE TO chan;
 --GRANT UNLIMITED TABLESPACE TO chan;
--Ajustes de sistema
'set linesize 300
set pagesize 90
set feddback on
set colsep ' ||' 
set null s/Registro
clear screen 
spool C:\Users\melis\OneDrive\Escritorio\BD\EE.txt
'
spool C:\Users\melis\OneDrive\Escritorio\BD\EE.txt
--BORRAR TABLAS
DROP TABLE Empleado CASCADE CONSTRAINTS;
DROP TABLE Electrodomestico CASCADE CONSTRAINTS;
DROP TABLE Empl_Elect CASCADE CONSTRAINTS;
--CREAR TABLAS

CREATE TABLE Empleado (
    nif VARCHAR2(10),
    nombre VARCHAR2(20),
    apellidos VARCHAR2(20),
    nivel NUMBER(2,0),
    ocupacion VARCHAR2(20)
);

CREATE TABLE Electrodomestico (
    aparato VARCHAR2(20),
    marca VARCHAR2(20),
    modelo VARCHAR2(20)
);

CREATE TABLE Empl_Elect (
  nif VARCHAR2(10),
  aparato VARCHAR2(20),
  ultima_fecha DATE
);


--Agregar Restricciones
ALTER TABLE Empleado ADD CONSTRAINT pk_empleado PRIMARY KEY (nif);
ALTER TABLE Electrodomestico ADD CONSTRAINT pk_electrodomestico PRIMARY KEY (aparato);
ALTER TABLE Empl_Elect ADD CONSTRAINT pk_empl_elect PRIMARY KEY (nif, aparato);
ALTER TABLE Empl_Elect ADD CONSTRAINT fk_empleado FOREIGN KEY (nif) REFERENCES Empleado(nif);
ALTER TABLE Empl_Elect ADD CONSTRAINT fk_electrodomestico FOREIGN KEY (aparato) REFERENCES Electrodomestico(aparato);

--INSERTAR DATOS
    INSERT INTO Empleado VALUES ('12345678A', 'Juan', 'Perez', 1, 'Reparador');
    INSERT INTO Empleado VALUES ('87654321B', 'Maria', 'Garcia', 2, 'Reparador');
    INSERT INTO Empleado VALUES ('12345678C', 'Pedro', 'Lopez', 3, 'Reparador');
    INSERT INTO Empleado VALUES ('87654321D', 'Ana', 'Gomez', 4, 'Reparador');
    INSERT INTO Empleado VALUES ('12345678E', 'Luis', 'Rodriguez', 5, 'Reparador');

    INSERT INTO Electrodomestico VALUES ('Lavadora', 'Bosch', 'A1');
    INSERT INTO Electrodomestico VALUES ('Licuadora', 'Bosch', 'A2');
    INSERT INTO Electrodomestico VALUES ('Secdora', 'Bosch', 'A3');
    INSERT INTO Electrodomestico VALUES ('Refrigerador', 'Bosch', 'A4');
    INSERT INTO Electrodomestico VALUES ('Estufa', 'Bosch', 'A5');

    INSERT INTO Empl_Elect VALUES ('12345678A', 'Lavadora', '01/01/2020');
    INSERT INTO Empl_Elect VALUES ('87654321B', 'Licuadora', '04/01/2020');
    INSERT INTO Empl_Elect VALUES ('12345678C', 'Secdora', '01/05/2020');
    INSERT INTO Empl_Elect VALUES ('87654321D', 'Refrigerador', '03/01/2020');
    INSERT INTO Empl_Elect VALUES ('12345678E', 'Estufa', '01/09/2020');
    
--CONSULTAS
--1. Mostrar los empleados que han reparado un electrodomestico
SELECT e.nombre, e.apellidos, ee.aparato
FROM Empleado e, Empl_Elect ee
WHERE e.nif = ee.nif;

--2. Mostrar los electrodomesticos que han sido reparados por un empleado
SELECT e.aparato, e.marca, e.modelo, ee.nif
FROM Electrodomestico e, Empl_Elect ee
WHERE e.aparato = ee.aparato;

-- 3.Mostar tablas
SELECT * FROM Empleado;
SELECT * FROM Electrodomestico;
SELECT * FROM Empl_Elect;

spool off