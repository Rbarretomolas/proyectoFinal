-- Función para Obtener el Nombre del Cliente por ID:
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerNombreCliente`(cliente_id INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE nombre_cliente VARCHAR(255);
    SELECT Nombre INTO nombre_cliente FROM Cliente WHERE idCliente = cliente_id;
    RETURN nombre_cliente;
END;

