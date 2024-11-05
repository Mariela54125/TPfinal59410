
#TOTAL DE VENTAS POR CLIENTES: EJEMPLO CLIENTE 1#
DELIMITER //

CREATE PROCEDURE TotalVentasCliente(IN cliente_id INT) 
BEGIN     
    SELECT SUM(total) AS total_ventas     
    FROM VENTA     
    WHERE id_cliente = cliente_id; 
END //

DELIMITER ;

CALL TotalVentasCliente(1); #CAMBIAR POR ID DE CLIENTE QUE DESEA CONSULTAR#



#TOTAL DE VENTAS POR VENDEDOR#
DELIMITER //

CREATE PROCEDURE TotalVentasPorVendedor(IN vendedor_id INT)
BEGIN
    SELECT SUM(total) AS total_ventas
    FROM VENTA
    WHERE id_vendedor = vendedor_id; # Filtra por el ID del vendedor#
END //

DELIMITER ;


CALL TotalVentasPorVendedor(3); #cambiar por id_vendedor que desea informacion#
