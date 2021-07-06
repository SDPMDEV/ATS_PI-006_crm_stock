-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: alliancets_stock
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `sma_addresses`
--

DROP TABLE IF EXISTS `sma_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_addresses`
--

LOCK TABLES `sma_addresses` WRITE;
/*!40000 ALTER TABLE `sma_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_adjustment_items`
--

DROP TABLE IF EXISTS `sma_adjustment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_adjustment_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adjustment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `option_id` int DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_adjustment_items`
--

LOCK TABLES `sma_adjustment_items` WRITE;
/*!40000 ALTER TABLE `sma_adjustment_items` DISABLE KEYS */;
INSERT INTO `sma_adjustment_items` VALUES (1,1,6,NULL,50.0000,1,'15565656','addition'),(2,1,5,NULL,50.0000,1,'15565656','addition'),(3,1,2,NULL,50.0000,1,'15565656','addition'),(4,1,3,NULL,50.0000,1,'15565656','addition'),(5,1,4,NULL,50.0000,1,'15565656','addition'),(6,1,6,NULL,50.0000,1,'15565656','addition');
/*!40000 ALTER TABLE `sma_adjustment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_adjustments`
--

DROP TABLE IF EXISTS `sma_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_adjustments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_adjustments`
--

LOCK TABLES `sma_adjustments` WRITE;
/*!40000 ALTER TABLE `sma_adjustments` DISABLE KEYS */;
INSERT INTO `sma_adjustments` VALUES (1,'2021-07-02 19:08:00','35651515',1,'',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_api_keys`
--

DROP TABLE IF EXISTS `sma_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_api_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_api_keys`
--

LOCK TABLES `sma_api_keys` WRITE;
/*!40000 ALTER TABLE `sma_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_api_limits`
--

DROP TABLE IF EXISTS `sma_api_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_api_limits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int NOT NULL,
  `hour_started` int NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_api_limits`
--

LOCK TABLES `sma_api_limits` WRITE;
/*!40000 ALTER TABLE `sma_api_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_api_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_api_logs`
--

DROP TABLE IF EXISTS `sma_api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_api_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_api_logs`
--

LOCK TABLES `sma_api_logs` WRITE;
/*!40000 ALTER TABLE `sma_api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_attachments`
--

DROP TABLE IF EXISTS `sma_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `subject_type` varchar(55) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_attachments`
--

LOCK TABLES `sma_attachments` WRITE;
/*!40000 ALTER TABLE `sma_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_brands`
--

DROP TABLE IF EXISTS `sma_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_brands`
--

LOCK TABLES `sma_brands` WRITE;
/*!40000 ALTER TABLE `sma_brands` DISABLE KEYS */;
INSERT INTO `sma_brands` VALUES (1,'0001','STECK',NULL,'steck','STECK'),(2,'0002','Segurimax',NULL,'segurimax','Segurimax'),(3,'0003','Daisa',NULL,'daisa','Daisa'),(4,'0004','Tigre',NULL,'tigre','Tigre'),(5,'0005','Philips',NULL,'philips','Philips'),(6,'0006','HellermannTyton',NULL,'hellermanntyton','HellermannTyton');
/*!40000 ALTER TABLE `sma_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_calendar`
--

DROP TABLE IF EXISTS `sma_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_calendar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_calendar`
--

LOCK TABLES `sma_calendar` WRITE;
/*!40000 ALTER TABLE `sma_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_captcha`
--

DROP TABLE IF EXISTS `sma_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_captcha` (
  `captcha_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_captcha`
--

LOCK TABLES `sma_captcha` WRITE;
/*!40000 ALTER TABLE `sma_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_cart`
--

DROP TABLE IF EXISTS `sma_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_cart`
--

LOCK TABLES `sma_cart` WRITE;
/*!40000 ALTER TABLE `sma_cart` DISABLE KEYS */;
INSERT INTO `sma_cart` VALUES ('7aca1749ebc07d880b26f4aa7c188b29','1625513572',1,'{\"cart_total\":987.39,\"total_item_tax\":75.12,\"total_items\":7,\"total_unique_items\":3,\"ded7e0ab119435d35bfb47b6e0921b0c\":{\"id\":\"e7e27d78a5a7bcc0d2046bfbfcd0dbf3\",\"product_id\":\"2\",\"qty\":1,\"name\":\"Abajur Diamante Design Moderno\",\"slug\":\"89473709\",\"code\":\"89473709\",\"price\":95.45,\"tax\":\"0.00\",\"image\":\"d31bd7ffd01b6ebd5d15a8c4e3b3cdcf.png\",\"option\":false,\"options\":null,\"rowid\":\"ded7e0ab119435d35bfb47b6e0921b0c\",\"row_tax\":\"0.0000\",\"subtotal\":\"95.4500\"},\"c5817188dea5676c55cd83e50ef2800c\":{\"id\":\"3b94f732208d0b14dcb88503d4434c2d\",\"product_id\":\"3\",\"qty\":4,\"name\":\"Abajur De Ch&atilde;o Trip&eacute; De Madeira C&uacute;pula\",\"slug\":\"99026252\",\"code\":\"99026252\",\"price\":175.26,\"tax\":\"18.78\",\"image\":\"7c7c2280f8b2b81c9a0b68dbe610b0e2.png\",\"option\":false,\"options\":null,\"rowid\":\"c5817188dea5676c55cd83e50ef2800c\",\"row_tax\":\"75.1200\",\"subtotal\":\"701.0400\"},\"1f4d8617b1e91e754060b96416e6b039\":{\"id\":\"afed5178f64ab21d7ec1a3e8080a2fe0\",\"product_id\":\"2\",\"qty\":2,\"name\":\"Abajur Diamante Design Moderno\",\"slug\":\"89473709\",\"code\":\"89473709\",\"price\":95.45,\"tax\":\"0.00\",\"image\":\"d31bd7ffd01b6ebd5d15a8c4e3b3cdcf.png\",\"option\":false,\"options\":null,\"rowid\":\"1f4d8617b1e91e754060b96416e6b039\",\"row_tax\":\"0.0000\",\"subtotal\":\"190.9000\"}}'),('863bc33f7b62739dbe82c4eecc5cc1f6','1625255024',1,'{\"cart_total\":286.35,\"total_item_tax\":0,\"total_items\":3,\"total_unique_items\":1,\"6fedf9504d41ee7d96c00fa38d753d85\":{\"id\":\"5a32990353154754ed06897cf1cae0ff\",\"product_id\":\"2\",\"qty\":3,\"name\":\"Abajur Diamante Design Moderno\",\"slug\":\"89473709\",\"code\":\"89473709\",\"price\":95.45,\"tax\":\"0.00\",\"image\":\"d31bd7ffd01b6ebd5d15a8c4e3b3cdcf.png\",\"option\":false,\"options\":null,\"rowid\":\"6fedf9504d41ee7d96c00fa38d753d85\",\"row_tax\":\"0.0000\",\"subtotal\":\"286.3500\"}}');
/*!40000 ALTER TABLE `sma_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_categories`
--

DROP TABLE IF EXISTS `sma_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_categories`
--

LOCK TABLES `sma_categories` WRITE;
/*!40000 ALTER TABLE `sma_categories` DISABLE KEYS */;
INSERT INTO `sma_categories` VALUES (1,'QM','Quandro Medidor','3a24d66dda6b67f153aef4ccdf4fe95d.jpg',0,'quandro-medidor','Quadro Medidor'),(2,'QD','Quadro de Distribuição','9e47736396bcbcdbedd8de8ce4388cd5.jpg',0,'quadro-de-distribuicao','Quadro de Distribuição'),(3,'DJ','Disjuntores','14a7f5b922c2e0006c3e36da37cd1c6d.jpg',0,'disjuntores','Disjuntores'),(4,'DD','Dispositivos DR','39d488d2f29648ec3f5a07c9953ee023.jpg',0,'dispositivos-dr','Dispositivos DR'),(5,'FS','Fusíveis','41d7de98ea3bb441a0e69e07bf3fa263.jpg',0,'fusiveis','Fusíveis'),(6,'FC','Fios e Cabos','77c496fda93a2161460bbb1d4322ad9d.jpg',0,'fios-e-cabos','Fios e Cabos'),(7,'EL','Eletrodutos','ecc7a42801591bdd7d34588f1bfb9df3.jpg',0,'eletrodutos','Eletrodutos'),(8,'CL','Caixa de Luz','3128f07590659f2de5323727ea5507a0.jpg',0,'caixa-de-luz','Caixa de Luz'),(9,'CP','Caixa de Passagem','c38c71a74bb7ba7aaa3c5d390d940800.jpg',0,'caixa-de-passagem','Caixa de Passagem'),(10,'TD','Tomada','5dce2bf38fd62b63dbf4f794c08daa89.jpg',0,'tomada','Tomada'),(11,'IT','Interruptor','3f03a1f30a5991439384aed652ff159b.jpg',0,'interruptor','Interruptor'),(12,'LP','Lâmpada','cfd92b2bff9bb4af84714a70a66300f9.jpg',0,'lampada','Lâmpadas'),(13,'SQ','Soquete','bf5397e0bf89d7be04ba72a5417a44c9.jpg',12,'soquete','Soquetes'),(14,'SP','Spots','917830b1349c5f33fbf460a54e113db4.jpg',0,'spots','Spots'),(15,'PD','Pendentes','1c77a07a3082138ab0560556569cb27c.jpg',0,'pendentes','Pendentes'),(16,'AB','Abajur','324c75acc7d366ccbefc6437cee040da.jpg',0,'abajur','Abajures'),(17,'LT','Lustres','21d07b98d3f2f6abef965af6091e52d1.jpg',0,'lustres','Lustres');
/*!40000 ALTER TABLE `sma_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_combo_items`
--

DROP TABLE IF EXISTS `sma_combo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_combo_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_combo_items`
--

LOCK TABLES `sma_combo_items` WRITE;
/*!40000 ALTER TABLE `sma_combo_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_combo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_companies`
--

DROP TABLE IF EXISTS `sma_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_companies`
--

LOCK TABLES `sma_companies` WRITE;
/*!40000 ALTER TABLE `sma_companies` DISABLE KEYS */;
INSERT INTO `sma_companies` VALUES (1,3,'customer',1,'Geral','Cliente Padrão','Exata Materiais Elétricos','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','3491590597','cliente@exatame.com.br','','','','','','Google',NULL,0,'logo.png',0,NULL,1,'Padrão',''),(2,4,'supplier',NULL,NULL,'Cliente Padrão','Fornecedor Padrão Exata','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','3491590597','fornecedor@exatame.com.br','-','-','-','-','-','-',NULL,0,'logo.png',0,NULL,NULL,NULL,''),(3,NULL,'biller',NULL,NULL,'Aexandre José Ribeiro Silva','Exata Materiais Elétricos','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','(34) 9159-0597','contato@exatame.com.br','','','','','','','Obrigado por comprar na Exata Materiais Elétricos\r\nEm caso de qualquer dúvida, fique à vontade para nos contatar por e-mail em contato@exatame.com.br\r\n---------\r\nExata Materiais Elétricos\r\nCNPJ: 41.402.813/0001-95',0,'logotipo_300x80.png',0,NULL,NULL,NULL,''),(4,4,'supplier',NULL,NULL,'Cliente Padrão','Fornecedor Secundário Exata','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','3491590597','fornecedor2@exatame.com.br','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `sma_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_costing`
--

DROP TABLE IF EXISTS `sma_costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_costing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int DEFAULT NULL,
  `sale_item_id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `purchase_item_id` int DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_costing`
--

LOCK TABLES `sma_costing` WRITE;
/*!40000 ALTER TABLE `sma_costing` DISABLE KEYS */;
INSERT INTO `sma_costing` VALUES (1,'2021-07-02',3,1,1,4,1.0000,199.9900,223.9888,156.4800,175.2600,49.0000,1,0,NULL,NULL,NULL),(2,'2021-07-02',2,2,1,3,1.0000,109.9300,109.9300,95.4500,95.4500,49.0000,1,0,NULL,NULL,NULL),(3,'2021-07-02',4,3,1,5,1.0000,45.9800,51.4976,36.8700,41.2900,49.0000,1,0,NULL,NULL,NULL),(4,'2021-07-02',2,4,2,3,1.0000,109.9300,109.9300,95.4500,95.4500,48.0000,1,0,NULL,NULL,NULL),(5,'2021-07-02',5,5,2,2,1.0000,53.9000,53.9000,32.8900,32.8900,49.0000,1,0,NULL,NULL,NULL),(6,'2021-07-02',6,6,2,1,1.0000,19.6000,19.6000,12.6500,12.6500,99.0000,1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_costing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_currencies`
--

DROP TABLE IF EXISTS `sma_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_currencies`
--

LOCK TABLES `sma_currencies` WRITE;
/*!40000 ALTER TABLE `sma_currencies` DISABLE KEYS */;
INSERT INTO `sma_currencies` VALUES (1,'USD','US Dollar',1.0000,0,NULL),(2,'EUR','EURO',0.7340,0,NULL),(3,'BRL','REAL',1.0000,0,'R$');
/*!40000 ALTER TABLE `sma_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_customer_groups`
--

DROP TABLE IF EXISTS `sma_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_customer_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int NOT NULL,
  `discount` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_customer_groups`
--

LOCK TABLES `sma_customer_groups` WRITE;
/*!40000 ALTER TABLE `sma_customer_groups` DISABLE KEYS */;
INSERT INTO `sma_customer_groups` VALUES (1,'Geral',0,NULL),(2,'Revendedor',-5,NULL),(3,'Destribuidor',-15,NULL),(4,'Novo Cliente (+10)',10,NULL);
/*!40000 ALTER TABLE `sma_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_date_format`
--

DROP TABLE IF EXISTS `sma_date_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_date_format` (
  `id` int NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_date_format`
--

LOCK TABLES `sma_date_format` WRITE;
/*!40000 ALTER TABLE `sma_date_format` DISABLE KEYS */;
INSERT INTO `sma_date_format` VALUES (1,'mm-dd-yyyy','m-d-Y','%m-%d-%Y'),(2,'mm/dd/yyyy','m/d/Y','%m/%d/%Y'),(3,'mm.dd.yyyy','m.d.Y','%m.%d.%Y'),(4,'dd-mm-yyyy','d-m-Y','%d-%m-%Y'),(5,'dd/mm/yyyy','d/m/Y','%d/%m/%Y'),(6,'dd.mm.yyyy','d.m.Y','%d.%m.%Y');
/*!40000 ALTER TABLE `sma_date_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_deliveries`
--

DROP TABLE IF EXISTS `sma_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_deliveries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_deliveries`
--

LOCK TABLES `sma_deliveries` WRITE;
/*!40000 ALTER TABLE `sma_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_deposits`
--

DROP TABLE IF EXISTS `sma_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_deposits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_deposits`
--

LOCK TABLES `sma_deposits` WRITE;
/*!40000 ALTER TABLE `sma_deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_expense_categories`
--

DROP TABLE IF EXISTS `sma_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_expense_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_expense_categories`
--

LOCK TABLES `sma_expense_categories` WRITE;
/*!40000 ALTER TABLE `sma_expense_categories` DISABLE KEYS */;
INSERT INTO `sma_expense_categories` VALUES (1,'DP001','Energia'),(2,'DP002','Água'),(3,'DP003','Aluguel'),(4,'DP004','Internet'),(5,'DP005','Brindes'),(6,'DP006','Telefone'),(7,'DP007','Salários'),(8,'DP008','Promoções');
/*!40000 ALTER TABLE `sma_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_expenses`
--

DROP TABLE IF EXISTS `sma_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_expenses`
--

LOCK TABLES `sma_expenses` WRITE;
/*!40000 ALTER TABLE `sma_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_gift_card_topups`
--

DROP TABLE IF EXISTS `sma_gift_card_topups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_gift_card_topups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `card_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_gift_card_topups`
--

LOCK TABLES `sma_gift_card_topups` WRITE;
/*!40000 ALTER TABLE `sma_gift_card_topups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_gift_card_topups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_gift_cards`
--

DROP TABLE IF EXISTS `sma_gift_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_gift_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_gift_cards`
--

LOCK TABLES `sma_gift_cards` WRITE;
/*!40000 ALTER TABLE `sma_gift_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_gift_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_groups`
--

DROP TABLE IF EXISTS `sma_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_groups` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_groups`
--

LOCK TABLES `sma_groups` WRITE;
/*!40000 ALTER TABLE `sma_groups` DISABLE KEYS */;
INSERT INTO `sma_groups` VALUES (1,'owner','Owner'),(2,'admin','Administrator'),(3,'customer','Customer'),(4,'supplier','Supplier'),(5,'vendas','Grupo de Vendedores');
/*!40000 ALTER TABLE `sma_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_login_attempts`
--

DROP TABLE IF EXISTS `sma_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_login_attempts` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_login_attempts`
--

LOCK TABLES `sma_login_attempts` WRITE;
/*!40000 ALTER TABLE `sma_login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_logs`
--

DROP TABLE IF EXISTS `sma_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detail` varchar(190) NOT NULL,
  `model` longtext,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_logs`
--

LOCK TABLES `sma_logs` WRITE;
/*!40000 ALTER TABLE `sma_logs` DISABLE KEYS */;
INSERT INTO `sma_logs` VALUES (1,'Product is being deleted by alliancets (User Id: 1)','{\"model\":{\"id\":\"1\",\"code\":\"54892235\",\"name\":\"Teste\",\"unit\":null,\"cost\":null,\"price\":\"25.8500\",\"alert_quantity\":\"0.0000\",\"image\":\"no_image.png\",\"category_id\":\"16\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":\"1\",\"track_quantity\":\"0\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":\"\",\"product_details\":\"\",\"tax_method\":\"1\",\"type\":\"service\",\"supplier1\":\"0\",\"supplier1price\":null,\"supplier2\":null,\"supplier2price\":null,\"supplier3\":null,\"supplier3price\":null,\"supplier4\":null,\"supplier4price\":null,\"supplier5\":null,\"supplier5price\":null,\"promotion\":null,\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":null,\"supplier3_part_no\":null,\"supplier4_part_no\":null,\"supplier5_part_no\":null,\"sale_unit\":\"0\",\"purchase_unit\":\"0\",\"brand\":\"0\",\"slug\":\"54892235\",\"featured\":null,\"weight\":\"0.0000\",\"hsn_code\":null,\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}','2021-07-02 18:29:32');
/*!40000 ALTER TABLE `sma_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_migrations`
--

DROP TABLE IF EXISTS `sma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_migrations`
--

LOCK TABLES `sma_migrations` WRITE;
/*!40000 ALTER TABLE `sma_migrations` DISABLE KEYS */;
INSERT INTO `sma_migrations` VALUES (315);
/*!40000 ALTER TABLE `sma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_notifications`
--

DROP TABLE IF EXISTS `sma_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_notifications`
--

LOCK TABLES `sma_notifications` WRITE;
/*!40000 ALTER TABLE `sma_notifications` DISABLE KEYS */;
INSERT INTO `sma_notifications` VALUES (1,'<p>Thank you for purchasing Stock Manager Advance. Please do not forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>','2014-08-15 09:00:57','2015-01-01 00:00:00','2017-01-01 00:00:00',3);
/*!40000 ALTER TABLE `sma_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_order_ref`
--

DROP TABLE IF EXISTS `sma_order_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_order_ref` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int NOT NULL DEFAULT '1',
  `qu` int NOT NULL DEFAULT '1',
  `po` int NOT NULL DEFAULT '1',
  `to` int NOT NULL DEFAULT '1',
  `pos` int NOT NULL DEFAULT '1',
  `do` int NOT NULL DEFAULT '1',
  `pay` int NOT NULL DEFAULT '1',
  `re` int NOT NULL DEFAULT '1',
  `rep` int NOT NULL DEFAULT '1',
  `ex` int NOT NULL DEFAULT '1',
  `ppay` int NOT NULL DEFAULT '1',
  `qa` int DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_order_ref`
--

LOCK TABLES `sma_order_ref` WRITE;
/*!40000 ALTER TABLE `sma_order_ref` DISABLE KEYS */;
INSERT INTO `sma_order_ref` VALUES (1,'2015-03-01',1,1,1,1,2,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `sma_order_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pages`
--

DROP TABLE IF EXISTS `sma_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_pages`
--

LOCK TABLES `sma_pages` WRITE;
/*!40000 ALTER TABLE `sma_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_payments`
--

DROP TABLE IF EXISTS `sma_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int DEFAULT NULL,
  `return_id` int DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_payments`
--

LOCK TABLES `sma_payments` WRITE;
/*!40000 ALTER TABLE `sma_payments` DISABLE KEYS */;
INSERT INTO `sma_payments` VALUES (1,'2021-07-02 21:25:00',2,NULL,NULL,'2659594',NULL,'cash','','','','','','Visa',157.9100,NULL,1,NULL,'received','<p>Valor Pago à vista</p>',0.0000,0.0000,NULL),(2,'2021-07-02 21:32:00',2,NULL,NULL,'2165623',NULL,'cash','','','','','','Visa',120.0000,NULL,1,NULL,'received','Pagamento Restante',0.0000,0.0000,NULL);
/*!40000 ALTER TABLE `sma_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_paypal`
--

DROP TABLE IF EXISTS `sma_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_paypal` (
  `id` int NOT NULL,
  `active` tinyint NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_paypal`
--

LOCK TABLES `sma_paypal` WRITE;
/*!40000 ALTER TABLE `sma_paypal` DISABLE KEYS */;
INSERT INTO `sma_paypal` VALUES (1,1,'mypaypal@paypal.com','USD',0.0000,0.0000,0.0000);
/*!40000 ALTER TABLE `sma_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_permissions`
--

DROP TABLE IF EXISTS `sma_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_permissions`
--

LOCK TABLES `sma_permissions` WRITE;
/*!40000 ALTER TABLE `sma_permissions` DISABLE KEYS */;
INSERT INTO `sma_permissions` VALUES (1,5,1,0,0,0,0,0,1,1,1,1,1,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pos_register`
--

DROP TABLE IF EXISTS `sma_pos_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_pos_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int DEFAULT NULL,
  `total_cc_slips` int DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int DEFAULT NULL,
  `total_cc_slips_submitted` int DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_pos_register`
--

LOCK TABLES `sma_pos_register` WRITE;
/*!40000 ALTER TABLE `sma_pos_register` DISABLE KEYS */;
INSERT INTO `sma_pos_register` VALUES (1,'2021-07-02 15:59:25',1,3000.0000,'open',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_pos_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pos_settings`
--

DROP TABLE IF EXISTS `sma_pos_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_pos_settings` (
  `pos_id` int NOT NULL,
  `cat_limit` int NOT NULL,
  `pro_limit` int NOT NULL,
  `default_category` int NOT NULL,
  `default_customer` int NOT NULL,
  `default_biller` int NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.47',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_pos_settings`
--

LOCK TABLES `sma_pos_settings` WRITE;
/*!40000 ALTER TABLE `sma_pos_settings` DISABLE KEYS */;
INSERT INTO `sma_pos_settings` VALUES (1,22,20,1,1,3,'1','Exata Materiais Elétricos','CNPJ','Tel: (34) 3824-9159','41.402.813/0001-95',NULL,'x1C','Ctrl+F3','Ctrl+Shift+M','Ctrl+Shift+C','Ctrl+Shift+A','Ctrl+F11','Ctrl+F12','F4','F7','F9','F8','Ctrl+F1','Ctrl+F2','Ctrl+F10',1,NULL,0,'default',1,0,0,0,42,NULL,'purchase_code','envato_username','3.4.47',0,0,0,'',1,NULL,'null',0,1,1);
/*!40000 ALTER TABLE `sma_pos_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_price_groups`
--

DROP TABLE IF EXISTS `sma_price_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_price_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_price_groups`
--

LOCK TABLES `sma_price_groups` WRITE;
/*!40000 ALTER TABLE `sma_price_groups` DISABLE KEYS */;
INSERT INTO `sma_price_groups` VALUES (1,'Padrão');
/*!40000 ALTER TABLE `sma_price_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_printers`
--

DROP TABLE IF EXISTS `sma_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_printers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_printers`
--

LOCK TABLES `sma_printers` WRITE;
/*!40000 ALTER TABLE `sma_printers` DISABLE KEYS */;
INSERT INTO `sma_printers` VALUES (1,'Impressora Padrão','network','default',255,'',_binary '187.120.124.69','9100');
/*!40000 ALTER TABLE `sma_printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_product_photos`
--

DROP TABLE IF EXISTS `sma_product_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_product_photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_product_photos`
--

LOCK TABLES `sma_product_photos` WRITE;
/*!40000 ALTER TABLE `sma_product_photos` DISABLE KEYS */;
INSERT INTO `sma_product_photos` VALUES (1,2,'320210279ca623723c62a16b91be732b.png'),(2,2,'ee90118d6ce4c339d19230996abe1f75.png'),(3,2,'56b8e999a7abf0a3628c4255cfacc98e.png'),(4,2,'ff1d2e7b03037258c296bdbb281dcad9.png'),(5,3,'c242d3871bf1e15efc6c7b7202d8e220.png'),(6,3,'e0d5de7eafa0a9753bd7f0925bfe2821.png'),(7,3,'dbb016dc1d3567024e4bfab81304c3f2.png'),(8,3,'45de453581dc7d18e80a0f6a08786e1f.png'),(9,3,'01be02c5646ce606a9ae53ddceda6881.png'),(10,4,'ba9b23364e36825ebe025cca3fa47965.png'),(11,4,'5cedb17d5b8a7180b4cfa30e6e57cc6a.png'),(12,5,'115a30de8012c08cc581ab06ef07f9c6.png'),(13,5,'6873669dd25c3396f2d2ddddba134166.png'),(14,5,'35e172e89919a4c3b0ee530558395483.png'),(15,6,'d21c59cf977b3126e1d75cd15fae8204.png'),(16,6,'f94c58d4383938d117d37feac8cef8eb.png'),(17,6,'bf4684393d2a1cfb8adc98d0b418be2f.png'),(18,7,'7c0a3dc1ff36229ecd313ba3361cf0f2.png');
/*!40000 ALTER TABLE `sma_product_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_product_prices`
--

DROP TABLE IF EXISTS `sma_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_product_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `price_group_id` int NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_product_prices`
--

LOCK TABLES `sma_product_prices` WRITE;
/*!40000 ALTER TABLE `sma_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_product_variants`
--

DROP TABLE IF EXISTS `sma_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_product_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_id_name` (`product_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_product_variants`
--

LOCK TABLES `sma_product_variants` WRITE;
/*!40000 ALTER TABLE `sma_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_products`
--

DROP TABLE IF EXISTS `sma_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int NOT NULL,
  `subcategory_id` int DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int DEFAULT NULL,
  `purchase_unit` int DEFAULT NULL,
  `brand` int DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_products`
--

LOCK TABLES `sma_products` WRITE;
/*!40000 ALTER TABLE `sma_products` DISABLE KEYS */;
INSERT INTO `sma_products` VALUES (2,'89473709','Abajur Diamante Design Moderno',1,109.9300,95.4500,2.0000,'d31bd7ffd01b6ebd5d15a8c4e3b3cdcf.png',16,NULL,'','','','','','',48.0000,1,1,'<p>ANUNCIO REFERE_SE A 1 ABAJUR , FOTO ILUSTRATIVA , DAS CORES QUE TEMOS DISPONÌVEIS</p>',NULL,'code128','','<p>Abajur Diamante</p><p>COR COBRE<br>SOQUETE E27 lãmpada comum<br>Base 23 x 20<br>Cupula 30x30 x20<br>Altura total com cúpula 40 cm<br>Cabo com interruptor liga/desliga<br>Fio 1 m</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'89473709',1,2.0000,NULL,0,0,'',0),(3,'99026252','Abajur De Chão Tripé De Madeira Cúpula',1,199.9900,156.4800,2.0000,'7c7c2280f8b2b81c9a0b68dbe610b0e2.png',16,NULL,'','','','','','',49.0000,3,1,'<p>Marca E-led Modelo Abajur Tripé de Chão</p><p>Largura total 44 cm </p><p>Diâmetro total 44 cm </p><p>Altura total 150 cm</p>',NULL,'code128','','<p>Abajur Tripé de Madeira Super Moderno<br><br>- Tendência em decoração e iluminação<br>- Madeira<br>- Cupula de Tecido<br>- Soquete E27<br>- Facil montagem<br>- Botão liga/desliga no fio da luminária localizada próxima da cúpula<br>- Dimensões completas nas imagens</p><p>- Necessário montagem.</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0,0,0,'99026252',NULL,2.0000,NULL,0,0,'',0),(4,'10405075','Abajur Mesa Escritorio Quarto Moderno Madeira E27',1,45.9800,36.8700,2.0000,'c50744138cb533aba809c7a1a50fb967.png',16,NULL,'','','','','','',49.0000,3,1,'<p>Medidas: Largura: 20 cm / Altura: 35 cm</p><p>Materiais: Madeira MDF / Plastico<br>Alimentação: Bivolt 110v / 220v<br>Potência: 100 W<br>Ambientes: Quarto, sala<br>Capacidade de lâmpadas: 1<br>Tipos de fontes de luz: Soquete E27<br>Tipo de soquete: E27</p>',NULL,'code128','','<p>Para dar aquela inovada na decoração é preciso muita criatividade e bom gosto e isso vem sempre aliada a um lindo abajur de mesa. Pensando nisso, desenvolvemos e criamos este modelo lindo e exclusivo modelo. Ela é feita com material de primeira qualidade, e seu recorte é todo feito a laser, para se adaptar a qualquer ambiente, seja ele interno ou externo.</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'10405075',NULL,2.0000,NULL,0,0,'',0),(5,'09061639','Caixa De Luz De Parede Tramontina 4x2',1,53.9000,32.8900,2.0000,'28daf29d4c82aab93c6e2476a703210d.png',8,NULL,'','','','','','',49.0000,1,1,'<p>Aplicação:</p><p>- Fixação de tomadas<br>- Fixação de interruptores<br>- Fixação de tomadas para telefonia<br>- Fixação de tomadas para Tv<br>- Serve como caixa de passagem para fios</p>',NULL,'code128','','<p>Aplicação:<br>- Fixação de tomadas<br>- Fixação de interruptores<br>- Fixação de tomadas para telefonia<br>- Fixação de tomadas para Tv<br>- Serve como caixa de passagem para fios</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'09061639',NULL,0.2500,NULL,0,0,'',0),(6,'01739757','Caixa De Passagem 102x102x55 Km03186 = Steck Ssx111 Cftv',1,19.6000,12.6500,2.0000,'974b226a9402bd449a0ac6a88c18aa31.png',9,NULL,'','','','','','',99.0000,1,1,'<p>Linha KM Caixa de Passagem Elétrica 102 para Sobrepor</p><p>Com design moderno, a Caixa de Passagem Elétrica 102 da Kraus-Muller segue a norma NBR desenvolvida para instalação em sobrepor, sendo indicada para montagem de equipamentos elétricos, passagem e comando.<br><br>A fixação da tampa da Caixa 102 é feita por meio de parafusos plásticos, agilizando a montagem. Além disso, temos caixas com tampas opacas ou transparentes. Existe também há opção para fixação de trilho DIN e placa de montagem.</p>',NULL,'code128','','<p>Matérias Primas: Material Termoplástico auto-extinguível;</p><p>Norma: Conforme Norma NBR IEC60670-1;<br>Grau de Proteção: IP 65;<br>Proteção Mecânica: IP XX7;<br>Temperatura de Operação: -5ºC à 60ºC e 70ºC para curto período de tempo;<br>Proteção U.V: Até 5 anos (Sob consulta).<br>Características:<br>Possuem marcação (exclusiva e patenteada);<br>Indicador do Sentido do giro do Parafuso;<br>Parafuso de ¼’’ de volta sem elementos metálicos;<br>Caixa de Passagem 102x102x57 Cega Tampa Opaca ou Transpartente.<br>Para garantir uma instalação com qualidade e segurança conte com a Linha Kraus-Muller!</p>',1,'standard',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'01739757',NULL,0.2900,NULL,0,0,'',0),(7,'19580826','Disjuntor Bipolar Duplo 10a, 16a,20a, 25a, 32a,40a, 50a, 63a',1,29.2800,12.4700,2.0000,'d87e991450a95860f6d85f06d889f991.png',3,NULL,'','','','','','',0.0000,1,1,'<p>1- PEÇA DISJUNTOR ELITECK/JNG - BIPOLAR</p><p>( ESCOLHER A AMPERAGEM ANTES 10A / 16A / 20A / 25A / 32A / 40A / 50A / 63A)</p>',NULL,'code128','','<p>Correntes Nominais (In): Corrente Alternada de 6A, 10A, 16A, 20A, 25A, 32A, 40A, 50A e 63A</p><p>Tensões Nominais (Un): 230Vca (1P), 400Vca (2P e 3P)<br>Numero de Pólos: 1P, 2P e 3P<br>Curva: C<br>Cap. Inter. Nom. (Ics=Icn): 4,5kA / 6kA (Ver Data Sheet)<br>Montagem: Trilho Din 35mm</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'19580826',NULL,0.5800,NULL,0,0,'',0);
/*!40000 ALTER TABLE `sma_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_promos`
--

DROP TABLE IF EXISTS `sma_promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_promos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product2buy` int NOT NULL,
  `product2get` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_promos`
--

LOCK TABLES `sma_promos` WRITE;
/*!40000 ALTER TABLE `sma_promos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_purchase_items`
--

DROP TABLE IF EXISTS `sma_purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_purchase_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_id` int DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_purchase_items`
--

LOCK TABLES `sma_purchase_items` WRITE;
/*!40000 ALTER TABLE `sma_purchase_items` DISABLE KEYS */;
INSERT INTO `sma_purchase_items` VALUES (1,NULL,NULL,6,'01739757','Caixa De Passagem 102x102x55 Km03186 = Steck Ssx111 Cftv',NULL,19.6000,50.0000,1,0.0000,1,'0',NULL,NULL,NULL,980.0000,99.0000,'2021-07-02','received',19.6000,19.6000,50.0000,NULL,NULL,1,'KG',50.0000,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,5,'09061639','Caixa De Luz De Parede Tramontina 4x2',NULL,53.9000,50.0000,1,0.0000,1,'0',NULL,NULL,NULL,2695.0000,49.0000,'2021-07-02','received',53.9000,53.9000,50.0000,NULL,NULL,1,'KG',50.0000,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,2,'89473709','Abajur Diamante Design Moderno',NULL,109.9300,50.0000,1,0.0000,1,'0',NULL,NULL,NULL,5496.5000,48.0000,'2021-07-02','received',109.9300,109.9300,50.0000,NULL,NULL,1,'KG',50.0000,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,3,'99026252','Abajur De Chão Tripé De Madeira Cúpula',NULL,199.9900,50.0000,1,23.9988,3,'12%',NULL,NULL,NULL,11199.4400,49.0000,'2021-07-02','received',223.9888,199.9900,50.0000,NULL,NULL,1,'KG',50.0000,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,4,'10405075','Abajur Mesa Escritorio Quarto Moderno Madeira E27',NULL,45.9800,50.0000,1,5.5176,3,'12%',NULL,NULL,NULL,2574.8800,49.0000,'2021-07-02','received',51.4976,45.9800,50.0000,NULL,NULL,1,'KG',50.0000,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_purchases`
--

DROP TABLE IF EXISTS `sma_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_purchases`
--

LOCK TABLES `sma_purchases` WRITE;
/*!40000 ALTER TABLE `sma_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_quote_items`
--

DROP TABLE IF EXISTS `sma_quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_quote_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quote_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_quote_items`
--

LOCK TABLES `sma_quote_items` WRITE;
/*!40000 ALTER TABLE `sma_quote_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_quote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_quotes`
--

DROP TABLE IF EXISTS `sma_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_quotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `biller_id` int NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_quotes`
--

LOCK TABLES `sma_quotes` WRITE;
/*!40000 ALTER TABLE `sma_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_return_items`
--

DROP TABLE IF EXISTS `sma_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_return_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `return_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_id` (`return_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`return_id`),
  KEY `return_id_2` (`return_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_return_items`
--

LOCK TABLES `sma_return_items` WRITE;
/*!40000 ALTER TABLE `sma_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_returns`
--

DROP TABLE IF EXISTS `sma_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_returns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_returns`
--

LOCK TABLES `sma_returns` WRITE;
/*!40000 ALTER TABLE `sma_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sale_items`
--

DROP TABLE IF EXISTS `sma_sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sale_items`
--

LOCK TABLES `sma_sale_items` WRITE;
/*!40000 ALTER TABLE `sma_sale_items` DISABLE KEYS */;
INSERT INTO `sma_sale_items` VALUES (1,1,3,'99026252','Abajur De Chão Tripé De Madeira Cúpula','standard',NULL,156.4800,175.2600,1.0000,1,18.7800,3,'12%','0',0.0000,175.2600,'',156.4800,NULL,1,'KG',1.0000,'',NULL,NULL,NULL,NULL),(2,1,2,'89473709','Abajur Diamante Design Moderno','standard',NULL,95.4500,95.4500,1.0000,1,0.0000,1,'0','0',0.0000,95.4500,'',95.4500,NULL,1,'KG',1.0000,'',NULL,NULL,NULL,NULL),(3,1,4,'10405075','Abajur Mesa Escritorio Quarto Moderno Madeira E27','standard',NULL,36.8700,41.2900,1.0000,1,4.4200,3,'12%','0',0.0000,41.2900,'',36.8700,NULL,1,'KG',1.0000,'',NULL,NULL,NULL,NULL),(4,2,2,'89473709','Abajur Diamante Design Moderno','standard',NULL,95.4500,95.4500,1.0000,1,0.0000,1,'0','0',0.0000,95.4500,'2956155',95.4500,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL),(5,2,5,'09061639','Caixa De Luz De Parede Tramontina 4x2','standard',NULL,32.8900,32.8900,1.0000,1,0.0000,1,'0','0',0.0000,32.8900,'6595623',32.8900,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL),(6,2,6,'01739757','Caixa De Passagem 102x102x55 Km03186 = Steck Ssx111 Cftv','standard',NULL,12.6500,12.6500,1.0000,1,0.0000,1,'0','0',0.0000,12.6500,'2659126',12.6500,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sales`
--

DROP TABLE IF EXISTS `sma_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int DEFAULT NULL,
  `reserve_id` int DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sales`
--

LOCK TABLES `sma_sales` WRITE;
/*!40000 ALTER TABLE `sma_sales` DISABLE KEYS */;
INSERT INTO `sma_sales` VALUES (1,'2021-07-02 19:25:35','VEN/POS2021/07/0001',1,'Exata Materiais Elétricos',3,'Exata Materiais Elétricos',1,'','',288.8000,0.0000,'',0.0000,0.0000,23.2000,3,37.4400,60.6400,0.0000,349.4400,'completed','due',0,NULL,1,NULL,NULL,3,1,0.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,0.0000,NULL,0,0,NULL,NULL,'ed6dfb8926a441ceea1a8533aa74be30670b3ecac5dce6c839721861b66004f7',NULL,NULL,NULL,NULL,NULL),(2,'2021-07-02 21:25:00','2165623',1,'Exata Materiais Elétricos',3,'Exata Materiais Elétricos',1,'&lt;p&gt;Nota da Venda&lt;&sol;p&gt;','&lt;p&gt;Nota do Admin&lt;&sol;p&gt;',140.9900,0.0000,'',0.0000,0.0000,0.0000,3,16.9188,16.9188,120.0000,277.9100,'completed','paid',15,'2021-07-17',1,NULL,NULL,3,0,277.9100,NULL,0.0000,'0',NULL,NULL,0.0000,NULL,NULL,0,0,NULL,NULL,'57fc68d4f906bb6d5ee4d6cacc21867f454bde0ed05791ee11e68c4a14b18598',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sessions`
--

DROP TABLE IF EXISTS `sma_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sessions`
--

LOCK TABLES `sma_sessions` WRITE;
/*!40000 ALTER TABLE `sma_sessions` DISABLE KEYS */;
INSERT INTO `sma_sessions` VALUES ('1j7gbdidaj5phhodauekb7rla76rfuds','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625245676,_binary '__ci_last_regenerate|i:1625245676;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('1o7dktjba2trg3kcoh82f2dssucfpsjg','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625247159,_binary '__ci_last_regenerate|i:1625247159;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('1vij74dnpj041e7jr1437ev1pk5e6hva','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625246856,_binary '__ci_last_regenerate|i:1625246856;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246816;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('1vj2fvoe6qfu147affej417k4vbuqjas','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625251131,_binary '__ci_last_regenerate|i:1625251131;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('3pus6ar18vmcjh5kfbme082jcbvg16rl','2804:7f2:298d:9518:fd08:1db2:2b02:aa60',1625527652,_binary '__ci_last_regenerate|i:1625527651;requested_page|s:18:\"admin/sales/view/2\";'),('5kojkchhasavnif48urtoi5c34u7khvf','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625241454,_binary '__ci_last_regenerate|i:1625241454;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;csrfkey|s:8:\"nkXBQlIJ\";__ci_vars|a:2:{s:7:\"csrfkey\";s:3:\"new\";s:9:\"csrfvalue\";s:3:\"new\";}csrfvalue|s:20:\"XdJ5IcZ61quESQW3zngw\";'),('5ov0gtuh4oas8o2qnu5t5dmvqh5fun2a','2804:7f2:298d:9518:a850:746:13b9:d630',1625509926,_binary '__ci_last_regenerate|i:1625509926;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('6bcd7bjfbtkrf3t9duuajkrja7qvd34s','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625251561,_binary '__ci_last_regenerate|i:1625251561;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('6l58veqmbu4q3f1g8fphedr8cja9m4hc','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249243,_binary '__ci_last_regenerate|i:1625249243;'),('75bvbcd3f5av803vo4avfucq61ue4nii','2804:7f2:298d:9518:a850:746:13b9:d630',1625509474,_binary '__ci_last_regenerate|i:1625509474;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('77er7fknpisf52naiom4han3mhverg88','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625240721,_binary '__ci_last_regenerate|i:1625240721;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('7viesm4gvepet5o5vq2otjaj2ir63khm','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625254752,_binary '__ci_last_regenerate|i:1625254752;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('8ejk9bhq9inrd26kcl4df5hfttv27rmv','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625253319,_binary '__ci_last_regenerate|i:1625253319;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625253168;'),('8fnq0biep49fggqffsqd5koo8i7u7ofv','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625250340,_binary '__ci_last_regenerate|i:1625250340;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('9n941nbd2qrol82ovcaiouv1cmjira6c','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625250644,_binary '__ci_last_regenerate|i:1625250644;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('9tsrofdjsbqvbb0l564in97ng6c0rtj3','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625240115,_binary '__ci_last_regenerate|i:1625240115;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;message|s:32:\"Categoria adicionada com sucesso\";__ci_vars|a:1:{s:7:\"message\";s:3:\"new\";}'),('ad3v425ssfhallvqjv1jm0etdcv0q6pj','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625255084,_binary '__ci_last_regenerate|i:1625254990;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"cart/checkout\";'),('adkm2q43i7ke5qvu2skivtc87qjn80k7','2804:7f2:298d:9518:a850:746:13b9:d630',1625502110,_binary '__ci_last_regenerate|i:1625502110;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('deh039e183nag4i6c0tecmbnmn33c77l','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625248781,_binary '__ci_last_regenerate|i:1625248781;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('dgdkqjbbsu68h0u6ef22og8oll7594lo','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625252750,_binary '__ci_last_regenerate|i:1625252750;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('eeauu6bggq1gp8a7j12igscc7jdkjoff','10.10.10.31',1625513531,_binary '__ci_last_regenerate|i:1625513531;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('eenv42uegliuffhvd1d5ngmbbbv60gee','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625245352,_binary '__ci_last_regenerate|i:1625245352;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('fhlsda81k4gve4eg8kdopg6kl740k204','2804:7f2:298d:9518:a850:746:13b9:d630',1625510675,_binary '__ci_last_regenerate|i:1625510675;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('fsl0da08j74coaeuc1v62rkvokjbta2d','10.10.10.31',1625508987,_binary '__ci_last_regenerate|i:1625508987;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('h87is17188ln5hmie970gk9akf76fsdk','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625239814,_binary '__ci_last_regenerate|i:1625239814;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('h9rnoejp575eii2i2ui1fjvmq4mp477o','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625261591,_binary '__ci_last_regenerate|i:1625261589;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625253140\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('hnklpho7fhnj5anurmltttfkpu2n5svh','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625245049,_binary '__ci_last_regenerate|i:1625245049;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625243954;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('hur1f7e75a5j0ddpu3lup6tv3t99g7vm','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249229,_binary '__ci_last_regenerate|i:1625249229;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('iejjcl12h83bmhkjfgshchc985ou77f6','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625252281,_binary '__ci_last_regenerate|i:1625252281;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('iuu3al121j27mlfba7015uqnr6anjqt3','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625241109,_binary '__ci_last_regenerate|i:1625241109;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('ja8okrc34pl8qulgc3ie4l9knaaal8q3','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625243755,_binary '__ci_last_regenerate|i:1625243755;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625238392\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625241608;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('k59ruu5qf4r3fts9h4i7spolht27oj2p','10.10.10.31',1625257515,_binary '__ci_last_regenerate|i:1625257448;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625257511;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('k7hqf9guu35bfpf11j1ogqnps0u5hqrm','2804:7f2:298d:9518:a850:746:13b9:d630',1625510260,_binary '__ci_last_regenerate|i:1625510260;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('kcl7b6rlhtanjka4jop8tde9mhvfmjt9','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625240420,_binary '__ci_last_regenerate|i:1625240420;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('l43386m2rjg0hdrso88l1qremijnfes5','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625246023,_binary '__ci_last_regenerate|i:1625246023;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('leimc6e7jgh1n1st0iqih0mlceqejq2m','10.10.10.31',1625513833,_binary '__ci_last_regenerate|i:1625513832;requested_page|s:13:\"cart/checkout\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('li9hgne8ok9hqe0hfno9ahsp0hpkk0s1','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625257448,_binary '__ci_last_regenerate|i:1625257448;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('m0mc6cnithaf2c59n4bgd6mjhl8p36km','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625252926,_binary '__ci_last_regenerate|i:1625252750;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('me1j7br6a43odmuod7hks03mu9qksri4','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625253742,_binary '__ci_last_regenerate|i:1625253742;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625253168;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";'),('mmdeivjs5rrt5ac9m9t9lijn1bqtdtkd','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249532,_binary '__ci_last_regenerate|i:1625249532;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('mu9qhajjr2n1vnmh9bctkbcprda5o4af','2804:7f2:298d:9518:a850:746:13b9:d630',1625511512,_binary '__ci_last_regenerate|i:1625511512;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('mvdq31f14pi5qkv3o1vi843d4u0dhlf8','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625254073,_binary '__ci_last_regenerate|i:1625254073;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('nmhs6qilak78hl40ampe7b6to0n2c9ir','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625244746,_binary '__ci_last_regenerate|i:1625244746;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625243954;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('nq0tu0pc3b7bm75ql0v11ouvh0i0kpei','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625250021,_binary '__ci_last_regenerate|i:1625250021;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('okk2v2dh4qr5fq7g8i134pvv0g6oh2rf','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625261589,_binary '__ci_last_regenerate|i:1625261589;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625253140\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('qnltgcs4h1tp4eh9mfliu6p1mm8agj9o','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625254990,_binary '__ci_last_regenerate|i:1625254990;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('qripsm9d6b5d4aiv8n5aq372i5ve52qp','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249412,_binary '__ci_last_regenerate|i:1625249243;'),('sthf8rdgb8ntknimqmpu22l6cld0p8hh','10.10.10.31',1625498371,_binary '__ci_last_regenerate|i:1625498371;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('te6brtcmves216pifkpkl5905b10flsf','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625247639,_binary '__ci_last_regenerate|i:1625247639;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('tt1tssbd7kf18nbtrk2hsnunge2du95a','10.10.10.31',1625513832,_binary '__ci_last_regenerate|i:1625513832;requested_page|s:4:\"cart\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('umevagku72vcq5etd1jksokuv35bvmv6','2804:7f2:298d:9518:a850:746:13b9:d630',1625511172,_binary '__ci_last_regenerate|i:1625511172;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vdmj8gpfopjfruo5ma8r4h6p3iqemufc','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625246549,_binary '__ci_last_regenerate|i:1625246549;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";');
/*!40000 ALTER TABLE `sma_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_settings`
--

DROP TABLE IF EXISTS `sma_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_settings` (
  `setting_id` int NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int NOT NULL,
  `accounting_method` tinyint NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int NOT NULL,
  `rows_per_page` int NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int NOT NULL DEFAULT '0',
  `dateformat` int NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint NOT NULL,
  `default_discount` int NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint NOT NULL,
  `tax1` tinyint NOT NULL,
  `tax2` tinyint NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int NOT NULL DEFAULT '0',
  `iheight` int NOT NULL,
  `twidth` int NOT NULL,
  `theight` int NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint NOT NULL DEFAULT '2',
  `qty_decimals` tinyint NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint DEFAULT NULL,
  `flag_chars` tinyint DEFAULT NULL,
  `item_code_start` tinyint DEFAULT NULL,
  `item_code_chars` tinyint DEFAULT NULL,
  `price_start` tinyint DEFAULT NULL,
  `price_chars` tinyint DEFAULT NULL,
  `price_divide_by` int DEFAULT NULL,
  `weight_start` tinyint DEFAULT NULL,
  `weight_chars` tinyint DEFAULT NULL,
  `weight_divide_by` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_settings`
--

LOCK TABLES `sma_settings` WRITE;
/*!40000 ALTER TABLE `sma_settings` DISABLE KEYS */;
INSERT INTO `sma_settings` VALUES (1,'logotipo_300x80.png','logotipo_300x801.png','Exata Materiais Elétricos','portuguese-brazilian',1,0,'BRL',1,10,'3.4.47',1,5,'VEN','COT','PC','TR','ENT','RPAG','DEV','DEVC','',0,'default',1,1,1,1,1,1,0,1,0,'America/Sao_Paulo',800,800,150,150,0,0,0,0,NULL,'mail','/usr/sbin/sendmail','pop.gmail.com','contact@sma.tecdiary.org','jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==','25',NULL,NULL,1,'contato@alliancetechsystem.com',0,4,1,0,2,1,1,0,2,2,',','.',0,3,'ATS','VWVC895WERD',0,NULL,NULL,NULL,NULL,0,0,0,1,'R$ ',0,'-',0,1,1,'PAG',90,'',1,0,'AN','dompdf',0,'weight',0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_shop_settings`
--

DROP TABLE IF EXISTS `sma_shop_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_shop_settings` (
  `shop_id` int NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int NOT NULL,
  `biller` int NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text,
  `shipping` int DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.47',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT '0',
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `hide_price` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_shop_settings`
--

LOCK TABLES `sma_shop_settings` WRITE;
/*!40000 ALTER TABLE `sma_shop_settings` DISABLE KEYS */;
INSERT INTO `sma_shop_settings` VALUES (1,'Exata Materiais Elétricos','Exata Materiais Elétricos. Seu lar, sua visão, nossos materiais elétricos. Renovamos sua casa e sua vida.',1,3,'','','','','Aceitamos PayPal ou você pode pagar com seus cartões de crédito/débito, ou diretamente na loja.','Clique no link abaixo para nos seguir nas redes sociais.','https://facebook.com/exata_materiais_eletricos','https://twitter.com/exata_materiais_eletricos','','https://www.instagram.com/exata_materiais_eletricos/','(34) 3824-9159','contato@exatame.com.br','Usamos cookies para melhorar a sua experiência no nosso site. Ao navegar neste site, você concorda com o uso de cookies.','','[{\"image\":\"ec36462eaa26f02309b4a36a65c84bdf.jpg\",\"link\":\"https:\\/\\/alliancets.local:444\\/3_clients\\/3_exata\\/\",\"caption\":\"\"},{\"image\":\"8117fa0afbcce8f90af02003ba2e1ba8.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"f93ea438f97f0128ff42c44c7b248fd2.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"0c524ecd996f76b027339159c48fa540.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"62e22e2df2c768807e076067cec6e5a3.jpg\",\"link\":\"\",\"caption\":\"\"}]',0,'','envato_username','3.4.47','logotipo_300x803.png','<p><strong>Exata Materiais Elétricos</strong></p><p><strong>Banco</strong>: Banco do Brasil</p><p><strong>Agência</strong>: 2358<br><strong>Conta corrente</strong>: 352658-8</p><p><strong>CNPJ</strong>: 41.402.813/0001-95 - MATRIZ</p>',0,0,'Os melhores materiais para seu lar. Aqui com as melhores marcas de materiais!',0,0,0);
/*!40000 ALTER TABLE `sma_shop_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_skrill`
--

DROP TABLE IF EXISTS `sma_skrill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_skrill` (
  `id` int NOT NULL,
  `active` tinyint NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_skrill`
--

LOCK TABLES `sma_skrill` WRITE;
/*!40000 ALTER TABLE `sma_skrill` DISABLE KEYS */;
INSERT INTO `sma_skrill` VALUES (1,0,'testaccount2@moneybookers.com','mbtest','USD',0.0000,0.0000,0.0000);
/*!40000 ALTER TABLE `sma_skrill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sms_settings`
--

DROP TABLE IF EXISTS `sma_sms_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_sms_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sms_settings`
--

LOCK TABLES `sma_sms_settings` WRITE;
/*!40000 ALTER TABLE `sma_sms_settings` DISABLE KEYS */;
INSERT INTO `sma_sms_settings` VALUES (1,NULL,'{\"gateway\":\"Log\",\"Log\":{}');
/*!40000 ALTER TABLE `sma_sms_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_stock_count_items`
--

DROP TABLE IF EXISTS `sma_stock_count_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_stock_count_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_count_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_stock_count_items`
--

LOCK TABLES `sma_stock_count_items` WRITE;
/*!40000 ALTER TABLE `sma_stock_count_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_stock_count_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_stock_counts`
--

DROP TABLE IF EXISTS `sma_stock_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_stock_counts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int DEFAULT NULL,
  `rows` int DEFAULT NULL,
  `differences` int DEFAULT NULL,
  `matches` int DEFAULT NULL,
  `missing` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_stock_counts`
--

LOCK TABLES `sma_stock_counts` WRITE;
/*!40000 ALTER TABLE `sma_stock_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_stock_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_suspended_bills`
--

DROP TABLE IF EXISTS `sma_suspended_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_suspended_bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_suspended_bills`
--

LOCK TABLES `sma_suspended_bills` WRITE;
/*!40000 ALTER TABLE `sma_suspended_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_suspended_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_suspended_items`
--

DROP TABLE IF EXISTS `sma_suspended_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_suspended_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suspend_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_suspended_items`
--

LOCK TABLES `sma_suspended_items` WRITE;
/*!40000 ALTER TABLE `sma_suspended_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_suspended_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_tax_rates`
--

DROP TABLE IF EXISTS `sma_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_tax_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_tax_rates`
--

LOCK TABLES `sma_tax_rates` WRITE;
/*!40000 ALTER TABLE `sma_tax_rates` DISABLE KEYS */;
INSERT INTO `sma_tax_rates` VALUES (1,'Sem Taxa','ST',0.0000,'2'),(2,'COFINS @3%','COFINS',3.0000,'1'),(3,'ICMS @12%','ICMS',12.0000,'1'),(4,'CSLL @9%','CSLL',9.0000,'1'),(5,'PIS @1.65%','PIS',1.6500,'1'),(6,'IPI @2%','IPI',2.0000,'1'),(7,'ISS @3%','ISS',3.0000,'1');
/*!40000 ALTER TABLE `sma_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_transfer_items`
--

DROP TABLE IF EXISTS `sma_transfer_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_transfer_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transfer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `product_unit_id` int DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_transfer_items`
--

LOCK TABLES `sma_transfer_items` WRITE;
/*!40000 ALTER TABLE `sma_transfer_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_transfer_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_transfers`
--

DROP TABLE IF EXISTS `sma_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_transfers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_transfers`
--

LOCK TABLES `sma_transfers` WRITE;
/*!40000 ALTER TABLE `sma_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_units`
--

DROP TABLE IF EXISTS `sma_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_units` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_units`
--

LOCK TABLES `sma_units` WRITE;
/*!40000 ALTER TABLE `sma_units` DISABLE KEYS */;
INSERT INTO `sma_units` VALUES (1,'KG','Kilograma',NULL,NULL,NULL,NULL),(3,'PC','Peça',NULL,NULL,NULL,NULL),(4,'M','Metro',NULL,NULL,NULL,NULL),(5,'CM','Centímetro',NULL,NULL,NULL,NULL),(6,'A','Ampere',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_user_logins`
--

DROP TABLE IF EXISTS `sma_user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_user_logins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_user_logins`
--

LOCK TABLES `sma_user_logins` WRITE;
/*!40000 ALTER TABLE `sma_user_logins` DISABLE KEYS */;
INSERT INTO `sma_user_logins` VALUES (1,1,NULL,_binary '2804:7f2:298d:95','owner@tecdiary.com','2021-07-02 14:20:37'),(2,1,NULL,_binary '2804:7f2:298d:95','owner@tecdiary.com','2021-07-02 15:06:32'),(3,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 15:58:11'),(4,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 16:36:16'),(5,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 16:39:10'),(6,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 19:06:54'),(7,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 19:12:21'),(8,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 21:25:23'),(9,1,NULL,_binary '10.10.10.31','alliancets','2021-07-05 13:57:05');
/*!40000 ALTER TABLE `sma_user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_users`
--

DROP TABLE IF EXISTS `sma_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int unsigned NOT NULL,
  `last_login` int unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned DEFAULT NULL,
  `biller_id` int unsigned DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_users`
--

LOCK TABLES `sma_users` WRITE;
/*!40000 ALTER TABLE `sma_users` DISABLE KEYS */;
INSERT INTO `sma_users` VALUES (1,_binary '10.10.10.31',_binary '\0\0','alliancets','d311d964b5ce674265621ff18b8436b3c8a4d4b5',NULL,'suporte@alliancets.dev',NULL,NULL,NULL,NULL,1351661704,1625493425,1,'Administrador','ATS','ALLIANCE TECH SYSTEM','62999132635',NULL,'male',1,NULL,NULL,NULL,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_variants`
--

DROP TABLE IF EXISTS `sma_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_variants`
--

LOCK TABLES `sma_variants` WRITE;
/*!40000 ALTER TABLE `sma_variants` DISABLE KEYS */;
INSERT INTO `sma_variants` VALUES (1,'Cor'),(2,'Tamanho'),(3,'Tipo');
/*!40000 ALTER TABLE `sma_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_warehouses`
--

DROP TABLE IF EXISTS `sma_warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_warehouses`
--

LOCK TABLES `sma_warehouses` WRITE;
/*!40000 ALTER TABLE `sma_warehouses` DISABLE KEYS */;
INSERT INTO `sma_warehouses` VALUES (1,'EME','Exata Materiais Elétricos','<p>Exata Materiais Elétricos</p>\r\n<p>Lagoa Formosa, Minas Gerais, Brazil</p>','598aea6f54d3f75ed29c8a732a2971dc.png','(34) 3824 9159','contato@exatame.com.br',1),(2,'DE','Depósito Externo','<p>Depósito Externo</p>','66b55758931b4bf02c85e6f0d4c17f77.png','(31) 9 9999-9999','contato@exatame.com.br',1);
/*!40000 ALTER TABLE `sma_warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_warehouses_products`
--

DROP TABLE IF EXISTS `sma_warehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_warehouses_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_warehouses_products`
--

LOCK TABLES `sma_warehouses_products` WRITE;
/*!40000 ALTER TABLE `sma_warehouses_products` DISABLE KEYS */;
INSERT INTO `sma_warehouses_products` VALUES (3,2,1,48.0000,NULL,109.9300),(4,2,2,0.0000,NULL,109.9300),(5,3,1,49.0000,NULL,199.9900),(6,3,2,0.0000,NULL,199.9900),(7,4,1,49.0000,NULL,45.9800),(8,4,2,0.0000,NULL,45.9800),(9,5,1,49.0000,NULL,53.9000),(10,5,2,0.0000,NULL,53.9000),(11,6,1,99.0000,NULL,19.6000),(12,6,2,0.0000,NULL,19.6000),(13,7,1,0.0000,NULL,29.2800),(14,7,2,0.0000,NULL,29.2800);
/*!40000 ALTER TABLE `sma_warehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_warehouses_products_variants`
--

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_warehouses_products_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

LOCK TABLES `sma_warehouses_products_variants` WRITE;
/*!40000 ALTER TABLE `sma_warehouses_products_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_warehouses_products_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_wishlist`
--

DROP TABLE IF EXISTS `sma_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sma_wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_wishlist`
--

LOCK TABLES `sma_wishlist` WRITE;
/*!40000 ALTER TABLE `sma_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sma_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-06 15:36:50
