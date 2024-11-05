
#Esto asegura que solo se registre un cambio en el log si realmente ha habido un cambio en el estado de la venta#


DELIMITER //

CREATE TRIGGER AfterUpdateEstadoVenta
AFTER UPDATE ON VENTA
FOR EACH ROW
BEGIN
    IF OLD.id_estado != NEW.id_estado THEN
        INSERT INTO LOG_ESTADO_VENTA (id_venta, estado_anterior, estado_nuevo, fecha_cambio)
        VALUES (NEW.id_venta, OLD.id_estado, NEW.id_estado, NOW());
    END IF;
END //

DELIMITER ;

#PRODUCTO NO PUEDE SER NEGATIVO AL INSERTAR EN TABLA VENTAS#

DELIMITER //

CREATE TRIGGER ValidateCantidadUpdate
BEFORE UPDATE ON VENTA
FOR EACH ROW
BEGIN
    IF NEW.cantidad < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad no puede ser negativa.';
    END IF;
END //

DELIMITER ;