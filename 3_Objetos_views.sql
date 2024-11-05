
#Views: Esto te dará un resumen del total de ventas y el importe total para cada estado de venta# 
CREATE VIEW Total_Ventas_por_Estado AS
SELECT 
    ev.descripcion_estado AS Estado,
    COUNT(v.id_venta) AS Total_Ventas,
    SUM(v.total) AS Total_Importe
FROM 
    VENTA v
JOIN 
    ESTADO_VENTA ev ON v.id_estado = ev.id_estado
GROUP BY 
    ev.descripcion_estado;
    
#ver total ventas por estado#
SELECT * FROM Total_Ventas_por_Estado;

#Views: total de venta por producto#
CREATE VIEW Total_Ventas_por_Producto AS
SELECT 
    p.nombre_producto AS Producto,
    COUNT(v.id_venta) AS Total_Ventas,
    SUM(v.total) AS Total_Importe
FROM 
    VENTA v
JOIN 
    PRODUCTO p ON v.id_producto = p.id_producto
GROUP BY 
    p.nombre_producto;
 #ver total de venta por producto#   
SELECT * FROM Total_Ventas_por_Producto;