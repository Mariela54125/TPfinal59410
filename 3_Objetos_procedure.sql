# TOTAL DE VENTAS POR CLIENTES: EJEMPLO CLIENTE 1 #
DELIMITER //

CREATE PROCEDURE TotalVentasCliente(IN cliente_id INT)
BEGIN
    -- Verificar si el cliente existe
    DECLARE cliente_existente INT;

    SELECT COUNT(*) INTO cliente_existente
    FROM CLIENTE
    WHERE id_cliente = cliente_id;

    -- Si el cliente no existe, devolver mensaje
    IF cliente_existente = 0 THEN
        SELECT 'El cliente no existe' AS mensaje_error;
    ELSE
        -- Realizar la consulta de ventas
        SELECT 
            C.nombre AS cliente_nombre,
            SUM(V.total) AS total_ventas
        FROM 
            VENTA V
            INNER JOIN CLIENTE C ON V.id_cliente = C.id_cliente
        WHERE 
            V.id_cliente = cliente_id
        GROUP BY 
            C.nombre;
    END IF;
END //

DELIMITER ;

CALL TotalVentasCliente(2); # CAMBIAR POR ID DE CLIENTE QUE DESEA CONSULTAR #

# TOTAL DE VENTAS POR VENDEDOR #
DELIMITER //

CREATE PROCEDURE TotalVentasPorVendedor(IN vendedor_id INT)
BEGIN
    -- Verificar si el vendedor existe
    DECLARE vendedor_existente INT;

    SELECT COUNT(*) INTO vendedor_existente
    FROM VENDEDOR
    WHERE id_vendedor = vendedor_id;

    -- Si el vendedor no existe, devolver mensaje
    IF vendedor_existente = 0 THEN
        SELECT 'El vendedor no existe' AS mensaje_error;
    ELSE
        -- Realizar la consulta de ventas
        SELECT 
            V.nombre AS vendedor_nombre,
            SUM(VT.total) AS total_ventas
        FROM 
            VENTA VT
            INNER JOIN VENDEDOR V ON VT.id_vendedor = V.id_vendedor
        WHERE 
            VT.id_vendedor = vendedor_id
        GROUP BY 
            V.nombre;
    END IF;
END //

DELIMITER ;

CALL TotalVentasPorVendedor(3); # CAMBIAR POR ID DE VENDEDOR QUE DESEA INFORMACION #
