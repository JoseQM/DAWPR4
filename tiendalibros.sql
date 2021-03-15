-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendalibros
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `idAutor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAutor` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellidosAutor` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Brandon','Sanderson'),(2,'Joanne','Rowling'),(3,'Joe','Abercrombie'),(4,'George','Martin');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriales` (
  `idEditorial` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEditorial` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idEditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'Nova'),(2,'SM'),(3,'Plaza&James'),(4,'Alianza');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `idLibro` int(11) NOT NULL AUTO_INCREMENT,
  `tituloLibro` varchar(200) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `precioLibro` decimal(6,2) DEFAULT NULL,
  `cantidadStockLibro` int(11) DEFAULT NULL,
  `idEditorialFK` int(11) DEFAULT NULL,
  `idAutorFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLibro`),
  KEY `idEditorialFK2_idx` (`idEditorialFK`),
  KEY `idAutorFK3_idx` (`idAutorFK`),
  CONSTRAINT `idAutorFK3` FOREIGN KEY (`idAutorFK`) REFERENCES `autores` (`idAutor`),
  CONSTRAINT `idEditorialFK2` FOREIGN KEY (`idEditorialFK`) REFERENCES `editoriales` (`idEditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Nacidos de la bruma I',44.00,50,1,1),(2,'Nacidos de la bruma II',22.00,70,1,1),(3,'Nacidos de la bruma III',22.00,60,1,1),(4,'Elantris',18.00,22,1,1),(5,'Harry Potter y el Prisionero de Azkaban',24.00,50,2,2),(6,'Harry Potter y el Caliz de Fuego',24.00,50,2,2),(7,'Harry Potter y las Reliquias de la Muerte I',24.00,50,2,2),(8,'La voz de las Espadas',22.00,80,3,3),(9,'Antes de que los cuelguen',22.00,80,3,3),(10,'El ultimo argumento de los Reyes',22.00,80,3,3),(11,'Juego de Tronos',28.00,60,4,4),(12,'Danza de dragones',28.00,60,4,4),(13,'Harry Potter y la Piedra Filosofal',16.00,12,2,2);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineapedidos`
--

DROP TABLE IF EXISTS `lineapedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineapedidos` (
  `idLineaPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idPedidoFK` int(11) DEFAULT NULL,
  `idLibroFK` int(11) DEFAULT NULL,
  `cantidadLibro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLineaPedido`),
  KEY `idPedidoFK_idx` (`idPedidoFK`),
  KEY `idLIbroFK5_idx` (`idLibroFK`),
  CONSTRAINT `idLibroFK5` FOREIGN KEY (`idLibroFK`) REFERENCES `libros` (`idLibro`),
  CONSTRAINT `idPedidoFK4` FOREIGN KEY (`idPedidoFK`) REFERENCES `pedidos` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineapedidos`
--

LOCK TABLES `lineapedidos` WRITE;
/*!40000 ALTER TABLE `lineapedidos` DISABLE KEYS */;
INSERT INTO `lineapedidos` VALUES (1,1,1,2),(2,1,4,6),(3,1,8,4);
/*!40000 ALTER TABLE `lineapedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` date DEFAULT NULL,
  `fechaEnvioPedido` date DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL,
  `pedidoEnviado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idUsuarioFK1_idx` (`idUsuarioFK`),
  CONSTRAINT `idUsuarioFK1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2021-03-15','2021-03-15',2,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(40) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `claveUsuario` varchar(250) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tipoUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',0),(2,'user','ee11cbb19052e40b07aac0ca060c23ee',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-15 21:49:21
