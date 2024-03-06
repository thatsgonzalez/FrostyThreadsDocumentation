USE db_frosty_threads;

DELIMITER //
CREATE TRIGGER eliminar_existencias_despues_insertar
AFTER INSERT ON tb_detalle_ordenes
FOR EACH ROW
BEGIN
    DECLARE cantidad_pedida INT;
    SELECT cantidad_prenda INTO cantidad_pedida FROM tb_detalle_ordenes WHERE id_detalle_orden = NEW.id_detalle_orden;
    UPDATE tb_prendas SET cantidad = cantidad - cantidad_pedida WHERE id_prenda = NEW.id_prenda;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION calcular_total_pedido(id_orden_param INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(tp.precio * tdo.cantidad_prenda) INTO total
    FROM tb_detalle_ordenes tdo
    INNER JOIN tb_prendas tp ON tdo.id_prenda = tp.id_prenda
    WHERE tdo.id_orden = id_orden_param;
    
    RETURN total;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION calcular_subtotal_por_prenda(id_detalle_orden_param INT, id_prenda_param INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE subtotal DECIMAL(10,2);
    
    SELECT (tp.precio * tdo.cantidad_prenda) INTO subtotal
    FROM tb_detalle_ordenes tdo
    INNER JOIN tb_prendas tp ON tdo.id_prenda = tp.id_prenda
    WHERE tdo.id_detalle_orden = id_detalle_orden_param AND tp.id_prenda = id_prenda_param;
    
    RETURN subtotal;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_tipo_talla(
    IN tipo_talla_param VARCHAR(32)
)
BEGIN
    INSERT INTO tb_tipos_tallas (tipo_talla) VALUES (tipo_talla_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_talla(
    IN talla_param VARCHAR(8),
    IN id_tipo_talla_param INT
)
BEGIN
    INSERT INTO tb_tallas (talla, id_tipo_talla) VALUES (talla_param, id_tipo_talla_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_categoria(
    IN categoria_param VARCHAR(32),
    IN categoria_img_param VARCHAR(25)
)
BEGIN
    INSERT INTO tb_categorias (categoria, categoria_img) VALUES (categoria_param, categoria_img_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_descuento(
    IN descuento_param INT
)
BEGIN
    INSERT INTO tb_descuentos (descuento) VALUES (descuento_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_marca(
    IN marca_param VARCHAR(32)
)
BEGIN
    INSERT INTO tb_marcas (marca) VALUES (marca_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_prenda(
    IN id_categoria_param INT,
    IN id_talla_param INT,
    IN precio_param INT,
    IN cantidad_param INT,
    IN detalle_prenda_param VARCHAR(255),
    IN id_marca_param INT,
    IN prenda_img_param VARCHAR(25),
    IN id_descuento_param INT,
    IN estado_prenda_param BOOLEAN
)
BEGIN
    INSERT INTO tb_prendas (id_categoria, id_talla, precio, cantidad, detalle_prenda, id_marca, prenda_img, id_descuento, estado_prenda) 
    VALUES (id_categoria_param, id_talla_param, precio_param, cantidad_param, detalle_prenda_param, id_marca_param, prenda_img_param, id_descuento_param, estado_prenda_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_provincia(
    IN provincia_param VARCHAR(32)
)
BEGIN
    INSERT INTO tb_provincias (provincia) VALUES (provincia_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_tipo_administrador(
    IN tipo_administrador_param VARCHAR(16)
)
BEGIN
    INSERT INTO tb_tipos_administradores (tipo_administrador) VALUES (tipo_administrador_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_cliente(
    IN nombre_cliente_param VARCHAR(64),
    IN apellido_cliente_param VARCHAR(64),
    IN email_cliente_param VARCHAR(128),
    IN clave_cliente_param VARCHAR(255)
)
BEGIN
    INSERT INTO tb_clientes (nombre_cliente, apellido_cliente, email_cliente, clave_cliente)
    VALUES (nombre_cliente_param, apellido_cliente_param, email_cliente_param, clave_cliente_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_administrador(
    IN nombre_administrador_param VARCHAR(64),
    IN apellido_administrador_param VARCHAR(64),
    IN email_administrador_param VARCHAR(128),
    IN clave_administrador_param VARCHAR(255),
    IN id_tipo_administrador_param INT
)
BEGIN
    INSERT INTO tb_administradores (nombre_administrador, apellido_administrador, email_administrador, clave_administrador, id_tipo_administrador)
    VALUES (nombre_administrador_param, apellido_administrador_param, email_administrador_param, clave_administrador_param, id_tipo_administrador_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_domicilio(
    IN id_provincia_param INT,
    IN detalle_direccion_param VARCHAR(255),
    IN id_cliente_param INT
)
BEGIN
    INSERT INTO tb_domicilios (id_provincia, detalle_direccion, id_cliente)
    VALUES (id_provincia_param, detalle_direccion_param, id_cliente_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_orden(
    IN id_domicilio_param INT,
    IN estado_orden_param ENUM('pendiente','enviado','recibido','cancelado')
)
BEGIN
    INSERT INTO tb_ordenes (id_domicilio, estado_orden)
    VALUES (id_domicilio_param, estado_orden_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_detalle_orden(
    IN id_prenda_param INT,
    IN id_orden_param INT,
    IN cantidad_prenda_param INT,
    IN fecha_orden_param DATE
)
BEGIN
    INSERT INTO tb_detalle_ordenes (id_prenda, id_orden, cantidad_prenda, fecha_orden)
    VALUES (id_prenda_param, id_orden_param, cantidad_prenda_param, fecha_orden_param);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_comentario(
    IN detalle_comentario_param VARCHAR(32),
    IN calificacion_prenda_param INT,
    IN id_detalle_orden_param INT
)
BEGIN
    INSERT INTO tb_comentarios (detalle_comentario, calificacion_prenda, id_detalle_orden)
    VALUES (detalle_comentario_param, calificacion_prenda_param, id_detalle_orden_param);
END;
//
DELIMITER ;
