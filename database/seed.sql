-- ============================================================
-- PFO1 - E-commerce y Marketplace
-- ARCHIVO: seed.sql
-- Descripción: Datos de prueba (DML)
-- Requiere: haber ejecutado schema.sql previamente
-- ============================================================

USE ecommerce_clone;

-- ============================================================
-- 1. CATEGORIA (10 registros)
-- ============================================================
INSERT INTO Categoria (nombre, descripcion) VALUES
('Celulares', 'Teléfonos móviles y accesorios'),
('Televisores', 'Smart TV, LED, OLED y accesorios'),
('Computación', 'Notebooks, PCs, tablets y periféricos'),
('Electrodomésticos', 'Heladeras, lavarropas, microondas'),
('Audio', 'Parlantes, auriculares, equipos de sonido'),
('Gaming', 'Consolas, juegos y accesorios gamer'),
('Climatización', 'Aires acondicionados, ventiladores'),
('Cámaras', 'Cámaras fotográficas y de seguridad'),
('Smart Home', 'Domótica y dispositivos inteligentes'),
('Herramientas', 'Taladros, amoladoras y herramientas varias');

-- ============================================================
-- 2. SUBCATEGORIA (30 registros)
-- ============================================================
INSERT INTO Subcategoria (nombre, id_categoria) VALUES
('Samsung', 1), ('Apple', 1), ('Motorola', 1), ('Xiaomi', 1),
('Smart TV 4K', 2), ('Smart TV 8K', 2), ('LED', 2),
('Notebooks', 3), ('Tablets', 3), ('PC Escritorio', 3),
('Heladeras', 4), ('Lavarropas', 4), ('Microondas', 4),
('Auriculares', 5), ('Parlantes', 5), ('Barras de Sonido', 5),
('Consolas', 6), ('Sillas Gamer', 6), ('Joysticks', 6),
('Aires Acondicionados', 7), ('Ventiladores', 7), ('Calefactores', 7),
('Cámaras DSLR', 8), ('Cámaras de Seguridad', 8),
('Smart Lights', 9), ('Cerraduras Inteligentes', 9),
('Taladros', 10), ('Amoladoras', 10), ('Cajas de Herramientas', 10),
('Accesorios Celulares', 1);

-- ============================================================
-- 3. MARCA (15 registros)
-- ============================================================
INSERT INTO Marca (nombre, pais_origen) VALUES
('Samsung', 'Corea del Sur'),
('Apple', 'Estados Unidos'),
('Motorola', 'Estados Unidos'),
('Xiaomi', 'China'),
('LG', 'Corea del Sur'),
('Sony', 'Japón'),
('HP', 'Estados Unidos'),
('Lenovo', 'China'),
('Dell', 'Estados Unidos'),
('Philips', 'Países Bajos'),
('Whirlpool', 'Estados Unidos'),
('BGH', 'Argentina'),
('Noblex', 'Argentina'),
('Logitech', 'Suiza'),
('Razer', 'Estados Unidos');

-- ============================================================
-- 4. PROVEEDOR (10 registros)
-- ============================================================
INSERT INTO Proveedor (nombre, cuit, telefono, email) VALUES
('Samsung Electronics Argentina', '30-12345678-9', '11-5555-1001', 'ventas@samsung.com.ar'),
('Apple Distribution International', '30-23456789-0', '11-5555-1002', 'ventas@apple.com.ar'),
('Motorola Mobility Argentina', '30-34567890-1', '11-5555-1003', 'ventas@motorola.com.ar'),
('Xiaomi Argentina S.A.', '30-45678901-2', '11-5555-1004', 'ventas@xiaomi.com.ar'),
('LG Electronics Argentina', '30-56789012-3', '11-5555-1005', 'ventas@lg.com.ar'),
('Sony Argentina S.A.', '30-67890123-4', '11-5555-1006', 'ventas@sony.com.ar'),
('HP Argentina S.R.L.', '30-78901234-5', '11-5555-1007', 'ventas@hp.com.ar'),
('Lenovo Argentina S.A.', '30-89012345-6', '11-5555-1008', 'ventas@lenovo.com.ar'),
('Dell Argentina S.R.L.', '30-90123456-7', '11-5555-1009', 'ventas@dell.com.ar'),
('Philips Argentina S.A.', '30-01234567-8', '11-5555-1010', 'ventas@philips.com.ar');

-- ============================================================
-- 5. PRODUCTO (50 registros - tabla principal)
-- ============================================================
INSERT INTO Producto (nombre, descripcion, precio, stock_minimo, id_subcategoria, id_marca, id_proveedor) VALUES
('Samsung Galaxy S24', 'Smartphone 256GB 8GB RAM', 1299999.00, 10, 1, 1, 1),
('iPhone 15 Pro', 'Smartphone 128GB Titanio', 1599999.00, 8, 2, 2, 2),
('Motorola Edge 50', 'Smartphone 256GB 12GB RAM', 899999.00, 12, 3, 3, 3),
('Xiaomi Redmi Note 13', 'Smartphone 128GB 6GB RAM', 499999.00, 15, 4, 4, 4),
('Samsung Smart TV 55" 4K', 'Televisor LED 55 pulgadas', 1099999.00, 5, 5, 1, 1),
('LG Smart TV 65" OLED', 'Televisor OLED 65 pulgadas', 2499999.00, 3, 6, 5, 5),
('Sony Bravia 50" LED', 'Televisor LED 50 pulgadas', 899999.00, 6, 7, 6, 6),
('HP Pavilion 15', 'Notebook Intel Core i5 8GB RAM', 1199999.00, 7, 8, 7, 7),
('Lenovo IdeaPad 3', 'Notebook AMD Ryzen 5 16GB RAM', 999999.00, 9, 8, 8, 8),
('Dell Inspiron 14', 'Notebook Intel Core i7 16GB RAM', 1499999.00, 5, 8, 9, 9),
('iPad Air 5ta Gen', 'Tablet 64GB WiFi', 899999.00, 8, 9, 2, 2),
('Samsung Galaxy Tab S9', 'Tablet 128GB WiFi', 1099999.00, 6, 9, 1, 1),
('PC Gamer HP Omen', 'PC Escritorio RTX 4060', 2199999.00, 4, 10, 7, 7),
('Heladera Samsung No Frost', 'Heladera 400L Inverter', 1599999.00, 5, 11, 1, 1),
('Lavarropas LG 8kg', 'Lavarropas automático', 899999.00, 8, 12, 5, 5),
('Microondas Philips 25L', 'Microondas digital', 299999.00, 10, 13, 10, 10),
('Auriculares Sony WH-1000XM5', 'Auriculares inalámbricos ANC', 599999.00, 12, 14, 6, 6),
('Parlante JBL Charge 5', 'Parlante portátil Bluetooth', 249999.00, 15, 15, 6, 6),
('Barra de Sonido Samsung', 'Barra 3.1 canales 400W', 499999.00, 7, 16, 1, 1),
('PlayStation 5 Slim', 'Consola Sony 1TB', 1299999.00, 6, 17, 6, 6),
('Xbox Series X', 'Consola Microsoft 1TB', 1199999.00, 5, 17, 6, 6),
('Silla Gamer Razer Iskur', 'Silla ergonómica premium', 799999.00, 4, 18, 15, 9),
('Joystick DualSense', 'Control inalámbrico PS5', 149999.00, 20, 19, 6, 6),
('Aire Acondicionado Samsung 3000F', 'Split inverter frío/calor', 1399999.00, 5, 20, 1, 1),
('Ventilador Philips 20"', 'Ventilador de pie 3 velocidades', 89999.00, 15, 21, 10, 10),
('Calefactor Noblex 2000W', 'Calefactor eléctrico', 129999.00, 10, 22, 13, 10),
('Cámara Canon EOS R50', 'Cámara mirrorless 24MP', 1499999.00, 3, 23, 6, 6),
('Cámara de Seguridad Xiaomi', 'Cámara WiFi 360°', 89999.00, 20, 24, 4, 4),
('Smart Light Philips Hue', 'Lámpara inteligente RGB', 49999.00, 25, 25, 10, 10),
('Cerradura Inteligente Samsung', 'Cerradura digital huella', 299999.00, 8, 26, 1, 1),
('Taladro Bosch 500W', 'Taladro percutor', 89999.00, 12, 27, 6, 6),
('Amoladora Angular DeWalt', 'Amoladora 850W', 129999.00, 8, 28, 6, 6),
('Caja de Herramientas 100pz', 'Set completo', 159999.00, 6, 29, 6, 6),
('Funda Samsung Galaxy S24', 'Funda silicona', 29999.00, 30, 30, 1, 1),
('Cargador Apple 20W', 'Cargador USB-C', 49999.00, 25, 30, 2, 2),
('Vidrio Templado Motorola', 'Protector pantalla', 19999.00, 40, 30, 3, 3),
('Smartwatch Samsung Watch 6', 'Reloj inteligente', 599999.00, 10, 30, 1, 1),
('Auriculares Apple AirPods Pro', 'Auriculares TWS ANC', 699999.00, 12, 14, 2, 2),
('Mouse Logitech MX Master 3', 'Mouse inalámbrico ergonómico', 149999.00, 15, 8, 14, 7),
('Teclado Mecánico Razer', 'Teclado gamer RGB', 199999.00, 10, 8, 15, 9),
('Monitor Samsung 27" 4K', 'Monitor profesional', 799999.00, 6, 8, 1, 1),
('Notebook Gamer ASUS ROG', 'Notebook RTX 4070', 2799999.00, 3, 8, 7, 7),
('Tablet Lenovo Tab P12', 'Tablet 128GB', 599999.00, 8, 9, 8, 8),
('Heladera LG French Door', 'Heladera 500L', 2199999.00, 3, 11, 5, 5),
('Lavarropas Samsung 10kg', 'Lavarropas carga frontal', 1199999.00, 5, 12, 1, 1),
('Microondas LG 30L', 'Microondas grill', 399999.00, 8, 13, 5, 5),
('Aire Acondicionado LG 4500F', 'Split inverter', 1899999.00, 4, 20, 5, 5),
('Parlante Sony SRS-XB43', 'Parlante Bluetooth extra bass', 349999.00, 10, 15, 6, 6),
('Cámara GoPro Hero 12', 'Cámara de acción 5K', 899999.00, 5, 23, 6, 6),
('Proyector Epson Full HD', 'Proyector 3000 lúmenes', 1099999.00, 4, 8, 6, 6);

-- ============================================================
-- 6. CLIENTE (15 registros)
-- ============================================================
INSERT INTO Cliente (nombre, apellido, email, telefono, direccion, ciudad, provincia, codigo_postal) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '11-5555-2001', 'Av. Corrientes 1234', 'Buenos Aires', 'CABA', '1043'),
('María', 'Gómez', 'maria.gomez@email.com', '11-5555-2002', 'Av. Santa Fe 5678', 'Buenos Aires', 'CABA', '1060'),
('Carlos', 'López', 'carlos.lopez@email.com', '11-5555-2003', 'Calle Florida 890', 'Buenos Aires', 'CABA', '1005'),
('Ana', 'Martínez', 'ana.martinez@email.com', '11-5555-2004', 'Av. Cabildo 2345', 'Buenos Aires', 'CABA', '1428'),
('Luis', 'Rodríguez', 'luis.rodriguez@email.com', '11-5555-2005', 'Av. Rivadavia 6789', 'Buenos Aires', 'CABA', '1406'),
('Laura', 'Fernández', 'laura.fernandez@email.com', '11-5555-2006', 'Calle Mitre 123', 'San Isidro', 'Buenos Aires', '1642'),
('Diego', 'Sánchez', 'diego.sanchez@email.com', '11-5555-2007', 'Av. Libertador 4567', 'Vicente López', 'Buenos Aires', '1602'),
('Sofía', 'Ramírez', 'sofia.ramirez@email.com', '11-5555-2008', 'Calle Sarmiento 789', 'Morón', 'Buenos Aires', '1708'),
('Pablo', 'Torres', 'pablo.torres@email.com', '11-5555-2009', 'Av. San Martín 1011', 'La Plata', 'Buenos Aires', '1900'),
('Valentina', 'Flores', 'valentina.flores@email.com', '11-5555-2010', 'Calle Belgrano 1213', 'Quilmes', 'Buenos Aires', '1878'),
('Matías', 'Acosta', 'matias.acosta@email.com', '11-5555-2011', 'Av. Mitre 1415', 'Avellaneda', 'Buenos Aires', '1870'),
('Camila', 'Benítez', 'camila.benitez@email.com', '11-5555-2012', 'Calle Rivadavia 1617', 'Lomas de Zamora', 'Buenos Aires', '1832'),
('Nicolás', 'Herrera', 'nicolas.herrera@email.com', '11-5555-2013', 'Av. Pavón 1819', 'Lanús', 'Buenos Aires', '1824'),
('Julieta', 'Morales', 'julieta.morales@email.com', '11-5555-2014', 'Calle Yrigoyen 2021', 'Banfield', 'Buenos Aires', '1828'),
('Facundo', 'Silva', 'facundo.silva@email.com', '11-5555-2015', 'Av. Calchaquí 2223', 'Quilmes', 'Buenos Aires', '1879');

-- ============================================================
-- 7. SUCURSAL (10 registros) - renombradas sin marca
-- ============================================================
INSERT INTO Sucursal (nombre, direccion, ciudad, telefono) VALUES
('Sucursal Centro', 'Av. Corrientes 1234', 'Buenos Aires', '11-5555-3001'),
('Sucursal Palermo', 'Av. Santa Fe 5678', 'Buenos Aires', '11-5555-3002'),
('Sucursal Cabildo', 'Av. Cabildo 2345', 'Buenos Aires', '11-5555-3003'),
('Sucursal San Isidro', 'Calle Mitre 123', 'San Isidro', '11-5555-3004'),
('Sucursal La Plata', 'Av. San Martín 1011', 'La Plata', '11-5555-3005'),
('Sucursal Quilmes', 'Calle Belgrano 1213', 'Quilmes', '11-5555-3006'),
('Sucursal Avellaneda', 'Av. Mitre 1415', 'Avellaneda', '11-5555-3007'),
('Sucursal Lomas', 'Calle Rivadavia 1617', 'Lomas de Zamora', '11-5555-3008'),
('Sucursal Lanús', 'Av. Pavón 1819', 'Lanús', '11-5555-3009'),
('Sucursal Banfield', 'Calle Yrigoyen 2021', 'Banfield', '11-5555-3010');

-- ============================================================
-- 8. STOCK (100 registros: 10 productos x 10 sucursales)
-- ============================================================
INSERT INTO Stock (cantidad, id_producto, id_sucursal) VALUES
(25, 1, 1), (30, 2, 1), (15, 3, 1), (20, 4, 1), (10, 5, 1),
(12, 6, 1), (18, 7, 1), (8, 8, 1), (14, 9, 1), (9, 10, 1),
(22, 1, 2), (28, 2, 2), (16, 3, 2), (24, 4, 2), (11, 5, 2),
(13, 6, 2), (19, 7, 2), (7, 8, 2), (15, 9, 2), (10, 10, 2),
(20, 1, 3), (26, 2, 3), (14, 3, 3), (22, 4, 3), (9, 5, 3),
(11, 6, 3), (17, 7, 3), (6, 8, 3), (13, 9, 3), (8, 10, 3),
(18, 1, 4), (24, 2, 4), (12, 3, 4), (20, 4, 4), (8, 5, 4),
(10, 6, 4), (16, 7, 4), (5, 8, 4), (12, 9, 4), (7, 10, 4),
(15, 1, 5), (22, 2, 5), (10, 3, 5), (18, 4, 5), (7, 5, 5),
(9, 6, 5), (14, 7, 5), (4, 8, 5), (11, 9, 5), (6, 10, 5),
(12, 1, 6), (20, 2, 6), (9, 3, 6), (16, 4, 6), (6, 5, 6),
(8, 6, 6), (13, 7, 6), (3, 8, 6), (10, 9, 6), (5, 10, 6),
(10, 1, 7), (18, 2, 7), (8, 3, 7), (14, 4, 7), (5, 5, 7),
(7, 6, 7), (12, 7, 7), (2, 8, 7), (9, 9, 7), (4, 10, 7),
(8, 1, 8), (16, 2, 8), (7, 3, 8), (12, 4, 8), (4, 5, 8),
(6, 6, 8), (11, 7, 8), (1, 8, 8), (8, 9, 8), (3, 10, 8),
(6, 1, 9), (14, 2, 9), (6, 3, 9), (10, 4, 9), (3, 5, 9),
(5, 6, 9), (10, 7, 9), (1, 8, 9), (7, 9, 9), (2, 10, 9),
(4, 1, 10), (12, 2, 10), (5, 3, 10), (8, 4, 10), (2, 5, 10),
(4, 6, 10), (9, 7, 10), (1, 8, 10), (6, 9, 10), (1, 10, 10);

-- ============================================================
-- 9. ENVIO (10 registros)
-- ============================================================
INSERT INTO Envio (direccion, ciudad, provincia, codigo_postal, fecha_envio, estado) VALUES
('Av. Corrientes 1234', 'Buenos Aires', 'CABA', '1043', '2025-01-15', 'Entregado'),
('Av. Santa Fe 5678', 'Buenos Aires', 'CABA', '1060', '2025-01-16', 'Entregado'),
('Calle Florida 890', 'Buenos Aires', 'CABA', '1005', '2025-01-17', 'En tránsito'),
('Av. Cabildo 2345', 'Buenos Aires', 'CABA', '1428', '2025-01-18', 'Entregado'),
('Av. Rivadavia 6789', 'Buenos Aires', 'CABA', '1406', '2025-01-19', 'Pendiente'),
('Calle Mitre 123', 'San Isidro', 'Buenos Aires', '1642', '2025-01-20', 'Entregado'),
('Av. Libertador 4567', 'Vicente López', 'Buenos Aires', '1602', '2025-01-21', 'En tránsito'),
('Calle Sarmiento 789', 'Morón', 'Buenos Aires', '1708', '2025-01-22', 'Entregado'),
('Av. San Martín 1011', 'La Plata', 'Buenos Aires', '1900', '2025-01-23', 'Pendiente'),
('Calle Belgrano 1213', 'Quilmes', 'Buenos Aires', '1878', '2025-01-24', 'Entregado');

-- ============================================================
-- 10. PEDIDO (50 registros - tabla transaccional principal)
-- ============================================================
INSERT INTO Pedido (fecha, total, estado, id_cliente, id_envio) VALUES
('2025-01-10', 1299999.00, 'Entregado', 1, 1),
('2025-01-11', 1599999.00, 'Entregado', 2, 2),
('2025-01-12', 899999.00, 'En tránsito', 3, 3),
('2025-01-13', 1099999.00, 'Entregado', 4, 4),
('2025-01-14', 2499999.00, 'Pendiente', 5, 5),
('2025-01-15', 1199999.00, 'Entregado', 6, 6),
('2025-01-16', 999999.00, 'En tránsito', 7, 7),
('2025-01-17', 1499999.00, 'Entregado', 8, 8),
('2025-01-18', 899999.00, 'Pendiente', 9, 9),
('2025-01-19', 1099999.00, 'Entregado', 10, 10),
('2025-01-20', 2199999.00, 'Entregado', 11, NULL),
('2025-01-21', 1599999.00, 'En tránsito', 12, NULL),
('2025-01-22', 899999.00, 'Pendiente', 13, NULL),
('2025-01-23', 299999.00, 'Entregado', 14, NULL),
('2025-01-24', 599999.00, 'Entregado', 15, NULL),
('2025-01-25', 249999.00, 'En tránsito', 1, NULL),
('2025-01-26', 499999.00, 'Pendiente', 2, NULL),
('2025-01-27', 1299999.00, 'Entregado', 3, NULL),
('2025-01-28', 1199999.00, 'Entregado', 4, NULL),
('2025-01-29', 799999.00, 'En tránsito', 5, NULL),
('2025-01-30', 149999.00, 'Pendiente', 6, NULL),
('2025-02-01', 1399999.00, 'Entregado', 7, NULL),
('2025-02-02', 89999.00, 'Entregado', 8, NULL),
('2025-02-03', 129999.00, 'En tránsito', 9, NULL),
('2025-02-04', 1499999.00, 'Pendiente', 10, NULL),
('2025-02-05', 89999.00, 'Entregado', 11, NULL),
('2025-02-06', 49999.00, 'Entregado', 12, NULL),
('2025-02-07', 299999.00, 'En tránsito', 13, NULL),
('2025-02-08', 89999.00, 'Pendiente', 14, NULL),
('2025-02-09', 129999.00, 'Entregado', 15, NULL),
('2025-02-10', 159999.00, 'Entregado', 1, NULL),
('2025-02-11', 29999.00, 'En tránsito', 2, NULL),
('2025-02-12', 49999.00, 'Pendiente', 3, NULL),
('2025-02-13', 19999.00, 'Entregado', 4, NULL),
('2025-02-14', 599999.00, 'Entregado', 5, NULL),
('2025-02-15', 699999.00, 'En tránsito', 6, NULL),
('2025-02-16', 149999.00, 'Pendiente', 7, NULL),
('2025-02-17', 199999.00, 'Entregado', 8, NULL),
('2025-02-18', 799999.00, 'Entregado', 9, NULL),
('2025-02-19', 2799999.00, 'En tránsito', 10, NULL),
('2025-02-20', 599999.00, 'Pendiente', 11, NULL),
('2025-02-21', 2199999.00, 'Entregado', 12, NULL),
('2025-02-22', 1199999.00, 'Entregado', 13, NULL),
('2025-02-23', 399999.00, 'En tránsito', 14, NULL),
('2025-02-24', 1899999.00, 'Pendiente', 15, NULL),
('2025-02-25', 349999.00, 'Entregado', 1, NULL),
('2025-02-26', 899999.00, 'Entregado', 2, NULL),
('2025-02-27', 1099999.00, 'En tránsito', 3, NULL),
('2025-02-28', 1599999.00, 'Pendiente', 4, NULL),
('2025-03-01', 899999.00, 'Entregado', 5, NULL);

-- ============================================================
-- 11. LINEA_PEDIDO (50 registros)
-- ============================================================
INSERT INTO Linea_Pedido (cantidad, precio_unitario, id_producto, id_pedido) VALUES
(1, 1299999.00, 1, 1),
(1, 1599999.00, 2, 2),
(1, 899999.00, 3, 3),
(1, 1099999.00, 5, 4),
(1, 2499999.00, 6, 5),
(1, 1199999.00, 8, 6),
(1, 999999.00, 9, 7),
(1, 1499999.00, 10, 8),
(1, 899999.00, 11, 9),
(1, 1099999.00, 12, 10),
(1, 2199999.00, 13, 11),
(1, 1599999.00, 14, 12),
(1, 899999.00, 15, 13),
(1, 299999.00, 16, 14),
(1, 599999.00, 17, 15),
(1, 249999.00, 18, 16),
(1, 499999.00, 19, 17),
(1, 1299999.00, 20, 18),
(1, 1199999.00, 21, 19),
(1, 799999.00, 22, 20),
(1, 149999.00, 23, 21),
(1, 1399999.00, 24, 22),
(1, 89999.00, 25, 23),
(1, 129999.00, 26, 24),
(1, 1499999.00, 27, 25),
(1, 89999.00, 28, 26),
(1, 49999.00, 29, 27),
(1, 299999.00, 30, 28),
(1, 89999.00, 31, 29),
(1, 129999.00, 32, 30),
(1, 159999.00, 33, 31),
(1, 29999.00, 34, 32),
(1, 49999.00, 35, 33),
(1, 19999.00, 36, 34),
(1, 599999.00, 37, 35),
(1, 699999.00, 38, 36),
(1, 149999.00, 39, 37),
(1, 199999.00, 40, 38),
(1, 799999.00, 41, 39),
(1, 2799999.00, 42, 40),
(1, 599999.00, 43, 41),
(1, 2199999.00, 44, 42),
(1, 1199999.00, 45, 43),
(1, 399999.00, 46, 44),
(1, 1899999.00, 47, 45),
(1, 349999.00, 48, 46),
(1, 899999.00, 49, 47),
(1, 1099999.00, 50, 48),
(1, 1599999.00, 14, 49),
(1, 899999.00, 15, 50);

-- ============================================================
-- 12. PAGO (15 registros)
-- ============================================================
INSERT INTO Pago (metodo, monto, fecha, id_pedido) VALUES
('Tarjeta de Crédito', 1299999.00, '2025-01-10', 1),
('Tarjeta de Débito', 1599999.00, '2025-01-11', 2),
('Transferencia', 899999.00, '2025-01-12', 3),
('Tarjeta de Crédito', 1099999.00, '2025-01-13', 4),
('Tarjeta de Crédito', 2499999.00, '2025-01-14', 5),
('Efectivo', 1199999.00, '2025-01-15', 6),
('Transferencia', 999999.00, '2025-01-16', 7),
('Tarjeta de Débito', 1499999.00, '2025-01-17', 8),
('Tarjeta de Crédito', 899999.00, '2025-01-18', 9),
('Transferencia', 1099999.00, '2025-01-19', 10),
('Tarjeta de Crédito', 2199999.00, '2025-01-20', 11),
('Tarjeta de Débito', 1599999.00, '2025-01-21', 12),
('Efectivo', 899999.00, '2025-01-22', 13),
('Tarjeta de Crédito', 299999.00, '2025-01-23', 14),
('Transferencia', 599999.00, '2025-01-24', 15);

-- ============================================================
-- 13. RESENA (10 registros)
-- ============================================================
INSERT INTO Resena (puntuacion, comentario, fecha, id_cliente, id_producto) VALUES
(5, 'Excelente producto, muy recomendable', '2025-01-20', 1, 1),
(4, 'Muy bueno, cumple expectativas', '2025-01-21', 2, 2),
(3, 'Regular, esperaba más', '2025-01-22', 3, 3),
(5, 'Increíble calidad de imagen', '2025-01-23', 4, 5),
(4, 'Buena relación precio-calidad', '2025-01-24', 5, 6),
(2, 'No me gustó, falló a los días', '2025-01-25', 6, 8),
(5, 'Muy rápido y liviano', '2025-01-26', 7, 9),
(4, 'Buena batería', '2025-01-27', 8, 10),
(5, 'Perfecto para trabajar', '2025-01-28', 9, 11),
(3, 'El precio es elevado', '2025-01-29', 10, 12);

-- ============================================================
-- FIN DEL SEED
-- ============================================================