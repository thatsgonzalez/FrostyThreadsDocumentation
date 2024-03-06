USE db_frosty_threads;

-- Insertar datos en tb_tipos_tallas
INSERT INTO tb_tipos_tallas (tipo_talla) VALUES
('Standard'),
('Shoes');

-- Insertar datos en tb_tallas
INSERT INTO tb_tallas (talla, id_tipo_talla) VALUES
('XS', 1),
('S', 1),
('M', 1),
('L', 1),
('XL', 1);

-- Insertar datos en tb_categorias
INSERT INTO tb_categorias (categoria, categoria_img) VALUES
('Camisetas', 'camisetas.jpg'),
('Pantalones', 'pantalones.jpg'),
('Chaquetas', 'chaquetas.jpg'),
('Vestidos', 'vestidos.jpg'),
('Zapatos', 'zapatos.jpg');

-- Insertar datos en tb_descuentos
INSERT INTO tb_descuentos (descuento) VALUES
(0),
(10),
(20),
(30),
(50);

-- Insertar datos en tb_marcas
INSERT INTO tb_marcas (marca) VALUES
('Nike'),
('Adidas'),
('Puma'),
('Jordan'),
('Zara');

-- Insertar datos en tb_prendas
INSERT INTO tb_prendas (id_categoria, id_talla, precio, cantidad, detalle_prenda, id_marca, prenda_img, id_descuento, estado_prenda) VALUES
(1, 1, 2500, 10, 'Camiseta de algodón con logo Nike', 1, 'camiseta_nike.jpg', 2, 0),
(2, 3, 3500, 8, 'Pantalón vaquero estilo skinny', 4, 'pantalon_levis.jpg', 3, 0),
(3, 2, 1500, 15, 'Chaqueta deportiva con capucha', 2, 'chaqueta_adidas.jpg', 1, 1),
(4, 5, 4000, 5, 'Vestido estampado floral', 5, 'vestido_zara.jpg', 4, 0),
(5, 4, 3000, 12, 'Zapatillas deportivas con suela amortiguadora', 3, 'zapatillas_puma.jpg', 2, 1);

-- Insertar datos en tb_provincias
INSERT INTO tb_provincias (provincia) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Mendoza'),
('Tucumán');

-- Insertar datos en tb_tipos_administradores
INSERT INTO tb_tipos_administradores (tipo_administrador) VALUES
('Superadmin'),
('Administrador'),
('Moderador'),
('Soporte'),
('Empleado');

-- Insertar datos en tb_clientes
INSERT INTO tb_clientes (nombre_cliente, apellido_cliente, email_cliente, clave_cliente) VALUES
('Juan', 'Pérez', 'juan@example.com', '123456'),
('María', 'González', 'maria@example.com', 'password'),
('Carlos', 'López', 'carlos@example.com', 'qwerty'),
('Laura', 'Martínez', 'laura@example.com', 'abc123'),
('Pedro', 'Sánchez', 'pedro@example.com', 'securepass');

-- Insertar datos en tb_administradores
INSERT INTO tb_administradores (nombre_administrador, apellido_administrador, email_administrador, clave_administrador, id_tipo_administrador) VALUES
('Admin', 'Principal', 'admin@example.com', 'admin123', 1),
('Moderador', '1', 'moderador1@example.com', 'moderador123', 3),
('Soporte', 'Técnico', 'soporte@example.com', 'soporte123', 4),
('Empleado', '1', 'empleado1@example.com', 'empleado123', 5),
('Empleado', '2', 'empleado2@example.com', 'empleado456', 5);

-- Insertar datos en tb_domicilios
INSERT INTO tb_domicilios (id_provincia, detalle_direccion, id_cliente) VALUES
(1, 'Calle 123, Ciudad Autónoma', 1),
(2, 'Av. Principal 456, Barrio Centro', 2),
(3, 'Ruta 22 Km 10, Ciudad del Este', 3),
(4, 'Av. Libertador 789, Barrio Norte', 4),
(5, 'Calle Mayor 111, Barrio Oeste', 5);

-- Insertar datos en tb_ordenes
INSERT INTO tb_ordenes (id_domicilio, estado_orden) VALUES
(1, 'pendiente'),
(2, 'enviado'),
(3, 'recibido'),
(4, 'cancelado'),
(5, 'enviado');

-- Insertar datos en tb_detalle_ordenes
INSERT INTO tb_detalle_ordenes (id_prenda, id_orden, cantidad_prenda, fecha_orden) VALUES
(1, 1, 2, '2024-03-06'),
(2, 2, 1, '2024-03-05'),
(3, 3, 3, '2024-03-04'),
(4, 4, 1, '2024-03-03'),
(5, 5, 2, '2024-03-02');

-- Insertar datos en tb_comentarios
INSERT INTO tb_comentarios (detalle_comentario, calificacion_prenda, id_detalle_orden) VALUES
('Excelente producto', 5, 1),
('Buena calidad', 4, 2),
('Tardó un poco en llegar', 3, 3),
('No era lo que esperaba', 2, 4),
('Muy cómodos', 5, 5);
