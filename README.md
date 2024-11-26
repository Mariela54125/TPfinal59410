Sistema de Ventas
Descripción
Este sistema de ventas permite a una consultora especializada en bases de datos ayudar a su cliente a mejorar la atención y mantener un control detallado de las ventas. Está diseñado para registrar operaciones y facilitar el análisis de datos en distintos períodos de tiempo, proporcionando herramientas que mejoran la toma de decisiones.

Objetivos
Crear una base de datos para registrar y analizar las operaciones de venta.
Proveer informes detallados y visualizaciones que faciliten el análisis de datos y la mejora de procesos.

Estructura del Sistema
Diagrama de Entidad-Relación
Ver el DER   DER BD Sistema_de_ventas.jpg
Representa gráficamente las entidades, sus atributos y las relaciones entre ellas.

Diagrama Esquemático
Ver el Esquemático
Muestra una vista más detallada de las tablas y sus relaciones.

Tablas y Columnas Principales
A continuación, se describen las tablas, sus propósitos y las columnas principales con sus tipos de datos y restricciones:

1. Clientes
Propósito: Almacena información básica de los clientes para gestionar ventas.
Columnas principales:
id_cliente: INT (PK), identificador único del cliente.
dni: VARCHAR(11), documento de identidad del cliente.
nombre_cliente: VARCHAR(100), nombre completo del cliente.
email: VARCHAR(100), correo electrónico para contacto.

2. Condición_pago
Propósito: Define las condiciones de pago disponibles (ej. contado, cuotas).
Columnas principales:
id_condicion: INT (PK), identificador único de la condición de pago.
descripcion_condicion: VARCHAR(50), descripción de la condición.

3. Estado_venta
Propósito: Permite clasificar las ventas según su estado (ej. pendiente, completada).
Columnas principales:
id_estado: INT (PK), identificador único del estado.
descripcion_estado: VARCHAR(50), descripción del estado.

4. Producto
Propósito: Gestiona el catálogo de productos disponibles para la venta.
Columnas principales:
id_producto: INT (PK), identificador único del producto.
nombre_producto: VARCHAR(100), nombre del producto.
categoria_producto: VARCHAR(50), categoría del producto.
precio: DECIMAL(10,2), precio unitario del producto.

5. Vendedor
Propósito: Registra a los vendedores para análisis de rendimiento.
Columnas principales:
id_vendedor: INT (PK), identificador único del vendedor.
nombre_vendedor: VARCHAR(100), nombre del vendedor.
cuit: VARCHAR(11), CUIT del vendedor.
tipo_vendedor: VARCHAR(50), clasificación del vendedor (interno/externo).

6. Venta
Propósito: Almacena los detalles de cada operación de venta.
Columnas principales:
id_venta: INT (PK), identificador único de la venta.
fecha_venta: DATETIME, fecha y hora de la venta.
Llaves foráneas:
id_cliente (INT, FK).
id_vendedor (INT, FK).
id_condicion (INT, FK).
id_estado (INT, FK).
id_producto (INT, FK).
cantidad: INT, cantidad de productos vendidos.
precio_unitario: DECIMAL(10,2), precio unitario del producto.
total: DECIMAL(10,2), monto total de la venta.

Funcionalidades Avanzadas
Vistas
Total_ventas_por_estado:
Muestra el comportamiento de las ventas clasificadas por estado (pendiente, completada, cancelada).
Total_ventas_por_producto:
Visualiza las ventas por producto, útil para gestionar inventario y proveedores.

Funciones
*PromedioVentas (Promedio_ventas):
Propósito: Calcula el promedio de ventas en un período seleccionado.
Parámetros: Fecha de inicio y fecha de fin.
Usos: Evaluar el rendimiento en distintos intervalos de tiempo.
*TotalVentas (Total_ventas):
Propósito: Devuelve el total de ventas realizadas.
Parámetros: Fecha de inicio y fecha de fin.
Usos: Proveer un panorama general de ingresos.

Procedimientos Almacenados
TotalVentasCliente:
Propósito: Calcula el total de ventas asociadas a un cliente específico.
Parámetros: id_cliente.
Flujo:
Valida si el cliente existe.
Calcula el total de ventas realizadas por ese cliente.
Retorna el resultado con nombre del cliente y monto.

TotalVentasVendedor:
Propósito: Calcula el rendimiento de un vendedor específico.
Parámetros: id_vendedor.
Flujo:
Valida si el vendedor existe.
Suma todas las ventas realizadas por ese vendedor.
Retorna el nombre del vendedor y su total de ventas.

Triggers
AfterUpdateEstadoVenta:
Propósito: Registra en un log todos los cambios realizados en el estado de las ventas para auditoría.
Usos: Asegurar la trazabilidad de los cambios.
ValidateCantidadUpdate:
Propósito: Verifica que las actualizaciones a la cantidad de productos en una venta no permitan valores negativos.
Usos: Evitar inconsistencias en los datos.

Archivos Adicionales
1_estructur.sql: Script SQL para crear la base de datos sistema_ventas.
Carpeta de inserción de registros: Contiene scripts para poblar las tablas con datos iniciales.
Scripts de vistas, funciones, procedimientos y triggers.
