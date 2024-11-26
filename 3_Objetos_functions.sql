DELIMITER $$

-- Crear la función PromedioVentasPorAño
CREATE FUNCTION PromedioVentasPorAño(año INT)
RETURNS DECIMAL(10, 2) 
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10, 2);

    SELECT AVG(total)
    INTO promedio
    FROM VENTA
    WHERE YEAR(fecha_venta) = año;

    RETURN promedio;
END $$

-- Crear la función SumaVentasPorAño
CREATE FUNCTION SumaVentasPorAño(año INT)
RETURNS DECIMAL(10, 2) 
DETERMINISTIC
BEGIN
    DECLARE suma DECIMAL(10, 2);

    SELECT SUM(total)
    INTO suma
    FROM VENTA
    WHERE YEAR(fecha_venta) = año;

    RETURN suma;
END $$

DELIMITER ;



    
    
