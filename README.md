# Sistema de Ventas

## Descripción

Este sistema de ventas permite a una consultora especializada en bases de datos ayudar a su cliente a mejorar la atención y mantener un control detallado de las ventas. El sistema está diseñado para registrar operaciones y facilitar el análisis de datos en distintos períodos de tiempo.

## Objetivos

- Crear una base de datos para registrar y analizar las operaciones de venta.
- Proveer informes detallados y visualizaciones para mejorar la toma de decisiones.

## Estructura del Sistema

### Diagrama de Entidad-Relación

https://github.com/Mariela54125/TPfinal59410/blob/main/DER%20BD%20Sistema_de_ventas.jpg

### Diagrama de Esquematico




### Tablas

- **Clientes**
- **Condición_pago**
- **Estado_venta**
- **Producto**
- **Vendedor**
- **Venta**

#### Columnas Clave de cada Tabla

- **Clientes**: id_cliente (INT), dni (VARCHAR), nombre_cliente (VARCHAR), email (VARCHAR)
- **Condición_pago**: id_condicion (INT), descripcion_condicion (VARCHAR)
- **Estado_venta**: id_estado (INT), descripcion_estado (VARCHAR)
- **Producto**: id_producto (INT), nombre_producto (VARCHAR), categoria_producto (VARCHAR), precio (DECIMAL)
- **Vendedor**: id_vendedor (INT), nombre_vendedor (VARCHAR), cuit (VARCHAR), tipo_vendedor (VARCHAR)
- **Venta**: id_venta (INT), fecha_venta (DATETIME), id_cliente (INT), id_vendedor (INT), id_condicion (INT), id_estado (INT), id_producto (INT), cantidad (INT), precio_unitario (DECIMAL), total (DECIMAL)

## Funcionalidades Avanzadas

### Vistas

- `Total_ventas_por_estado`: Muestra el comportamiento de las ventas por estado en un período seleccionado.
- `Total_ventas_por_producto`: Visualiza las ventas por cada producto para decisiones relacionadas con el inventario y proveedores.

### Funciones

- `Promedio_ventas`: Calcula el promedio de ventas en un período.
- `Total_ventas`: Muestra el total de ventas para obtener un panorama general del negocio.

### Procedimientos Almacenados

- `Totaldeventasclientes`: Total de ventas por cliente en un período, útil para determinar condiciones especiales de venta.
- `Totaldeventasvendedor`: Ventas por vendedor, usado para análisis de rendimiento y comisiones.

### Triggers

- `AfterUpdateEstadoVenta`: Registra cambios en el estado de las ventas para auditoría.
- `ValidateCantidadUpdate`: Verifica que la cantidad en una venta no sea negativa antes de realizar una actualización.

## Archivos Adicionales

- 1_estructur.sql`: Script SQL para crear la base de datos `sistema_ventas`.
- 2_ Carpeta de inserción de registros en tablas.
- 3_Scripts de vistas, funciones, procedimientos y triggers.
