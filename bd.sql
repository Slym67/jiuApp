-- MySQL dump 10.13  Distrib 8.0.29, for macos11.6 (x86_64)
--
-- Host: localhost    Database: jiu2
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cidade_id` bigint unsigned NOT NULL,
  `modalidade_id` bigint unsigned NOT NULL,
  `horario` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_semana` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendas_cidade_id_foreign` (`cidade_id`),
  KEY `agendas_modalidade_id_foreign` (`modalidade_id`),
  CONSTRAINT `agendas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `agendas_modalidade_id_foreign` FOREIGN KEY (`modalidade_id`) REFERENCES `modalidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
INSERT INTO `agendas` VALUES (1,1,1,'09:30','quarta','t',1,'2022-06-01 20:22:38','2022-07-20 12:42:26'),(2,1,1,'10:00','terça','t',1,'2022-06-01 20:22:46','2022-08-02 12:28:05'),(3,1,1,'20:30','quarta','t',1,'2022-06-01 21:54:40','2022-06-01 21:54:40'),(4,2,1,'10:00','sexta','t',1,'2022-07-22 12:40:48','2022-07-22 12:40:48'),(5,1,1,'09:00','sabádo','t',1,'2022-07-22 21:05:46','2022-07-22 21:05:46');
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_acessos`
--

DROP TABLE IF EXISTS `aluno_acessos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_acessos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_acessos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `aluno_acessos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_acessos`
--

LOCK TABLES `aluno_acessos` WRITE;
/*!40000 ALTER TABLE `aluno_acessos` DISABLE KEYS */;
INSERT INTO `aluno_acessos` VALUES (1,1,'127.0.0.1','2022-05-28 15:04:25','2022-05-28 15:04:25'),(3,1,'127.0.0.1','2022-05-28 15:24:08','2022-05-28 15:24:08'),(4,1,'127.0.0.1','2022-05-29 21:35:47','2022-05-29 21:35:47'),(5,1,'192.168.100.28','2022-05-29 21:37:38','2022-05-29 21:37:38'),(6,1,'127.0.0.1','2022-05-29 21:38:59','2022-05-29 21:38:59'),(8,1,'127.0.0.1','2022-05-29 21:55:02','2022-05-29 21:55:02'),(9,1,'127.0.0.1','2022-05-29 21:57:09','2022-05-29 21:57:09'),(12,1,'127.0.0.1','2022-05-29 22:37:13','2022-05-29 22:37:13'),(13,1,'127.0.0.1','2022-06-01 01:59:15','2022-06-01 01:59:15'),(14,1,'127.0.0.1','2022-06-01 11:05:52','2022-06-01 11:05:52'),(15,1,'127.0.0.1','2022-06-01 11:06:31','2022-06-01 11:06:31'),(17,1,'127.0.0.1','2022-06-01 11:43:23','2022-06-01 11:43:23'),(18,1,'127.0.0.1','2022-06-01 20:14:58','2022-06-01 20:14:58'),(20,1,'127.0.0.1','2022-06-03 15:42:52','2022-06-03 15:42:52'),(21,1,'127.0.0.1','2022-06-03 15:43:37','2022-06-03 15:43:37'),(23,1,'127.0.0.1','2022-06-03 15:45:55','2022-06-03 15:45:55'),(27,1,'127.0.0.1','2022-06-03 16:02:20','2022-06-03 16:02:20'),(28,1,'127.0.0.1','2022-06-19 19:24:52','2022-06-19 19:24:52'),(30,1,'127.0.0.1','2022-06-19 19:31:22','2022-06-19 19:31:22'),(31,1,'127.0.0.1','2022-06-20 10:34:51','2022-06-20 10:34:51'),(34,1,'192.168.100.134','2022-06-20 12:25:51','2022-06-20 12:25:51'),(35,1,'127.0.0.1','2022-07-20 12:32:32','2022-07-20 12:32:32'),(43,1,'127.0.0.1','2022-07-20 13:39:15','2022-07-20 13:39:15'),(44,1,'127.0.0.1','2022-07-20 13:40:07','2022-07-20 13:40:07'),(45,1,'127.0.0.1','2022-07-20 13:40:46','2022-07-20 13:40:46'),(46,1,'127.0.0.1','2022-07-20 13:41:45','2022-07-20 13:41:45'),(49,1,'127.0.0.1','2022-07-20 13:44:51','2022-07-20 13:44:51'),(51,1,'127.0.0.1','2022-07-20 13:46:48','2022-07-20 13:46:48'),(52,1,'127.0.0.1','2022-07-22 12:32:59','2022-07-22 12:32:59'),(59,1,'127.0.0.1','2022-07-22 17:10:16','2022-07-22 17:10:16'),(61,1,'127.0.0.1','2022-07-22 17:42:37','2022-07-22 17:42:37'),(66,1,'127.0.0.1','2022-07-26 17:27:14','2022-07-26 17:27:14'),(67,1,'127.0.0.1','2022-07-26 18:22:34','2022-07-26 18:22:34'),(68,1,'127.0.0.1','2022-07-27 03:52:18','2022-07-27 03:52:18'),(69,1,'127.0.0.1','2022-07-27 11:21:03','2022-07-27 11:21:03'),(70,1,'127.0.0.1','2022-07-27 11:29:16','2022-07-27 11:29:16'),(71,5,'127.0.0.1','2022-07-27 11:39:09','2022-07-27 11:39:09'),(72,5,'127.0.0.1','2022-07-27 11:51:43','2022-07-27 11:51:43'),(73,5,'127.0.0.1','2022-07-27 13:16:22','2022-07-27 13:16:22'),(74,5,'127.0.0.1','2022-07-27 13:23:25','2022-07-27 13:23:25'),(75,5,'127.0.0.1','2022-08-03 14:58:30','2022-08-03 14:58:30'),(76,1,'127.0.0.1','2022-08-04 12:48:49','2022-08-04 12:48:49'),(77,5,'127.0.0.1','2022-08-04 12:49:07','2022-08-04 12:49:07'),(78,1,'127.0.0.1','2022-08-04 12:50:11','2022-08-04 12:50:11'),(79,5,'127.0.0.1','2022-08-04 14:46:08','2022-08-04 14:46:08'),(80,5,'127.0.0.1','2022-08-04 14:46:52','2022-08-04 14:46:52'),(81,5,'127.0.0.1','2022-08-04 14:46:55','2022-08-04 14:46:55'),(82,5,'127.0.0.1','2022-08-04 14:46:58','2022-08-04 14:46:58'),(83,5,'127.0.0.1','2022-08-05 12:52:05','2022-08-05 12:52:05'),(84,1,'127.0.0.1','2022-08-10 12:38:26','2022-08-10 12:38:26'),(85,1,'127.0.0.1','2022-08-16 17:27:05','2022-08-16 17:27:05'),(86,5,'127.0.0.1','2022-08-17 17:53:31','2022-08-17 17:53:31');
/*!40000 ALTER TABLE `aluno_acessos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_anotacaos`
--

DROP TABLE IF EXISTS `aluno_anotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_anotacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `anotacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('negativa','neutra','positiva') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_anotacaos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `aluno_anotacaos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_anotacaos`
--

LOCK TABLES `aluno_anotacaos` WRITE;
/*!40000 ALTER TABLE `aluno_anotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_anotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_exame_posicaos`
--

DROP TABLE IF EXISTS `aluno_exame_posicaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_exame_posicaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_exame_id` bigint unsigned NOT NULL,
  `posicao_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_exame_posicaos_aluno_exame_id_foreign` (`aluno_exame_id`),
  KEY `aluno_exame_posicaos_posicao_id_foreign` (`posicao_id`),
  CONSTRAINT `aluno_exame_posicaos_aluno_exame_id_foreign` FOREIGN KEY (`aluno_exame_id`) REFERENCES `aluno_exames` (`id`),
  CONSTRAINT `aluno_exame_posicaos_posicao_id_foreign` FOREIGN KEY (`posicao_id`) REFERENCES `posicaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_exame_posicaos`
--

LOCK TABLES `aluno_exame_posicaos` WRITE;
/*!40000 ALTER TABLE `aluno_exame_posicaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_exame_posicaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_exames`
--

DROP TABLE IF EXISTS `aluno_exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_exames` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `exame_id` bigint unsigned NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `resultado` enum('aprovado','reprovado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_exames_aluno_id_foreign` (`aluno_id`),
  KEY `aluno_exames_exame_id_foreign` (`exame_id`),
  CONSTRAINT `aluno_exames_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `aluno_exames_exame_id_foreign` FOREIGN KEY (`exame_id`) REFERENCES `exame_faixas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_exames`
--

LOCK TABLES `aluno_exames` WRITE;
/*!40000 ALTER TABLE `aluno_exames` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_graduacaos`
--

DROP TABLE IF EXISTS `aluno_graduacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_graduacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `faixa_id` bigint unsigned NOT NULL,
  `data` date NOT NULL,
  `grau` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_graduacaos_aluno_id_foreign` (`aluno_id`),
  KEY `aluno_graduacaos_faixa_id_foreign` (`faixa_id`),
  CONSTRAINT `aluno_graduacaos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `aluno_graduacaos_faixa_id_foreign` FOREIGN KEY (`faixa_id`) REFERENCES `faixas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_graduacaos`
--

LOCK TABLES `aluno_graduacaos` WRITE;
/*!40000 ALTER TABLE `aluno_graduacaos` DISABLE KEYS */;
INSERT INTO `aluno_graduacaos` VALUES (1,1,5,'2022-05-28',0,'2022-05-28 14:58:15','2022-05-28 14:58:15'),(5,5,1,'2022-07-27',4,'2022-07-27 11:38:28','2022-07-27 11:38:28');
/*!40000 ALTER TABLE `aluno_graduacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_treinos`
--

DROP TABLE IF EXISTS `aluno_treinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_treinos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `treino_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_treinos_aluno_id_foreign` (`aluno_id`),
  KEY `aluno_treinos_treino_id_foreign` (`treino_id`),
  CONSTRAINT `aluno_treinos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `aluno_treinos_treino_id_foreign` FOREIGN KEY (`treino_id`) REFERENCES `treinos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_treinos`
--

LOCK TABLES `aluno_treinos` WRITE;
/*!40000 ALTER TABLE `aluno_treinos` DISABLE KEYS */;
INSERT INTO `aluno_treinos` VALUES (5,1,9,0,'2022-08-02 12:29:47','2022-08-02 12:29:47');
/*!40000 ALTER TABLE `aluno_treinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso_atual` decimal(5,2) NOT NULL,
  `permitir_cadastrar_posicao` tinyint(1) NOT NULL DEFAULT '0',
  `cidade_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `valor_mensalidade` decimal(8,2) DEFAULT '100.00',
  `token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `alunos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `alunos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Walter','Pezzo','walter@gmail.com','43999999999','m',1,'202cb962ac59075b964b07152d234b70','WH1J3Z311vf9yvTVSMTz.png',100.50,0,2,'2022-05-28 14:58:15','2022-08-16 17:27:06',100.00,'60a32fdc-bfd4-4cc0-91a0-b3c16a4695c2'),(5,'Marcos','Bueno','marcos_buenomello@hotmail.com','43996347016','m',1,'e10adc3949ba59abbe56e057f20f883e','',82.00,0,1,'2022-07-27 11:38:28','2022-08-17 17:53:33',1.20,'3b28bed2-fcac-493b-8a0d-c5fc9f295298');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aviso_views`
--

DROP TABLE IF EXISTS `aviso_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviso_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `aviso_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aviso_views_aluno_id_foreign` (`aluno_id`),
  KEY `aviso_views_aviso_id_foreign` (`aviso_id`),
  CONSTRAINT `aviso_views_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `aviso_views_aviso_id_foreign` FOREIGN KEY (`aviso_id`) REFERENCES `avisos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso_views`
--

LOCK TABLES `aviso_views` WRITE;
/*!40000 ALTER TABLE `aviso_views` DISABLE KEYS */;
INSERT INTO `aviso_views` VALUES (1,1,1,'2022-06-01 11:21:44','2022-06-01 11:21:44');
/*!40000 ALTER TABLE `aviso_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avisos`
--

DROP TABLE IF EXISTS `avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avisos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos`
--

LOCK TABLES `avisos` WRITE;
/*!40000 ALTER TABLE `avisos` DISABLE KEYS */;
INSERT INTO `avisos` VALUES (1,'asd','asf','','2022-06-01 02:21:16','2022-06-01 02:21:16'),(2,'fas','asfasdasd','','2022-07-27 15:37:16','2022-07-27 15:37:16'),(3,'fas','asfasdasd','','2022-07-27 15:37:25','2022-07-27 15:37:25'),(4,'fas','afasdasfasdasd','','2022-07-27 15:39:21','2022-07-27 15:39:49');
/*!40000 ALTER TABLE `avisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produtos`
--

DROP TABLE IF EXISTS `categoria_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produtos`
--

LOCK TABLES `categoria_produtos` WRITE;
/*!40000 ALTER TABLE `categoria_produtos` DISABLE KEYS */;
INSERT INTO `categoria_produtos` VALUES (1,'RashGuards','2022-08-16 17:55:19','2022-08-16 19:18:22');
/*!40000 ALTER TABLE `categoria_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Guarda fechada','2022-05-28 15:11:43','2022-05-28 15:11:43'),(2,'Meia guarda','2022-05-28 15:11:56','2022-06-01 02:01:20'),(3,'100 Kg','2022-05-28 15:12:01','2022-05-28 15:12:01');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkouts`
--

DROP TABLE IF EXISTS `checkouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkouts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aluno_id` bigint unsigned NOT NULL,
  `transacao_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('pix','cartao') COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkouts_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `checkouts_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkouts`
--

LOCK TABLES `checkouts` WRITE;
/*!40000 ALTER TABLE `checkouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'Jaguariaíva','2022-05-28 14:58:15','2022-05-28 14:58:15'),(2,'Arapoti','2022-05-28 14:58:15','2022-05-28 14:58:15');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_videos`
--

DROP TABLE IF EXISTS `comentario_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario_videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `posicao_id` bigint unsigned NOT NULL,
  `comentario` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aluno_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `resposta_view` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `comentario_videos_posicao_id_foreign` (`posicao_id`),
  KEY `comentario_videos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `comentario_videos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `comentario_videos_posicao_id_foreign` FOREIGN KEY (`posicao_id`) REFERENCES `posicaos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_videos`
--

LOCK TABLES `comentario_videos` WRITE;
/*!40000 ALTER TABLE `comentario_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracaos`
--

DROP TABLE IF EXISTS `configuracaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `valor_mensalidade` decimal(10,2) NOT NULL,
  `dias_para_bloqueio` int NOT NULL,
  `dia_pagamento` int NOT NULL,
  `minutos_para_presenca` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `valor_contribuicao` decimal(10,2) DEFAULT '10.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracaos`
--

LOCK TABLES `configuracaos` WRITE;
/*!40000 ALTER TABLE `configuracaos` DISABLE KEYS */;
INSERT INTO `configuracaos` VALUES (1,1.20,10,10,1555,'2022-05-28 15:04:33','2022-08-17 22:17:51',2.00);
/*!40000 ALTER TABLE `configuracaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuicao_retiradas`
--

DROP TABLE IF EXISTS `contribuicao_retiradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribuicao_retiradas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `motivo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuicao_retiradas`
--

LOCK TABLES `contribuicao_retiradas` WRITE;
/*!40000 ALTER TABLE `contribuicao_retiradas` DISABLE KEYS */;
INSERT INTO `contribuicao_retiradas` VALUES (1,120.00,'Teste','2022-08-18 00:37:25','2022-08-18 00:37:25'),(2,12.00,'asfasdas dasd','2022-08-18 00:38:28','2022-08-18 00:38:28');
/*!40000 ALTER TABLE `contribuicao_retiradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuicaos`
--

DROP TABLE IF EXISTS `contribuicaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribuicaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `aluno_id` bigint unsigned NOT NULL,
  `transacao_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento` enum('pix','dinheiro','outros') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contribuicaos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `contribuicaos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuicaos`
--

LOCK TABLES `contribuicaos` WRITE;
/*!40000 ALTER TABLE `contribuicaos` DISABLE KEYS */;
INSERT INTO `contribuicaos` VALUES (1,10.00,5,'24975338843','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter2497533884363047579','pix','2022-08-17 22:09:49','2022-08-17 22:09:49'),(2,10.00,5,'24975357735','pending','09520985980','marcos_buenomello@hotmail.com','iVBORw0KGgoAAAANSUhEUgAABRQAAAUUAQAAAACGnaNFAAAIBElEQVR42u3dQY7jNhAFUN5A97+lbsAgQCYjs35R7J5BMECeF0a7bVFPy0IVP8f841/3YGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGT8deNYX9c///v7Zz8+1rd/vv1xRfk4/11lPr99/tXcnJGRkZGRkZGRkZGR8dh4PUudz5/VlX5CF971vDYpnsvfnx/zzRkZGRkZGRkZGRkZGQ+MC+B5n48aabki/e7nx/SWyOnmjIyMjIyMjIyMjIyM3zXe8aq1yMoL7B6tVHOMjIyMjIyMjIyMjIy/1ZjJH4ryxcf/FsrzRhcjIyMjIyMjIyMjI+PvNKaV2qqqdISuslT7pOl335vbY2RkZGRkZGRkZGRkzJkF/9nbL+QqMDIyMjIyMjIyMjL+3435dX9u1pll4TInNzMghR4szaVOwMjIyMjIyMjIyMjI+Ga8S+VT4teuskSeiRtdcMEsO4Xa7UKMjIyMjIyMjIyMjIyHxrTmMvq2qblmHpZbUMtTpSNzDvtcjIyMjIyMjIyMjIyMaZHNeZxXjlpbQtcW93P59nGvrq5jZGRkZGRkZGRkZGR8M7YhBUtBldPTWu1dxubKnFwdpWNkZGRkZGRkZGRkZPyKMY+qzdDu2VdQTehB3jN0l/NCT/YhMTIyMjIyMjIyMjIyNpkFpR66Szfp+SzN6rmqWsqy2bWeLkZGRkZGRkZGRkZGxmNjqYyuXIKVQIKmQXRQgpW6bpaNQ4yMjIyMjIyMjIyMjO/G9qqcXnCHEbkU2HaP/hyeVJu9z8QxMjIyMjIyMjIyMjLO7R6fEV4l+bm94/1ZaS3BbqP8lWbsGBkZGRkZGRkZGRkZj40f7Z5l6i21lEoCQQNIe3zeJuYuRkZGRkZGRkZGRkbGY+NSFLXBBZvTcu6wA+j63Bq03KgmSb/MxDEyMjIyMjIyMjIyMu57SCNrUwmWH/J61ldpgK7d8rOQGRkZGRkZGRkZGRkZT4wjbMe53oqxkkrQzM6VJ1j2Fo3jmThGRkZGRkZGRkZGRsbZZUqn5XKNlHb2LOVW06JaRuTyR0ZGRkZGRkZGRkZGxkNjilCbIRVtbttH4y3WYOs52uPDyMjIyMjIyMjIyMhYjXlybWyzCO4cupY29ZTMgqau29ZcjIyMjIyMjIyMjIyM2ThKNNpzcq0uUq6otVTRzlDNpXE4RkZGRkZGRkZGRkbGI2MIC4jat7JsfiYfNAvkgIOjzAJGRkZGRkZGRkZGRsYZ9/jcY6RBtgxt59+aWIOSR51e2x4SIyMjIyMjIyMjIyPjwUxcbQstSdKLpw1d2zxBmonb1lyMjIyMjIyMjIyMjIxNzdXethRPs0yzlcs+2kJ5RG6Gs3nmS13IyMjIyMjIyMjIyMg4u0zpNn4tfZGbRu2JoEtFNnOp9jITx8jIyMjIyMjIyMjIuOzxaYbbUt5aCh8oXaIRtu28zsRtay5GRkZGRkZGRkZGRsbNTNwoQdDLFp3cJbpCN6lmILSH5+T1GBkZGRkZGRkZGRkZj4xpA0+ZhLvL2/JUIXJg5Jm4O2cbnNSFjIyMjIyMjIyMjIyMbWbBcttGmzPYUtPozqhyyzsEsTEyMjIyMjIyMjIyMr4Zy6VNskAKTluMCbDs7AlbeUZXtDEyMjIyMjIyMjIyMo73M3JSCyiPvs3N6mWVGaqv0Y3cjXV5RkZGRkZGRkZGRkbGvTGNqpX+zlUi1JbmUpqdS/HU5UkP5/YYGRkZGRkZGRkZGRmbmitdujxByWC7twnRsxuCazpWL3N7jIyMjIyMjIyMjIyMybj89urm2pYft6kEM8RT145VCpvuay5GRkZGRkZGRkZGRsbG2PZyltu2aWypm1TCDGqvKRdojIyMjIyMjIyMjIyM4ws1VxPwXOKfr1w3LZ7nT0beC/S9TGlGRkZGRkZGRkZGRsaiGJ8TbqkZNHL4wBPQphLMrmm0CWdjZGRkZGRkZGRkZGR8M45wTE06N+dnw+kOXaIKKNHRs1Ru22wDRkZGRkZGRkZGRkbGo5m4FA595x07y/me7UMWRTMxdzy3x8jIyMjIyMjIyMjI+DoTV3bnNGHTSxMqj8PNXHg9b/6duT1GRkZGRkZGRkZGRsb0KnesH8MM28hng85SbqXHCF0nRkZGRkZGRkZGRkbGvTGFD2y+SPt5Zg4zKE2j1KK6C56RkZGRkZGRkZGRkfHYOMqAWi6Z2hrpDrHTM5CvbabbYGRkZGRkZGRkZGRk/JqxeD4m4cr1zUmfJe9g2e1Ti7aU7nbY52JkZGRkZGRkZGRkZNxDSxBbExhdnuUjriCd77npOjEyMjIyMjIyMjIyMp4bx/pKSQW1h/Qswa58jGfa2VN6UlcfcMDIyMjIyMjIyMjIyPhmvEIP6cpflGiClN92fZZbMxRtX665GBkZGRkZGRkZGRkZG2Oqgko+QY2OzjNxM2dPlz7V+UwcIyMjIyMjIyMjIyPjd4xjvXTk6mt2qDQT17SUtj0kRkZGRkZGRkZGRkbGI2NNICin29QW0OYc0PvzuJ2rBEuXmoyRkZGRkZGRkZGRkfHImMgJ9fzifstly/N0i/suI3KMjIyMjIyMjIyMjIzHxhES1dLunLTlZ5YNPCXg4N4skJ+ZkZGRkZGRkZGRkZHxyPinvhgZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZv238Cy3YyMRsxKIiAAAAAElFTkSuQmCC','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter249753577356304791E','pix','2022-08-17 22:09:57','2022-08-17 22:09:57'),(3,10.00,5,'24975429011','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter249754290116304515C','pix','2022-08-17 22:10:17','2022-08-17 22:10:17'),(4,10.00,5,'24975429227','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter24975429227630432DA','pix','2022-08-17 22:10:50','2022-08-17 22:10:50'),(5,10.00,5,'24975481320','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter2497548132063041C2D','pix','2022-08-17 22:12:41','2022-08-17 22:12:41'),(6,10.00,5,'24975481363','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter249754813636304F45E','pix','2022-08-17 22:12:47','2022-08-17 22:12:47'),(7,10.00,1,'24975612273','pending','09520985980','walter@gmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter249756122736304DDBC','pix','2022-08-17 22:16:34','2022-08-17 22:16:34'),(8,10.00,1,'24975612368','pending','09520985980','walter@gmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com520400005303986540510.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter249756123686304CC82','pix','2022-08-17 22:16:52','2022-08-17 22:17:07'),(9,2.00,1,'24975612816','approved','09520985980','walter@gmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com52040000530398654042.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter2497561281663040C36','pix','2022-08-17 22:18:01','2022-08-17 22:19:02'),(10,2.00,5,'24980086918','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com52040000530398654042.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter2498008691863045F1C','pix','2022-08-18 00:47:41','2022-08-18 00:47:41'),(11,2.00,5,'24980136016','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com52040000530398654042.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter249801360166304D086','pix','2022-08-18 00:47:54','2022-08-18 00:47:54'),(12,2.00,5,'24980136207','pending','09520985980','marcos_buenomello@hotmail.com','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','00020126400014br.gov.bcb.pix0118slymdev2@gmail.com52040000530398654042.005802BR5911BUMI26371836010Jaguariava62240520mpqrinter2498013620763045F94','pix','2022-08-18 00:48:21','2022-08-18 00:48:21');
/*!40000 ALTER TABLE `contribuicaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exame_faixa_posicaos`
--

DROP TABLE IF EXISTS `exame_faixa_posicaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exame_faixa_posicaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `exame_id` bigint unsigned NOT NULL,
  `posicao_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exame_faixa_posicaos_exame_id_foreign` (`exame_id`),
  KEY `exame_faixa_posicaos_posicao_id_foreign` (`posicao_id`),
  CONSTRAINT `exame_faixa_posicaos_exame_id_foreign` FOREIGN KEY (`exame_id`) REFERENCES `exame_faixas` (`id`),
  CONSTRAINT `exame_faixa_posicaos_posicao_id_foreign` FOREIGN KEY (`posicao_id`) REFERENCES `posicaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame_faixa_posicaos`
--

LOCK TABLES `exame_faixa_posicaos` WRITE;
/*!40000 ALTER TABLE `exame_faixa_posicaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `exame_faixa_posicaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exame_faixas`
--

DROP TABLE IF EXISTS `exame_faixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exame_faixas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `faixa_id` bigint unsigned NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exame_faixas_faixa_id_foreign` (`faixa_id`),
  CONSTRAINT `exame_faixas_faixa_id_foreign` FOREIGN KEY (`faixa_id`) REFERENCES `faixas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame_faixas`
--

LOCK TABLES `exame_faixas` WRITE;
/*!40000 ALTER TABLE `exame_faixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `exame_faixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faixas`
--

DROP TABLE IF EXISTS `faixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faixas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faixas`
--

LOCK TABLES `faixas` WRITE;
/*!40000 ALTER TABLE `faixas` DISABLE KEYS */;
INSERT INTO `faixas` VALUES (1,'Branca','2022-05-28 14:58:15','2022-05-28 14:58:15'),(2,'Azul','2022-05-28 14:58:15','2022-05-28 14:58:15'),(3,'Roxa','2022-05-28 14:58:15','2022-05-28 14:58:15'),(4,'Marrom','2022-05-28 14:58:15','2022-05-28 14:58:15'),(5,'Preta','2022-05-28 14:58:15','2022-05-28 14:58:15'),(6,'Cinza e branca','2022-06-19 19:31:37','2022-06-19 19:31:37'),(7,'Cinza','2022-06-19 19:31:37','2022-06-19 19:31:37'),(8,'Cinza e preta','2022-06-19 19:31:37','2022-06-19 19:31:37'),(9,'Amarela e branca','2022-06-19 19:31:37','2022-06-19 19:31:37'),(10,'Amarela','2022-06-19 19:31:37','2022-06-19 19:31:37'),(11,'Amarela e preta','2022-06-19 19:31:37','2022-06-19 19:31:37'),(12,'Laranja e branca','2022-06-19 19:31:37','2022-06-19 19:31:37'),(13,'Laranja','2022-06-19 19:31:37','2022-06-19 19:31:37'),(14,'Laranja e preta','2022-06-19 19:31:37','2022-06-19 19:31:37'),(15,'Verde e branca','2022-06-19 19:31:37','2022-06-19 19:31:37'),(16,'Verde','2022-06-19 19:31:37','2022-06-19 19:31:37'),(17,'Verde e preta','2022-06-19 19:31:37','2022-06-19 19:31:37');
/*!40000 ALTER TABLE `faixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensalidades`
--

DROP TABLE IF EXISTS `mensalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensalidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('dinheiro','pix','cartão de crédito','cartão de débito','transferência','cheque') COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_pagamento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mensalidades_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `mensalidades_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidades`
--

LOCK TABLES `mensalidades` WRITE;
/*!40000 ALTER TABLE `mensalidades` DISABLE KEYS */;
INSERT INTO `mensalidades` VALUES (41,1,1.20,'dinheiro','','2022-07-27','2022-07-27 04:09:59','2022-07-27 04:09:59'),(42,5,1.20,'pix','Mercado pago pix: 24569442319','2022-08-04','2022-08-04 13:09:22','2022-08-04 13:09:22');
/*!40000 ALTER TABLE `mensalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (26,'2014_10_12_000000_create_users_table',1),(27,'2014_10_12_100000_create_password_resets_table',1),(28,'2019_08_19_000000_create_failed_jobs_table',1),(29,'2019_12_14_000001_create_personal_access_tokens_table',1),(30,'2022_04_11_021731_create_cidades_table',1),(31,'2022_04_11_155254_create_faixas_table',1),(32,'2022_05_11_021410_create_alunos_table',1),(33,'2022_05_11_155705_create_aluno_graduacaos_table',1),(34,'2022_05_15_111910_create_categorias_table',1),(35,'2022_05_15_113231_create_posicaos_table',1),(36,'2022_05_15_184258_create_posicao_videos_table',1),(37,'2022_05_15_204756_create_modalidades_table',1),(38,'2022_05_15_205635_create_agendas_table',1),(39,'2022_05_15_223422_create_aluno_acessos_table',1),(40,'2022_05_15_223947_create_configuracaos_table',1),(41,'2022_05_15_232654_create_aluno_anotacaos_table',1),(42,'2022_05_20_144530_create_treinos_table',1),(43,'2022_05_20_160644_create_aluno_treinos_table',1),(44,'2022_05_20_172409_create_posicao_views_table',1),(45,'2022_05_21_105121_create_recompensas_table',1),(46,'2022_05_21_144228_create_exame_faixas_table',1),(47,'2022_05_21_144258_create_exame_faixa_posicaos_table',1),(48,'2022_05_21_165658_create_mensalidades_table',1),(49,'2022_05_26_182625_create_aluno_exames_table',1),(50,'2022_05_26_182705_create_aluno_exame_posicaos_table',1),(51,'2022_05_28_093040_create_avisos_table',1),(52,'2022_05_28_093121_create_aviso_views_table',1),(53,'2022_06_19_171110_create_checkouts_table',2),(54,'2022_07_26_140258_create_comentario_videos_table',3),(60,'2022_08_16_042625_create_categoria_produtos_table',4),(61,'2022_08_16_042708_create_produtos_table',4),(62,'2022_08_16_043929_create_produto_galerias_table',4),(63,'2022_08_16_044240_create_pedidos_table',4),(64,'2022_08_16_044319_create_pedido_items_table',4),(67,'2022_08_16_191949_create_produto_acessos_table',5),(68,'2022_08_17_181705_create_contribuicaos_table',5),(69,'2022_08_17_193105_create_contribuicao_retiradas_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
INSERT INTO `modalidades` VALUES (1,'Jiu-Jitsu','2022-05-28 14:58:15','2022-05-28 14:58:15'),(2,'NO-GI','2022-05-28 14:58:15','2022-05-28 14:58:15');
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_items`
--

DROP TABLE IF EXISTS `pedido_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_items_pedido_id_foreign` (`pedido_id`),
  KEY `pedido_items_produto_id_foreign` (`produto_id`),
  CONSTRAINT `pedido_items_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `pedido_items_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_items`
--

LOCK TABLES `pedido_items` WRITE;
/*!40000 ALTER TABLE `pedido_items` DISABLE KEYS */;
INSERT INTO `pedido_items` VALUES (3,1,5,1,209.00,'2022-08-17 11:21:30','2022-08-17 11:21:30'),(5,1,6,1,56.00,'2022-08-17 11:49:00','2022-08-17 11:49:00'),(8,2,6,1,56.00,'2022-08-17 13:54:42','2022-08-17 13:54:42'),(10,4,6,1,56.00,'2022-08-17 15:46:00','2022-08-17 15:46:00');
/*!40000 ALTER TABLE `pedido_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` bigint unsigned NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` enum('pix','cartao','boleto') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `carrinho` tinyint(1) DEFAULT '0',
  `link_boleto` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `pedidos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `pedidos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,265.00,'','','','24959348675','pending','pix','2022-08-16 21:58:35','2022-08-17 14:32:28',0,'https://www.mercadopago.com.br/payments/24959348675/ticket?caller_id=200475973&payment_method_id=bolbradesco&payment_id=24959348675&payment_method_reference_id=10083497669&hash=188d708f-8c7e-4279-8b7a-d73f9427a84f'),(2,1,56.00,'','','','24959554030','pending','boleto','2022-08-17 13:54:42','2022-08-17 14:32:29',0,'https://www.mercadopago.com.br/payments/24959554030/ticket?caller_id=200475973&payment_method_id=bolbradesco&payment_id=24959554030&payment_method_reference_id=10083506485&hash=c5f87b85-d6dc-427b-899b-452d97773031'),(4,1,56.00,'','','','1307583410','','cartao','2022-08-17 15:46:00','2022-08-17 17:20:59',0,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicao_videos`
--

DROP TABLE IF EXISTS `posicao_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicao_videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `posicao_id` bigint unsigned NOT NULL,
  `url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('google_drive','youtube') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posicao_videos_posicao_id_foreign` (`posicao_id`),
  CONSTRAINT `posicao_videos_posicao_id_foreign` FOREIGN KEY (`posicao_id`) REFERENCES `posicaos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao_videos`
--

LOCK TABLES `posicao_videos` WRITE;
/*!40000 ALTER TABLE `posicao_videos` DISABLE KEYS */;
INSERT INTO `posicao_videos` VALUES (3,3,'XAqbhIOKcj8&t=18s','youtube','2022-06-01 20:18:42','2022-06-01 20:18:42'),(4,4,'sZeYlQEj9t4','youtube','2022-06-01 20:20:48','2022-06-01 20:20:48'),(8,10,'1-_BU-VO8k2LBLrSRjZLGAAcwM_FsnbhT','google_drive','2022-07-22 17:26:01','2022-07-22 17:26:01'),(9,12,'Ng36caYN71Y','youtube','2022-07-22 17:45:54','2022-07-22 17:45:54'),(10,13,'11SDgBFGIu8rmErXrykuZs3WnRNKCZqqP','google_drive','2022-08-04 13:30:13','2022-08-04 13:30:13');
/*!40000 ALTER TABLE `posicao_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicao_views`
--

DROP TABLE IF EXISTS `posicao_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicao_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `posicao_id` bigint unsigned NOT NULL,
  `aluno_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posicao_views_posicao_id_foreign` (`posicao_id`),
  KEY `posicao_views_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `posicao_views_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `posicao_views_posicao_id_foreign` FOREIGN KEY (`posicao_id`) REFERENCES `posicaos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao_views`
--

LOCK TABLES `posicao_views` WRITE;
/*!40000 ALTER TABLE `posicao_views` DISABLE KEYS */;
INSERT INTO `posicao_views` VALUES (41,10,1,'2022-07-22 15:03:12','2022-07-22 15:03:12'),(42,10,1,'2022-07-22 15:03:17','2022-07-22 15:03:17'),(57,12,1,'2022-07-22 17:46:00','2022-07-22 17:46:00'),(58,12,1,'2022-07-22 18:27:36','2022-07-22 18:27:36'),(59,10,1,'2022-07-22 20:00:19','2022-07-22 20:00:19'),(60,10,1,'2022-07-22 20:02:21','2022-07-22 20:02:21'),(159,13,1,'2022-08-04 13:30:15','2022-08-04 13:30:15'),(160,13,1,'2022-08-04 13:36:59','2022-08-04 13:36:59'),(161,13,1,'2022-08-04 13:37:23','2022-08-04 13:37:23'),(162,13,1,'2022-08-04 13:37:28','2022-08-04 13:37:28'),(163,13,1,'2022-08-04 13:37:48','2022-08-04 13:37:48'),(164,12,1,'2022-08-04 13:38:05','2022-08-04 13:38:05'),(165,10,1,'2022-08-04 13:38:12','2022-08-04 13:38:12'),(166,10,1,'2022-08-04 13:38:47','2022-08-04 13:38:47'),(167,13,1,'2022-08-04 13:38:56','2022-08-04 13:38:56'),(168,13,1,'2022-08-04 13:39:07','2022-08-04 13:39:07'),(169,10,1,'2022-08-04 13:39:19','2022-08-04 13:39:19'),(170,10,1,'2022-08-04 13:39:46','2022-08-04 13:39:46'),(171,13,1,'2022-08-04 13:39:55','2022-08-04 13:39:55'),(172,13,5,'2022-08-04 13:41:19','2022-08-04 13:41:19'),(173,13,5,'2022-08-04 13:41:31','2022-08-04 13:41:31'),(174,13,5,'2022-08-04 13:41:51','2022-08-04 13:41:51'),(175,10,5,'2022-08-04 13:41:56','2022-08-04 13:41:56'),(176,10,5,'2022-08-04 14:06:12','2022-08-04 14:06:12'),(177,13,5,'2022-08-04 14:06:43','2022-08-04 14:06:43'),(178,13,1,'2022-08-04 14:06:50','2022-08-04 14:06:50'),(179,13,1,'2022-08-04 14:07:07','2022-08-04 14:07:07'),(180,10,1,'2022-08-04 14:07:17','2022-08-04 14:07:17'),(181,10,1,'2022-08-04 14:07:20','2022-08-04 14:07:20'),(182,13,1,'2022-08-04 14:07:32','2022-08-04 14:07:32'),(183,13,1,'2022-08-04 14:07:45','2022-08-04 14:07:45'),(184,10,1,'2022-08-04 14:07:51','2022-08-04 14:07:51'),(185,10,1,'2022-08-04 14:09:12','2022-08-04 14:09:12'),(186,10,1,'2022-08-04 14:09:18','2022-08-04 14:09:18'),(187,10,1,'2022-08-04 14:09:57','2022-08-04 14:09:57'),(188,13,1,'2022-08-04 14:10:04','2022-08-04 14:10:04'),(189,13,1,'2022-08-04 14:10:34','2022-08-04 14:10:34'),(190,13,1,'2022-08-04 14:13:15','2022-08-04 14:13:15'),(191,13,5,'2022-08-04 14:14:04','2022-08-04 14:14:04'),(192,13,5,'2022-08-04 14:15:38','2022-08-04 14:15:38'),(193,13,5,'2022-08-04 14:17:15','2022-08-04 14:17:15'),(194,13,5,'2022-08-04 14:17:18','2022-08-04 14:17:18'),(195,13,5,'2022-08-04 14:17:28','2022-08-04 14:17:28'),(196,13,5,'2022-08-04 14:17:44','2022-08-04 14:17:44'),(197,13,1,'2022-08-04 14:19:49','2022-08-04 14:19:49'),(198,13,5,'2022-08-04 14:25:38','2022-08-04 14:25:38');
/*!40000 ALTER TABLE `posicao_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicaos`
--

DROP TABLE IF EXISTS `posicaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` bigint unsigned NOT NULL,
  `imagem` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_temp` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faixa_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `aluno_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posicaos_categoria_id_foreign` (`categoria_id`),
  KEY `posicaos_faixa_id_foreign` (`faixa_id`),
  KEY `posicaos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `posicaos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `posicaos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `posicaos_faixa_id_foreign` FOREIGN KEY (`faixa_id`) REFERENCES `faixas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicaos`
--

LOCK TABLES `posicaos` WRITE;
/*!40000 ALTER TABLE `posicaos` DISABLE KEYS */;
INSERT INTO `posicaos` VALUES (3,2,'K7YTjVHAbCLlYlRtDvnU.png','','Da meia guarda para as costas','Roger Gracie ensina a trabalhar a meia guarda até pegar as costas!',1,1,1,'2022-06-01 20:18:42','2022-06-01 20:18:42'),(4,1,'vN55YaCjWloy9MssSoLT.png','','finalizar da guarda fechada','Mais uma excelente dica do grande campeão do Jiu-Jitsu, Roger Gracie.',1,1,1,'2022-06-01 20:20:48','2022-06-01 20:21:05'),(10,1,'4P999TUhbaDxmQ84vjFx.png','','asfasd','',1,1,1,'2022-07-22 15:02:58','2022-07-22 19:12:51'),(12,1,'','','asfasdffff','',1,1,1,'2022-07-22 17:45:54','2022-07-22 17:45:54'),(13,1,'','','teste novo','',1,1,1,'2022-08-04 13:30:13','2022-08-04 13:30:13');
/*!40000 ALTER TABLE `posicaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_acessos`
--

DROP TABLE IF EXISTS `produto_acessos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_acessos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `aluno_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_acessos_produto_id_foreign` (`produto_id`),
  KEY `produto_acessos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `produto_acessos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `produto_acessos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_acessos`
--

LOCK TABLES `produto_acessos` WRITE;
/*!40000 ALTER TABLE `produto_acessos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_acessos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_galerias`
--

DROP TABLE IF EXISTS `produto_galerias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_galerias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `imagem` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_galerias_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_galerias_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_galerias`
--

LOCK TABLES `produto_galerias` WRITE;
/*!40000 ALTER TABLE `produto_galerias` DISABLE KEYS */;
INSERT INTO `produto_galerias` VALUES (4,5,'ebH0xMQlhjuNXiuweuUI.png','2022-08-16 20:26:12','2022-08-16 20:26:12'),(8,4,'edOJgO8r893GDCBlJh69.png','2022-08-17 11:18:44','2022-08-17 11:18:44'),(9,4,'Vg1BrTzMAYY21qQdIkvo.png','2022-08-17 11:19:05','2022-08-17 11:19:05'),(10,4,'QmzcibzfEwiDLEwCNpbm.png','2022-08-17 11:19:09','2022-08-17 11:19:09'),(11,4,'vzWb11gZRFwr2XEcsfIK.png','2022-08-17 11:19:13','2022-08-17 11:19:13'),(12,6,'EEX2hfOpizmACSpz4wiX.png','2022-08-17 11:23:35','2022-08-17 11:23:35');
/*!40000 ALTER TABLE `produto_galerias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estoque` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (4,'KVRA','M','Muito top asd asd a asd ad asd asdsdsdsdas dasd asdasdsdasd asd asd asd as das das dasd asd as das asd',120.00,1,0,1,'2022-08-16 18:44:09','2022-08-16 20:22:55',0),(5,'teste2','P','asd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd aasd asdasdasdasdasd asd as dasdasdasdasda asd asdasdasd a',209.00,1,0,1,'2022-08-16 20:26:12','2022-08-17 11:39:29',1),(6,'tamanho','','',56.00,1,0,1,'2022-08-17 11:23:17','2022-08-17 11:46:31',1);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recompensas`
--

DROP TABLE IF EXISTS `recompensas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recompensas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `faixa_id` bigint unsigned NOT NULL,
  `grau` int NOT NULL,
  `total_presencas` int NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recompensas_faixa_id_foreign` (`faixa_id`),
  CONSTRAINT `recompensas_faixa_id_foreign` FOREIGN KEY (`faixa_id`) REFERENCES `faixas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recompensas`
--

LOCK TABLES `recompensas` WRITE;
/*!40000 ALTER TABLE `recompensas` DISABLE KEYS */;
INSERT INTO `recompensas` VALUES (1,1,1,30,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(2,1,2,45,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(3,1,3,60,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(4,1,4,75,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(5,2,0,120,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(6,2,1,135,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(7,2,2,150,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(8,2,3,165,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(9,2,4,180,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(10,3,0,225,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(11,3,1,240,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(12,3,2,255,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(13,3,3,270,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(14,3,4,285,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(15,4,0,330,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(16,4,1,345,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(17,4,2,360,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(18,4,3,375,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(19,4,4,390,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(20,5,0,435,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(21,5,1,450,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(22,5,2,465,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(23,5,3,480,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(24,5,4,495,'Está apto, porém sob análise do mestre','2022-05-28 14:58:15','2022-05-28 14:58:15'),(25,5,5,1,'aada','2022-07-27 04:03:26','2022-07-27 04:03:26');
/*!40000 ALTER TABLE `recompensas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinos`
--

DROP TABLE IF EXISTS `treinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treinos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `agenda_id` bigint unsigned NOT NULL,
  `descricao` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `treinos_agenda_id_foreign` (`agenda_id`),
  CONSTRAINT `treinos_agenda_id_foreign` FOREIGN KEY (`agenda_id`) REFERENCES `agendas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinos`
--

LOCK TABLES `treinos` WRITE;
/*!40000 ALTER TABLE `treinos` DISABLE KEYS */;
INSERT INTO `treinos` VALUES (1,1,'','2022-06-02',1,'2022-06-01 20:24:18','2022-06-01 20:24:18'),(2,2,'','2022-05-31',1,'2022-06-01 20:24:20','2022-06-01 20:24:20'),(3,3,'','2022-06-01',1,'2022-06-01 21:55:16','2022-06-01 21:59:10'),(4,1,'','2022-07-20',1,'2022-07-20 12:41:58','2022-07-20 12:41:58'),(5,2,'','2022-07-20',1,'2022-07-20 12:46:48','2022-07-20 12:46:48'),(6,4,'','2022-07-22',1,'2022-07-22 12:40:57','2022-07-22 12:40:57'),(7,1,'','2022-07-27',1,'2022-07-26 18:23:19','2022-07-26 18:23:19'),(8,2,'','2022-07-27',1,'2022-07-26 18:23:22','2022-07-26 18:23:22'),(9,2,'','2022-08-02',1,'2022-08-02 12:28:12','2022-08-02 12:28:12');
/*!40000 ALTER TABLE `treinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-17 21:49:04
