DROP DATABASE IF EXISTS sistema_ventas;
CREATE DATABASE sistema_ventas;
USE sistema_ventas;

-- Tabla para los clientes
CREATE TABLE CLIENTE(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    dni VARCHAR(11),
    nombre_cliente VARCHAR(200),
    email VARCHAR(254),
    PRIMARY KEY (id_cliente)
) COMMENT 'INFORMACION BASICA DEL CLIENTE';

-- Tabla para los productos
CREATE TABLE PRODUCTO(
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(200),
    categoria_producto VARCHAR(200),
    precio DECIMAL(10,2),
    PRIMARY KEY(id_producto)
) COMMENT 'LISTA DE PRODUCTOS DISPONIBLES';

-- Tabla para los vendedores
CREATE TABLE VENDEDOR(
    id_vendedor INT NOT NULL AUTO_INCREMENT,
    nombre_vendedor VARCHAR(200),
    cuit VARCHAR(13),
    tipo_vendedor VARCHAR(200),
    PRIMARY KEY(id_vendedor)
) COMMENT 'INFORMACION DEL VENDEDOR';

-- Tabla para las condiciones de venta
CREATE TABLE CONDICION_VENTA(
    id_condicion INT NOT NULL AUTO_INCREMENT,
    descripcion_condicion VARCHAR(200),
    PRIMARY KEY(id_condicion)
) COMMENT 'CONDICIONES DE PAGO O COMPRA (CONTADO, CUOTAS, ETC)';

-- Tabla para los estados de venta
CREATE TABLE ESTADO_VENTA(
    id_estado INT NOT NULL AUTO_INCREMENT,
    descripcion_estado VARCHAR(200),
    PRIMARY KEY(id_estado)
) COMMENT 'ESTADO DE LA VENTA (FINALIZADO, EN PROCESO DE ENTREGA, EN PRODUCCION)';

-- Tabla de ventas con detalle integrado
CREATE TABLE VENTA(
    id_venta INT NOT NULL AUTO_INCREMENT,
    fecha_venta DATETIME DEFAULT (CURRENT_TIMESTAMP),
    id_cliente INT,
    id_vendedor INT,
    id_condicion INT,
    id_estado INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    total DECIMAL(12,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    PRIMARY KEY(id_venta)
) COMMENT 'REGISTRO DE VENTAS, DETALLES Y ESTADO DE CADA VENTA';

-- Relaciones entre tablas (FOREIGN KEYS)
-- Relación entre la tabla VENTA y CLIENTE
ALTER TABLE VENTA
    ADD CONSTRAINT fk_venta_cliente
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente);

-- Relación entre la tabla VENTA y VENDEDOR
ALTER TABLE VENTA
    ADD CONSTRAINT fk_venta_vendedor
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id_vendedor);

-- Relación entre la tabla VENTA y CONDICION_VENTA
ALTER TABLE VENTA
    ADD CONSTRAINT fk_venta_condicion
    FOREIGN KEY (id_condicion) REFERENCES CONDICION_VENTA(id_condicion);

-- Relación entre la tabla VENTA y ESTADO_VENTA
ALTER TABLE VENTA
    ADD CONSTRAINT fk_venta_estado
    FOREIGN KEY (id_estado) REFERENCES ESTADO_VENTA(id_estado);

-- Relación entre la tabla VENTA y PRODUCTO
ALTER TABLE VENTA
    ADD CONSTRAINT fk_venta_producto
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto);
