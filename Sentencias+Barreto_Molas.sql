-- Crear el usuario solo_lectura con contraseña
CREATE USER 'solo_lectura'@'localhost' IDENTIFIED BY 'contraseña_solo_lectura';

-- Crear el usuario lectura_insercion_modificacion con contraseña
CREATE USER 'lectura_insercion_modificacion'@'localhost' IDENTIFIED BY 'contraseña_lectura_insercion_modificacion';

-- Conceder los permisos de solo lectura en todas las tablas
GRANT SELECT ON *.* TO 'solo_lectura'@'localhost';

-- Conceder los permisos de lectura, inserción y modificación en todas las tablas
GRANT SELECT, INSERT, UPDATE ON *.* TO 'lectura_insercion_modificacion'@'localhost';

-- Revocar el permiso de eliminación para ambos usuarios
REVOKE DELETE ON *.* FROM 'solo_lectura'@'localhost';
REVOKE DELETE ON *.* FROM 'lectura_insercion_modificacion'@'localhost';

-- Verificar permisos del usuario solo_lectura
SHOW GRANTS FOR 'solo_lectura'@'localhost';

-- Verificar permisos del usuario lectura_insercion_modificacion
SHOW GRANTS FOR 'lectura_insercion_modificacion'@'localhost';








