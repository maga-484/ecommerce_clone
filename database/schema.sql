-- ============================================================
-- PFO1 - E-commerce y Marketplace
-- ARCHIVO: schema.sql
-- Descripción: Creación del esquema y todas las tablas (DDL)
-- ============================================================

DROP SCHEMA IF EXISTS ecommerce_clone;
CREATE SCHEMA ecommerce_clone;
USE ecommerce_clone;

-- ============================================================
-- 1. TABLA: CATEGORIA
-- ============================================================
CREATE TABLE Categoria (
	id_categoria    INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(100) NOT NULL,
	descripcion     VARCHAR(255)
);

-- ============================================================
-- 2. TABLA: SUBCATEGORIA
-- ============================================================
CREATE TABLE Subcategoria (
	id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(100) NOT NULL,
	id_categoria    INT NOT NULL,
	FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

-- ============================================================
-- 3. TABLA: MARCA
-- ============================================================
CREATE TABLE Marca (
	id_marca        INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(100) NOT NULL,
	pais_origen     VARCHAR(50)
);

-- ============================================================
-- 4. TABLA: PROVEEDOR
-- ============================================================
CREATE TABLE Proveedor (
	id_proveedor    INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(150) NOT NULL,
	cuit            VARCHAR(15) UNIQUE,
	telefono        VARCHAR(20),
	email           VARCHAR(100)
);

-- ============================================================
-- 5. TABLA: PRODUCTO
-- ============================================================
CREATE TABLE Producto (
	id_producto     INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(150) NOT NULL,
	descripcion     VARCHAR(255),
	precio          DECIMAL(10,2) NOT NULL,
	stock_minimo    INT DEFAULT 5,
	id_subcategoria INT NOT NULL,
	id_marca        INT NOT NULL,
	id_proveedor    INT NOT NULL,
	FOREIGN KEY (id_subcategoria) REFERENCES Subcategoria(id_subcategoria),
	FOREIGN KEY (id_marca) REFERENCES Marca(id_marca),
	FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- ============================================================
-- 6. TABLA: CLIENTE
-- ============================================================
CREATE TABLE Cliente (
	id_cliente      INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(100) NOT NULL,
	apellido        VARCHAR(100) NOT NULL,
	email           VARCHAR(150) UNIQUE NOT NULL,
	telefono        VARCHAR(20),
	direccion       VARCHAR(200),
	ciudad          VARCHAR(100),
	provincia       VARCHAR(100),
	codigo_postal   VARCHAR(10)
);

-- ============================================================
-- 7. TABLA: SUCURSAL
-- ============================================================
CREATE TABLE Sucursal (
	id_sucursal     INT AUTO_INCREMENT PRIMARY KEY,
	nombre          VARCHAR(100) NOT NULL,
	direccion       VARCHAR(200),
	ciudad          VARCHAR(100),
	telefono        VARCHAR(20)
);

-- ============================================================
-- 8. TABLA: STOCK
-- ============================================================
CREATE TABLE Stock (
	id_stock        INT AUTO_INCREMENT PRIMARY KEY,
	cantidad        INT NOT NULL DEFAULT 0,
	id_producto     INT NOT NULL,
	id_sucursal     INT NOT NULL,
	FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
	FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

-- ============================================================
-- 9. TABLA: ENVIO
-- ============================================================
CREATE TABLE Envio (
	id_envio        INT AUTO_INCREMENT PRIMARY KEY,
	direccion       VARCHAR(200) NOT NULL,
	ciudad          VARCHAR(100),
	provincia       VARCHAR(100),
	codigo_postal   VARCHAR(10),
	fecha_envio     DATE,
	estado          VARCHAR(50) DEFAULT 'Pendiente'
);

-- ============================================================
-- 10. TABLA: PEDIDO
-- ============================================================
CREATE TABLE Pedido (
	id_pedido       INT AUTO_INCREMENT PRIMARY KEY,
	fecha           DATE NOT NULL,
	total           DECIMAL(12,2) NOT NULL,
	estado          VARCHAR(50) DEFAULT 'Pendiente',
	id_cliente      INT NOT NULL,
	id_envio        INT,
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
	FOREIGN KEY (id_envio) REFERENCES Envio(id_envio)
);

-- ============================================================
-- 11. TABLA: LINEA_PEDIDO
-- ============================================================
CREATE TABLE Linea_Pedido (
	id_linea        INT AUTO_INCREMENT PRIMARY KEY,
	cantidad        INT NOT NULL,
	precio_unitario DECIMAL(10,2) NOT NULL,
	id_producto     INT NOT NULL,
	id_pedido       INT NOT NULL,
	FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
	FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- ============================================================
-- 12. TABLA: PAGO
-- ============================================================
CREATE TABLE Pago (
	id_pago         INT AUTO_INCREMENT PRIMARY KEY,
	metodo          VARCHAR(50) NOT NULL,
	monto           DECIMAL(12,2) NOT NULL,
	fecha           DATE NOT NULL,
	id_pedido       INT NOT NULL,
	FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- ============================================================
-- 13. TABLA: RESENA
-- ============================================================
CREATE TABLE Resena (
	id_resena       INT AUTO_INCREMENT PRIMARY KEY,
	puntuacion      INT NOT NULL CHECK (puntuacion BETWEEN 1 AND 5),
	comentario      VARCHAR(500),
	fecha           DATE NOT NULL,
	id_cliente      INT NOT NULL,
	id_producto     INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
	FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- ============================================================
-- FIN DEL SCHEMA
-- ============================================================