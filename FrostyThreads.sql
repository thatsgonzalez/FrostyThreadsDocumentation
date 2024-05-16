DROP DATABASE db_frosty_threads;

CREATE DATABASE db_frosty_threads;

USE db_frosty_threads;

CREATE TABLE tb_tipos_tallas(
	id_tipo_talla INT AUTO_INCREMENT PRIMARY KEY,
	tipo_talla VARCHAR(32) NOT NULL
);

CREATE TABLE tb_tallas(
	id_talla INT AUTO_INCREMENT PRIMARY KEY,
	talla VARCHAR(8) NOT NULL,
	id_tipo_talla INT NOT NULL,
	CONSTRAINT fk_talla_tipo FOREIGN KEY (id_tipo_talla) REFERENCES tb_tipos_tallas(id_tipo_talla)
);

CREATE TABLE tb_categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
	categoria VARCHAR(32) NOT NULL,
	categoria_img VARCHAR(25)
);

CREATE TABLE tb_descuentos(
	id_descuento INT PRIMARY KEY AUTO_INCREMENT,
	descuento INT NOT NULL,
	
	CONSTRAINT ck_descuento CHECK(descuento>=0 && descuento<=100)
);

CREATE TABLE tb_marcas(
	id_marca INT AUTO_INCREMENT PRIMARY KEY,
	marca VARCHAR(32)
);

CREATE TABLE tb_prendas(
	id_prenda INT AUTO_INCREMENT PRIMARY KEY,
	id_categoria INT NOT NULL,
	id_talla INT NOT NULL,
	precio INT NOT NULL,
	cantidad INT NOT NULL,
	detalle_prenda VARCHAR(255),
	id_marca INT NOT NULL,
	prenda_img VARCHAR(25),
	id_descuento INT NOT NULL,
	estado_prenda BOOLEAN DEFAULT 0,
	
	CONSTRAINT fk_prenda_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria),
	CONSTRAINT fk_prenda_talla FOREIGN KEY (id_talla) REFERENCES tb_tallas(id_talla),
	CONSTRAINT ck_prenda_precio CHECK(precio>=0),
	CONSTRAINT ck_prenda_cantidad CHECK(cantidad>=0),
	CONSTRAINT fk_prenda_descuento FOREIGN KEY (id_descuento) REFERENCES tb_descuentos(id_descuento),
	CONSTRAINT fk_prenda_marca FOREIGN KEY (id_marca) REFERENCES tb_marcas(id_marca)	
	
);

CREATE TABLE tb_provincias(
	id_provincia INT PRIMARY KEY AUTO_INCREMENT,
	provincia VARCHAR(32) NOT NULL 
);

CREATE TABLE tb_tipos_administradores(
	id_tipo_administrador INT PRIMARY KEY AUTO_INCREMENT,
	tipo_administrador VARCHAR(16) NOT NULL
);

CREATE TABLE tb_clientes(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nombre_cliente VARCHAR(64) NOT NULL,
	apellido_cliente VARCHAR(64) NOT NULL,
	email_cliente VARCHAR(128) NOT NULL,
	clave_cliente VARCHAR(255) NOT NULL,
	
	CONSTRAINT u_cliente_email UNIQUE(email_cliente)
	
);

CREATE TABLE tb_administradores(
	id_administrador INT PRIMARY KEY AUTO_INCREMENT,
	nombre_administrador VARCHAR(64) NOT NULL,
	apellido_administrador VARCHAR(64) NOT NULL,
	email_administrador VARCHAR(128) NOT NULL,
	clave_administrador VARCHAR(255) NOT NULL,
	id_tipo_administrador INT NOT NULL,
	
	CONSTRAINT fk_administrador_tipo FOREIGN KEY (id_tipo_administrador) REFERENCES tb_tipos_administradores(id_tipo_administrador),
	CONSTRAINT u_administrador_email UNIQUE(email_administrador)
	
);


CREATE TABLE tb_domicilios(
	id_domicilio INT PRIMARY KEY AUTO_INCREMENT,
	id_provincia INT NOT NULL,
	detalle_direccion VARCHAR(255) NOT NULL,
	id_cliente INT NOT NULL,
	
	CONSTRAINT fk_domicilio_provincia FOREIGN KEY (id_provincia) REFERENCES tb_provincias(id_provincia),
	CONSTRAINT fk_domicilio_cliente FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
	 
);

CREATE TABLE tb_ordenes(
	id_orden INT PRIMARY KEY AUTO_INCREMENT,
	id_domicilio INT NOT NULL,
	estado_orden ENUM('pendiente','enviado','recibido','cancelado'),
	
	CONSTRAINT fk_orden_domicilio FOREIGN KEY (id_domicilio) REFERENCES tb_domicilios(id_domicilio)
	
);

CREATE TABLE tb_detalle_ordenes(
	id_detalle_orden INT PRIMARY KEY AUTO_INCREMENT,
	id_prenda INT NOT NULL,
	id_orden INT NOT NULL,
	cantidad_prenda INT NOT NULL,
	fecha_orden DATE NOT NULL,
	
	CONSTRAINT fk_detalle_prenda FOREIGN KEY (id_prenda) REFERENCES tb_prendas(id_prenda),
	CONSTRAINT fk_detalle_orden FOREIGN KEY (id_orden) REFERENCES tb_ordenes(id_orden),
	CONSTRAINT ck_detalle_cantidad_prenda CHECK(cantidad_prenda>=0)
);

CREATE TABLE tb_comentarios(
	id_comentario INT PRIMARY KEY AUTO_INCREMENT,
	detalle_comentario VARCHAR(32) NOT NULL,
	calificacion_prenda INT(1) NOT NULL,
	estado_comentario BOOLEAN DEFAULT 0,
	id_detalle_orden INT NOT NULL UNIQUE,
	
	CONSTRAINT ck_calificacion_prenda CHECK(calificacion_prenda>=0 && calificacion_prenda<=5),
	CONSTRAINT fk_comentario_detalle FOREIGN KEY (id_detalle_orden) REFERENCES tb_detalle_ordenes(id_detalle_orden)
);

CREATE USER 'admin'@'localhost' IDENTIFIED BY '123456';

GRANT INSERT, UPDATE, SELECT, DELETE, EXECUTE, TRIGGER, CREATE ROUTINE, ALTER ROUTINE, CREATE VIEW ON 
db_frosty_threads.* TO 'admin'@'localhost';

USE db_frosty_threads;

INSERT INTO tb_tipos_administradores(tipo_administrador) VALUES('SuperAdmin');



INSERT INTO tb_provincias(provincia)
VALUES('toronto');

SELECT * FROM tb_clientes;

INSERT INTO tb_domicilios(id_provincia, detalle_direccion, id_cliente) VALUES(1,'mi casa',1);
