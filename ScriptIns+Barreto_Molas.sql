-- Eliminacion de la base de datos existente
DROP SCHEMA IF EXISTS e_commerce;

-- Creacion de la base de datos 
CREATE SCHEMA e_Commerce;

-- Usar la base de datos recién creada
USE e_Commerce;

-- Creacion de la tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Dirección VARCHAR(255),
    Email VARCHAR(255)
);

-- Insercion de datos en la tabla Cliente
INSERT INTO Cliente (idCliente, Nombre, Dirección, Email)
VALUES
    (1, 'Juan Pérez', 'Calle Principal 123', 'juan@example.com'),
    (2, 'María López', 'Avenida Central 456', 'maria@example.com'),
    (3, 'Carlos Rodríguez', 'Calle Secundaria 789', 'carlos@example.com');

-- Creacion de la tabla Producto
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    Descripción TEXT
);

-- Insersion de datos en la tabla Producto
INSERT INTO Producto (idProducto, Nombre, Precio, Descripción)
VALUES
    (1, 'Producto A', 19.99, 'Descripción del Producto A'),
    (2, 'Producto B', 29.99, 'Descripción del Producto B'),
    (3, 'Producto C', 9.99, 'Descripción del Producto C');

-- Creacion de la tabla Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Fecha DATETIME,
    Total DECIMAL(10, 2)
);

-- Insercion de datos en la tabla Pedido
INSERT INTO Pedido (idPedido, Fecha, Total)
VALUES
    (1, '2023-09-01 12:00:00', 49.97),
    (2, '2023-09-02 14:30:00', 69.98),
    (3, '2023-09-03 10:15:00', 19.99);

-- Creacion de la tabla Categoría
CREATE TABLE Categoría (
    idCategoría INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Insercion dedatos en la tabla Categoría
INSERT INTO Categoría (idCategoría, Nombre)
VALUES
    (1, 'Electrónica'),
    (2, 'Ropa'),
    (3, 'Hogar');

-- Creacion de la tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Contacto VARCHAR(255)
);

-- Insercion de datos en la tabla Proveedor
INSERT INTO Proveedor (idProveedor, Nombre, Contacto)
VALUES
    (1, 'Proveedor X', 'contacto@proveedorx.com'),
    (2, 'Proveedor Y', 'contacto@proveedory.com'),
    (3, 'Proveedor Z', 'contacto@proveedorz.com');

-- Creacion de la tabla ProductoCategoria (tabla intermedia)
CREATE TABLE ProductoCategoria (
    idProductoCategoria INT PRIMARY KEY,
    idProducto INT,
    idCategoría INT,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idCategoría) REFERENCES Categoría(idCategoría)
);

-- Insercion de datos en la tabla ProductoCategoria (relacion entre productos y categorías)
INSERT INTO ProductoCategoria (idProductoCategoria, idProducto, idCategoría)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

-- Creacion la tabla ClientePedido (tabla intermedia)
CREATE TABLE ClientePedido (
    idClientePedido INT PRIMARY KEY,
    idCliente INT,
    idPedido INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Insercion de datos en la tabla ClientePedido (relacion entre clientes y pedidos)
INSERT INTO ClientePedido (idClientePedido, idCliente, idPedido)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

-- Creacion de la tabla ProductoProveedor (tabla intermedia)
CREATE TABLE ProductoProveedor (
    idProductoProveedor INT PRIMARY KEY,
    idProducto INT,
    idProveedor INT,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

-- Insercion de datos en la tabla ProductoProveedor (relacion entre productos y proveedores)
INSERT INTO ProductoProveedor (idProductoProveedor, idProducto, idProveedor)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

-- Creacion la tabla DetallePedido
CREATE TABLE DetallePedido (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    idProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Insercion de datos en la tabla DetallePedido
INSERT INTO DetallePedido (idPedido, idProducto, Cantidad, PrecioUnitario)
VALUES
    (1, 1, 2, 19.99),
    (1, 2, 1, 29.99),
    (2, 3, 3, 9.99);

-- Creacion de la tabla RevisionesDeProductos
CREATE TABLE RevisionesDeProductos (
    idRevision INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idPedido INT,
    idProducto INT,
    Comentario TEXT,
    Calificacion INT,
    Fecha_Revision DATE,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Insercion de datos en la tabla RevisionesDeProductos
INSERT INTO RevisionesDeProductos (idCliente, idPedido, idProducto, Comentario, Calificacion, Fecha_Revision)
VALUES
    (1, 1, 1, '¡Excelente producto!', 5, '2023-09-01'),
    (2, 2, 2, 'Buen producto, entrega rápida', 4, '2023-09-02'),
    (3, 3, 3, 'Me gustó, pero podría mejorar', 3, '2023-09-03');