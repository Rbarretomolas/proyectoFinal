
-- Eliminacion de la base de datos existente
DROP SCHEMA IF EXISTS e_commerce;

-- Creacion de la base de datos 
CREATE SCHEMA e_commerce;

-- Usar la base de datos recién creada
USE e_commerce;

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Dirección VARCHAR(255),
    Email VARCHAR(255)
);
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    Descripción TEXT
);

-- Tabla de registro para Cliente
CREATE TABLE RegistroCliente (
    idRegistro INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    accion VARCHAR(50),
    usuario VARCHAR(50),
    fecha DATE,
    hora TIME
);

-- Tabla de registro para Producto
CREATE TABLE RegistroProducto (
    idRegistro INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT,
    accion VARCHAR(50),
    usuario VARCHAR(50),
    fecha DATE,
    hora TIME
);


DELIMITER //
CREATE TRIGGER Before_Insert_Cliente
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCliente (idCliente, accion, usuario, fecha, hora)
    VALUES (NEW.idCliente, 'INSERCIÓN', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER After_Delete_Cliente
AFTER DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCliente (idCliente, accion, usuario, fecha, hora)
    VALUES (OLD.idCliente, 'ELIMINACIÓN', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Update_Producto
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO RegistroProducto (idProducto, accion, usuario, fecha, hora)
    VALUES (NEW.idProducto, 'ACTUALIZACIÓN', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER After_Delete_Producto
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO RegistroProducto (idProducto, accion, usuario, fecha, hora)
    VALUES (OLD.idProducto, 'ELIMINACIÓN', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

-- Prueba de los Triggers

INSERT INTO Cliente (idCliente, Nombre, Dirección, Email)
VALUES
    (1, 'Juan Pérez', 'Calle Principal 123', 'juan@example.com'),
    (2, 'María López', 'Avenida Central 456', 'maria@example.com'),
    (3, 'Carlos Rodríguez', 'Calle Secundaria 789', 'carlos@example.com'),
    (4, 'Laura García', 'Calle Norte 789', 'laura@example.com');
INSERT INTO Producto (idProducto, Nombre, Precio, Descripción)
VALUES
    (1, 'Producto A', 19.99, 'Descripción del Producto A'),
    (2, 'Producto B', 29.99, 'Descripción del Producto B'),
    (3, 'Producto C', 9.99, 'Descripción del Producto C');
DELETE FROM Cliente WHERE idCliente = 1;

UPDATE Producto SET Precio = 20.99 WHERE idProducto = 1;

DELETE FROM Producto WHERE idProducto = 1;

-- Verifica si se ha registrado la insercion/eliminación del cliente
SELECT * FROM RegistroCliente;

-- Verifica si se ha registrado la actualización/eliminacion del producto
SELECT * FROM RegistroProducto;

/* Trigger Before_Insert_Cliente (BEFORE INSERT):
Este trigger se dispara antes de que se realice una operación de inserción en la tabla Cliente. 
Controla e registra en la tabla RegistroCliente los siguientes detalles:

idCliente: El ID del cliente que se está insertando.
accion: La acción realizada, que en este caso es "INSERCIÓN".
usuario: El nombre del usuario que está realizando la inserción.
fecha: La fecha en que se realiza la operación.
hora: La hora a la que se realiza la operación.

Trigger After_Delete_Cliente (AFTER DELETE):
Este trigger se dispara después de que se realice una operación de eliminación en la tabla Cliente. 
Controla y registra en la tabla RegistroCliente los siguientes detalles:

idCliente: El ID del cliente que se está eliminando.
accion: La acción realizada, que en este caso es "ELIMINACIÓN".
usuario: El nombre del usuario que está realizando la eliminación.
fecha: La fecha en que se realiza la operación.
hora: La hora a la que se realiza la operación. 

Trigger Before_Update_Producto (BEFORE UPDATE):
Este trigger se dispara antes de que se realice una operación de actualización en la tabla Producto. 
Controla y registra en la tabla RegistroProducto los siguientes detalles:

idProducto: El ID del producto que se está actualizando.
accion: La acción realizada, que en este caso es "ACTUALIZACIÓN".
usuario: El nombre del usuario que está realizando la actualización.
fecha: La fecha en que se realiza la operación.
hora: La hora a la que se realiza la operación.

Trigger After_Delete_Producto (AFTER DELETE):
Este trigger se dispara después de que se realice una operación de eliminación en la tabla Producto. 
Controla y registra en la tabla RegistroProducto los siguientes detalles:

idProducto: El ID del producto que se está eliminando.
accion: La acción realizada, que en este caso es "ELIMINACIÓN".
usuario: El nombre del usuario que está realizando la eliminación.
fecha: La fecha en que se realiza la operación.
hora: La hora a la que se realiza la operación.*/

  







