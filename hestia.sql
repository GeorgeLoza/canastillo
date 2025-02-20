-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: hestia_soal
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `almacens`
--

DROP TABLE IF EXISTS `almacens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `almacens_codigo_unique` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacens`
--

LOCK TABLES `almacens` WRITE;
/*!40000 ALTER TABLE `almacens` DISABLE KEYS */;
INSERT INTO `almacens` VALUES (1,'ALM-001','Almacen Lacteos','Soalpro - Planta lacteos',NULL,NULL);
/*!40000 ALTER TABLE `almacens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_movimientos`
--

DROP TABLE IF EXISTS `detalle_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_movimientos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movimiento_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `cantidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_movimientos_movimiento_id_foreign` (`movimiento_id`),
  KEY `detalle_movimientos_item_id_foreign` (`item_id`),
  CONSTRAINT `detalle_movimientos_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `detalle_movimientos_movimiento_id_foreign` FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_movimientos`
--

LOCK TABLES `detalle_movimientos` WRITE;
/*!40000 ALTER TABLE `detalle_movimientos` DISABLE KEYS */;
INSERT INTO `detalle_movimientos` VALUES (10,4,2,'121','2024-10-28 19:40:17','2024-10-28 19:40:17'),(11,5,2,'12356','2024-10-28 19:56:41','2024-10-28 19:56:41'),(12,6,3,'123456','2024-10-28 23:36:47','2024-10-28 23:36:47'),(15,7,10,'30','2024-11-07 16:28:39','2024-11-07 16:28:39'),(16,7,14,'25','2024-11-07 16:28:39','2024-11-07 16:28:39'),(17,7,6,'1','2024-11-07 16:28:39','2024-11-07 16:28:39'),(19,8,11,'20','2024-11-28 17:37:52','2024-11-28 17:37:52');
/*!40000 ALTER TABLE `detalle_movimientos` ENABLE KEYS */;
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
-- Table structure for table `garantias`
--

DROP TABLE IF EXISTS `garantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiempo` datetime NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `movimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `identificador` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `garantias_user_id_foreign` (`user_id`),
  CONSTRAINT `garantias_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantias`
--

LOCK TABLES `garantias` WRITE;
/*!40000 ALTER TABLE `garantias` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_extras`
--

DROP TABLE IF EXISTS `informacion_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion_extras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `informacion_extras_user_id_foreign` (`user_id`),
  CONSTRAINT `informacion_extras_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_extras`
--

LOCK TABLES `informacion_extras` WRITE;
/*!40000 ALTER TABLE `informacion_extras` DISABLE KEYS */;
INSERT INTO `informacion_extras` VALUES (5,1,NULL,NULL,NULL,NULL,'2024-10-28 18:19:52','2024-10-28 18:19:52'),(6,2,NULL,NULL,NULL,NULL,'2024-11-07 16:17:33','2024-11-07 16:17:33');
/*!40000 ALTER TABLE `informacion_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tama├▒o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'Canastillo','C-001','Peque├▒o',38.20,'Rojo - Naranja','canastillo de red simple','2024-10-22 17:55:36','2024-10-22 17:55:36'),(3,'Canastillo','C-002','Peque├▒o',32.30,'verde','canastillo robusto','2024-10-24 23:51:54','2024-10-24 23:52:17'),(5,'Canastillo','R','Grande',0.00,'Rojo','59x39,5x',NULL,NULL),(6,'Canastillo','RP','Peque├▒o',0.00,'Rojo','39,5x33x',NULL,NULL),(7,'Canastillo','RP','Peque├▒o',0.00,'Naranja','39,5x33x',NULL,NULL),(8,'Canastillo','AZ','Grande',0.00,'Azul Grande','59x39,5x',NULL,NULL),(9,'Canastillo','AM','Grande',0.00,'Amarillo Grande','59x39,5x',NULL,NULL),(10,'Canastillo','V','',0.00,'Verde','59x39,5x',NULL,NULL),(11,'Canastillo','B o BD','',0.00,'Blanco Delizia','59x39,5x',NULL,NULL),(12,'Canastillo','Z o NZ','',0.00,'Negro Z','51,5x29,5x',NULL,NULL),(13,'Canastillo','C','Grande',0.00,'Celeste','50x39x',NULL,NULL),(14,'Canastillo','NG','Grande',0.00,'Naranja','50x39x',NULL,NULL),(15,'Botellon','BOT','',0.00,'Botellon','',NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (10,'0000_01_01_000000_create_almacens_table',1),(11,'0001_01_01_000000_create_users_table',1),(12,'0001_01_01_000001_create_cache_table',1),(13,'0001_01_01_000002_create_jobs_table',1),(14,'2024_10_11_120956_create_informacion_extras_table',1),(15,'2024_10_11_124549_create_garantias_table',1),(16,'2024_10_11_125132_create_items_table',1),(17,'2024_10_11_125826_create_movimientos_table',1),(18,'2024_10_11_131526_create_detalle_movimientos_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almacen_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `transporte_cliente` bigint unsigned DEFAULT NULL,
  `identificador` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `movimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_movimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimientos_almacen_id_foreign` (`almacen_id`),
  KEY `movimientos_user_id_foreign` (`user_id`),
  KEY `movimientos_transporte_cliente_foreign` (`transporte_cliente`),
  CONSTRAINT `movimientos_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `movimientos_transporte_cliente_foreign` FOREIGN KEY (`transporte_cliente`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `movimientos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (4,'2024-10-28 15:40:17',1,1,NULL,'1245','Ingreso','Compra','nfjkesbfsh','2024-10-28 19:40:17','2024-10-28 19:40:17'),(5,'2024-10-28 15:56:40',1,1,NULL,'1235','Ingreso','Compra','HJBHJ','2024-10-28 19:56:40','2024-10-28 19:56:40'),(6,'2024-10-28 19:36:47',1,1,NULL,'41561','Ingreso','Compra','njdksehjhfdk','2024-10-28 23:36:47','2024-10-28 23:36:47'),(7,'2024-11-07 12:27:44',1,1,NULL,'789456','Ingreso','Compra','Ninguno','2024-11-07 16:27:44','2024-11-07 16:27:44'),(8,'2024-11-28 13:37:35',1,1,NULL,'a123','Ingreso','Compra','ninguna','2024-11-28 17:37:35','2024-11-28 17:37:35');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0umZrAGlARcknA5sUeeKIpQDW5GBP7NoEeFtdcDV',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaGpPVVJMTTBudHhpY2RXUkRmUWFuYmptYkdpZGwwdlZKZFIxclprdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvY29tcHJhIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1730983587),('FupwjU7kIeGNa61IyQsy3woTmy3zsI5JchJ5b35K',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVGdrNlE4WnY0ZlB2SEM2eEx5cXBSUDcxR0UxbXByYmQ4RmRTMUJnMSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGVzcGFjaG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1730228417),('x43czEyzEWt1nIcSmYzUZ96iQGQ3ru7mLrArpL0F',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTVFaSmV3eFBpMVUzZ1dCUFFOVmhGd1BOUVY1UXFYV1NCQllmMFRkYSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1732801122);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `almacen_id` bigint unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_almacen_id_foreign` (`almacen_id`),
  CONSTRAINT `users_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jorge','Loza','admi',NULL,1,NULL,NULL,'69965','$2y$12$aro/9GpGt.NcPcvxgu4VjumwNNT8eNowLk5NZQBOj6DlEA6g/Bjhy',NULL,'2024-10-16 20:28:08','2024-11-07 16:17:10'),(2,'Zbonko','Arce','jef',NULL,NULL,NULL,NULL,'10001','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(3,'Silvia','Paz','jef',NULL,NULL,NULL,NULL,'10002','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(4,'Jorge','-','admi',NULL,NULL,NULL,NULL,'10003','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(5,'Diego','-','admi',NULL,NULL,NULL,NULL,'10004','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(6,'Dante Oliver','Condorena Cussi','cliente',NULL,1,NULL,NULL,'10005','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(7,'Marcelo','Buchapi Medina','cliente',NULL,1,NULL,NULL,'10006','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(8,'Genaro','Quenta Coyo','cliente',NULL,1,NULL,NULL,'10007','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(9,'Rene','Callisaya Choque','cliente',NULL,1,NULL,NULL,'10008','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(10,'Ruben','Mamani Pe├▒asco','cliente',NULL,1,NULL,NULL,'10009','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(11,'Daniel Alvaro','Mauricio Mamani','cliente',NULL,1,NULL,NULL,'10010','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(12,'Luis','Maquera Condori','cliente',NULL,1,NULL,NULL,'10011','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(13,'Epifanio','Miranda Guaygua','cliente',NULL,1,NULL,NULL,'10012','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(14,'Jhonny ','Callisaya Mancilla','cliente',NULL,1,NULL,NULL,'10013','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(15,'Elias','Alcon Limari','cliente',NULL,1,NULL,NULL,'10014','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(16,'Cristian ','Llanos','cliente',NULL,NULL,NULL,NULL,'10015','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(17,'Luis','Zarco','cliente',NULL,NULL,NULL,NULL,'10016','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(18,'David','Zarco','cliente',NULL,NULL,NULL,NULL,'10017','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(19,'Ademar','Gutierrez','cliente',NULL,NULL,NULL,NULL,'10018','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(20,'Jose Luis','Pacheco','cliente',NULL,NULL,NULL,NULL,'10019','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(21,'Marlene','Gutierrez','cliente',NULL,NULL,NULL,NULL,'10020','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(22,'Agencia','9','cliente',NULL,NULL,NULL,NULL,'10021','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(23,'Agencia','12','cliente',NULL,NULL,NULL,NULL,'10022','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(24,'Lenin','Carrillo','cliente',NULL,NULL,NULL,NULL,'10023','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(25,'Ivan ','Condori','cliente',NULL,NULL,NULL,NULL,'10024','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(26,'Distribuidora','Gomez','cliente',NULL,NULL,NULL,NULL,'10025','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(27,'SEDEM LA PAZ','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10026','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(28,'SEDEM EL ALTO','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10027','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(29,'SEDEM ORURO','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10028','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(30,'SEDEM POTOSI','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10029','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(31,'SEDEM TARIJA','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10030','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(32,'SEDEM CBBA','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10031','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(33,'SEDEM SCZ','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10032','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(34,'SEDEM CHUQUISACA','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10033','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(35,'SEDEM PANDO','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10034','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(36,'SEDEM BENI','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10035','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(37,'CODIALSA','Marco Flores','cliente',NULL,NULL,NULL,NULL,'10036','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(38,'Ximena','Bolivar','cliente',NULL,NULL,NULL,NULL,'10037','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(39,'Emerson','Kantuta','cliente',NULL,NULL,NULL,NULL,'10038','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(40,'Silverio','Mamani','cliente',NULL,NULL,NULL,NULL,'10039','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(41,'Freddy','Merlo Copa','cliente',NULL,NULL,NULL,NULL,'10040','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(42,'Roger','Palli','cliente',NULL,NULL,NULL,NULL,'10041','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(43,'Roberto','Calle','cliente',NULL,NULL,NULL,NULL,'10042','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(44,'Fernando','Chacon','cliente',NULL,NULL,NULL,NULL,'10043','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(45,'Miguel ','Quispe','cliente',NULL,NULL,NULL,NULL,'10044','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(46,'Freddy','Cuelca','cliente',NULL,NULL,NULL,NULL,'10045','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(47,'Cleto','Mamani','cliente',NULL,NULL,NULL,NULL,'10046','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(48,'Beatriz','Carazani','cliente',NULL,NULL,NULL,NULL,'10047','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(49,'Leonardo','Huanca','cliente',NULL,NULL,NULL,NULL,'10048','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(50,'Amalia','Aruquipa','cliente',NULL,NULL,NULL,NULL,'10049','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(51,'Marco Antonio','Pinedo','cliente',NULL,NULL,NULL,NULL,'10050','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(52,'Alfredo','Rojas','cliente',NULL,NULL,NULL,NULL,'10051','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(53,'Edgar','Carazani','cliente',NULL,NULL,NULL,NULL,'10052','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(54,'Dionicio','Carazani','cliente',NULL,NULL,NULL,NULL,'10053','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(55,'Orlando','Zabala','cliente',NULL,NULL,NULL,NULL,'10054','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(56,'Wilmer','Callisaya','cliente',NULL,NULL,NULL,NULL,'10055','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(57,'Graciela','Mendoza','cliente',NULL,NULL,NULL,NULL,'10056','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(58,'Juan','Jimenez','cliente',NULL,NULL,NULL,NULL,'10057','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(59,'Boris','Mamani','cliente',NULL,NULL,NULL,NULL,'10058','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(60,'Gabriel','Quispe','cliente',NULL,NULL,NULL,NULL,'10059','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(61,'Wilfredo','Tambo','cliente',NULL,NULL,NULL,NULL,'10060','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(62,'Ronald','Alanoca','cliente',NULL,NULL,NULL,NULL,'10061','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(63,'David','Bautista','cliente',NULL,NULL,NULL,NULL,'10062','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(64,'Roger','Vargas Villanueva','cliente',NULL,NULL,NULL,NULL,'10063','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(65,'William','Alarcon Avila','cliente',NULL,NULL,NULL,NULL,'10064','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(66,'Fernando','Burgos Aranibar','cliente',NULL,NULL,NULL,NULL,'10065','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(67,'David','Choque','cliente',NULL,NULL,NULL,NULL,'10066','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(68,'Fernando','Condori Limachi','cliente',NULL,NULL,NULL,NULL,'10067','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(69,'Jose Luis','Loayza','cliente',NULL,NULL,NULL,NULL,'10068','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(70,'Yulios','Pacari Asistiri','cliente',NULL,NULL,NULL,NULL,'10069','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(71,'Ronald','Sanchez Alanoca','cliente',NULL,NULL,NULL,NULL,'10070','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(72,'Alfredo','Ticona Mamani','cliente',NULL,NULL,NULL,NULL,'10071','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(73,'Marcelo','Alarcon Villa','cliente',NULL,NULL,NULL,NULL,'10072','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(74,'Alfredo','Callejas Mmani','cliente',NULL,NULL,NULL,NULL,'10073','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(75,'Esteban','Loza Poma','cliente',NULL,NULL,NULL,NULL,'10074','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(76,'Jhylmar','Quispe','cliente',NULL,NULL,NULL,NULL,'10075','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(77,'Mario','Tola Alavi','cliente',NULL,NULL,NULL,NULL,'10076','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(78,'Valentin ','Trujillo Callisaya','cliente',NULL,NULL,NULL,NULL,'10077','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(79,'Ramiro ','Yujra Chavez','cliente',NULL,NULL,NULL,NULL,'10078','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(80,'Rodolfo','Cruz Limachi','cliente',NULL,NULL,NULL,NULL,'10079','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(81,'Gsaton','Fernandez Mamani','cliente',NULL,NULL,NULL,NULL,'10080','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(82,'Edwin','Quisbert Torrez','cliente',NULL,NULL,NULL,NULL,'10081','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(83,'Jorge','Sanabria','cliente',NULL,NULL,NULL,NULL,'10082','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(84,'Percy','Vega Machaca','cliente',NULL,NULL,NULL,NULL,'10083','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(85,'Marisabel','Vela','cliente',NULL,NULL,NULL,NULL,'10084','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(86,'J. Daniel','Mamani','cliente',NULL,NULL,NULL,NULL,'10085','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(87,'Jorge','Callizaya','cliente',NULL,NULL,NULL,NULL,'10086','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(88,'Jorge','Diaz Choquetarqui','cliente',NULL,NULL,NULL,NULL,'10087','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(89,'Alan','Huariste (Javier Mamani)','cliente',NULL,NULL,NULL,NULL,'10088','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(90,'Ruben','Mamani Gutierrez','cliente',NULL,NULL,NULL,NULL,'10089','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(91,'Clotilde','Tantani','cliente',NULL,NULL,NULL,NULL,'10090','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(92,'Yhandira','Huanca','cliente',NULL,NULL,NULL,NULL,'10091','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(93,'Edwin ','Loza','cliente',NULL,NULL,NULL,NULL,'10092','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(94,'Luis','Ayca','cliente',NULL,NULL,NULL,NULL,'10093','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(95,'Agustin','Barrera','cliente',NULL,NULL,NULL,NULL,'10094','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(96,'Alejandro','Jimenez','cliente',NULL,NULL,NULL,NULL,'10095','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(97,'Dennis','Vasquez','cliente',NULL,NULL,NULL,NULL,'10096','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(98,'Roly','Carvajal','cliente',NULL,NULL,NULL,NULL,'10097','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(99,'Luis','Castro Faijo','cliente',NULL,NULL,NULL,NULL,'10098','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(100,'Samanta','Aparicio','cliente',NULL,NULL,NULL,NULL,'10099','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(101,'Olimpia','Huanca','cliente',NULL,NULL,NULL,NULL,'10100','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(102,'Carlos Gemer','Espinoza','cliente',NULL,NULL,NULL,NULL,'10101','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(103,'Alfredo','Ari (Flores V. Ruddy)','cliente',NULL,NULL,NULL,NULL,'10102','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(104,'Roli','Trigueros Butron - EA','cliente',NULL,NULL,NULL,NULL,'10103','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(105,'Dionicio','Quispe Flores - EA','cliente',NULL,NULL,NULL,NULL,'10104','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(106,'Rodrigo','Choque Huanca - EA','cliente',NULL,NULL,NULL,NULL,'10105','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(107,'Martin','Zegarra Achumiri - EA','cliente',NULL,NULL,NULL,NULL,'10106','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(108,'Santiago','Ventura - EA','cliente',NULL,NULL,NULL,NULL,'10107','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(109,'Miguel ','Mamani Mamani - EA','cliente',NULL,NULL,NULL,NULL,'10108','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(110,'Franklin','Rosas Ichuta - EA','cliente',NULL,NULL,NULL,NULL,'10109','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(111,'Limber','Tambo Apaza - EA','cliente',NULL,NULL,NULL,NULL,'10110','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(112,'Nelson','Mamani Torrez - EA','cliente',NULL,NULL,NULL,NULL,'10111','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(113,'Eloy','Mamani Quispe - EA','cliente',NULL,NULL,NULL,NULL,'10112','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(114,'Emiliano ','Mamani Copa - EA','cliente',NULL,NULL,NULL,NULL,'10113','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(115,'Ariel Gonzalo','Mauricio Mamani - EA','cliente',NULL,NULL,NULL,NULL,'10114','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(116,'Favio','Mamani Coaquira - EA','cliente',NULL,NULL,NULL,NULL,'10115','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(117,'Ines','Nina Ali - EA','cliente',NULL,NULL,NULL,NULL,'10116','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(118,'Elvira','Quelca - EA','cliente',NULL,NULL,NULL,NULL,'10117','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(119,'Jose Luis','Quispe Ticona - EA','cliente',NULL,NULL,NULL,NULL,'10118','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(120,'Ronald ','Chura Pacha - EA','cliente',NULL,NULL,NULL,NULL,'10119','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(121,'Lucio','Copa - EA','cliente',NULL,NULL,NULL,NULL,'10120','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(122,'Vicente','Canaviri Charcas - EA','cliente',NULL,NULL,NULL,NULL,'10121','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(123,'Winsor','Canaviri Charcas - EA','cliente',NULL,NULL,NULL,NULL,'10122','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(124,'Rosa Maria','Torres - EA','cliente',NULL,NULL,NULL,NULL,'10123','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(125,'Edwin Rudy','Condori Qui├▒ones - EA','cliente',NULL,NULL,NULL,NULL,'10124','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(126,'Maria','Mamani Condori - EA','cliente',NULL,NULL,NULL,NULL,'10125','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(127,'Luis','Apaza Arcani - EA','cliente',NULL,NULL,NULL,NULL,'10126','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(128,'Cristiam','Patty Arispe - EA','cliente',NULL,NULL,NULL,NULL,'10127','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(129,'Rene','Gutierrez - EA','cliente',NULL,NULL,NULL,NULL,'10128','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(130,'Miguel ','Mamani Mamani - VIACHA','cliente',NULL,NULL,NULL,NULL,'10129','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(131,'Pedro','Suxo - VIACHA','cliente',NULL,NULL,NULL,NULL,'10130','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(132,'Rene','Choque Huanca - VIACHA','cliente',NULL,NULL,NULL,NULL,'10131','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(133,'Roly','Trigero - VIACHA','cliente',NULL,NULL,NULL,NULL,'10132','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(134,'Wilder','Ruiz - VIACHA','cliente',NULL,NULL,NULL,NULL,'10133','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(135,'Miguel ','Herrera - VIACHA','cliente',NULL,NULL,NULL,NULL,'10134','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(136,'Franklin','Rosas Ichuta - VIACHA','cliente',NULL,NULL,NULL,NULL,'10135','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(137,'Martin','Zegarra - VIACHA','cliente',NULL,NULL,NULL,NULL,'10136','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(138,'Jose','Pe├▒asco - VIACHA','cliente',NULL,NULL,NULL,NULL,'10137','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(139,'Martin','Quispe - VIACHA','cliente',NULL,NULL,NULL,NULL,'10138','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(140,'Martin','Quispe - ACHOCALLA','cliente',NULL,NULL,NULL,NULL,'10139','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(141,'Wilder','Ruiz - ACHOCALLA','cliente',NULL,NULL,NULL,NULL,'10140','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(142,'Miguel','Herrera - ACHOCALLA','cliente',NULL,NULL,NULL,NULL,'10141','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(143,'Rene','Choque Huanca - ACHOCALLA','cliente',NULL,NULL,NULL,NULL,'10142','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(144,'Rodrigo','Choque - ACHOCALLA','cliente',NULL,NULL,NULL,NULL,'10143','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(145,'Pan Casero','-','cliente',NULL,NULL,NULL,NULL,'10144','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(146,'Espa├▒ola','-','cliente',NULL,NULL,NULL,NULL,'10145','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(147,'Aecofor','-','cliente',NULL,NULL,NULL,NULL,'10146','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(148,'Guisel','Monroy','cliente',NULL,NULL,NULL,NULL,'10147','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(149,'Doris','Amizola','cliente',NULL,NULL,NULL,NULL,'10148','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(150,'Pastor','Mamani','cliente',NULL,NULL,NULL,NULL,'10149','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(151,'Helen','Herrera','cliente',NULL,NULL,NULL,NULL,'10150','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(152,'Yola','Paye','cliente',NULL,NULL,NULL,NULL,'10151','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(153,'Virginia','Choque','cliente',NULL,NULL,NULL,NULL,'10152','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(154,'Lucy','Sanchez','cliente',NULL,NULL,NULL,NULL,'10153','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(155,'SAMY','Oruro','cliente',NULL,NULL,NULL,NULL,'10154','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(156,'Potosi','-','cliente',NULL,NULL,NULL,NULL,'10155','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(157,'Sacaba','CBBA','cliente',NULL,NULL,NULL,NULL,'10156','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(158,'Sucre','-','cliente',NULL,NULL,NULL,NULL,'10157','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(159,'Cochabamba','-','cliente',NULL,NULL,NULL,NULL,'10158','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(160,'Nordland','-','cliente',NULL,NULL,NULL,NULL,'10159','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(161,'Juan Carlos','Mendoza - LP','cliente',NULL,NULL,NULL,NULL,'10160','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(162,'Daniel','Ventura Aquino - LP','cliente',NULL,NULL,NULL,NULL,'10161','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(163,'Carlos','Coronel Tola - LP','cliente',NULL,NULL,NULL,NULL,'10162','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(164,'Hector','Ventura Aquino - LP','cliente',NULL,NULL,NULL,NULL,'10163','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(165,'Guido','Condori - LP','cliente',NULL,NULL,NULL,NULL,'10164','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(166,'Juan Jose','Vargas - LP','cliente',NULL,NULL,NULL,NULL,'10165','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(167,'Nelson','Mamani Torrez - LP','cliente',NULL,NULL,NULL,NULL,'10166','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(168,'Gonzalo','Ventura - LP','cliente',NULL,NULL,NULL,NULL,'10167','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(169,'Eloy','Alanoca - LP','cliente',NULL,NULL,NULL,NULL,'10168','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(170,'Rene','Choquehuanca - LP','cliente',NULL,NULL,NULL,NULL,'10169','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(171,'Hernan','Canaviri - LP','cliente',NULL,NULL,NULL,NULL,'10170','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(172,'Marco','Ticona - LP','cliente',NULL,NULL,NULL,NULL,'10171','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(173,'Franclin','Paucara - LP','cliente',NULL,NULL,NULL,NULL,'10172','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(174,'Daniel','Huanto - LP','cliente',NULL,NULL,NULL,NULL,'10173','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(175,'Leoncio','Apaza - LP','cliente',NULL,NULL,NULL,NULL,'10174','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(176,'Marco','Bautista - LP','cliente',NULL,NULL,NULL,NULL,'10175','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(177,'Jose','Pe├▒asco - LP','cliente',NULL,NULL,NULL,NULL,'10176','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(178,'Esteban','Coronel - LP','cliente',NULL,NULL,NULL,NULL,'10177','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(179,'Juan Carlos','Mendoza - LP','cliente',NULL,NULL,NULL,NULL,'10178','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(180,'Pablo','Mamani - LP','cliente',NULL,NULL,NULL,NULL,'10179','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(181,'Boris','Mamani - OTROS','cliente',NULL,NULL,NULL,NULL,'10180','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(182,'Omar','Luna - OTROS','cliente',NULL,NULL,NULL,NULL,'10181','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(183,'A.','Carrasco - OTROS','cliente',NULL,NULL,NULL,NULL,'10182','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(184,'Jorge','Suxo - ORURO','cliente',NULL,NULL,NULL,NULL,'10183','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(185,'RR. HH. - OTROS','-','cliente',NULL,NULL,NULL,NULL,'10184','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(186,'Marcelo','Mayta - Otros','cliente',NULL,NULL,NULL,NULL,'10185','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(187,'Erick','Alacama - OTROS','cliente',NULL,NULL,NULL,NULL,'10186','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(188,'Diego','Tarqui - OTROS','cliente',NULL,NULL,NULL,NULL,'10187','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(189,'TECALIM - OTROS','-','cliente',NULL,NULL,NULL,NULL,'10188','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL),(190,'David','Bautista - OTROS','cliente',NULL,NULL,NULL,NULL,'10189','$2y$12$F7TpOgD.hd0RQstJDoftmun9KZjlgUtGN8j107Jfqf73bfHZGkNAu',NULL,NULL,NULL);
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

-- Dump completed on 2024-11-28  9:47:49
