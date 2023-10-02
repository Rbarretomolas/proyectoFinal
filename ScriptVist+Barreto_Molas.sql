-- Vista de Productos y Categorías: Esta vista muestra una lista de productos y sus categorías correspondientes
CREATE VIEW Vista_Productos_Categorias AS
SELECT p.Nombre AS Producto, c.Nombre AS Categoría
FROM Producto p
JOIN ProductoCategoria pc ON p.idProducto = pc.idProducto
JOIN Categoría c ON pc.idCategoría = c.idCategoría;

-- Vista de Ventas Totales por Cliente: Esta vista presenta las ventas totales realizadas por cada cliente
CREATE VIEW Vista_Ventas_Por_Cliente AS
SELECT c.Nombre AS Cliente, SUM(d.Cantidad * d.PrecioUnitario) AS VentasTotales
FROM Cliente c
LEFT JOIN ClientePedido cp ON c.idCliente = cp.idCliente
LEFT JOIN Pedido pe ON cp.idPedido = pe.idPedido
LEFT JOIN DetallePedido d ON pe.idPedido = d.idPedido
GROUP BY c.Nombre;

-- Vista de Productos Más Vendidos: Esta vista muestra los productos más vendidos junto con la cantidad total vendida
CREATE VIEW Vista_Productos_Mas_Vendidos AS
SELECT p.Nombre AS Producto, SUM(d.Cantidad) AS CantidadVendida
FROM Producto p
LEFT JOIN DetallePedido d ON p.idProducto = d.idProducto
GROUP BY p.Nombre
ORDER BY SUM(d.Cantidad) DESC
LIMIT 10;

-- Vista de Pedidos Pendientes: Esta vista muestra los pedidos pendientes que aún no han sido entregados.
CREATE VIEW Vista_Pedidos_Pendientes AS
SELECT p.idPedido, c.Nombre AS Cliente, p.Fecha
FROM Pedido p
LEFT JOIN ClientePedido cp ON p.idPedido = cp.idPedido
LEFT JOIN Cliente c ON cp.idCliente = c.idCliente
WHERE p.Fecha > NOW();

-- Vista de Revisiones de Productos Recientes: Esta vista presenta las revisiones de productos realizadas en los últimos 30 días, 
-- incluyendo detalles sobre el producto, el cliente, el comentario y la calificación. 
CREATE VIEW Vista_Revisiones_Recientes AS
SELECT r.Fecha_Revision, p.Nombre AS Producto, c.Nombre AS Cliente, r.Comentario, r.Calificacion
FROM RevisionesDeProductos r
JOIN Producto p ON r.idProducto = p.idProducto
JOIN Cliente c ON r.idCliente = c.idCliente
WHERE r.Fecha_Revision >= DATE_SUB(NOW(), INTERVAL 30 DAY);

SELECT * FROM Vista_Ventas_Por_Cliente;
SELECT * FROM Vista_Revisiones_Recientes;
SELECT * FROM Vista_Pedidos_Pendientes;
SELECT * FROM Vista_Productos_Mas_Vendidos;
SELECT * FROM Vista_Productos_Categorias;
