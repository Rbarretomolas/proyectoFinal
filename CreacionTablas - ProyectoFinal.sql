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
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Fecha DATETIME,
    Total DECIMAL(10, 2)
);
CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY,
    Nombre VARCHAR(255)
);
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Contacto VARCHAR(255)
);
CREATE TABLE ProductoCategoria (
    idProductoCategoria INT PRIMARY KEY,
    idProducto INT,
    idCategoria INT,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idCategoria) REFERENCES Categoria (idCategoria)
);
CREATE TABLE ClientePedido (
    idClientePedido INT PRIMARY KEY,
    idCliente INT,
    idPedido INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
CREATE TABLE ProductoProveedor (
    idProductoProveedor INT PRIMARY KEY,
    idProducto INT,
    idProveedor INT,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE DetallePedido (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    idProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);
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
