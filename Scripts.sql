--1)
-- INNER JOIN
SELECT reservacion.id_reservacion, cliente.nombre, 
cliente.apellido, fecha_entrada, estado
FROM reservacion 
INNER JOIN cliente ON reservacion.id_cliente = cliente.id_cliente;

-- LEFT JOIN
SELECT hotel.nombre, tipo_habitacion.nombre
FROM hotel
LEFT JOIN habitacion ON hotel.id_hotel = habitacion.id_hotel
LEFT JOIN tipo_habitacion ON habitacion.id_tipo = tipo_habitacion.id_tipo;

-- RIGHT JOIN
SELECT cadena_hotelera.nombre, hotel.nombre
FROM hotel
RIGHT JOIN cadena_hotelera ON hotel.id_cadena = cadena_hotelera.id_cadena;

--2)
--  Hoteles por ciudad y cadena
SELECT DISTINCT ciudad, cadena_hotelera.nombre as cadena
FROM hotel
JOIN cadena_hotelera ON hotel.id_cadena = cadena_hotelera.id_cadena
ORDER BY ciudad;

--  Tipos de habitación por hotel
SELECT DISTINCT hotel.nombre as hotel, tipo_habitacion.nombre as tipo, 
tipo_habitacion.capacidad
FROM hotel
JOIN habitacion ON hotel.id_hotel = habitacion.id_hotel
JOIN tipo_habitacion ON habitacion.id_tipo = tipo_habitacion.id_tipo
ORDER BY hotel.nombre;

--3)
-- GROUP BY
SELECT hotel.nombre, COUNT(habitacion.id_habitacion) as total_habitaciones
FROM hotel
JOIN habitacion ON hotel.id_hotel = habitacion.id_hotel
GROUP BY hotel.nombre;

-- GROUP BY con HAVING
SELECT hotel.nombre, COUNT(reservacion.id_reservacion) as total_reservaciones
FROM hotel
JOIN habitacion ON hotel.id_hotel = habitacion.id_hotel
JOIN reservacion ON habitacion.id_habitacion = reservacion.id_habitacion
GROUP BY hotel.nombre
HAVING COUNT(reservacion.id_reservacion) > 2;

--4)
-- Procedimiento para registrar nueva reservación
DELIMITER //
CREATE PROCEDURE nueva_reservacion(
   IN cliente_id INT,
   IN habitacion_id INT,
   IN fecha_in DATE,
   IN fecha_out DATE,
   IN num_huespedes INT,
   IN metodo_pago VARCHAR(50)
)
BEGIN
   INSERT INTO reservacion(id_cliente, id_habitacion, 
   fecha_entrada, fecha_salida, estado, numero_huespedes, 
   metodo_pago, fecha_reservacion)
   VALUES (cliente_id, habitacion_id, fecha_in, fecha_out, 
    'confirmada', num_huespedes, metodo_pago, CURDATE());
   
   UPDATE habitacion SET estado_actual = 'ocupada' 
   WHERE id_habitacion = habitacion_id;
END //
DELIMITER ;

-- Ingresamos una nueva reservacion
CALL nueva_reservacion(1, 5, '2024-11-01', '2024-11-05', 2, 'Tarjeta de Crédito');

SELECT * FROM reservacion WHERE id_cliente = 1;

-- Aqui vemos o verficamos si se guardo la nueva reservacion
SELECT id_habitacion, estado_actual 
FROM habitacion WHERE id_habitacion = 5;


-- Procedimiento para actualizar estado de habitación
DELIMITER //
CREATE PROCEDURE actualizar_estado_habitacion(
   IN habitacion_id INT,
   IN nuevo_estado ENUM('disponible','ocupada','mantenimiento')
)
BEGIN
   UPDATE habitacion 
   SET estado_actual = nuevo_estado 
   WHERE id_habitacion = habitacion_id;
END //
DELIMITER ;

CALL actualizar_estado_habitacion(3, 'ocupada');

-- Con esto verificamos que el estado de la habitacion cambio 
-- consultando la tabla habitacion y se actualizo
SELECT id_habitacion, estado_actual 
FROM habitacion 
WHERE id_habitacion = 3;




-- Procedimiento para cancelar reservación
DELIMITER //
CREATE PROCEDURE cancelar_reservacion(
   IN reservacion_id INT
)
BEGIN
   UPDATE reservacion 
   SET estado = 'cancelada' 
   WHERE id_reservacion = reservacion_id;
   
   UPDATE habitacion 
   SET estado_actual = 'disponible' 
   WHERE id_habitacion = (SELECT id_habitacion 
   FROM reservacion 
   WHERE id_reservacion = reservacion_id);
END //
DELIMITER ;

-- cancelamos la reservacion con id_reser... = 5
CALL cancelar_reservacion(5);

-- Verificar el estado de la reservación
SELECT id_reservacion, estado 
FROM reservacion 
WHERE id_reservacion = 5;



--5)
-- Función para calcular el precio total de una reservación
DELIMITER //
CREATE FUNCTION calcular_precio_total(dias INT, precio_base DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN dias * precio_base;
END //
DELIMITER ;

-- Diagmos que queremos calcular el precio de una
-- reservacion de 3 dias con uh precio de 100 diario
SELECT calcular_precio_total(3, 100);


-- Función para verificar disponibilidad de habitación
DELIMITER //
CREATE FUNCTION esta_disponible(habitacion_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE estado VARCHAR(20);
    SELECT estado_actual INTO estado FROM habitacion 
    WHERE id_habitacion = habitacion_id;
    RETURN estado = 'disponible';
END //
DELIMITER ;

-- esto es para verificar si la habitacion
-- con id 3 esta dispo.
SELECT esta_disponible(3);
-- En este caso sale 0 sig. que no esta
-- disponible y 1 si estaria pero no es el caso


-- Función para contar reservaciones activas de un cliente
DELIMITER //
CREATE FUNCTION contar_reservaciones_activas(cliente_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total 
    FROM reservacion 
    WHERE id_cliente = cliente_id 
    AND estado = 'confirmada';
    RETURN total;
END //
DELIMITER ;

-- si queremos ver las reservaciones
-- activas del cliente con id 5
SELECT contar_reservaciones_activas(5);


--6)
-- Trigger para actualizar estado de habitación después de una reservación
DELIMITER //
CREATE TRIGGER actualizar_estado_despues_reserva
AFTER INSERT ON reservacion
FOR EACH ROW
BEGIN
    UPDATE habitacion 
    SET estado_actual = 'ocupada'
    WHERE id_habitacion = NEW.id_habitacion;
END //
DELIMITER ;

-- Para crear una reservacion
DELIMITER //
CREATE PROCEDURE crear_reservacion(
   cliente_id INT, 
   habitacion_id INT, 
   fecha_inicio DATE, 
   fecha_fin DATE, 
   huespedes INT
)
BEGIN
   INSERT INTO reservacion (id_cliente, 
	id_habitacion, fecha_inicio, 
	fecha_fin, estado, numero_huespedes)
   VALUES (cliente_id, habitacion_id, 
	fecha_inicio, fecha_fin, 'confirmada', huespedes);
END //
DELIMITER ;

CALL crear_reservacion(3, 2, '2024-12-01', '2024-12-05', 2);
-- Aqui la salida sera dif porque puse fecha_inicio en vez de fecha_entrada
-- y tambien para fecha_fin envez de fecha_salida lo hice asi porque queria comprobar bien 
-- ya que no veia bien si se hizo el cambio xd +15 min 



DESCRIBE reservacion;

ALTER TABLE reservacion
ADD COLUMN fecha_inicio DATE,
ADD COLUMN fecha_fin DATE;


-- Trigger para verificar capacidad antes de insertar reservación
DELIMITER //
CREATE TRIGGER verificar_capacidad_antes_reserva
BEFORE INSERT ON reservacion
FOR EACH ROW
BEGIN
   DECLARE max_capacidad INT;
   SELECT capacidad INTO max_capacidad 
   FROM habitacion h
   JOIN tipo_habitacion t ON h.id_tipo = t.id_tipo
   WHERE h.id_habitacion = NEW.id_habitacion;

   IF NEW.numero_huespedes > max_capacidad THEN
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'Número de huéspedes excede la capacidad de la habitación';
   END IF;
END //
DELIMITER ;


-- ejemplo
INSERT INTO reservacion (id_cliente, id_habitacion, fecha_entrada, fecha_salida, numero_huespedes)
VALUES (1, 3, '2024-12-01', '2024-12-05', 3);

SELECT * FROM reservacion;



-- Trigger para liberar habitación después de cancelar reservación
DELIMITER //
CREATE TRIGGER liberar_habitacion_despues_cancelar
AFTER UPDATE ON reservacion
FOR EACH ROW
BEGIN
    IF NEW.estado = 'cancelada' AND OLD.estado = 'confirmada' THEN
        UPDATE habitacion 
        SET estado_actual = 'disponible'
        WHERE id_habitacion = NEW.id_habitacion;
    END IF;
END //
DELIMITER ;

-- ejemplo
UPDATE reservacion
SET estado = 'cancelada'
WHERE id_reservacion = 5;

SELECT estado_actual 
FROM habitacion 
WHERE id_habitacion = 3;












