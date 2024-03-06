-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_frosty_threads
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_administradores`
--

DROP TABLE IF EXISTS `tb_administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_administradores` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_administrador` varchar(64) NOT NULL,
  `apellido_administrador` varchar(64) NOT NULL,
  `email_administrador` varchar(128) NOT NULL,
  `clave_administrador` varchar(255) NOT NULL,
  `id_tipo_administrador` int(11) NOT NULL,
  PRIMARY KEY (`id_administrador`),
  UNIQUE KEY `u_administrador_email` (`email_administrador`),
  KEY `fk_administrador_tipo` (`id_tipo_administrador`),
  CONSTRAINT `fk_administrador_tipo` FOREIGN KEY (`id_tipo_administrador`) REFERENCES `tb_tipos_administradores` (`id_tipo_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_administradores`
--

LOCK TABLES `tb_administradores` WRITE;
/*!40000 ALTER TABLE `tb_administradores` DISABLE KEYS */;
INSERT INTO `tb_administradores` VALUES (1,'Admin','Principal','admin@example.com','admin123',1),(2,'Moderador','1','moderador1@example.com','moderador123',3),(3,'Soporte','Técnico','soporte@example.com','soporte123',4),(4,'Empleado','1','empleado1@example.com','empleado123',5),(5,'Empleado','2','empleado2@example.com','empleado456',5);
/*!40000 ALTER TABLE `tb_administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categorias`
--

DROP TABLE IF EXISTS `tb_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(32) NOT NULL,
  `categoria_img` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categorias`
--

LOCK TABLES `tb_categorias` WRITE;
/*!40000 ALTER TABLE `tb_categorias` DISABLE KEYS */;
INSERT INTO `tb_categorias` VALUES (1,'Camisetas','camisetas.jpg'),(2,'Pantalones','pantalones.jpg'),(3,'Chaquetas','chaquetas.jpg'),(4,'Vestidos','vestidos.jpg'),(5,'Zapatos','zapatos.jpg');
/*!40000 ALTER TABLE `tb_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(64) NOT NULL,
  `apellido_cliente` varchar(64) NOT NULL,
  `email_cliente` varchar(128) NOT NULL,
  `clave_cliente` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `u_cliente_email` (`email_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES (1,'Juan','Pérez','juan@example.com','123456'),(2,'María','González','maria@example.com','password'),(3,'Carlos','López','carlos@example.com','qwerty'),(4,'Laura','Martínez','laura@example.com','abc123'),(5,'Pedro','Sánchez','pedro@example.com','securepass');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentarios` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_comentario` varchar(32) NOT NULL,
  `calificacion_prenda` int(1) NOT NULL,
  `estado_comentario` tinyint(1) DEFAULT 0,
  `id_detalle_orden` int(11) NOT NULL,
  PRIMARY KEY (`id_comentario`),
  UNIQUE KEY `id_detalle_orden` (`id_detalle_orden`),
  CONSTRAINT `fk_comentario_detalle` FOREIGN KEY (`id_detalle_orden`) REFERENCES `tb_detalle_ordenes` (`id_detalle_orden`),
  CONSTRAINT `ck_calificacion_prenda` CHECK (`calificacion_prenda` >= 0 and `calificacion_prenda` <= 5)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
INSERT INTO `tb_comentarios` VALUES (1,'Excelente producto',5,0,1),(2,'Buena calidad',4,0,2),(3,'Tardó un poco en llegar',3,0,3),(4,'No era lo que esperaba',2,0,4),(5,'Muy cómodos',5,0,5);
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_descuentos`
--

DROP TABLE IF EXISTS `tb_descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_descuentos` (
  `id_descuento` int(11) NOT NULL AUTO_INCREMENT,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`id_descuento`),
  CONSTRAINT `ck_descuento` CHECK (`descuento` >= 0 and `descuento` <= 100)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_descuentos`
--

LOCK TABLES `tb_descuentos` WRITE;
/*!40000 ALTER TABLE `tb_descuentos` DISABLE KEYS */;
INSERT INTO `tb_descuentos` VALUES (1,0),(2,10),(3,20),(4,30),(5,50);
/*!40000 ALTER TABLE `tb_descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalle_ordenes`
--

DROP TABLE IF EXISTS `tb_detalle_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalle_ordenes` (
  `id_detalle_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_prenda` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `cantidad_prenda` int(11) NOT NULL,
  `fecha_orden` date NOT NULL,
  PRIMARY KEY (`id_detalle_orden`),
  KEY `fk_detalle_prenda` (`id_prenda`),
  KEY `fk_detalle_orden` (`id_orden`),
  CONSTRAINT `fk_detalle_orden` FOREIGN KEY (`id_orden`) REFERENCES `tb_ordenes` (`id_orden`),
  CONSTRAINT `fk_detalle_prenda` FOREIGN KEY (`id_prenda`) REFERENCES `tb_prendas` (`id_prenda`),
  CONSTRAINT `ck_detalle_cantidad_prenda` CHECK (`cantidad_prenda` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalle_ordenes`
--

LOCK TABLES `tb_detalle_ordenes` WRITE;
/*!40000 ALTER TABLE `tb_detalle_ordenes` DISABLE KEYS */;
INSERT INTO `tb_detalle_ordenes` VALUES (1,1,1,2,'2024-03-06'),(2,2,2,1,'2024-03-05'),(3,3,3,3,'2024-03-04'),(4,4,4,1,'2024-03-03'),(5,5,5,2,'2024-03-02');
/*!40000 ALTER TABLE `tb_detalle_ordenes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER eliminar_existencias_despues_insertar
AFTER INSERT ON tb_detalle_ordenes
FOR EACH ROW
BEGIN
    DECLARE cantidad_pedida INT;
    SELECT cantidad_prenda INTO cantidad_pedida FROM tb_detalle_ordenes WHERE id_detalle_orden = NEW.id_detalle_orden;
    UPDATE tb_prendas SET cantidad = cantidad - cantidad_pedida WHERE id_prenda = NEW.id_prenda;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_domicilios`
--

DROP TABLE IF EXISTS `tb_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_domicilios` (
  `id_domicilio` int(11) NOT NULL AUTO_INCREMENT,
  `id_provincia` int(11) NOT NULL,
  `detalle_direccion` varchar(255) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_domicilio`),
  KEY `fk_domicilio_provincia` (`id_provincia`),
  KEY `fk_domicilio_cliente` (`id_cliente`),
  CONSTRAINT `fk_domicilio_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`),
  CONSTRAINT `fk_domicilio_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `tb_provincias` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_domicilios`
--

LOCK TABLES `tb_domicilios` WRITE;
/*!40000 ALTER TABLE `tb_domicilios` DISABLE KEYS */;
INSERT INTO `tb_domicilios` VALUES (1,1,'Calle 123, Ciudad Autónoma',1),(2,2,'Av. Principal 456, Barrio Centro',2),(3,3,'Ruta 22 Km 10, Ciudad del Este',3),(4,4,'Av. Libertador 789, Barrio Norte',4),(5,5,'Calle Mayor 111, Barrio Oeste',5);
/*!40000 ALTER TABLE `tb_domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_marcas`
--

DROP TABLE IF EXISTS `tb_marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marcas`
--

LOCK TABLES `tb_marcas` WRITE;
/*!40000 ALTER TABLE `tb_marcas` DISABLE KEYS */;
INSERT INTO `tb_marcas` VALUES (1,'Nike'),(2,'Adidas'),(3,'Puma'),(4,'Jordan'),(5,'Zara');
/*!40000 ALTER TABLE `tb_marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ordenes`
--

DROP TABLE IF EXISTS `tb_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ordenes` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_domicilio` int(11) NOT NULL,
  `estado_orden` enum('pendiente','enviado','recibido','cancelado') DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_orden_domicilio` (`id_domicilio`),
  CONSTRAINT `fk_orden_domicilio` FOREIGN KEY (`id_domicilio`) REFERENCES `tb_domicilios` (`id_domicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ordenes`
--

LOCK TABLES `tb_ordenes` WRITE;
/*!40000 ALTER TABLE `tb_ordenes` DISABLE KEYS */;
INSERT INTO `tb_ordenes` VALUES (1,1,'pendiente'),(2,2,'enviado'),(3,3,'recibido'),(4,4,'cancelado'),(5,5,'enviado');
/*!40000 ALTER TABLE `tb_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prendas`
--

DROP TABLE IF EXISTS `tb_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_prendas` (
  `id_prenda` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `detalle_prenda` varchar(255) DEFAULT NULL,
  `id_marca` int(11) NOT NULL,
  `prenda_img` varchar(25) DEFAULT NULL,
  `id_descuento` int(11) NOT NULL,
  `estado_prenda` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_prenda`),
  KEY `fk_prenda_categoria` (`id_categoria`),
  KEY `fk_prenda_talla` (`id_talla`),
  KEY `fk_prenda_descuento` (`id_descuento`),
  KEY `fk_prenda_marca` (`id_marca`),
  CONSTRAINT `fk_prenda_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias` (`id_categoria`),
  CONSTRAINT `fk_prenda_descuento` FOREIGN KEY (`id_descuento`) REFERENCES `tb_descuentos` (`id_descuento`),
  CONSTRAINT `fk_prenda_marca` FOREIGN KEY (`id_marca`) REFERENCES `tb_marcas` (`id_marca`),
  CONSTRAINT `fk_prenda_talla` FOREIGN KEY (`id_talla`) REFERENCES `tb_tallas` (`id_talla`),
  CONSTRAINT `ck_prenda_precio` CHECK (`precio` >= 0),
  CONSTRAINT `ck_prenda_cantidad` CHECK (`cantidad` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prendas`
--

LOCK TABLES `tb_prendas` WRITE;
/*!40000 ALTER TABLE `tb_prendas` DISABLE KEYS */;
INSERT INTO `tb_prendas` VALUES (1,1,1,2500,10,'Camiseta de algodón con logo Nike',1,'camiseta_nike.jpg',2,0),(2,2,3,3500,8,'Pantalón vaquero estilo skinny',4,'pantalon_levis.jpg',3,0),(3,3,2,1500,15,'Chaqueta deportiva con capucha',2,'chaqueta_adidas.jpg',1,1),(4,4,5,4000,5,'Vestido estampado floral',5,'vestido_zara.jpg',4,0),(5,5,4,3000,12,'Zapatillas deportivas con suela amortiguadora',3,'zapatillas_puma.jpg',2,1);
/*!40000 ALTER TABLE `tb_prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_provincias`
--

DROP TABLE IF EXISTS `tb_provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_provincias` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(32) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_provincias`
--

LOCK TABLES `tb_provincias` WRITE;
/*!40000 ALTER TABLE `tb_provincias` DISABLE KEYS */;
INSERT INTO `tb_provincias` VALUES (1,'Buenos Aires'),(2,'Córdoba'),(3,'Santa Fe'),(4,'Mendoza'),(5,'Tucumán');
/*!40000 ALTER TABLE `tb_provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tallas`
--

DROP TABLE IF EXISTS `tb_tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `talla` varchar(8) NOT NULL,
  `id_tipo_talla` int(11) NOT NULL,
  PRIMARY KEY (`id_talla`),
  KEY `fk_talla_tipo` (`id_tipo_talla`),
  CONSTRAINT `fk_talla_tipo` FOREIGN KEY (`id_tipo_talla`) REFERENCES `tb_tipos_tallas` (`id_tipo_talla`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tallas`
--

LOCK TABLES `tb_tallas` WRITE;
/*!40000 ALTER TABLE `tb_tallas` DISABLE KEYS */;
INSERT INTO `tb_tallas` VALUES (1,'XS',1),(2,'S',1),(3,'M',1),(4,'L',1),(5,'XL',1);
/*!40000 ALTER TABLE `tb_tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipos_administradores`
--

DROP TABLE IF EXISTS `tb_tipos_administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipos_administradores` (
  `id_tipo_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_administrador` varchar(16) NOT NULL,
  PRIMARY KEY (`id_tipo_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipos_administradores`
--

LOCK TABLES `tb_tipos_administradores` WRITE;
/*!40000 ALTER TABLE `tb_tipos_administradores` DISABLE KEYS */;
INSERT INTO `tb_tipos_administradores` VALUES (1,'Superadmin'),(2,'Administrador'),(3,'Moderador'),(4,'Soporte'),(5,'Empleado');
/*!40000 ALTER TABLE `tb_tipos_administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipos_tallas`
--

DROP TABLE IF EXISTS `tb_tipos_tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipos_tallas` (
  `id_tipo_talla` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_talla` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tipo_talla`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipos_tallas`
--

LOCK TABLES `tb_tipos_tallas` WRITE;
/*!40000 ALTER TABLE `tb_tipos_tallas` DISABLE KEYS */;
INSERT INTO `tb_tipos_tallas` VALUES (1,'Standard'),(2,'Shoes');
/*!40000 ALTER TABLE `tb_tipos_tallas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 11:22:48
