spool C:\Users\melis\OneDrive\Escritorio\BD\LA.txt

--BORRAR TABLAS
DROP TABLE Libro CASCADE CONSTRAINTS;
DROP TABLE Autor CASCADE CONSTRAINTS;
--CREAR TABLAS

CREATE TABLE Libro (
isbn NUMBER(13,0),
edicion NUMBER(2,0),
editorial VARCHAR2(20),
paginas NUMBER(4,0),
fecha DATE,
);


CREATE TABLE Autor (
autor VARCHAR2(20) 
);


--Agregar Restricciones
ALTER TABLE Libro ADD CONSTRAINT pk_libro PRIMARY KEY (isbn);
ALTER TABLE Autor ADD CONSTRAINT pk_autor PRIMARY KEY (autor);
--INSERTAR DATOS
INSERT INTO Libro VALUES (9788408218443, 1, 'Planeta', 400, '01/01/2019');
INSERT INTO Libro VALUES (9788408218443, 1, 'Planeta', 400, '01/01/2019');
INSERT INTO Libro VALUES (9788408218443, 1, 'Planeta', 400, '01/01/2019');
INSERT INTO Libro VALUES (9788408218443, 1, 'Planeta', 400, '01/01/2019');
INSERT INTO Libro VALUES (9788408218443, 1, 'Planeta', 400, '01/01/2019');

INSERT INTO Autor VALUES ('J.K. Rowling');
INSERT INTO Autor VALUES ('M Lu');
INSERT INTO Autor VALUES ('J.Jane');
INSERT INTO Autor VALUES ('S.Lila');
INSERT INTO Autor VALUES ('JP Sander');

-- 3.Mostar tablas
SELECT * FROM Libro;
SELECT * FROM Autor;


spool off