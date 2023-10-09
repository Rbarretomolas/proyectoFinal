-- Eliminacion de la base de datos existente
DROP SCHEMA IF EXISTS e_commerce;

-- Creacion de la base de datos 
CREATE SCHEMA e_commerce;

-- Usar la base de datos recién creada
USE e_commerce;

-- Insercion de datos en la tabla Cliente
INSERT INTO Cliente (idCliente, Nombre, Dirección, Email)
VALUES
    (1, 'Juan Pérez', 'Calle Principal 123', 'juan@example.com'),
    (2, 'María López', 'Avenida Central 456', 'maria@example.com'),
    (3, 'Carlos Rodríguez', 'Calle Secundaria 789', 'carlos@example.com'),
	(4, 'Laura García', 'Calle Norte 789', 'laura@example.com'),
    (5, 'Pedro Martinez', 'Avenida Sur 101', 'pedro@example.com'),
    (6, 'Ana Sánchez', 'Calle Este 543', 'ana@example.com'),
    (7, 'Luis Rodríguez', 'Avenida Oeste 876', 'luis@example.com');
    
-- Insersion de datos en la tabla Producto
INSERT INTO Producto (idProducto, Nombre, Precio, Descripción)
VALUES
    (1, 'Producto A', 19.99, 'Descripción del Producto A'),
    (2, 'Producto B', 29.99, 'Descripción del Producto B'),
    (3, 'Producto C', 9.99, 'Descripción del Producto C'),
	(4, 'Producto D', 39.99, 'Descripción del Producto D'),
    (5, 'Producto E', 49.99, 'Descripción del Producto E'),
    (6, 'Producto F', 19.99, 'Descripción del Producto F'),
    (7, 'Producto G', 29.99, 'Descripción del Producto G');

-- Insercion de datos en la tabla Pedido
INSERT INTO Pedido (idPedido, Fecha, Total)
VALUES
    (1, '2023-09-01 12:00:00', 49.97),
    (2, '2023-09-02 14:30:00', 69.98),
    (3, '2023-09-03 10:15:00', 19.99),
	(4, '2023-09-04 11:45:00', 59.99),
    (5, '2023-09-05 16:20:00', 79.98),
    (6, '2023-09-06 09:30:00', 24.99),
    (7, '2023-09-07 14:00:00', 34.99);
    
-- Insercion dedatos en la tabla Categoría
INSERT INTO Categoria (idCategoria, Nombre)
VALUES
    (1, 'Electrónica'),
    (2, 'Ropa'),
    (3, 'Hogar'),
	(4, 'Alimentación'),
    (5, 'Electrodomésticos'),
    (6, 'Juguetes'),
    (7, 'Muebles');

INSERT INTO Proveedor (idProveedor, Nombre, Contacto)
VALUES
    (1, 'Proveedor X', 'contacto@proveedorx.com'),
    (2, 'Proveedor Y', 'contacto@proveedory.com'),
    (3, 'Proveedor Z', 'contacto@proveedorz.com'),
    (4, 'Proveedor A', 'contacto@proveedora.com'),
    (5, 'Proveedor B', 'contacto@proveedorb.com'),
    (6, 'Proveedor C', 'contacto@proveedorc.com'),
    (7, 'Proveedor D', 'contacto@proveedord.com');
    
INSERT INTO ProductoCategoria (idProductoCategoria, idProducto, idCategoria)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7);
    
-- Insercion de datos en la tabla ClientePedido (relacion entre clientes y pedidos)
INSERT INTO ClientePedido (idClientePedido, idCliente, idPedido)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7);
    
-- Insercion de datos en la tabla ProductoProveedor (relacion entre productos y proveedores)
INSERT INTO ProductoProveedor (idProductoProveedor, idProducto, idProveedor)
VALUES
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7);

-- Insercion de datos en la tabla DetallePedido
INSERT INTO DetallePedido (idPedido, idProducto, Cantidad, PrecioUnitario)
VALUES
    (1, 1, 2, 19.99),
    (1, 2, 1, 29.99),
    (2, 3, 3, 9.99),
    (3, 1, 2, 19.99),
    (3, 2, 1, 29.99),
    (4, 3, 3, 9.99),
    (4, 4, 2, 39.99);

-- Insercion de datos en la tabla RevisionesDeProductos
INSERT INTO RevisionesDeProductos (idCliente, idPedido, idProducto, Comentario, Calificacion, Fecha_Revision)
VALUES
    (1, 1, 1, '¡Excelente producto!', 5, '2023-10-01'),
    (2, 2, 2, 'Buen producto, entrega rápida', 4, '2023-10-02'),
    (3, 3, 3, 'Me gustó, pero podría mejorar', 3, '2023-10-03'),
    (4, 4, 4, 'Buen producto, excelente calidad', 5, '2023-10-04'),
    (5, 5, 5, 'Me gustó mucho, volvería a comprar', 4, '2023-10-05'),
    (6, 6, 6, 'Producto recomendado, envío rápido', 4, '2023-10-06'),
    (7, 7, 7, 'No cumplió mis expectativas', 2, '2023-10-07');
    














    
    
    
    
    






    