CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarTabla`(
    IN tabla_nombre VARCHAR(255), -- Nombre de la tabla que se desea ordenar
    IN columna_orden VARCHAR(255), -- Nombre de la columna por la cual se desea ordenar
    IN orden_tipo VARCHAR(10) -- Tipo de orden: 'ASC' para ascendente, 'DESC' para descendente
)
BEGIN
    -- Construccion de la consulta SQL dinámica para ordenar la tabla
    SET @sql = CONCAT('SELECT * FROM ', tabla_nombre, ' ORDER BY ', columna_orden, ' ', orden_tipo, ';');
    
    -- Preparacion y ejecucion de la consulta SQL
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    
    -- Liberacion de la consulta preparada
    DEALLOCATE PREPARE stmt;
END;

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEliminarRegistro`(
    IN tabla_nombre VARCHAR(255), -- Nombre de la tabla en la que se realizará la operación
    IN accion VARCHAR(10), -- Acción a realizar: 'INSERT' o 'DELETE'
    IN id INT, -- ID del registro a eliminar (solo para DELETE)
    IN valor_nombre VARCHAR(255), -- Valor para la columna "Nombre" (solo para INSERT)
    IN valor_direccion VARCHAR(255), -- Valor para la columna "Dirección" (solo para INSERT)
    IN valor_email VARCHAR(255) -- Valor para la columna "Email" (solo para INSERT)
)
BEGIN
    -- Variable para almacenar mensajes de resultado
    DECLARE mensaje VARCHAR(255);

    -- Verificar la acción
    CASE
        WHEN accion = 'INSERT' THEN
            -- Insertar un nuevo registro en la tabla Cliente
            INSERT INTO Cliente (Nombre, Dirección, Email) VALUES (valor_nombre, valor_direccion, valor_email);
            SET mensaje = CONCAT('Inserción en ', tabla_nombre, ' exitosa.');
        WHEN accion = 'DELETE' THEN
            -- Eliminar un registro específico en la tabla por ID
            SET @sql = CONCAT('DELETE FROM ', tabla_nombre, ' WHERE id = ', id, ';');
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
            SET mensaje = CONCAT('Eliminación en ', tabla_nombre, ' exitosa.');
        ELSE
            SET mensaje = 'Acción no válida';
    END CASE;

    -- Devolver un mensaje como resultado
    SELECT mensaje AS Resultado;
END



-- LLamadas de prueba
CALL InsertarEliminarRegistro('Cliente', 'INSERT', NULL, 'Nuevo Cliente', '123 Calle Nueva', 'nuevo@cliente.com');
CALL OrdenarTabla('Cliente', 'Nombre', 'ASC');