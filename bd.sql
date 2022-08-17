-- MySQL dump 10.13  Distrib 8.0.29, for macos11.6 (x86_64)
--
-- Host: localhost    Database: jiu
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_acessos`
--

LOCK TABLES `aluno_acessos` WRITE;
/*!40000 ALTER TABLE `aluno_acessos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_graduacaos`
--

LOCK TABLES `aluno_graduacaos` WRITE;
/*!40000 ALTER TABLE `aluno_graduacaos` DISABLE KEYS */;
INSERT INTO `aluno_graduacaos` VALUES (1,1,17,'2022-08-16',0,'2022-08-16 22:21:46','2022-08-16 22:21:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_treinos`
--

LOCK TABLES `aluno_treinos` WRITE;
/*!40000 ALTER TABLE `aluno_treinos` DISABLE KEYS */;
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
  `valor_mensalidade` decimal(8,2) NOT NULL,
  `permitir_cadastrar_posicao` tinyint(1) NOT NULL DEFAULT '0',
  `cidade_id` bigint unsigned NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alunos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `alunos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Walter','Pezzo','walter@gmail.com','43999999999','m',1,'202cb962ac59075b964b07152d234b70','',100.50,0.00,0,2,'','2022-08-16 22:21:46','2022-08-16 22:21:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso_views`
--

LOCK TABLES `aviso_views` WRITE;
/*!40000 ALTER TABLE `aviso_views` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos`
--

LOCK TABLES `avisos` WRITE;
/*!40000 ALTER TABLE `avisos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produtos`
--

LOCK TABLES `categoria_produtos` WRITE;
/*!40000 ALTER TABLE `categoria_produtos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `cidades` VALUES (1,'Jaguariaíva','2022-08-16 22:21:46','2022-08-16 22:21:46'),(2,'Arapoti','2022-08-16 22:21:46','2022-08-16 22:21:46');
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
  `resposta_view` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_videos_posicao_id_foreign` (`posicao_id`),
  KEY `comentario_videos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `comentario_videos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `comentario_videos_posicao_id_foreign` FOREIGN KEY (`posicao_id`) REFERENCES `posicaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracaos`
--

LOCK TABLES `configuracaos` WRITE;
/*!40000 ALTER TABLE `configuracaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracaos` ENABLE KEYS */;
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
INSERT INTO `faixas` VALUES (1,'Branca','2022-08-16 22:21:46','2022-08-16 22:21:46'),(2,'Cinza e branca','2022-08-16 22:21:46','2022-08-16 22:21:46'),(3,'Cinza','2022-08-16 22:21:46','2022-08-16 22:21:46'),(4,'Cinza e preta','2022-08-16 22:21:46','2022-08-16 22:21:46'),(5,'Amarela e branca','2022-08-16 22:21:46','2022-08-16 22:21:46'),(6,'Amarela','2022-08-16 22:21:46','2022-08-16 22:21:46'),(7,'Amarela e preta','2022-08-16 22:21:46','2022-08-16 22:21:46'),(8,'Laranja e branca','2022-08-16 22:21:46','2022-08-16 22:21:46'),(9,'Laranja','2022-08-16 22:21:46','2022-08-16 22:21:46'),(10,'Laranja e preta','2022-08-16 22:21:46','2022-08-16 22:21:46'),(11,'Verde e branca','2022-08-16 22:21:46','2022-08-16 22:21:46'),(12,'Verde','2022-08-16 22:21:46','2022-08-16 22:21:46'),(13,'Verde e preta','2022-08-16 22:21:46','2022-08-16 22:21:46'),(14,'Azul','2022-08-16 22:21:46','2022-08-16 22:21:46'),(15,'Roxa','2022-08-16 22:21:46','2022-08-16 22:21:46'),(16,'Marrom','2022-08-16 22:21:46','2022-08-16 22:21:46'),(17,'Preta','2022-08-16 22:21:46','2022-08-16 22:21:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidades`
--

LOCK TABLES `mensalidades` WRITE;
/*!40000 ALTER TABLE `mensalidades` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (251,'2014_10_12_000000_create_users_table',1),(252,'2014_10_12_100000_create_password_resets_table',1),(253,'2019_08_19_000000_create_failed_jobs_table',1),(254,'2019_12_14_000001_create_personal_access_tokens_table',1),(255,'2022_04_11_021731_create_cidades_table',1),(256,'2022_04_11_155254_create_faixas_table',1),(257,'2022_05_11_021410_create_alunos_table',1),(258,'2022_05_11_155705_create_aluno_graduacaos_table',1),(259,'2022_05_15_111910_create_categorias_table',1),(260,'2022_05_15_113231_create_posicaos_table',1),(261,'2022_05_15_184258_create_posicao_videos_table',1),(262,'2022_05_15_204756_create_modalidades_table',1),(263,'2022_05_15_205635_create_agendas_table',1),(264,'2022_05_15_223422_create_aluno_acessos_table',1),(265,'2022_05_15_223947_create_configuracaos_table',1),(266,'2022_05_15_232654_create_aluno_anotacaos_table',1),(267,'2022_05_20_144530_create_treinos_table',1),(268,'2022_05_20_160644_create_aluno_treinos_table',1),(269,'2022_05_20_172409_create_posicao_views_table',1),(270,'2022_05_21_105121_create_recompensas_table',1),(271,'2022_05_21_144228_create_exame_faixas_table',1),(272,'2022_05_21_144258_create_exame_faixa_posicaos_table',1),(273,'2022_05_21_165658_create_mensalidades_table',1),(274,'2022_05_26_182625_create_aluno_exames_table',1),(275,'2022_05_26_182705_create_aluno_exame_posicaos_table',1),(276,'2022_05_28_093040_create_avisos_table',1),(277,'2022_05_28_093121_create_aviso_views_table',1),(278,'2022_06_19_171110_create_checkouts_table',1),(279,'2022_07_26_140258_create_comentario_videos_table',1),(280,'2022_08_16_042625_create_categoria_produtos_table',1),(281,'2022_08_16_042708_create_produtos_table',1),(282,'2022_08_16_043929_create_produto_galerias_table',1),(283,'2022_08_16_044240_create_pedidos_table',1),(284,'2022_08_16_044319_create_pedido_items_table',1),(285,'2022_08_16_191949_create_produto_acessos_table',1);
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
INSERT INTO `modalidades` VALUES (1,'Jiu-Jitsu','2022-08-16 22:21:46','2022-08-16 22:21:46'),(2,'NO-GI','2022-08-16 22:21:47','2022-08-16 22:21:47');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_items`
--

LOCK TABLES `pedido_items` WRITE;
/*!40000 ALTER TABLE `pedido_items` DISABLE KEYS */;
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
  `tipo_pagamento` enum('pix','cartao') COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrinho` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_aluno_id_foreign` (`aluno_id`),
  CONSTRAINT `pedidos_aluno_id_foreign` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao_videos`
--

LOCK TABLES `posicao_videos` WRITE;
/*!40000 ALTER TABLE `posicao_videos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao_views`
--

LOCK TABLES `posicao_views` WRITE;
/*!40000 ALTER TABLE `posicao_views` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicaos`
--

LOCK TABLES `posicaos` WRITE;
/*!40000 ALTER TABLE `posicaos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_galerias`
--

LOCK TABLES `produto_galerias` WRITE;
/*!40000 ALTER TABLE `produto_galerias` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recompensas`
--

LOCK TABLES `recompensas` WRITE;
/*!40000 ALTER TABLE `recompensas` DISABLE KEYS */;
INSERT INTO `recompensas` VALUES (1,1,1,30,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(2,1,2,45,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(3,1,3,60,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(4,1,4,75,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(5,2,0,120,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(6,2,1,135,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(7,2,2,150,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(8,2,3,165,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(9,2,4,180,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(10,3,0,225,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(11,3,1,240,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(12,3,2,255,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(13,3,3,270,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(14,3,4,285,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(15,4,0,330,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(16,4,1,345,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(17,4,2,360,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(18,4,3,375,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(19,4,4,390,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(20,5,0,435,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(21,5,1,450,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(22,5,2,465,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(23,5,3,480,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(24,5,4,495,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(25,6,0,540,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(26,6,1,555,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(27,6,2,570,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(28,6,3,585,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(29,6,4,600,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(30,7,0,645,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(31,7,1,660,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(32,7,2,675,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(33,7,3,690,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(34,7,4,705,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(35,8,0,750,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(36,8,1,765,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(37,8,2,780,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(38,8,3,795,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(39,8,4,810,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(40,9,0,855,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(41,9,1,870,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(42,9,2,885,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(43,9,3,900,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(44,9,4,915,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(45,10,0,960,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(46,10,1,975,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(47,10,2,990,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(48,10,3,1005,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(49,10,4,1020,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(50,11,0,1065,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(51,11,1,1080,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(52,11,2,1095,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(53,11,3,1110,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(54,11,4,1125,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(55,12,0,1170,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(56,12,1,1185,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(57,12,2,1200,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(58,12,3,1215,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(59,12,4,1230,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(60,13,0,1275,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(61,13,1,1290,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(62,13,2,1305,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(63,13,3,1320,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(64,13,4,1335,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(65,14,0,1380,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(66,14,1,1395,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(67,14,2,1410,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(68,14,3,1425,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(69,14,4,1440,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(70,15,0,1485,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(71,15,1,1500,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(72,15,2,1515,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(73,15,3,1530,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(74,15,4,1545,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(75,16,0,1590,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(76,16,1,1605,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(77,16,2,1620,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(78,16,3,1635,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(79,16,4,1650,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(80,17,0,1695,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(81,17,1,1710,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(82,17,2,1725,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(83,17,3,1740,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47'),(84,17,4,1755,'Está apto, porém sob análise do mestre','2022-08-16 22:21:47','2022-08-16 22:21:47');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinos`
--

LOCK TABLES `treinos` WRITE;
/*!40000 ALTER TABLE `treinos` DISABLE KEYS */;
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

-- Dump completed on 2022-08-16 19:24:42
