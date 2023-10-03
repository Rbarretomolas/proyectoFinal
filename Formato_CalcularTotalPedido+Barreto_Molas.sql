-- Función para calcular el total de un pedido a partir de su ID:
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularTotalPedido`(pedido_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(Cantidad * PrecioUnitario)
    INTO total
    FROM DetallePedido
    WHERE idPedido = pedido_id;
    RETURN total;
END