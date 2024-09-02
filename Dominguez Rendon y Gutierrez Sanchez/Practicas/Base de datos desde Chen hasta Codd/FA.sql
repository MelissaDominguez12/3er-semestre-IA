spool C:\Users\melis\OneDrive\Escritorio\BD\FA.txt

--BORRAR TABLAS
DROP TABLE Factura CASCADE CONSTRAINTS;
DROP TABLE Albaran CASCADE CONSTRAINTS;
DROP TABLE Fact_Alba CASCADE CONSTRAINTS;
--CREAR TABLAS

CREATE TABLE Factura (
  numero_factura NUMBER(7,0),
  fecha_emision DATE,
  total_factura NUMBER(4,0)
);


CREATE TABLE Albaran (
    numero_albaran NUMBER(7,0),
    fecha_venta DATE,   
    total_albaran NUMBER(4,0)
);

CREATE TABLE Fact_Alba (
 numero_albaran NUMBER(7),
 numero_factura NUMBER(7),
 descuento NUMBER(2)
);


--Agregar Restricciones
ALTER TABLE Factura ADD CONSTRAINT pk_factura PRIMARY KEY (numero_factura);
ALTER TABLE Albaran ADD CONSTRAINT pk_albaran PRIMARY KEY (numero_albaran);
ALTER TABLE Fact_Alba ADD CONSTRAINT pk_fact_alba PRIMARY KEY (numero_albaran);
ALTER TABLE Fact_Alba ADD CONSTRAINT fk_fact_alba FOREIGN KEY (numero_albaran) REFERENCES Albaran(numero_albaran);
ALTER TABLE Fact_Alba ADD CONSTRAINT fk_fact_alba FOREIGN KEY (numero_factura) REFERENCES Factura(numero_factura);

--INSERTAR DATOS
INSERT INTO Factura VALUES (1, '01/01/2020', 100);
INSERT INTO Factura VALUES (2, '02/01/2020', 200);
INSERT INTO Factura VALUES (3, '03/01/2020', 300);
INSERT INTO Factura VALUES (4, '04/01/2020', 400);
INSERT INTO Factura VALUES (5, '05/01/2020', 500);

INSERT INTO Albaran VALUES (1, '01/01/2020', 100);
INSERT INTO Albaran VALUES (2, '02/01/2020', 200);
INSERT INTO Albaran VALUES (3, '03/01/2020', 300);
INSERT INTO Albaran VALUES (4, '04/01/2020', 400);
INSERT INTO Albaran VALUES (5, '05/01/2020', 500);

INSERT INTO Fact_Alba VALUES (1, 1, 10);
INSERT INTO Fact_Alba VALUES (2, 2, 20);
INSERT INTO Fact_Alba VALUES (3, 3, 30);
INSERT INTO Fact_Alba VALUES (4, 4, 40);
INSERT INTO Fact_Alba VALUES (5, 5, 50);
    

-- 3.Mostar tablas
SELECT * FROM Factura;
SELECT * FROM Albaran;
SELECT * FROM Fact_Alba;

--4.Mostrar diccionario de datos
DESCRIBE Factura;
DESCRIBE Albaran;
DESCRIBE Fact_Alba;

--5.Mostrar restricciones
SELECT * FROM USER_CONSTRAINTS;

COL OBJECT_NAME FORMAT A25
COL OBJECT__TYPE FORMAT A12
COL OBJECT_ID   FORMAT 99,999	
SELECT OBJECT_NAME, OBJECT_TYPE, OBJECT_ID
	FROM USER_OBJECTS
	WHERE OBJECT_TYPE IN ('FACTURA','ALBARAN', 'FACT_ALBA')
	ORDER BY 2,1;

spool off