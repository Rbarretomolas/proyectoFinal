-- Eliminacion de la base de datos existente
DROP SCHEMA IF EXISTS e_commerce;

-- Creacion de la base de datos 
CREATE SCHEMA e_commerce;

-- Usar la base de datos recién creada
USE e_commerce;

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Fecha DATETIME,
    Total DECIMAL(10, 2)
);


  
    
CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Iniciar una transacción
START TRANSACTION;

-- Eliminar el pedido con idPedido = 1
DELETE FROM Pedido WHERE idPedido = 1;

-- Dejar comentada la sentencia Rollback
-- ROLLBACK;

-- Y luego la sentencia Commit
COMMIT;

-- Si eliminamos registros importantes, comentamos las sentencias para re-insertarlos
-- INSERT INTO Pedido (idPedido, Fecha, Total) VALUES (1, '2023-10-25 10:00:00', 100.50);

-- Iniciar una transacción
START TRANSACTION;

-- Insertar 8 registros
INSERT INTO Categoria (idCategoria, Nombre) VALUES (1, 'Electronica');
INSERT INTO Categoria (idCategoria, Nombre) VALUES (2, 'Ropa');
INSERT INTO Categoria (idCategoria, Nombre) VALUES (3, 'Hogar');
INSERT INTO Categoria (idCategoria, Nombre) VALUES (4, 'Alimentacion');

-- Agregar un savepoint después del registro #4
SAVEPOINT Savepoint1;
INSERT INTO Categoria (idCategoria, Nombre) VALUES (5, 'Electrodomesticos');
INSERT INTO Categoria (idCategoria, Nombre) VALUES (6, 'Juguetes');
INSERT INTO Categoria (idCategoria, Nombre) VALUES (7, 'Muebles');
INSERT INTO Categoria (idCategoria, Nombre) VALUES (8, 'Deportes');

-- Agregar un savepoint después del registro #8
SAVEPOINT Savepoint2;

-- Dejar comentada la sentencia para eliminar el savepoint de los primeros 4 registros insertados
-- ROLLBACK TO Savepoint1;

-- Finalmente, finalizar la transacción
COMMIT;


