
#PROMEDIO DE VENTAS: 2024#
SELECT 
    YEAR(fecha_venta) AS Año,
    AVG(total) AS Promedio_Ventas
FROM 
    VENTA
GROUP BY 
    YEAR(fecha_venta);
    
#SUMAR TOTAL DE VENTAS: 2024#
SELECT SUM(total) AS suma_ventas_2024
FROM VENTA
WHERE YEAR(fecha_venta) = 2024;


    
    