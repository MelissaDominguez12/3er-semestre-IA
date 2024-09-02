spool C:\Users\melis\OneDrive\Escritorio\BD\LA.txt

--BORRAR TABLAS
DROP TABLE Editorial CASCADE CONSTRAINTS;
DROP TABLE Revista CASCADE CONSTRAINTS;
--CREAR TABLAS

CREATE TABLE Editorial(
nombre_editorial VARCHAR2(15),
direccion VARCHAR2(20),
director VARCHAR2(15)
);


CREATE TABLE Revista (
titulo VARCHAR2(15),
editor VARCHAR2(15),
ejemplares NUMBER(3),
nombre_editorial VARCHAR2(15)
);


--Agregar Restricciones
ALTER TABLE Editorial ADD CONSTRAINT pk_editorial PRIMARY KEY (nombre_editorial);
ALTER TABLE Revista ADD CONSTRAINT pk_revista PRIMARY KEY (titulo);
ALTER TABLE Revista ADD CONSTRAINT fk_revista FOREIGN KEY (nombre_editorial) REFERENCES Editorial(nombre_editorial);
--INSERTAR DATOS
INSERT INTO Editorial VALUES ('Editorial1','Direccion1','Director1');
INSERT INTO Editorial VALUES ('Editorial2','Direccion2','Director2');
INSERT INTO Editorial VALUES ('Editorial3','Direccion3','Director3');
INSERT INTO Editorial VALUES ('Editorial4','Direccion4','Director4');
INSERT INTO Editorial VALUES ('Editorial5','Direccion5','Director5');

INSERT INTO Revista VALUES ('Revista1','Editor1',1,'Editorial1');
INSERT INTO Revista VALUES ('Revista2','Editor2',2,'Editorial2');
INSERT INTO Revista VALUES ('Revista3','Editor3',3,'Editorial3');
INSERT INTO Revista VALUES ('Revista4','Editor4',4,'Editorial4');
INSERT INTO Revista VALUES ('Revista5','Editor5',5,'Editorial5');

-- 3.Mostar tablas
SELECT * FROM Editorial;
SELECT * FROM Revista;


spool off