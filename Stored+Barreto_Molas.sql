-- Eliminacion de la base de datos existente
DROP SCHEMA IF EXISTS e_commerce;

-- Creacion de la base de datos 
CREATE SCHEMA e_commerce;

-- Usar la base de datos recién creada
USE e_commerce;

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Dirección VARCHAR(255),
    Email VARCHAR(255)
);
INSERT INTO Cliente (idCliente, Nombre, Dirección, Email)
VALUES
    (1, 'Juan Pérez', 'Calle Principal 123', 'juan@example.com'),
    (2, 'María López', 'Avenida Central 456', 'maria@example.com'),
    (3, 'Carlos Rodríguez', 'Calle Secundaria 789', 'carlos@example.com'),
    (4, 'Laura García', 'Calle Norte 789', 'laura@example.com'),
    (5, 'Pedro Martinez', 'Avenida Sur 101', 'pedro@example.com'),
    (6, 'Ana Sánchez', 'Calle Este 543', 'ana@example.com'),
    (7, 'Luis Rodríguez', 'Avenida Oeste 876', 'luis@example.com');

DELIMITER //
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
END;//
DELIMITER ;

DELIMITER //
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
END//

DELIMITER ;



-- LLamadas de prueba
CALL InsertarEliminarRegistro('Cliente', 'INSERT', NULL, 'Nuevo Cliente', '123 Calle Nueva', 'nuevo@cliente.com');
CALL OrdenarTabla('Cliente', 'Nombre', 'ASC');