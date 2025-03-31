-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: luena_terrafacil
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `documentacao`
--

DROP TABLE IF EXISTS `documentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_solicitacao` int DEFAULT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  `caminho_arquivo` varchar(255) NOT NULL,
  `status` enum('pendente','aprovado','rejeitado') DEFAULT 'pendente',
  PRIMARY KEY (`id`),
  KEY `id_solicitacao` (`id_solicitacao`),
  CONSTRAINT `documentacao_ibfk_1` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacoes_compra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacao`
--

LOCK TABLES `documentacao` WRITE;
/*!40000 ALTER TABLE `documentacao` DISABLE KEYS */;
INSERT INTO `documentacao` VALUES (1,1,'documento1.pdf','/uploads/documento1.pdf','aprovado'),(2,2,'documento2.pdf','/uploads/documento2.pdf','pendente');
/*!40000 ALTER TABLE `documentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_solicitacao` int DEFAULT NULL,
  `valor` decimal(15,2) NOT NULL,
  `data_pagamento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pendente','confirmado') DEFAULT 'pendente',
  PRIMARY KEY (`id`),
  KEY `id_solicitacao` (`id_solicitacao`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacoes_compra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,1,1000000.00,'2025-03-31 05:14:40','confirmado'),(2,2,400000.00,'2025-03-31 05:14:40','pendente');
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacoes_compra`
--

DROP TABLE IF EXISTS `solicitacoes_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitacoes_compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_terreno` int DEFAULT NULL,
  `id_comprador` int DEFAULT NULL,
  `status` enum('pendente','aprovado','rejeitado') DEFAULT 'pendente',
  `data_solicitacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_terreno` (`id_terreno`),
  KEY `id_comprador` (`id_comprador`),
  CONSTRAINT `solicitacoes_compra_ibfk_1` FOREIGN KEY (`id_terreno`) REFERENCES `terrenos` (`id`),
  CONSTRAINT `solicitacoes_compra_ibfk_2` FOREIGN KEY (`id_comprador`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacoes_compra`
--

LOCK TABLES `solicitacoes_compra` WRITE;
/*!40000 ALTER TABLE `solicitacoes_compra` DISABLE KEYS */;
INSERT INTO `solicitacoes_compra` VALUES (1,1,1,'aprovado','2025-03-31 05:09:47'),(2,2,1,'pendente','2025-03-31 05:09:47');
/*!40000 ALTER TABLE `solicitacoes_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terrenos`
--

DROP TABLE IF EXISTS `terrenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terrenos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(255) NOT NULL,
  `metragem` decimal(10,2) NOT NULL,
  `preco` decimal(15,2) NOT NULL,
  `finalidade` enum('residencial','comercial','industrial','outro') NOT NULL,
  `status` enum('disponível','reservado','vendido') DEFAULT 'disponível',
  `id_proprietario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proprietario` (`id_proprietario`),
  CONSTRAINT `terrenos_ibfk_1` FOREIGN KEY (`id_proprietario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terrenos`
--

LOCK TABLES `terrenos` WRITE;
/*!40000 ALTER TABLE `terrenos` DISABLE KEYS */;
INSERT INTO `terrenos` VALUES (1,'Alto Luena',500.00,1000000.00,'comercial','disponível',1),(2,'4 de Abril',70.00,400000.00,'residencial','disponível',2);
/*!40000 ALTER TABLE `terrenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` enum('admin','cidadão') NOT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Alegria Cufuna','alegriayenycufuna2001@gmail.com','932794934','yeny2001','cidadão','2025-03-31 04:54:32'),(2,'Nelson Lucas','nelson@gmail.com','931876009','nelson2025','admin','2025-03-31 04:54:32');
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

-- Dump completed on 2025-03-31  6:16:42
