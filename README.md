Sistema de Ventas
Descripción
Este sistema de ventas permite a una consultora especializada en bases de datos ayudar a su cliente a mejorar la atención y mantener un control detallado de las ventas. Está diseñado para registrar operaciones y facilitar el análisis de datos en distintos períodos de tiempo, proporcionando herramientas que mejoran la toma de decisiones.

Objetivos
Crear una base de datos para registrar y analizar las operaciones de venta.
Proveer informes detallados y visualizaciones que faciliten el análisis de datos y la mejora de procesos.
Estructura del Sistema
Diagrama de Entidad-Relación
Ver el DER
Representa gráficamente las entidades, sus atributos y las relaciones entre ellas.

Diagrama Esquemático
Ver el Esquemático
Muestra una vista más detallada de las tablas y sus relaciones.

Tablas y Funcionalidad
A continuación, se describe lo que hace cada tabla y su propósito en el sistema:

1. Clientes
Propósito: Almacena información básica de los clientes para gestionar ventas.
Columnas principales:
id_cliente: Identificador único del cliente.
dni: Documento de identidad.
nombre_cliente: Nombre del cliente.
email: Correo electrónico para contacto.
2. Condición_pago
Propósito: Define las condiciones de pago disponibles (ej. contado, cuotas).
Columnas principales:
id_condicion: Identificador único de la condición de pago.
descripcion_condicion: Detalle de la condición (texto).
3. Estado_venta
Propósito: Permite clasificar las ventas según su estado (ej. pendiente, completada).
Columnas principales:
id_estado: Identificador único del estado.
descripcion_estado: Detalle del estado.
4. Producto
Propósito: Gestiona el catálogo de productos disponibles para la venta.
Columnas principales:
id_producto: Identificador único del producto.
nombre_producto: Nombre del producto.
categoria_producto: Categoría a la que pertenece el producto.
precio: Precio unitario.
5. Vendedor
Propósito: Registra a los vendedores para análisis de rendimiento.
Columnas principales:
id_vendedor: Identificador único del vendedor.
nombre_vendedor: Nombre del vendedor.
cuit: CUIT del vendedor.
tipo_vendedor: Clasificación (interno o externo).
6. Venta
Propósito: Almacena los detalles de cada operación de venta.
Columnas principales:
id_venta: Identificador único de la venta.
fecha_venta: Fecha y hora de la venta.
Llaves foráneas: id_cliente, id_vendedor, id_condicion, id_estado, id_producto.
cantidad: Cantidad de productos vendidos.
total: Total calculado (cantidad x precio unitario).
Funcionalidades Avanzadas
Vistas
Total_ventas_por_estado: Muestra el comportamiento de las ventas clasificadas por estado (pendiente, completada, cancelada).
Total_ventas_por_producto: Visualiza las ventas por producto, útil para gestionar inventario y proveedores.
Funciones
PromedioVentas (Promedio_ventas):

Propósito: Calcula el promedio de ventas en un período seleccionado.
Usos: Evaluar el rendimiento en distintos intervalos de tiempo.
TotalVentas (Total_ventas):

Propósito: Devuelve el total de ventas realizadas.
Usos: Proveer un panorama general de ingresos.
Procedimientos Almacenados
TotalVentasCliente:

Propósito: Valida si el cliente existe, luego calcula el total de ventas asociadas.
Flujo:
Valida si el cliente existe.
Calcula el total de ventas realizadas por ese cliente.
Devuelve el resultado con nombre del cliente y monto.
TotalVentasVendedor:

Propósito: Calcula el rendimiento de un vendedor específico.
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


