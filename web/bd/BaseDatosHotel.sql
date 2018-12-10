/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.35-MariaDB : Database - bdhotelfinal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdhotelfinal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bdhotelfinal`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `cod_cliente` char(10) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `rason_social` varchar(200) DEFAULT NULL,
  `cod_tipdoccl` char(5) NOT NULL,
  `documento` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` char(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`),
  KEY `fk_Cliente_Tipo_DocCliente1_idx` (`cod_tipdoccl`),
  CONSTRAINT `fk_Cliente_Tipo_DocCliente1` FOREIGN KEY (`cod_tipdoccl`) REFERENCES `tipo_doccliente` (`cod_tipdoccl`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

insert  into `cliente`(`cod_cliente`,`nombres`,`apellidos`,`rason_social`,`cod_tipdoccl`,`documento`,`direccion`,`telefono`,`email`) values ('CLI0000001','JUAN','RIOS AGUILERA','','D0001',48586868,'POR AHI','95886886','RONY@HOTMAIL.COM'),('CLI0000002','Claribel','Zegarra Galvez','soltera sin compromiso','D0001',72640644,'San Martin los olvidados de Dios ','935179422','clarizita@gmail.com'),('CLI0000003','Claudia ','Ruiz Chiroque','divorciada','D0001',74999199,'LAS MERCEDES 609','935179422','claudiaruizchiroque@gmail.com'),('CLI0000004','JUAN','PEREZ CANALES','','D0006',34858302,'LOS OLVIDADOS','98876554','email@hotmail');

/*Table structure for table `detalle_producto` */

DROP TABLE IF EXISTS `detalle_producto`;

CREATE TABLE `detalle_producto` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `cod_productos` char(10) NOT NULL,
  `cod_venpro` char(10) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_Detalle_Producto_Productos1_idx` (`cod_productos`),
  KEY `fk_Detalle_Producto_Venta_Producto1_idx` (`cod_venpro`),
  CONSTRAINT `fk_Detalle_Producto_Productos1` FOREIGN KEY (`cod_productos`) REFERENCES `productos` (`cod_productos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Producto_Venta_Producto1` FOREIGN KEY (`cod_venpro`) REFERENCES `venta_producto` (`cod_venpro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalle_producto` */

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `cod_empleados` char(10) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `dni` char(9) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `cod_tipoem` int(11) NOT NULL,
  PRIMARY KEY (`cod_empleados`),
  KEY `fk_Empleados_Tipo_Empleado_idx` (`cod_tipoem`),
  CONSTRAINT `fk_Em_Tipo_Em` FOREIGN KEY (`cod_tipoem`) REFERENCES `tipo_empleado` (`cod_tipoem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empleados` */

insert  into `empleados`(`cod_empleados`,`nombres`,`apellidos`,`dni`,`username`,`password`,`telefono`,`email`,`estado`,`cod_tipoem`) values ('EMP0000001','RONY','AGUILERA RIVERA','46261585','Rony','123456','35445666','rony@hotmmail.com','',1),('EMP0000002','JORGE','ALVA MEJIA','364747575','Jorge','123456','45678899','jorge@hotmail.com','',2);

/*Table structure for table `estado_habitacion` */

DROP TABLE IF EXISTS `estado_habitacion`;

CREATE TABLE `estado_habitacion` (
  `cod_estado` char(5) NOT NULL,
  `estado_habitacion` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `estado_habitacion` */

insert  into `estado_habitacion`(`cod_estado`,`estado_habitacion`) values ('ETH01','DISPONIBLE'),('ETH02','RESERVADA'),('ETH03','OCUPADA');

/*Table structure for table `habitacion` */

DROP TABLE IF EXISTS `habitacion`;

CREATE TABLE `habitacion` (
  `cod_habitacion` char(10) NOT NULL,
  `numero` char(10) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cod_tipoh` char(5) NOT NULL,
  `cod_nivel` char(5) NOT NULL,
  `cod_estado` char(5) NOT NULL,
  PRIMARY KEY (`cod_habitacion`),
  KEY `fk_Habitacion_Tipo_Habitacion1_idx` (`cod_tipoh`),
  KEY `fk_Habitacion_Nivel1_idx` (`cod_nivel`),
  KEY `fk_Habitacion_Estado_Habitacion1_idx` (`cod_estado`),
  CONSTRAINT `fk_Habitacion_Estado_Habitacion1` FOREIGN KEY (`cod_estado`) REFERENCES `estado_habitacion` (`cod_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habitacion_Nivel1` FOREIGN KEY (`cod_nivel`) REFERENCES `nivel` (`cod_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habitacion_Tipo_Habitacion1` FOREIGN KEY (`cod_tipoh`) REFERENCES `tipo_habitacion` (`cod_tipoh`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `habitacion` */

insert  into `habitacion`(`cod_habitacion`,`numero`,`precio`,`descripcion`,`cod_tipoh`,`cod_nivel`,`cod_estado`) values ('HAB0000001','101',200.00,'HABITACION CON AIRE ACONDICIONADO','TPH02','NIV01','ETH03'),('HAB0000002','102',234.00,'HABITACION CON RADIO','TPH02','NIV01','ETH03'),('HAB0000003','201',304.00,'HABITACION CON TV Y VENTILADOR','TPH01','NIV02','ETH03'),('HAB0000004','301',234.00,'HABITACION CON BAÃ?ERA','TPH01','NIV03','ETH03'),('HAB0000005','202',349.00,'HABITACION CON JACUZZY','TPH01','NIV02','ETH03'),('HAB0000006','103',200.00,'HABITACION CON CAMA QUEEN','TPH01','NIV01','ETH03'),('HAB0000007','203',150.00,'HABITACION PERSONAL','TPH02','NIV02','ETH01'),('HAB0000008','302',350.00,'HABITACION CON JACUZZY','TPH01','NIV03','ETH03'),('HAB0000009','303',300.00,'HABITACION CON JACUZZY','TPH01','NIV03','ETH01');

/*Table structure for table `nivel` */

DROP TABLE IF EXISTS `nivel`;

CREATE TABLE `nivel` (
  `cod_nivel` char(5) NOT NULL,
  `piso` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nivel` */

insert  into `nivel`(`cod_nivel`,`piso`) values ('NIV01','PRIMER PISO'),('NIV02','SEGUNDO PISO'),('NIV03','TERCER NIVEL'),('NIV04','CUARTO PISO');

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `cod_pagos` int(11) NOT NULL AUTO_INCREMENT,
  `cod_serviciofinal` char(10) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `cod_empleados` char(10) NOT NULL,
  `cod_venpro` char(10) NOT NULL,
  PRIMARY KEY (`cod_pagos`),
  KEY `fk_Pagos_Servicio_Final1_idx` (`cod_serviciofinal`),
  KEY `fk_Pagos_Empleados1_idx` (`cod_empleados`),
  KEY `fk_Pagos_Venta_Producto1_idx` (`cod_venpro`),
  CONSTRAINT `fk_Pagos_Empleados1` FOREIGN KEY (`cod_empleados`) REFERENCES `empleados` (`cod_empleados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_Servicio_Final1` FOREIGN KEY (`cod_serviciofinal`) REFERENCES `servicio_final` (`cod_serviciofinal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_Venta_Producto1` FOREIGN KEY (`cod_venpro`) REFERENCES `venta_producto` (`cod_venpro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pagos` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `cod_productos` char(10) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `cod_tippro` char(5) NOT NULL,
  `detalle` varchar(200) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`cod_productos`),
  KEY `fk_Productos_Tipo_Producto1_idx` (`cod_tippro`),
  CONSTRAINT `fk_Productos_Tipo_Producto1` FOREIGN KEY (`cod_tippro`) REFERENCES `tipo_producto` (`cod_tippro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productos` */

/*Table structure for table `registro_habitacion` */

DROP TABLE IF EXISTS `registro_habitacion`;

CREATE TABLE `registro_habitacion` (
  `cod_ventahab` char(10) NOT NULL,
  `cod_cliente` char(10) NOT NULL,
  `cod_habitacion` char(10) NOT NULL,
  `cod_empleados` char(10) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `hora_ingreso` time NOT NULL,
  `numero_adultos` int(11) DEFAULT NULL,
  `numero_niños` int(11) DEFAULT NULL,
  `cod_reserva` char(10) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_ventahab`),
  KEY `fk_Venta_Habitacion_Cliente1_idx` (`cod_cliente`),
  KEY `fk_Venta_Habitacion_Habitacion1_idx` (`cod_habitacion`),
  KEY `fk_Venta_Habitacion_Empleados1_idx` (`cod_empleados`),
  KEY `fk_Registro_Habitacion_Reserva1_idx` (`cod_reserva`),
  CONSTRAINT `fk_Registro_Habitacion_Reserva1` FOREIGN KEY (`cod_reserva`) REFERENCES `reserva` (`cod_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Habitacion_Cliente1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Habitacion_Empleados1` FOREIGN KEY (`cod_empleados`) REFERENCES `empleados` (`cod_empleados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Habitacion_Habitacion1` FOREIGN KEY (`cod_habitacion`) REFERENCES `habitacion` (`cod_habitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registro_habitacion` */

insert  into `registro_habitacion`(`cod_ventahab`,`cod_cliente`,`cod_habitacion`,`cod_empleados`,`fecha_ingreso`,`hora_ingreso`,`numero_adultos`,`numero_niños`,`cod_reserva`,`estado`) values ('RGH0000002','CLI0000004','HAB0000002','EMP0000001','2018-12-15','12:02:00',2,1,NULL,'INICIADO'),('RGH0000003','CLI0000002','HAB0000003','EMP0000001','2018-12-15','12:01:00',1,1,NULL,'INICIADO'),('RGH0000004','CLI0000003','HAB0000004','EMP0000001','2018-12-15','12:02:00',1,2,NULL,'INICIADO'),('RGH0000005','CLI0000001','HAB0000005','EMP0000001','2018-12-23','12:12:00',2,1,NULL,'INICIADO'),('RGH0000006','CLI0000001','HAB0000008','EMP0000001','2018-12-13','12:03:00',3,1,NULL,''),('RGH0000007','CLI0000004','HAB0000001','EMP0000001','2018-12-09','12:02:00',2,1,NULL,'CULMINADO'),('RGH0000008','CLI0000003','HAB0000006','EMP0000001','2018-12-09','10:12:00',1,2,NULL,'INICIADO'),('RGH000001','CLI0000001','HAB0000001','EMP0000001','2018-12-08','12:02:00',1,1,NULL,'INICIADO');

/*Table structure for table `registro_salida` */

DROP TABLE IF EXISTS `registro_salida`;

CREATE TABLE `registro_salida` (
  `cod_ventahab` char(10) NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `insidencias_salida` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_ventahab`),
  KEY `fk_Registro_Salida_Registro_Habitacion1_idx` (`cod_ventahab`),
  CONSTRAINT `fk_Registro_Salida_Registro_Habitacion1` FOREIGN KEY (`cod_ventahab`) REFERENCES `registro_habitacion` (`cod_ventahab`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registro_salida` */

/*Table structure for table `reserva` */

DROP TABLE IF EXISTS `reserva`;

CREATE TABLE `reserva` (
  `cod_reserva` char(10) NOT NULL,
  `cod_cliente` char(10) NOT NULL,
  `cod_empleados` char(10) NOT NULL,
  `cod_pago` char(5) NOT NULL,
  `cant_personas` int(11) DEFAULT NULL,
  `monto_adelantado` decimal(9,2) DEFAULT NULL,
  `cod_habitacion` char(10) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `fecha_reserva` date NOT NULL,
  `hora_llegada` time NOT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_reserva`),
  KEY `fk_Reserva_Cliente1_idx` (`cod_cliente`),
  KEY `fk_Reserva_Empleados1_idx` (`cod_empleados`),
  KEY `fk_Reserva_Habitacion1_idx` (`cod_habitacion`),
  KEY `fk_Reserva_Tipo_Pago1_idx` (`cod_pago`),
  CONSTRAINT `fk_Reserva_Cliente1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Empleados1` FOREIGN KEY (`cod_empleados`) REFERENCES `empleados` (`cod_empleados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Habitacion1` FOREIGN KEY (`cod_habitacion`) REFERENCES `habitacion` (`cod_habitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Tipo_Pago1` FOREIGN KEY (`cod_pago`) REFERENCES `tipo_pago` (`cod_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reserva` */

/*Table structure for table `servicio_final` */

DROP TABLE IF EXISTS `servicio_final`;

CREATE TABLE `servicio_final` (
  `cod_serviciofinal` char(10) NOT NULL,
  `cod_tipodoc` char(5) NOT NULL,
  `fecha_giro` date DEFAULT NULL,
  `serie` char(5) DEFAULT NULL,
  `correlativo` char(10) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `cod_pago` char(5) NOT NULL,
  `cod_ventahab` char(10) NOT NULL,
  PRIMARY KEY (`cod_serviciofinal`),
  KEY `fk_Venta_Final_Tipo_Documento_venta1_idx` (`cod_tipodoc`),
  KEY `fk_Servicio_Final_Tipo_Pago1_idx` (`cod_pago`),
  KEY `fk_Servicio_Final_Registro_Salida1_idx` (`cod_ventahab`),
  CONSTRAINT `fk_Servicio_Final_Registro_Salida1` FOREIGN KEY (`cod_ventahab`) REFERENCES `registro_salida` (`cod_ventahab`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_Final_Tipo_Pago1` FOREIGN KEY (`cod_pago`) REFERENCES `tipo_pago` (`cod_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Final_Tipo_Documento_venta1` FOREIGN KEY (`cod_tipodoc`) REFERENCES `tipo_documento_venta` (`cod_tipodoc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `servicio_final` */

/*Table structure for table `tipo_doccliente` */

DROP TABLE IF EXISTS `tipo_doccliente`;

CREATE TABLE `tipo_doccliente` (
  `cod_tipdoccl` char(5) NOT NULL,
  `documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tipdoccl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_doccliente` */

insert  into `tipo_doccliente`(`cod_tipdoccl`,`documento`) values ('D0001','DNI'),('D0002','PASAPORTE'),('D0003','REGISTRO CORREGIDO'),('D0004','CLAUDIA'),('D0005','DOCUMENO'),('D0006','DOCUMENTO');

/*Table structure for table `tipo_documento_venta` */

DROP TABLE IF EXISTS `tipo_documento_venta`;

CREATE TABLE `tipo_documento_venta` (
  `cod_tipodoc` char(5) NOT NULL,
  `comprobante` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tipodoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_documento_venta` */

/*Table structure for table `tipo_empleado` */

DROP TABLE IF EXISTS `tipo_empleado`;

CREATE TABLE `tipo_empleado` (
  `cod_tipoem` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_emleado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tipoem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tipo_empleado` */

insert  into `tipo_empleado`(`cod_tipoem`,`tipo_emleado`) values (1,'ADMINISTRADOR'),(2,'RECEPCIONISTA'),(5,'CAJERO');

/*Table structure for table `tipo_habitacion` */

DROP TABLE IF EXISTS `tipo_habitacion`;

CREATE TABLE `tipo_habitacion` (
  `cod_tipoh` char(5) NOT NULL,
  `tipo_habitacion` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_tipoh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_habitacion` */

insert  into `tipo_habitacion`(`cod_tipoh`,`tipo_habitacion`,`descripcion`) values ('TPH01','MATRIMONIAL','HABITACION PARA DOS PAREJAS'),('TPH02','PERSONAL','HABITACION PARA UNA SOLA PERSONA'),('TPH03','TRIPE','HABITACION PARA TRES PERSONAS');

/*Table structure for table `tipo_pago` */

DROP TABLE IF EXISTS `tipo_pago`;

CREATE TABLE `tipo_pago` (
  `cod_pago` char(5) NOT NULL,
  `forma_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_pago` */

/*Table structure for table `tipo_producto` */

DROP TABLE IF EXISTS `tipo_producto`;

CREATE TABLE `tipo_producto` (
  `cod_tippro` char(5) NOT NULL,
  `tipo_producto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tippro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_producto` */

/*Table structure for table `venta_producto` */

DROP TABLE IF EXISTS `venta_producto`;

CREATE TABLE `venta_producto` (
  `cod_venpro` char(10) NOT NULL,
  `cod_tipodoc` char(5) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `descuent` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `cod_cliente` char(10) NOT NULL,
  PRIMARY KEY (`cod_venpro`),
  KEY `fk_Venta_Producto_Tipo_Documento_venta1_idx` (`cod_tipodoc`),
  KEY `fk_Venta_Producto_Cliente1_idx` (`cod_cliente`),
  CONSTRAINT `fk_Venta_Producto_Cliente1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Producto_Tipo_Documento_venta1` FOREIGN KEY (`cod_tipodoc`) REFERENCES `tipo_documento_venta` (`cod_tipodoc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `venta_producto` */

/* Procedure structure for procedure `sp_ActualizaCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaCliente`(cod CHAR(10), nom VARCHAR(100), ape VARCHAR(100), rason VARCHAR(100), tip_doc CHAR(5), doc CHAR(9), dire VARCHAR(200), fono CHAR(10), email VARCHAR(200) )
BEGIN
    UPDATE cliente 
    SET `nombres` = nom, `apellidos` = ape, `rason_social` = rason, `cod_tipdoccl` = tip_dic, `documento` = doc, `direccion`=dire, telefono = fono, email = email
    WHERE `cod_cliente` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaDetalleProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaDetalleProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaDetalleProducto`(cod int, cant INT, cod_pro varCHAR(45),
 codvenpro CHAR(10))
BEGIN
    UPDATE `detalle_producto` 
    SET `cantidad` = cant, `cod_productos` = cod_pro, `cod_venpro` = codvenpro
    WHERE `cod_detpro` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaDocCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaDocCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaDocCliente`(cod CHAR(5),doc varchar(45))
BEGIN
    
    UPDATE `tipo_doccliente`
    SET `documento`=doc
    WHERE`cod_tipdoccl` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaEmpleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaEmpleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaEmpleados`(cod CHAR(10), nom VARCHAR(200),codtpemp CHAR(5),ape VARCHAR(200),
dni CHAR(9),uss VARCHAR(45),pass VARCHAR(45),cel CHAR(9),correo VARCHAR(200),est BIT)
BEGIN
  
    UPDATE `empleados`
    SET `nombres` = nom, `cod_tipoem` = codtpemp, `apellidos` = ape, `dni` = dni,
     `username`=uss,`password`=pass,`telefono`=cel,`email`=correo,`estado`=est
    WHERE `cod_empleados` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaEstadoHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaEstadoHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaEstadoHabitacion`(cod CHAR(5),ethab VARCHAR(45))
BEGIN
   
    UPDATE `estado_habitacion`
    SET `estado_habitacion`=ethab
    WHERE `cod_estado`=cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaHabitacion`(cod CHAR(10),num CHAR(10),pre DECIMAL(9,2),des VARCHAR(200),
costphab CHAR(5),codniv CHAR(5),codest CHAR(5))
BEGIN
   
    UPDATE `habitacion`
    SET `numero`=num,`precio`=pre,`descripcion`=des,`cod_tipoh`=costphab,`cod_nivel`=codniv,`cod_estado`=codest
    WHERE `cod_habitacion`=cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaNivel` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaNivel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaNivel`(cod CHAR(10),pis VARCHAR(45))
BEGIN
    
    UPDATE `nivel`
    SET `piso`=pis
    WHERE `cod_nivel` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaProductos`(cod CHAR(10),pro VARCHAR(45),prec DECIMAL(9,2),codtppro CHAR(5),det VARCHAR(200),sto INT)
BEGIN
    DECLARE tpro CHAR(5);
    UPDATE `productos`
    SET `producto`=pro,`precio`=prec,`cod_tippro`=codtppro,`detalle`=det,`stock`=sto
    WHERE `cod_productos` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaRegistroHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaRegistroHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaRegistroHabitacion`(cod CHAR(10),codcl CHAR(10),codhab CHAR(10),codemp CHAR(10),
fecing DATE,horing TIME,numadu INT,numni INT)
BEGIN
    
    UPDATE `registro_habitacion`
    SET`cod_cliente`=codcl,`cod_habitacion`=codhab,`cod_empleados`=codemp,`fecha_ingreso`=fecing,`hora_ingreso`=horing,
    `numero_adultos`=numadu,`numero_niños`=numni
    WHERE `cod_ventahab` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaRegistroSalida` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaRegistroSalida` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaRegistroSalida`(cod CHAR(10),fech DATE,hora TIME,insid VARCHAR(200))
BEGIN
    
    UPDATE `registro_salida`
    SET `fecha_salida`=fech,`hora_salida`=hora,`insidencias_salida`=insid
    WHERE `cod_ventahab` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaReserva` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaReserva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaReserva`(cod CHAR(10),codcli CHAR(10),codemp CHAR(10),codpa CHAR(5),canper INT,
montadel DECIMAL(9,2),codhab CHAR(10),fechres DATETIME,fechreg DATE,horalleg TIME,obs VARCHAR(200))
BEGIN
    
    UPDATE `reserva`
    SET `cod_cliente`=codcli,`cod_empleados`=codemp,`cod_pago`=codpa,`cant_personas`=canper,`monto_adelantado`=montadel,
    `cod_habitacion`=codhab,`fecha_registro`=fechres,`fecha_reserva`=fechareg,`hora_llegada`=horalleg,`observacion`=obs
    WHERE `cod_reserva` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaServicioFinal` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaServicioFinal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaServicioFinal`(cod CHAR(10),codtpdoc CHAR(5),fechgir DATE,ser CHAR(5),
correl CHAR(10),tot DECIMAL(9,2),codp CHAR(5))
BEGIN
    
    UPDATE `servicio_final`
    SET `cod_tipodoc`=codtpdoc,`fecha_giro`=fechgir,`serie`=der,`correlativo`=correl,`total`=tot,`cod_pago`=codp
    WHERE `cod_ventahab` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaTipoDocumentoVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaTipoDocumentoVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaTipoDocumentoVenta`(cod CHAR(5),compr VARCHAR(45))
BEGIN
    
    UPDATE `tipo_documento_venta`
    SET `comprobante`=compr
    WHERE `cod_tipodoc` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaTipoEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaTipoEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaTipoEmpleado`(cod int,tpemp VARCHAR(45))
BEGIN
    
    UPDATE `tipo_empleado`
    SET `tipo_empleo`=tpemp
    WHERE `cod_tipoem` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaTipoHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaTipoHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaTipoHabitacion`(cod CHAR(5),tphab VARCHAR(45),des VARCHAR(200))
BEGIN
    
    UPDATE `tipo_habitacion`
    SET `tipo_habitacion`=tphab,`descripcion`=des
    WHERE `cod_tipoh` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaTipoPago` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaTipoPago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaTipoPago`(cod CHAR(5),formpa VARCHAR(45))
BEGIN
    
    UPDATE `tipo_pago`
    SET `forma_pago`=formpa
    WHERE `cod_pago` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaTipoProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaTipoProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaTipoProducto`(cod CHAR(5),tppro VARCHAR(45))
BEGIN
    
    UPDATE `tipo_producto`
    SET `tipo_producto`=tppro
    WHERE `cod_tippro` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ActualizaVentaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizaVentaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizaVentaProducto`(cod CHAR(5),codtpdoc CHAR(5),fech DATE,
des DECIMAL(9,2),tot DECIMAL(9,2),codcl CHAR(10))
BEGIN
    
    UPDATE `venta_producto`
    SET`cod_tipodoc`=codtpdoc,`fecha`=fech,`descuent`=des,`total`=tot,`cod_cliente`=codcl
    WHERE `cod_venpro` =cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CanHabReservadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CanHabReservadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CanHabReservadas`()
BEGIN
		DECLARE cod CHAR(10);
    SET cod = (SELECT `cod_estado`FROM estado_habitacion WHERE `estado_habitacion` = 'RESERVADA');
    SELECT COUNT(numero) AS RESERVADAS FROM `habitacion`
    WHERE `cod_estado` = cod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CantHabDisponibles` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CantHabDisponibles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CantHabDisponibles`()
BEGIN
    DECLARE cod CHAR(10);
    SET cod = (SELECT `cod_estado`FROM estado_habitacion WHERE `estado_habitacion` = 'DISPONIBLE');
    SELECT COUNT(numero) AS DISPONIBLES FROM `habitacion`
    WHERE `cod_estado` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CantHabOcupadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CantHabOcupadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CantHabOcupadas`()
BEGIN
    DECLARE cod CHAR(10);
    SET cod = (SELECT `cod_estado`FROM estado_habitacion WHERE `estado_habitacion` = 'OCUPADA');
    SELECT COUNT(numero) AS DISPONIBLES FROM `habitacion`
    WHERE `cod_estado` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DevuelveFila` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DevuelveFila` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DevuelveFila`(tipo varchar(50))
BEGIN
    SELECT nro FROM (SELECT @row := @row + 1 AS nro, t.*
FROM tipo_doccliente t, (SELECT @row := 0) r)AS tablaTemporal WHERE documento = tipo;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaCliente`(cod CHAR(10))
BEGIN
    DELETE FROM cliente
    WHERE `cod_cliente`= cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaDetalleProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaDetalleProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaDetalleProducto`(cod char(10))
BEGIN
    delete from `detalle_producto`
    where `cod_detpro` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaDocCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaDocCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaDocCliente`(cod char(10))
BEGIN
    delete from `tipo_doccliente`
    where `cod_tipdoccl` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaEmpleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaEmpleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaEmpleados`(cod char(10))
BEGIN
    delete from `empleados`
    where `cod_empleados` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaEstadoHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaEstadoHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaEstadoHabitacion`(cod char(5))
BEGIN
    delete from `estado_habitacion`
    where `cod_estado` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaHabitacion`(cod char(10))
BEGIN
    delete from `habitacion`
    where `cod_habitacion` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaNivel` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaNivel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaNivel`(cod char(10))
BEGIN
    delete from `nivel`
    where `cod_nivel` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaProductos`(cod char(10))
BEGIN
    delete from `productos`
    where `cod_productos` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaRegistroHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaRegistroHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaRegistroHabitacion`(cod char(10))
BEGIN
    delete from `registro_habitacion`
    where `cod_ventahab` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaRegistroSalida` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaRegistroSalida` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaRegistroSalida`(cod char(10))
BEGIN
    delete from `registro_salida`
    where `cod_ventahab` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaReserva` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaReserva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaReserva`(cod char(10))
BEGIN
    delete from `reserva`
    where `cod_reserva` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaServicioFinal` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaServicioFinal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaServicioFinal`(cod char(10))
BEGIN
    delete from `servicio_final`
    where `cod_ventahab` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaTipoDocumentoVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaTipoDocumentoVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaTipoDocumentoVenta`(cod char(5))
BEGIN
    delete from `tipo_documento_venta`
    where `cod_tipodoc` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaTipoEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaTipoEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaTipoEmpleado`(cod char(5))
BEGIN
    delete from `tipo_empleado`
    where `cod_tipoem` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaTipoHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaTipoHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaTipoHabitacion`(cod char(5))
BEGIN
    delete from `tipo_habitacion`
    where `cod_tipoh` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaTipoPago` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaTipoPago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaTipoPago`(cod char(5))
BEGIN
    delete from `tipo_pago`
    where `cod_pago` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaTipoProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaTipoProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaTipoProducto`(cod char(5))
BEGIN
    delete from `tipo_producto`
    where `cod_tippro` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminaVentaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminaVentaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminaVentaProducto`(cod char(5))
BEGIN
    delete from `venta_producto`
    where `cod_venpro` = cod;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_HabitacionesOcupadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_HabitacionesOcupadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_HabitacionesOcupadas`()
BEGIN
    SELECT CONCAT(C.`nombres`," ", C.`apellidos`) , CONCAT( TDC.`documento`,":", C.`documento`), H.`numero`, TH.`tipo_habitacion`, RH.`fecha_ingreso`, RH.`hora_ingreso`
FROM `tipo_doccliente` AS TDC INNER JOIN cliente AS C ON TDC.`cod_tipdoccl` = C.`cod_tipdoccl` INNER JOIN `registro_habitacion` AS RH
ON C.`cod_cliente` = RH.`cod_cliente` INNER JOIN `habitacion` AS H ON H.`cod_habitacion` = rh.`cod_habitacion` INNER JOIN `tipo_habitacion` AS TH
ON TH.`cod_tipoh`=H.`cod_tipoh` INNER JOIN estado_habitacion AS EH ON EH.`cod_estado` = H.`cod_estado`
WHERE EH.`estado_habitacion` = 'OCUPADA';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaCliente`(nom VARCHAR(100), ape VARCHAR(100), rason VARCHAR(100), tip_doc CHAR(5), doc CHAR(9), dire VARCHAR(200), fono CHAR(10), email VARCHAR(200) )
BEGIN
    DECLARE id CHAR(10);
		SET id=(SELECT CONCAT("CLI",RIGHT(CONCAT("0000000",
		MAX(SUBSTRING(`cod_cliente`,7)+1)),7)) FROM `cliente`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='CLI0000001';
				END IF;
			END;
		INSERT INTO cliente (`cod_cliente`,nombres, apellidos, rason_social, cod_tipdoccl,documento, direccion, telefono,email)
		VALUES (id,nom, ape, rason, tip_doc, doc, dire, fono, email);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaDetalleProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaDetalleProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaDetalleProducto`(cant int, cod_pro varchar(45),
 codvenpro char(10))
BEGIN
  
		INSERT INTO detalle_producto (`cantidad`,`cod_productos`,`cod_venpro`)
		VALUES (cant,cod_pro,codvenpro);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaEmpleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaEmpleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaEmpleados`(nom VARCHAR(200),ape VARCHAR(200),
dni CHAR(9),uss VARCHAR(45),pass VARCHAR(45),cel CHAR(9),correo VARCHAR(200),est BIT,codtpemp int)
BEGIN
    DECLARE id CHAR(10);
  
		SET id=(SELECT CONCAT("EMP",RIGHT(CONCAT("0000000",
		MAX(SUBSTRING(`cod_empleados`,4)+1)),7)) FROM `empleados`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='EMP0000001';
				END IF;
			END;
		INSERT INTO `empleados` (`cod_empleados`,`nombres`,`apellidos`,`dni`,`username`,`password`,`telefono`,`email`,`estado`,`cod_tipoem`)
		VALUES (id,nom,ape,dni,uss,pass,cel,correo,est,codtpemp);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaEstadoHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaEstadoHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaEstadoHabitacion`(ethab varchar(45))
BEGIN
    DECLARE id CHAR(5);
  
		SET id=(SELECT CONCAT("ETH",RIGHT(CONCAT("00",
		MAX(SUBSTRING(`cod_estado`,4)+1)),2)) FROM `estado_habitacion`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='ETH01';
				END IF;
			END;
		INSERT INTO `estado_habitacion` (`cod_estado`,`estado_habitacion`)
		VALUES (id,ethab);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaHabitacion`(num char(10),pre decimal(9,2),des varchar(200),
costphab CHAR(5),codniv CHAR(5))
BEGIN
    DECLARE id CHAR(10);
    DECLARE codest CHAR(5);
    SET codest = (SELECT `cod_estado`FROM estado_habitacion WHERE `estado_habitacion` = 'DISPONIBLE');
   
		SET id=(SELECT CONCAT("HAB",RIGHT(CONCAT("0000000",
		MAX(SUBSTRING(`cod_habitacion`,4)+1)),7)) FROM `habitacion`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='HAB0000001';
				END IF;
			END;
		INSERT INTO `habitacion` (`cod_habitacion`,`numero`,`precio`,`descripcion`,`cod_tipoh`,`cod_nivel`,`cod_estado`)
		VALUES (id,num,pre,des,costphab,codniv,codest);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaNivel` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaNivel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaNivel`(pis varchar(45))
BEGIN
    DECLARE id CHAR(5);
   
		SET id=(SELECT CONCAT("NIV",RIGHT(CONCAT("00",
		MAX(SUBSTRING(`cod_nivel`,4)+1)),2)) FROM `nivel`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='NIV01';
				END IF;
			END;
		INSERT INTO `nivel` (`cod_nivel`,`piso`)
		VALUES (id,pis);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaProductos`(pro varchar(45),prec decimal(9,2),codtppro char(45),det varchar(200),sto int)
BEGIN
    DECLARE id CHAR(10);
   
		SET id=(SELECT CONCAT("PRO",RIGHT(CONCAT("000000",
		MAX(SUBSTRING(`cod_productos`,4)+1)),7)) FROM `productos`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='PRO000001';
				END IF;
			END;
		INSERT INTO `productos` (`cod_productos`,`producto`,`precio`,`cod_tippro`,`detalle`,`stock`)
		VALUES (id,pro,prec,codtppro,det,sto);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaRegistroHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaRegistroHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaRegistroHabitacion`(codcl char(10),codhab char(10),codemp char(10),fecing date,horing time,
numadu int,numni int)
BEGIN
    DECLARE id CHAR(10);
    declare est varchar(50);
   
		SET id=(SELECT CONCAT("RGH",RIGHT(CONCAT("000000",
		MAX(SUBSTRING(`cod_ventahab`,4)+1)),7)) FROM `registro_habitacion`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='RGH0000001';
				END IF;
			END;
			set est = 'INICIAL';
		INSERT INTO `registro_habitacion` (`cod_ventahab`,`cod_cliente`,`cod_habitacion`,`cod_empleados`,`fecha_ingreso`,
		`hora_ingreso`,`numero_adultos`,`numero_niños`,`estado`)
		VALUES (id,codcl,codhab,codemp,fecing,horing,numadu,numni, est);
		update`habitacion`
		set `cod_estado` = 'ETH03'
		where `cod_habitacion` = codhab;	
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaRegistroSalida` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaRegistroSalida` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaRegistroSalida`(cod_reg char(10),fech date,hora time,insid varchar(200))
BEGIN
    
		INSERT INTO `registro_salida` (`cod_ventahab`,`fecha_salida`,`hora_salida`,`insidencias_salida`)
		VALUES (cod_reg,fech,hora,insid);
		update registro_habitacion
		set estado='CULMINADO'
		where cod_ventahab=cod_reg;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaReserva` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaReserva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaReserva`(codcli char(10),codemp char(10),codpa char(5),canper int,
montadel decimal(9,2),codhab char(10),fechres datetime,fechreg date,horalleg time,obs varchar(200))
BEGIN
    DECLARE id CHAR(10);
   
		SET id=(SELECT CONCAT("RES",RIGHT(CONCAT("000000",
		MAX(SUBSTRING(`cod_reserva`,4)+1)),7)) FROM `reserva`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='RES000001';
				END IF;
			END;
		INSERT INTO `reserva` (`cod_reserva`,`cod_cliente`,`cod_empleados`,`cod_pago`,`cant_personas`,`monto_adelantado`,
		`cod_habitacion`,`fecha_registro`,`fecha_reserva`,`hora_llegada`,`observacion`)
		VALUES (id,codcli,codemp,codpa,canper,montadel,codhab,fechres,fechreg,horalleg,obs);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaServicioFinal` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaServicioFinal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaServicioFinal`(codtpdoc char(5),fechgir date,ser char(5),
correl char(10),tot decimal(9,2),codp char(5))
BEGIN
    DECLARE id CHAR(10);
   
		SET id=(SELECT CONCAT("SEF",RIGHT(CONCAT("000000",
		MAX(SUBSTRING(`cod_ventahab`,4)+1)),7)) FROM `servicio_final`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='SEF000001';
				END IF;
			END;
		INSERT INTO `servicio_final` (`cod_ventahab`,`cod_tipodoc`,`fecha_giro`,`serie`,`correlativo`,
		`total`,`cod_pago`)
		VALUES (id,codtpdoc,fechgir,ser,correl,tot,codp);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaTipoDocCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaTipoDocCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaTipoDocCliente`(doc VARCHAR(100))
BEGIN
	DECLARE id CHAR(5);
		SET id=(SELECT CONCAT("D",RIGHT(CONCAT("0000",
		MAX(SUBSTRING(cod_tipdoccl,4)+1)),4)) FROM tipo_doccliente);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='D0001';
				END IF;
			END;
		INSERT INTO tipo_doccliente(cod_tipdoccl,documento) VALUES(id, doc);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaTipoDocumentoVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaTipoDocumentoVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaTipoDocumentoVenta`(compr varchar(45))
BEGIN
    DECLARE id CHAR(5);
    
		SET id=(SELECT CONCAT("TDV",RIGHT(CONCAT("00",
		MAX(SUBSTRING(`cod_tipodoc`,4)+1)),2)) FROM `tipo_documento_venta`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='TDV01';
				END IF;
			END;
		INSERT INTO `tipo_documento_venta` (`cod_tipodoc`,`comprobante`)
		VALUES (id,compr);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaTipoEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaTipoEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaTipoEmpleado`(tpemp varchar(45))
BEGIN
    
		INSERT INTO `tipo_empleado`(`tipo_emleado`)
		VALUES (tpemp);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaTipoHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaTipoHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaTipoHabitacion`(tphab varchar(45),des varchar(200))
BEGIN
    DECLARE id CHAR(5);
    
		SET id=(SELECT CONCAT("TPH",RIGHT(CONCAT("00",
		MAX(SUBSTRING(`cod_tipoh`,4)+1)),2)) FROM `tipo_habitacion`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='TPH01';
				END IF;
			END;
		INSERT INTO `tipo_habitacion` (`cod_tipoh`,`tipo_habitacion`,`descripcion`)
		VALUES (id,tphab,des);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaTipoPago` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaTipoPago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaTipoPago`(formpa varchar(45))
BEGIN
    DECLARE id CHAR(5);
    
		SET id=(SELECT CONCAT("TPP",RIGHT(CONCAT("00",
		MAX(SUBSTRING(`cod_pago`,4)+1)),2)) FROM `tipo_pago`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='TPP01';
				END IF;
			END;
		INSERT INTO `tipo_pago` (`cod_pago`,`forma_pago`)
		VALUES (id,formpa);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaTipoProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaTipoProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaTipoProducto`(tppro varchar(45))
BEGIN
    DECLARE id CHAR(5);
    
		SET id=(SELECT CONCAT("TPR",RIGHT(CONCAT("00",
		MAX(SUBSTRING(`cod_tippro`,4)+1)),2)) FROM `tipo_producto`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='TPR01';
				END IF;
			END;
		INSERT INTO `tipo_producto` (`cod_tippro`,`tipo_producto`)
		VALUES (id,tppro);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_IngresaVentaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_IngresaVentaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IngresaVentaProducto`(codtpdoc char(5),fech DATE,des DECIMAL(9,2),tot DECIMAL(9,2),codcl CHAR(10))
BEGIN
    DECLARE id CHAR(10);
    
		SET id=(SELECT CONCAT("VPR",RIGHT(CONCAT("0000000",
		MAX(SUBSTRING(`cod_venpro`,4)+1)),2)) FROM `venta_producto`);
			BEGIN 
				IF ISNULL(id) THEN 
					SET id='VPR0000001';
				END IF;
			END;
		INSERT INTO `venta_producto` (`cod_venpro`,`cod_tipodoc`,`fecha`,`descuent`,`total`,`cod_cliente`)
		VALUES (id,codtpdoc,fech,des,tot,codcl);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_retornaRegistroHabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_retornaRegistroHabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_retornaRegistroHabitacion`(num char(10))
BEGIN
    SELECT rh.`cod_ventahab`, CONCAT( c.`nombres`," ",c.`apellidos`) AS 'CLIENTE', rh.`fecha_ingreso`, rh.`hora_ingreso`
FROM `habitacion` AS H INNER JOIN `registro_habitacion` AS RH ON H.`cod_habitacion`= RH.`cod_habitacion` INNER JOIN cliente AS C ON C.`cod_cliente` = RH.`cod_cliente`
WHERE h.`numero` = num AND rh.`estado`='INICIADO';
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
