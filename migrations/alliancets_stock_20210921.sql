-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: alliancets_stock
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_addresses`
--

LOCK TABLES `sma_addresses` WRITE;
/*!40000 ALTER TABLE `sma_addresses` DISABLE KEYS */;
INSERT INTO `sma_addresses` VALUES (1,5,'Rua Cristiano Moreira Sales, 147','Estoril','Belo Horizonte','30320-410','Minas Gerais','Brasil','3130178366','0000-00-00 00:00:00'),(2,6,'123','321','ourinhos','17500900','sp','brasil','14981473444','2021-07-22 13:59:27');
/*!40000 ALTER TABLE `sma_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_adjustment_items`
--

DROP TABLE IF EXISTS `sma_adjustment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `hour_started` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(6) DEFAULT '0',
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
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
-- Table structure for table `sma_banco_boleto`
--

DROP TABLE IF EXISTS `sma_banco_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_banco_boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_banco_boleto`
--

LOCK TABLES `sma_banco_boleto` WRITE;
/*!40000 ALTER TABLE `sma_banco_boleto` DISABLE KEYS */;
INSERT INTO `sma_banco_boleto` VALUES (1,'sicoob');
/*!40000 ALTER TABLE `sma_banco_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_boleto_config`
--

DROP TABLE IF EXISTS `sma_boleto_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_boleto_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banco_id` int(11) NOT NULL,
  `agencia` varchar(16) NOT NULL,
  `conta` varchar(16) NOT NULL,
  `serial_number` int(11) DEFAULT NULL,
  `codigo_cliente` varchar(15) DEFAULT NULL,
  `taxa_juro_base` double DEFAULT NULL,
  `taxa_juro_dia` double DEFAULT NULL,
  `chave_acesso_web` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banco_id` (`banco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_boleto_config`
--

LOCK TABLES `sma_boleto_config` WRITE;
/*!40000 ALTER TABLE `sma_boleto_config` DISABLE KEYS */;
INSERT INTO `sma_boleto_config` VALUES (1,1,'3154','202096',10003,'399094',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_boleto_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_brands`
--

DROP TABLE IF EXISTS `sma_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
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
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_companies`
--

LOCK TABLES `sma_companies` WRITE;
/*!40000 ALTER TABLE `sma_companies` DISABLE KEYS */;
INSERT INTO `sma_companies` VALUES (1,3,'customer',1,'Geral','Cliente Padrão','Exata Materiais Elétricos','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','3491590597','cliente@exatame.com.br','','','','','','Google',NULL,0,'logo.png',0,NULL,1,'Padrão',''),(2,4,'supplier',NULL,NULL,'Cliente Padrão','Fornecedor Padrão Exata','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','3491590597','fornecedor@exatame.com.br','-','-','-','-','-','-',NULL,0,'logo.png',0,NULL,NULL,NULL,''),(3,NULL,'biller',NULL,NULL,'Aexandre José Ribeiro Silva','Exata Materiais Elétricos','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','(34) 9159-0597','contato@exatame.com.br','','','','','','','Obrigado por comprar na Exata Materiais Elétricos\r\nEm caso de qualquer dúvida, fique à vontade para nos contatar por e-mail em contato@exatame.com.br\r\n---------\r\nExata Materiais Elétricos\r\nCNPJ: 41.402.813/0001-95',0,'logotipo_300x80.png',0,NULL,NULL,NULL,''),(4,4,'supplier',NULL,NULL,'Cliente Padrão','Fornecedor Secundário Exata','41.402.813/0001-95','R Eliaquim Tero','Lagoa Formosa','MG','38.720-0','Brasil','3491590597','fornecedor2@exatame.com.br','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),(5,3,'customer',1,'Geral','Rafael Costa','GR WEB',NULL,NULL,NULL,NULL,NULL,NULL,'62999132635','rafael.sabino@hotmail.com.br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'logo.png',0,NULL,1,'Padrão',NULL),(6,3,'customer',1,'Geral','flaviano cruz','jeca',NULL,NULL,NULL,NULL,NULL,NULL,'11111111111','flavianogjc@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'logo.png',0,NULL,1,'Padrão',NULL);
/*!40000 ALTER TABLE `sma_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_costing`
--

DROP TABLE IF EXISTS `sma_costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `sma_currencies` VALUES (3,'BRL','REAL',1.0000,0,'R$');
/*!40000 ALTER TABLE `sma_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_customer_groups`
--

DROP TABLE IF EXISTS `sma_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_order_ref`
--

LOCK TABLES `sma_order_ref` WRITE;
/*!40000 ALTER TABLE `sma_order_ref` DISABLE KEYS */;
INSERT INTO `sma_order_ref` VALUES (1,'2015-03-01',3,1,1,1,2,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `sma_order_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_pages`
--

DROP TABLE IF EXISTS `sma_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` tinyint(4) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
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
  `created_by` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_pos_settings` (
  `pos_id` int(11) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
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
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.47',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
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
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `sma_products` VALUES (2,'89473709','Abajur Diamante Design Moderno',1,109.9300,95.4500,2.0000,'d31bd7ffd01b6ebd5d15a8c4e3b3cdcf.png',16,NULL,'','','','','','',48.0000,1,1,'<p>ANUNCIO REFERE_SE A 1 ABAJUR , FOTO ILUSTRATIVA , DAS CORES QUE TEMOS DISPONÌVEIS</p>',NULL,'code128','','<p>Abajur Diamante</p><p>COR COBRE<br>SOQUETE E27 lãmpada comum<br>Base 23 x 20<br>Cupula 30x30 x20<br>Altura total com cúpula 40 cm<br>Cabo com interruptor liga/desliga<br>Fio 1 m</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'89473709',1,2.0000,NULL,0,0,'',0),(3,'99026252','Abajur De Chão Tripé De Madeira Cúpula',1,199.9900,156.4800,2.0000,'7c7c2280f8b2b81c9a0b68dbe610b0e2.png',16,NULL,'','','','','','',49.0000,3,1,'<p>Marca E-led Modelo Abajur Tripé de Chão</p><p>Largura total 44 cm </p><p>Diâmetro total 44 cm </p><p>Altura total 150 cm</p>',NULL,'code128','','<p>Abajur Tripé de Madeira Super Moderno<br><br>- Tendência em decoração e iluminação<br>- Madeira<br>- Cupula de Tecido<br>- Soquete E27<br>- Facil montagem<br>- Botão liga/desliga no fio da luminária localizada próxima da cúpula<br>- Dimensões completas nas imagens</p><p>- Necessário montagem.</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0,0,0,'99026252',NULL,2.0000,NULL,1,0,'',0),(4,'10405075','Abajur Mesa Escritorio Quarto Moderno Madeira E27',1,45.9800,36.8700,2.0000,'c50744138cb533aba809c7a1a50fb967.png',16,NULL,'','','','','','',49.0000,3,1,'<p>Medidas: Largura: 20 cm / Altura: 35 cm</p><p>Materiais: Madeira MDF / Plastico<br>Alimentação: Bivolt 110v / 220v<br>Potência: 100 W<br>Ambientes: Quarto, sala<br>Capacidade de lâmpadas: 1<br>Tipos de fontes de luz: Soquete E27<br>Tipo de soquete: E27</p>',NULL,'code128','','<p>Para dar aquela inovada na decoração é preciso muita criatividade e bom gosto e isso vem sempre aliada a um lindo abajur de mesa. Pensando nisso, desenvolvemos e criamos este modelo lindo e exclusivo modelo. Ela é feita com material de primeira qualidade, e seu recorte é todo feito a laser, para se adaptar a qualquer ambiente, seja ele interno ou externo.</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'10405075',NULL,2.0000,NULL,0,0,'',0),(5,'09061639','Caixa De Luz De Parede Tramontina 4x2',1,53.9000,32.8900,2.0000,'28daf29d4c82aab93c6e2476a703210d.png',8,NULL,'','','','','','',49.0000,1,1,'<p>Aplicação:</p><p>- Fixação de tomadas<br>- Fixação de interruptores<br>- Fixação de tomadas para telefonia<br>- Fixação de tomadas para Tv<br>- Serve como caixa de passagem para fios</p>',NULL,'code128','','<p>Aplicação:<br>- Fixação de tomadas<br>- Fixação de interruptores<br>- Fixação de tomadas para telefonia<br>- Fixação de tomadas para Tv<br>- Serve como caixa de passagem para fios</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'09061639',NULL,0.2500,NULL,0,0,'',0),(6,'01739757','Caixa De Passagem 102x102x55 Km03186 = Steck Ssx111 Cftv',1,19.6000,12.6500,2.0000,'974b226a9402bd449a0ac6a88c18aa31.png',9,NULL,'','','','','','',99.0000,1,1,'<p>Linha KM Caixa de Passagem Elétrica 102 para Sobrepor</p><p>Com design moderno, a Caixa de Passagem Elétrica 102 da Kraus-Muller segue a norma NBR desenvolvida para instalação em sobrepor, sendo indicada para montagem de equipamentos elétricos, passagem e comando.<br><br>A fixação da tampa da Caixa 102 é feita por meio de parafusos plásticos, agilizando a montagem. Além disso, temos caixas com tampas opacas ou transparentes. Existe também há opção para fixação de trilho DIN e placa de montagem.</p>',NULL,'code128','','<p>Matérias Primas: Material Termoplástico auto-extinguível;</p><p>Norma: Conforme Norma NBR IEC60670-1;<br>Grau de Proteção: IP 65;<br>Proteção Mecânica: IP XX7;<br>Temperatura de Operação: -5ºC à 60ºC e 70ºC para curto período de tempo;<br>Proteção U.V: Até 5 anos (Sob consulta).<br>Características:<br>Possuem marcação (exclusiva e patenteada);<br>Indicador do Sentido do giro do Parafuso;<br>Parafuso de ¼’’ de volta sem elementos metálicos;<br>Caixa de Passagem 102x102x57 Cega Tampa Opaca ou Transpartente.<br>Para garantir uma instalação com qualidade e segurança conte com a Linha Kraus-Muller!</p>',1,'standard',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'01739757',NULL,0.2900,NULL,0,0,'',0),(7,'19580826','Disjuntor Bipolar Duplo 10a, 16a,20a, 25a, 32a,40a, 50a, 63a',1,29.2800,12.4700,2.0000,'d87e991450a95860f6d85f06d889f991.png',3,NULL,'','','','','','',0.0000,1,1,'<p>1- PEÇA DISJUNTOR ELITECK/JNG - BIPOLAR</p><p>( ESCOLHER A AMPERAGEM ANTES 10A / 16A / 20A / 25A / 32A / 40A / 50A / 63A)</p>',NULL,'code128','','<p>Correntes Nominais (In): Corrente Alternada de 6A, 10A, 16A, 20A, 25A, 32A, 40A, 50A e 63A</p><p>Tensões Nominais (Un): 230Vca (1P), 400Vca (2P e 3P)<br>Numero de Pólos: 1P, 2P e 3P<br>Curva: C<br>Cap. Inter. Nom. (Ics=Icn): 4,5kA / 6kA (Ver Data Sheet)<br>Montagem: Trilho Din 35mm</p>',1,'standard',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'19580826',NULL,0.5800,NULL,0,0,'',0);
/*!40000 ALTER TABLE `sma_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_promos`
--

DROP TABLE IF EXISTS `sma_promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
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
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sale_items`
--

LOCK TABLES `sma_sale_items` WRITE;
/*!40000 ALTER TABLE `sma_sale_items` DISABLE KEYS */;
INSERT INTO `sma_sale_items` VALUES (1,1,3,'99026252','Abajur De Chão Tripé De Madeira Cúpula','standard',NULL,156.4800,175.2600,1.0000,1,18.7800,3,'12%','0',0.0000,175.2600,'',156.4800,NULL,1,'KG',1.0000,'',NULL,NULL,NULL,NULL),(2,1,2,'89473709','Abajur Diamante Design Moderno','standard',NULL,95.4500,95.4500,1.0000,1,0.0000,1,'0','0',0.0000,95.4500,'',95.4500,NULL,1,'KG',1.0000,'',NULL,NULL,NULL,NULL),(3,1,4,'10405075','Abajur Mesa Escritorio Quarto Moderno Madeira E27','standard',NULL,36.8700,41.2900,1.0000,1,4.4200,3,'12%','0',0.0000,41.2900,'',36.8700,NULL,1,'KG',1.0000,'',NULL,NULL,NULL,NULL),(4,2,2,'89473709','Abajur Diamante Design Moderno','standard',NULL,95.4500,95.4500,1.0000,1,0.0000,1,'0','0',0.0000,95.4500,'2956155',95.4500,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL),(5,2,5,'09061639','Caixa De Luz De Parede Tramontina 4x2','standard',NULL,32.8900,32.8900,1.0000,1,0.0000,1,'0','0',0.0000,32.8900,'6595623',32.8900,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL),(6,2,6,'01739757','Caixa De Passagem 102x102x55 Km03186 = Steck Ssx111 Cftv','standard',NULL,12.6500,12.6500,1.0000,1,0.0000,1,'0','0',0.0000,12.6500,'2659126',12.6500,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL),(7,3,4,'10405075','Abajur Mesa Escritorio Quarto Moderno Madeira E27','standard',NULL,36.8700,41.2900,2.0000,1,8.8488,3,'12%',NULL,0.0000,82.5900,NULL,36.8700,NULL,1,'KG',2.0000,NULL,NULL,NULL,NULL,NULL),(8,3,2,'89473709','Abajur Diamante Design Moderno','standard',NULL,95.4500,95.4500,1.0000,1,0.0000,1,'0',NULL,0.0000,95.4500,NULL,95.4500,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL),(9,4,3,'99026252','Abajur De Chão Tripé De Madeira Cúpula','standard',NULL,156.4800,175.2600,1.0000,1,18.7776,3,'12%',NULL,0.0000,175.2600,NULL,156.4800,NULL,1,'KG',1.0000,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sma_sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sales`
--

DROP TABLE IF EXISTS `sma_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_sales`
--

LOCK TABLES `sma_sales` WRITE;
/*!40000 ALTER TABLE `sma_sales` DISABLE KEYS */;
INSERT INTO `sma_sales` VALUES (1,'2021-07-02 19:25:35','VEN/POS2021/07/0001',1,'Exata Materiais Elétricos',3,'Exata Materiais Elétricos',1,'','',288.8000,0.0000,'',0.0000,0.0000,23.2000,3,37.4400,60.6400,0.0000,349.4400,'completed','due',0,NULL,1,NULL,NULL,3,1,0.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,0.0000,NULL,0,0,NULL,NULL,'ed6dfb8926a441ceea1a8533aa74be30670b3ecac5dce6c839721861b66004f7',NULL,NULL,NULL,NULL,NULL),(2,'2021-07-02 21:25:00','2165623',1,'Exata Materiais Elétricos',3,'Exata Materiais Elétricos',1,'&lt;p&gt;Nota da Venda&lt;&sol;p&gt;','&lt;p&gt;Nota do Admin&lt;&sol;p&gt;',140.9900,0.0000,'',0.0000,0.0000,0.0000,3,16.9188,16.9188,120.0000,277.9100,'completed','paid',15,'2021-07-17',1,NULL,NULL,3,0,277.9100,NULL,0.0000,'0',NULL,NULL,0.0000,NULL,NULL,0,0,NULL,NULL,'57fc68d4f906bb6d5ee4d6cacc21867f454bde0ed05791ee11e68c4a14b18598',NULL,NULL,NULL,NULL,NULL),(3,'2021-07-08 06:19:51','VEN2021/07/0001',5,'GR WEB',3,'Exata Materiais Elétricos',1,'',NULL,169.1900,0.0000,NULL,0.0000,0.0000,8.8488,1,0.0000,8.8488,0.0000,178.0388,'pending','pending',NULL,NULL,3,NULL,NULL,3,0,0.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,NULL,NULL,0,1,1,NULL,'17ece516d36c9ffd29f0d8c7382a0a31a6bf654243b3e7e27beae1cb3e5a7267',NULL,NULL,NULL,NULL,'bank'),(4,'2021-07-22 13:59:43','VEN2021/07/0002',6,'jeca',3,'Exata Materiais Elétricos',1,'',NULL,156.4800,0.0000,NULL,0.0000,0.0000,18.7776,1,0.0000,18.7776,0.0000,9175.2576,'pending','pending',NULL,NULL,4,NULL,NULL,1,0,0.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,NULL,NULL,0,1,2,NULL,'22cc1a76be559b2999cd74369475ab18b184a05d9a9dd210e1bd6e89c0103b8b',NULL,NULL,NULL,NULL,'bank');
/*!40000 ALTER TABLE `sma_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_sessions`
--

DROP TABLE IF EXISTS `sma_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
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
INSERT INTO `sma_sessions` VALUES ('0087hu7o53tscdhh170rfulh3ts38j1h','127.0.0.1',1627566475,_binary '__ci_last_regenerate|i:1627566475;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('03921solfi57k92te8eckd91n0h61dra','127.0.0.1',1627382233,_binary '__ci_last_regenerate|i:1627382233;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";error|s:110:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/boleto/\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('0hp0ejelkij13fv5e929odfrehaprso9','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625721840,_binary '__ci_last_regenerate|i:1625721837;requested_page|s:13:\"admin/welcome\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625718951\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('0koikbpscfa3kcpcuqrp05n8p01b3p4b','127.0.0.1',1626104370,_binary '__ci_last_regenerate|i:1626104333;requested_page|s:13:\"shop/products\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625719116\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626100543;'),('0n1btdf4ip9je8u7hpoa98ik0cbve73v','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625714156,_binary '__ci_last_regenerate|i:1625714156;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625597872\";last_ip|s:36:\"2804:7f2:298d:9518:c9a1:39ac:f6:3fc0\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('0nics93b65mm7v5q7bu8r0dj8rsg9nst','127.0.0.1',1632089796,_binary '__ci_last_regenerate|i:1632089796;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632068467\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('0rk0qsjsaju0htjladtnrgets5sk81ke','127.0.0.1',1631616860,_binary '__ci_last_regenerate|i:1631616860;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('12sj77e3n7a0cje53irl8fnd0reej32v','127.0.0.1',1629245183,_binary '__ci_last_regenerate|i:1629245182;'),('1aq2p3sni4ijm7eludbbumkcndp78thu','127.0.0.1',1631562921,_binary '__ci_last_regenerate|i:1631562910;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631548058\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('1b917ho1m4klr3our27rpjdighpr1ps2','127.0.0.1',1631619089,_binary '__ci_last_regenerate|i:1631619089;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('1c3v1st4m4cs0t5sujv6dh7e7imi2qgr','127.0.0.1',1628334748,_binary '__ci_last_regenerate|i:1628334748;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"emzt2OhgY7rCipyK8aSq\";'),('1f5qi3it4cdmnmlr8jktecp9hc7jmpsu','127.0.0.1',1631548883,_binary '__ci_last_regenerate|i:1631548883;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631529390\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('1j7gbdidaj5phhodauekb7rla76rfuds','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625245676,_binary '__ci_last_regenerate|i:1625245676;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('1o7dktjba2trg3kcoh82f2dssucfpsjg','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625247159,_binary '__ci_last_regenerate|i:1625247159;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('1o8iim0093ae24kub9fidsgqcoin9pel','127.0.0.1',1632058419,_binary '__ci_last_regenerate|i:1632058419;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632056941;'),('1oddi45qoq2jet9un4rpmasmmmckqbv4','127.0.0.1',1626100141,_binary '__ci_last_regenerate|i:1626100141;requested_page|s:13:\"shop/products\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625719116\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('1s4q0vf7am9c4pv5cu0t297bj52rph2u','127.0.0.1',1631627438,_binary '__ci_last_regenerate|i:1631627438;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('1vij74dnpj041e7jr1437ev1pk5e6hva','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625246856,_binary '__ci_last_regenerate|i:1625246856;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246816;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('1vj2fvoe6qfu147affej417k4vbuqjas','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625251131,_binary '__ci_last_regenerate|i:1625251131;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('241n8teu2cni8876j0rkmbhv9vgm2jn5','127.0.0.1',1627557206,_binary '__ci_last_regenerate|i:1627557206;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('24pl73d8598870ennbj7jte3kbtmpr6n','127.0.0.1',1631548367,_binary '__ci_last_regenerate|i:1631548367;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631529390\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('28i1c5ekapih5q5ifu5p2gk3e8m8oah4','127.0.0.1',1627563504,_binary '__ci_last_regenerate|i:1627563504;'),('2bghcglcdptcakn2m75h940un9dsi2ac','127.0.0.1',1626256086,_binary '__ci_last_regenerate|i:1626256086;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626255764;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";'),('2gq7j589irvhsilfed349vr1cvcig1gi','127.0.0.1',1628624498,_binary '__ci_last_regenerate|i:1628624497;'),('2k0brc5h0ar1jc9j22uogb4oih57u3ec','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625716218,_binary '__ci_last_regenerate|i:1625716217;requested_page|s:13:\"shop/products\";'),('2l0ndv08kkqo0bso86ubrai7rq0199hc','127.0.0.1',1628245066,_binary '__ci_last_regenerate|i:1628245066;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628244754;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('2md22t7mmdq7pmqa2gkb7l7jo47sjk78','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625711641,_binary '__ci_last_regenerate|i:1625711641;'),('30f62rq851m5rev598du6nqabevu6a25','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625712717,_binary '__ci_last_regenerate|i:1625712717;requested_page|s:5:\"admin\";'),('30ldklkkjhhjpbnkccjltr4lt4pq3te3','127.0.0.1',1629379607,_binary '__ci_last_regenerate|i:1629379607;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629317156\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";error|s:135:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/boleto/sicoob/boleto_bancoob.php\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('32cchi3jqq6cofmet27i3gq9cpp3i8am','127.0.0.1',1626947991,_binary '__ci_last_regenerate|i:1626947991;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('36ndkjdh62qsnedl49urtu7kbntjrfsp','127.0.0.1',1628161528,_binary '__ci_last_regenerate|i:1628161528;'),('373j89i9hdo6rhi5a16e9v46j6163qbq','127.0.0.1',1627556645,_binary '__ci_last_regenerate|i:1627556645;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('37neb9u23oq0rcgsfdb6542as3o93bou','127.0.0.1',1628244648,_binary '__ci_last_regenerate|i:1628244492;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628243411\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('3b3bt1cophpa43cgstt6j2nkbsq50b4r','127.0.0.1',1630946157,_binary '__ci_last_regenerate|i:1630946157;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('3fv1po3i8mkk6agu0tc8hud7hr0s3abu','127.0.0.1',1629166716,_binary '__ci_last_regenerate|i:1629166716;'),('3gie232qv9e9rc7skpno2m99umq69rph','127.0.0.1',1631618779,_binary '__ci_last_regenerate|i:1631618779;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('3hg574jhm2r329ih982bvjj8821j6r9l','127.0.0.1',1631619406,_binary '__ci_last_regenerate|i:1631619406;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('3kdabp61iff4ptv55o4jt26h6enc15sb','127.0.0.1',1628246473,_binary '__ci_last_regenerate|i:1628246473;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628244754;'),('3ku3nphohd8sg4c59os1vbhsla6hc370','127.0.0.1',1627386569,_binary '__ci_last_regenerate|i:1627386319;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('3pus6ar18vmcjh5kfbme082jcbvg16rl','2804:7f2:298d:9518:fd08:1db2:2b02:aa60',1625527652,_binary '__ci_last_regenerate|i:1625527651;requested_page|s:18:\"admin/sales/view/2\";'),('3s1asd5ijist3t1l4el41esk8v8nd17r','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625718600,_binary '__ci_last_regenerate|i:1625718599;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625715300\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('4n6qejugmlob23u01gspps86ruloeca2','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625724260,_binary '__ci_last_regenerate|i:1625724185;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625717353\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('4ojtqfejuhe1s2dt5qpievqm6jb1e0u5','127.0.0.1',1630322006,_binary '__ci_last_regenerate|i:1630322006;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('4rm10mopttvd3h8un48gdsn2bpsb8pof','127.0.0.1',1627383343,_binary '__ci_last_regenerate|i:1627383343;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('4s0frf8c0dpnkojqbam7n8lv54kbgat2','127.0.0.1',1631975327,_binary '__ci_last_regenerate|i:1631975166;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631814856\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631975242;'),('4t8l7ok6khvu75bu44e25u0usg6u2m9l','127.0.0.1',1628293851,_binary '__ci_last_regenerate|i:1628293851;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628244511\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('5976hn5pqtga3pf2bmgbeigqrcha2hre','127.0.0.1',1626961623,_binary '__ci_last_regenerate|i:1626961623;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626947991\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626960286;requested_page|s:13:\"cart/checkout\";'),('5atb79qa3pjeei2174u04d9pacd50lvb','127.0.0.1',1630415434,_binary '__ci_last_regenerate|i:1630415434;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1630325549\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('5csht2jgup4ulq6p7ckf8ghnnavv0680','127.0.0.1',1630322792,_binary '__ci_last_regenerate|i:1630322791;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('5kojkchhasavnif48urtoi5c34u7khvf','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625241454,_binary '__ci_last_regenerate|i:1625241454;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;csrfkey|s:8:\"nkXBQlIJ\";__ci_vars|a:2:{s:7:\"csrfkey\";s:3:\"new\";s:9:\"csrfvalue\";s:3:\"new\";}csrfvalue|s:20:\"XdJ5IcZ61quESQW3zngw\";'),('5lm0lkbga825dvnkkfnodou92226mu84','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625711641,_binary '__ci_last_regenerate|i:1625711641;'),('5ov0gtuh4oas8o2qnu5t5dmvqh5fun2a','2804:7f2:298d:9518:a850:746:13b9:d630',1625509926,_binary '__ci_last_regenerate|i:1625509926;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('62aq2con89ikp1eam3ueb2gi2rd6k48j','127.0.0.1',1629319950,_binary '__ci_last_regenerate|i:1629319950;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629168153\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('63s8m5q2gcnp4v8sni48f66glroejpad','127.0.0.1',1625832539,_binary '__ci_last_regenerate|i:1625832539;'),('645b7stf0vb3ssma3pen36ujbbeq1b3n','127.0.0.1',1627382900,_binary '__ci_last_regenerate|i:1627382900;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('67h9rlep000deoovfe60vdscl7hqq090','127.0.0.1',1630323625,_binary '__ci_last_regenerate|i:1630323624;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('6bcd7bjfbtkrf3t9duuajkrja7qvd34s','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625251561,_binary '__ci_last_regenerate|i:1625251561;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('6dqu6335418akvl7u1hhcnuukl77b0op','127.0.0.1',1630325584,_binary '__ci_last_regenerate|i:1630325584;'),('6h2l036sq7mku28son9g8gb9t7bidep5','127.0.0.1',1627381509,_binary '__ci_last_regenerate|i:1627381509;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('6j2n88vv9ebgvq1o5i7gnn8mnh1v07cr','127.0.0.1',1626960052,_binary '__ci_last_regenerate|i:1626960052;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626947991\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('6l58veqmbu4q3f1g8fphedr8cja9m4hc','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249243,_binary '__ci_last_regenerate|i:1625249243;'),('6o00pcun0a66t8r019udsr743joimv0s','127.0.0.1',1625830150,_binary '__ci_last_regenerate|i:1625830150;'),('6t678a5edj685n61tslcbdin98mv6aaj','127.0.0.1',1629166321,_binary '__ci_last_regenerate|i:1629166321;'),('6tud764mbhi5rocjlea1h3aeq2480dvf','127.0.0.1',1628333889,_binary '__ci_last_regenerate|i:1628333889;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"emzt2OhgY7rCipyK8aSq\";'),('75bvbcd3f5av803vo4avfucq61ue4nii','2804:7f2:298d:9518:a850:746:13b9:d630',1625509474,_binary '__ci_last_regenerate|i:1625509474;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('75jklm47ig7k0f3h0sa82d06g23kkf0l','127.0.0.1',1625762181,_binary '__ci_last_regenerate|i:1625762181;'),('77er7fknpisf52naiom4han3mhverg88','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625240721,_binary '__ci_last_regenerate|i:1625240721;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('7cihpupj9175a0tk27fi32qb8s272apg','127.0.0.1',1626343915,_binary '__ci_last_regenerate|i:1626343915;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('7ebaiudkoiuisfcu5gu4ojodhni0l9kq','127.0.0.1',1629321559,_binary '__ci_last_regenerate|i:1629321559;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629168153\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('7heu12c7pblgfa42hnnc2ssu5ss0448e','127.0.0.1',1631615199,_binary '__ci_last_regenerate|i:1631615199;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('7ssscfonqn113rl3ufj9rl66ankl3t5i','127.0.0.1',1627383034,_binary '__ci_last_regenerate|i:1627383034;'),('7viesm4gvepet5o5vq2otjaj2ir63khm','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625254752,_binary '__ci_last_regenerate|i:1625254752;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('86g20v3j8ddi5951bb5fgmgu1pco2usp','127.0.0.1',1627387238,_binary '__ci_last_regenerate|i:1627387238;'),('86v691559ec0g8vrmgf9v465l78etrc9','127.0.0.1',1629165121,_binary '__ci_last_regenerate|i:1629165121;error|s:72:\"Mail Error: <strong>Could not instantiate mail function.</strong><br />\n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('87esm2q8bpufbngiqvpcp31kaka0vhmb','127.0.0.1',1631537772,_binary '__ci_last_regenerate|i:1631537772;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('89bjg92ukaat3f8ggl6vioq0b7do6fmu','127.0.0.1',1631562245,_binary '__ci_last_regenerate|i:1631562245;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631548058\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('8cm81sh5e8284ki58k215r7p9acdlvpv','127.0.0.1',1626265208,_binary '__ci_last_regenerate|i:1626265208;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('8ejk9bhq9inrd26kcl4df5hfttv27rmv','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625253319,_binary '__ci_last_regenerate|i:1625253319;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625253168;'),('8f53dtmte1akklvoadkdad0nnrf28776','127.0.0.1',1630325584,_binary '__ci_last_regenerate|i:1630325584;'),('8fnq0biep49fggqffsqd5koo8i7u7ofv','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625250340,_binary '__ci_last_regenerate|i:1625250340;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('8m4n6mtkuie2sr201eds3fjbpo8lg9rm','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625721837,_binary '__ci_last_regenerate|i:1625721837;requested_page|s:13:\"admin/welcome\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625718951\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('8n5jkof6vmuspncjahd68j0e64ko86fn','127.0.0.1',1632056170,_binary '__ci_last_regenerate|i:1632056170;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('8p3mal6jb8r6oagef4b63sn1sq6n7hld','127.0.0.1',1627558037,_binary '__ci_last_regenerate|i:1627558037;'),('8uk7ae6b79tram6ffqeh69la445414lc','127.0.0.1',1631975166,_binary '__ci_last_regenerate|i:1631975166;'),('8v822vlki22qc6of6kq6ts6ff6oami3h','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625724185,_binary '__ci_last_regenerate|i:1625724185;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625717353\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('934676uvsnvoifa0g389okk0p1upmri3','127.0.0.1',1630327703,_binary '__ci_last_regenerate|i:1630327703;'),('94d16acp4ce78srmqn6tbki35va2umvs','127.0.0.1',1627387238,_binary '__ci_last_regenerate|i:1627387238;'),('97pg7tg1rv3nrk1j9avrrvk8jo503irp','127.0.0.1',1631548429,_binary '__ci_last_regenerate|i:1631548429;requested_page|s:31:\"admin/system_settings/tax_rates\";'),('99o35g979unritf9qmavfis294reg3qo','127.0.0.1',1631618281,_binary '__ci_last_regenerate|i:1631618281;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('9clm5h7a038levpqke44ii1bvqn0h5u9','127.0.0.1',1626962461,_binary '__ci_last_regenerate|i:1626962461;'),('9n941nbd2qrol82ovcaiouv1cmjira6c','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625250644,_binary '__ci_last_regenerate|i:1625250644;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('9or2ce6oi6ppjguvnq3j3mq1vcfmsv3f','127.0.0.1',1626947362,_binary '__ci_last_regenerate|i:1626947362;'),('9qlrh2vfb7isjt80mkgvpaf45dg5uvkt','127.0.0.1',1630327702,_binary '__ci_last_regenerate|i:1630327702;'),('9tsrofdjsbqvbb0l564in97ng6c0rtj3','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625240115,_binary '__ci_last_regenerate|i:1625240115;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;message|s:32:\"Categoria adicionada com sucesso\";__ci_vars|a:1:{s:7:\"message\";s:3:\"new\";}'),('a9gh7atpi441uu70bpofp1k42vaftlf7','127.0.0.1',1626267298,_binary '__ci_last_regenerate|i:1626267298;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('acnj81ambp93n6udmud0p4qfkksigoqq','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625713048,_binary '__ci_last_regenerate|i:1625713048;requested_page|s:5:\"admin\";'),('ad3v425ssfhallvqjv1jm0etdcv0q6pj','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625255084,_binary '__ci_last_regenerate|i:1625254990;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"cart/checkout\";'),('adkm2q43i7ke5qvu2skivtc87qjn80k7','2804:7f2:298d:9518:a850:746:13b9:d630',1625502110,_binary '__ci_last_regenerate|i:1625502110;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('alf4gdffk94a22e4r4tcb2ge8698qpho','127.0.0.1',1630326376,_binary '__ci_last_regenerate|i:1630326376;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629373702\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('amu2g977fkaqrtff2f1ignnjcogugclh','127.0.0.1',1628334766,_binary '__ci_last_regenerate|i:1628334766;requested_page|s:28:\"admin/system_settings/boleto\";'),('aqdb50kktcadjvd586k9m28d789sp9mo','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625715911,_binary '__ci_last_regenerate|i:1625715911;'),('ars7n5lthk9o3aefb11nd95rie2h2sm5','127.0.0.1',1626255056,_binary '__ci_last_regenerate|i:1626255056;'),('asj0adbhgni2j5gvgvsjfj91ojrbmo8g','127.0.0.1',1630325536,_binary '__ci_last_regenerate|i:1630325536;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('b0bbrkl3med8qm9bbt87uo1v1820p1jg','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625713420,_binary '__ci_last_regenerate|i:1625713420;requested_page|s:5:\"admin\";'),('bhkuc3inh565u79jshba11l2nqf44ipj','127.0.0.1',1626990721,_binary '__ci_last_regenerate|i:1626990721;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626962308\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('bj5v2qseq6ns99pn9cktrk5kk0bse4n7','127.0.0.1',1631535223,_binary '__ci_last_regenerate|i:1631535223;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('bmfhekvdelk0lgam6gu7d8v4h8gkp4q9','127.0.0.1',1629167820,_binary '__ci_last_regenerate|i:1629167820;'),('c133hg17ndt5k1v3t6bfbh1tqerot06s','127.0.0.1',1630327366,_binary '__ci_last_regenerate|i:1630327366;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629373702\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('c383o8ec6eqkfgi4pirt6c7lknpm13f3','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625722296,_binary '__ci_last_regenerate|i:1625722286;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625718831\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('c3ingt2th3uvtkrn3fla182hgvt7e7l4','127.0.0.1',1631535836,_binary '__ci_last_regenerate|i:1631535836;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('c59a0lbegbek1jnjokkfivlk3cgc6pe2','127.0.0.1',1631561155,_binary '__ci_last_regenerate|i:1631561155;requested_page|s:31:\"admin/system_settings/tax_rates\";'),('c5pbup6td4eackp58pgfcn43v4sfm945','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625710280,_binary '__ci_last_regenerate|i:1625710280;'),('c736pjfcg3sq0vacos7605gdm0ko8lbf','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625709277,_binary '__ci_last_regenerate|i:1625709277;'),('cijrdl287kds57leduahenmip85a4gb7','127.0.0.1',1625830370,_binary '__ci_last_regenerate|i:1625830370;'),('d3njravgeuep75sr3uig8aq1imk2b30p','127.0.0.1',1626348551,_binary '__ci_last_regenerate|i:1626348551;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626255057\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626344047;'),('d4vqcg6cjh8gd2nr2l6euh9e0e1uo7aq','127.0.0.1',1628246872,_binary '__ci_last_regenerate|i:1628246872;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628246684;'),('d61ppr6a9ldjh9dt1d95ol5136n4jb12','127.0.0.1',1631532341,_binary '__ci_last_regenerate|i:1631532341;requested_page|s:31:\"admin/system_settings/tax_rates\";'),('d73rosn5rvumehvr79l4tg31727cudum','127.0.0.1',1632058442,_binary '__ci_last_regenerate|i:1632058419;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632056941;'),('deh039e183nag4i6c0tecmbnmn33c77l','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625248781,_binary '__ci_last_regenerate|i:1625248781;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('dgdkqjbbsu68h0u6ef22og8oll7594lo','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625252750,_binary '__ci_last_regenerate|i:1625252750;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('diqm6funf0eaam25us9gc8vcso4ekibf','127.0.0.1',1625761513,_binary '__ci_last_regenerate|i:1625761513;'),('dmchfvk3btg1601hjuhr5o3f053c53eg','127.0.0.1',1631623600,_binary '__ci_last_regenerate|i:1631623600;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('dos1h31qgevq2rc6u3qdksea83t060pj','127.0.0.1',1626947991,_binary '__ci_last_regenerate|i:1626947991;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626442528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('duuiecrgjs50ks2ujbn1vvh6vfd2mpju','127.0.0.1',1631616538,_binary '__ci_last_regenerate|i:1631616538;requested_page|s:15:\"admin/customers\";'),('e2bd1of032folb3or79d754tastpoggk','127.0.0.1',1626202673,_binary '__ci_last_regenerate|i:1626202605;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626098619\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('e3mk6huakkfdih0o3ritubqk0i8ckk9n','127.0.0.1',1627555022,_binary '__ci_last_regenerate|i:1627555022;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('e4dmse47ins6ilrp584gjt1nl6u7fmdc','127.0.0.1',1626962217,_binary '__ci_last_regenerate|i:1626962217;requested_page|s:13:\"cart/checkout\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('e6im0ifkp2m1dclv05jklecue8crj0d9','127.0.0.1',1626442576,_binary '__ci_last_regenerate|i:1626442576;'),('e997tq50s9ctjtdmp8elcm7njbddqrnh','127.0.0.1',1631550843,_binary '__ci_last_regenerate|i:1631550641;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631529390\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('edehlpj44acb5adhen24knvjd77ujga6','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625715258,_binary '__ci_last_regenerate|i:1625715257;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625597872\";last_ip|s:36:\"2804:7f2:298d:9518:c9a1:39ac:f6:3fc0\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('eeauu6bggq1gp8a7j12igscc7jdkjoff','10.10.10.31',1625513531,_binary '__ci_last_regenerate|i:1625513531;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('eee8159eofkm0doit4517pr1rq09em0u','127.0.0.1',1631561864,_binary '__ci_last_regenerate|i:1631561864;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631548058\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('eenv42uegliuffhvd1d5ngmbbbv60gee','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625245352,_binary '__ci_last_regenerate|i:1625245352;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('ej7v59almbsd8h9uddbvr4ng9h5q48cc','127.0.0.1',1628247910,_binary '__ci_last_regenerate|i:1628247910;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628247160;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('envcj8th73e7r5csunboiei8dvl11ffi','127.0.0.1',1629318942,_binary '__ci_last_regenerate|i:1629318942;'),('er99eb441pm0nnoqg6ckegeell97jh53','127.0.0.1',1629318942,_binary '__ci_last_regenerate|i:1629318942;'),('euk4a25c9rr8ucd26pg268qkvdg88f89','127.0.0.1',1626261018,_binary '__ci_last_regenerate|i:1626261018;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626255764;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('f0o3pdem9ivo4gi16ph434m5qg9ob394','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625710755,_binary '__ci_last_regenerate|i:1625710755;'),('f12n3gvjhelojjanj4brhv976es7iiit','127.0.0.1',1631618299,_binary '__ci_last_regenerate|i:1631618299;requested_page|s:15:\"admin/customers\";'),('f6mtbnm5v6dvue47bjl4n38234su04qg','127.0.0.1',1626962383,_binary '__ci_last_regenerate|i:1626962383;'),('fhlsda81k4gve4eg8kdopg6kl740k204','2804:7f2:298d:9518:a850:746:13b9:d630',1625510675,_binary '__ci_last_regenerate|i:1625510675;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('flmh7srekd5lfjc0uorb5s85p5eisfbv','127.0.0.1',1629379607,_binary '__ci_last_regenerate|i:1629379607;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629317156\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('fpsesh4irn1e6ks11j6ohlguun2fhelm','127.0.0.1',1626257217,_binary '__ci_last_regenerate|i:1626257217;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626255764;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";error|s:114:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/nfe/tst.php\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('fsl0da08j74coaeuc1v62rkvokjbta2d','10.10.10.31',1625508987,_binary '__ci_last_regenerate|i:1625508987;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('fvms74b1bbs394pptafvlt3j3aukjbco','127.0.0.1',1631618335,_binary '__ci_last_regenerate|i:1631618335;requested_page|s:15:\"admin/customers\";'),('g8gb53p834mvu457ttkefoghujoelpki','127.0.0.1',1626988027,_binary '__ci_last_regenerate|i:1626988027;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626962308\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('ge1llud1vi4dmr81n06cr5svouus719g','127.0.0.1',1626962462,_binary '__ci_last_regenerate|i:1626962217;requested_page|s:13:\"cart/checkout\";identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626961965\";last_ip|N;avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('gm2seavrj9g7d1ano2nm8lqdjngdlc0p','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625725923,_binary '__ci_last_regenerate|i:1625725634;requested_page|s:11:\"shop/orders\";identity|s:8:\"rafaelvc\";username|s:8:\"rafaelvc\";email|s:28:\"rafael.sabino@hotmail.com.br\";user_id|s:1:\"3\";old_last_login|s:10:\"1625724865\";last_ip|N;avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"5\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('gn4kkprj6obajf38tocscpt3ih7b16o4','127.0.0.1',1627827808,_binary '__ci_last_regenerate|i:1627827808;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('gob503b30hedmq666fgsb0vrf3mj3c84','127.0.0.1',1626262026,_binary '__ci_last_regenerate|i:1626262026;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";'),('gpcadqmo3gtthldb9r64srdnv4hutq52','127.0.0.1',1625761821,_binary '__ci_last_regenerate|i:1625761821;'),('gtp32m0psvoo3t98odl977ecb5m96473','127.0.0.1',1630326901,_binary '__ci_last_regenerate|i:1630326901;'),('gtrmjenktq00jgrhjvle6fobvth5ievt','127.0.0.1',1629321559,_binary '__ci_last_regenerate|i:1629321559;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629168153\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('gv9lsj8d81gnkagso42vnfvke3tc2s1s','127.0.0.1',1629168142,_binary '__ci_last_regenerate|i:1629168142;'),('h146ltefsl7k58luu10dv5vr848vr9ni','127.0.0.1',1631815899,_binary '__ci_last_regenerate|i:1631815722;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631614086\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('h1cf2c90hc9rledm8lh9304oabd8et8g','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625714556,_binary '__ci_last_regenerate|i:1625714556;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625597872\";last_ip|s:36:\"2804:7f2:298d:9518:c9a1:39ac:f6:3fc0\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('h1gre8ftdm3q1kkjhv76igjrr2au139a','127.0.0.1',1631619048,_binary '__ci_last_regenerate|i:1631619048;requested_page|s:15:\"admin/customers\";'),('h87is17188ln5hmie970gk9akf76fsdk','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625239814,_binary '__ci_last_regenerate|i:1625239814;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('h9rnoejp575eii2i2ui1fjvmq4mp477o','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625261591,_binary '__ci_last_regenerate|i:1625261589;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625253140\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('havo95frp73rl0ahe4vj2fj74e4rse4l','127.0.0.1',1630116881,_binary '__ci_last_regenerate|i:1630116877;'),('hicmma8dvmk9d04efvqo83kkfvt3ulj7','127.0.0.1',1631619369,_binary '__ci_last_regenerate|i:1631619369;requested_page|s:15:\"admin/customers\";'),('hnklpho7fhnj5anurmltttfkpu2n5svh','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625245049,_binary '__ci_last_regenerate|i:1625245049;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625243954;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('hpk7k8dvvr1cd1j8dtp3j1g5c3bsna4b','127.0.0.1',1627556191,_binary '__ci_last_regenerate|i:1627556191;'),('hqk49ctk61m7m3appgq59k5n80jgd14p','127.0.0.1',1630328058,_binary '__ci_last_regenerate|i:1630328058;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629373702\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('hu1askal6n3grue9g39t37b5sfe02m87','127.0.0.1',1632056898,_binary '__ci_last_regenerate|i:1632056898;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632056201;'),('hughrdbgl3q7m2eroabf14qmhqp95a4i','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625715604,_binary '__ci_last_regenerate|i:1625715604;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625493425\";last_ip|s:1:\"?\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('hur1f7e75a5j0ddpu3lup6tv3t99g7vm','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249229,_binary '__ci_last_regenerate|i:1625249229;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('i1715bsh97s4pgnr3r55sbrf1t2p1lu4','127.0.0.1',1626104333,_binary '__ci_last_regenerate|i:1626104333;requested_page|s:13:\"shop/products\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625719116\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626100543;'),('i383eace1jso4lbm9m2klfk4vsm6n5oc','127.0.0.1',1626442743,_binary '__ci_last_regenerate|i:1626442457;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626343942\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626442713;'),('i45a68foddgh9bcifk2s28g9pl71i6sn','127.0.0.1',1626962384,_binary '__ci_last_regenerate|i:1626962384;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('i55mk696etaem2vch4od8d4dhu96bius','127.0.0.1',1628249417,_binary '__ci_last_regenerate|i:1628249417;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628247160;'),('ib4c7m3m63piduj1mdq98btdl37gh9m9','127.0.0.1',1626267421,_binary '__ci_last_regenerate|i:1626267298;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('ibge4pkgt8oqg915o0eu50ee05o29j8p','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625722781,_binary '__ci_last_regenerate|i:1625722781;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625717353\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('ic5dfte42o8jjnglusvj2qk41n6kptk8','127.0.0.1',1627385993,_binary '__ci_last_regenerate|i:1627385993;'),('iejjcl12h83bmhkjfgshchc985ou77f6','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625252281,_binary '__ci_last_regenerate|i:1625252281;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('imlg4hphp9p3q41nhfp14pjevr0c0491','127.0.0.1',1631628314,_binary '__ci_last_regenerate|i:1631628304;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('io27v6v3v1b7p10r8kque1s7svf85o52','127.0.0.1',1631624267,_binary '__ci_last_regenerate|i:1631624267;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('ipgphcrjuj2p41tso6f9p6nr294v22a0','127.0.0.1',1631537772,_binary '__ci_last_regenerate|i:1631537772;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('iu5ssemmchij7qfbttesqfqc6hh8emmd','127.0.0.1',1632086775,_binary '__ci_last_regenerate|i:1632086775;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632068467\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('iudp2uhn3k8sheub92kc4sjqajpde92r','127.0.0.1',1627562693,_binary '__ci_last_regenerate|i:1627562693;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('iuu3al121j27mlfba7015uqnr6anjqt3','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625241109,_binary '__ci_last_regenerate|i:1625241109;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('iv24hlm8rmnc21r46ca5lap0tpb9u3gi','127.0.0.1',1631622587,_binary '__ci_last_regenerate|i:1631622587;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('j626gihm7jdllg1dnu51dessrb6qu6p0','127.0.0.1',1631614808,_binary '__ci_last_regenerate|i:1631614808;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('j9up32fskvu6vo7tjbudi4ljmkbq4hgu','2804:7f2:298d:9518:c9a1:39ac:f6:3fc0',1625597873,_binary '__ci_last_regenerate|i:1625597864;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625597829\";last_ip|s:36:\"2804:7f2:298d:9518:c9a1:39ac:f6:3fc0\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('ja8okrc34pl8qulgc3ie4l9knaaal8q3','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625243755,_binary '__ci_last_regenerate|i:1625243755;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625238392\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625241608;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('jc9vma5265cfk3cm7c81qr61keue4qdr','127.0.0.1',1626960447,_binary '__ci_last_regenerate|i:1626960447;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626947991\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626960286;requested_page|s:13:\"cart/checkout\";error|s:72:\"Mail Error: <strong>Could not instantiate mail function.</strong><br />\n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('jd53rlfhl0foh0skaglkaqobfdbmm66n','127.0.0.1',1626258105,_binary '__ci_last_regenerate|i:1626258105;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626255764;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";error|s:119:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/nfe/xml-nfce.php\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('jh0hr6bs3qqf8fjcnlmrrm5rucq0vkus','127.0.0.1',1627827831,_binary '__ci_last_regenerate|i:1627827808;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627645046\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('jju3nhf0lqf91esosd07j2j64n3242ri','127.0.0.1',1630958672,_binary '__ci_last_regenerate|i:1630958671;'),('jk0ncshvmmfotp5s5qb6t4ruirm35aek','127.0.0.1',1628244659,_binary '__ci_last_regenerate|i:1628244659;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628243856;__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('jl8rcd8ki8psdh43p7slkpdbko54bbgo','127.0.0.1',1626262885,_binary '__ci_last_regenerate|i:1626262885;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";'),('jongrsvr2fdpalm99mv1hgi9m8f88ao6','127.0.0.1',1631537399,_binary '__ci_last_regenerate|i:1631537399;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('k1l2t7g60fr3tkdf7tkog4ebi8aunr8c','127.0.0.1',1627558037,_binary '__ci_last_regenerate|i:1627558037;'),('k59ruu5qf4r3fts9h4i7spolht27oj2p','10.10.10.31',1625257515,_binary '__ci_last_regenerate|i:1625257448;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625257511;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('k5dleddtsdesgnkpupbk5m66gi5j6gml','127.0.0.1',1631562910,_binary '__ci_last_regenerate|i:1631562910;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631548058\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('k7cbglkrlotulpf3iteg56n86aa8teet','127.0.0.1',1626986873,_binary '__ci_last_regenerate|i:1626986873;'),('k7hqf9guu35bfpf11j1ogqnps0u5hqrm','2804:7f2:298d:9518:a850:746:13b9:d630',1625510260,_binary '__ci_last_regenerate|i:1625510260;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('k80e3c9l68doscuko4kncn5dg9f03kms','127.0.0.1',1626442576,_binary '__ci_last_regenerate|i:1626442576;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('k89ncs4621onj3e0f5ad872r414kt29o','127.0.0.1',1626099435,_binary '__ci_last_regenerate|i:1626099435;requested_page|s:13:\"shop/products\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625719116\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('k8lu3udk8b102jh0qm8vcb2rrfron9mc','127.0.0.1',1628332493,_binary '__ci_last_regenerate|i:1628332493;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('k9mqvag435t11blsfas1lci0s8sbutq3','127.0.0.1',1631627944,_binary '__ci_last_regenerate|i:1631627944;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('kcl7b6rlhtanjka4jop8tde9mhvfmjt9','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625240420,_binary '__ci_last_regenerate|i:1625240420;identity|s:18:\"owner@tecdiary.com\";username|s:5:\"owner\";email|s:18:\"owner@tecdiary.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1625235637\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625239148;'),('kfr26qnc5i8b8ge00lqljpc81npjpgbo','127.0.0.1',1628334945,_binary '__ci_last_regenerate|i:1628334748;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"emzt2OhgY7rCipyK8aSq\";'),('ko6qa5cvlitc9jiugsf7tlq767nas1oj','127.0.0.1',1626213828,_binary '__ci_last_regenerate|i:1626213823;requested_page|s:11:\"admin/sales\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('ku7fg8nnllkto3l4s3otebqa4iefqc6a','127.0.0.1',1626431517,_binary '__ci_last_regenerate|i:1626431517;error|s:128:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/nfe/xml-nfce.php?pedido=1\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('l393bcoa7jv4m7hhaftdsh0h554erlhb','127.0.0.1',1626255735,_binary '__ci_last_regenerate|i:1626255735;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('l43386m2rjg0hdrso88l1qremijnfes5','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625246023,_binary '__ci_last_regenerate|i:1625246023;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('l4b6mh70pgkmbab1foq7klb06ea8b013','127.0.0.1',1626986873,_binary '__ci_last_regenerate|i:1626986873;'),('l6hhb3adev9ln6tpu8hsk2h3aubijp07','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625712041,_binary '__ci_last_regenerate|i:1625712041;'),('l8l7lafd41nqr0iogj2miasf5tovrtph','127.0.0.1',1631615667,_binary '__ci_last_regenerate|i:1631615667;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('lcuj4cals1jpkh6683kkr7lq56s7cpjv','127.0.0.1',1628245334,_binary '__ci_last_regenerate|i:1628245334;requested_page|s:5:\"admin\";'),('leimc6e7jgh1n1st0iqih0mlceqejq2m','10.10.10.31',1625513833,_binary '__ci_last_regenerate|i:1625513832;requested_page|s:13:\"cart/checkout\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('lenj067810iqpqp5m9dnhurnqishsvst','127.0.0.1',1626264583,_binary '__ci_last_regenerate|i:1626264583;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('lhbnfkb6hsfv9geqjp5vanmhqgr576bh','127.0.0.1',1628160920,_binary '__ci_last_regenerate|i:1628160920;'),('lhg6h3d22ocseeh87ghdno5f6n30476g','127.0.0.1',1628344493,_binary '__ci_last_regenerate|i:1628344493;requested_page|s:28:\"admin/system_settings/boleto\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628332165\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('li9hgne8ok9hqe0hfno9ahsp0hpkk0s1','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625257448,_binary '__ci_last_regenerate|i:1625257448;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('lk9kfdehhcqj84gi5lov352gh4rrm7g1','127.0.0.1',1627385993,_binary '__ci_last_regenerate|i:1627385993;'),('llj8aq112umtg08l7g634g88apui3vg8','127.0.0.1',1630327644,_binary '__ci_last_regenerate|i:1630327644;'),('lohpu3ri3bre7p5b7k3kprd2q3r26p9j','127.0.0.1',1632070903,_binary '__ci_last_regenerate|i:1632068448;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632056060\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('lpo52t7aunu43tvt8mn3k23klhqb5o3f','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625709935,_binary '__ci_last_regenerate|i:1625709935;'),('lq2l97qovest6ngfpr9ci6lfvc27obic','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625718599,_binary '__ci_last_regenerate|i:1625718599;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625715300\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('m0mc6cnithaf2c59n4bgd6mjhl8p36km','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625252926,_binary '__ci_last_regenerate|i:1625252750;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";user_csrf|s:20:\"fxv24jpcHPBYTr0tyQmg\";'),('m0rpm962gvlmhdq1b0r0t7m3ocr3cqf7','127.0.0.1',1631623277,_binary '__ci_last_regenerate|i:1631623277;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('m20r8fs9lif1jtvqpu79tqcdb9vrv25f','127.0.0.1',1626261591,_binary '__ci_last_regenerate|i:1626261591;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261044;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";'),('m2gf5rpu85kqqck75i3n0u3cqp1fmsj6','127.0.0.1',1631537157,_binary '__ci_last_regenerate|i:1631537157;requested_page|s:31:\"admin/system_settings/tax_rates\";'),('m5pgnc04j9ra2fsp0i596s8dfv8ugace','127.0.0.1',1626259420,_binary '__ci_last_regenerate|i:1626259420;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('m83ac4qnhndmmb9upgf1uc2g8td5efuj','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625713755,_binary '__ci_last_regenerate|i:1625713755;requested_page|s:5:\"admin\";'),('m8hi2fvjde0iplaoajbgmsg6qdju89f2','127.0.0.1',1626101433,_binary '__ci_last_regenerate|i:1626101433;requested_page|s:13:\"shop/products\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625719116\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626100543;csrfkey|s:8:\"oSuybeOX\";__ci_vars|a:2:{s:7:\"csrfkey\";s:3:\"new\";s:9:\"csrfvalue\";s:3:\"new\";}csrfvalue|s:20:\"qBf2EmYzX5LVWiR6hFde\";'),('me1j7br6a43odmuod7hks03mu9qksri4','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625253742,_binary '__ci_last_regenerate|i:1625253742;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625253168;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";'),('mh5nhfnvghqi140l15tilduovd0bepbv','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625725634,_binary '__ci_last_regenerate|i:1625725634;requested_page|s:11:\"shop/orders\";identity|s:8:\"rafaelvc\";username|s:8:\"rafaelvc\";email|s:28:\"rafael.sabino@hotmail.com.br\";user_id|s:1:\"3\";old_last_login|s:10:\"1625724865\";last_ip|N;avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"5\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('mighca4mpefne3qusgv7794v1abhr106','127.0.0.1',1629165655,_binary '__ci_last_regenerate|i:1629165655;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('mkgj41g6ilrsomsk23a3143aq0vbi71h','127.0.0.1',1626259058,_binary '__ci_last_regenerate|i:1626259058;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626255764;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";error|s:182:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/nfe/libs/DanfeNFCe.php?nfe=nfce35210736665277000180650010000000001834663021.xml\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('mmdeivjs5rrt5ac9m9t9lijn1bqtdtkd','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249532,_binary '__ci_last_regenerate|i:1625249532;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('mnglbhshnp71k5pkdism98565pq095gm','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625718914,_binary '__ci_last_regenerate|i:1625718817;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625718694\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('mpc9j571scceg70fgk2257516itub9sm','127.0.0.1',1626987216,_binary '__ci_last_regenerate|i:1626987216;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626962308\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('mq3ujm3gb6j9pqi1jl9ktm2hecojpev7','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625717328,_binary '__ci_last_regenerate|i:1625717328;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625493425\";last_ip|s:1:\"?\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('mu9qhajjr2n1vnmh9bctkbcprda5o4af','2804:7f2:298d:9518:a850:746:13b9:d630',1625511512,_binary '__ci_last_regenerate|i:1625511512;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('mv7lrmnhl72h7t4ajk8m2nr218hic66k','127.0.0.1',1628161731,_binary '__ci_last_regenerate|i:1628161528;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626959800\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628161730;'),('mvdq31f14pi5qkv3o1vi843d4u0dhlf8','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625254073,_binary '__ci_last_regenerate|i:1625254073;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('n1ff2n2p5qsc0b8popkcr2mug1vt6s9r','127.0.0.1',1631550825,_binary '__ci_last_regenerate|i:1631550641;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631529390\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('n5n145unnqq29av4fg1gqg3je9nasgiq','127.0.0.1',1628294465,_binary '__ci_last_regenerate|i:1628294465;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628244511\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('n5qk8mpc9akugohv4nca79slumgt38m4','127.0.0.1',1632058099,_binary '__ci_last_regenerate|i:1632058099;requested_page|s:21:\"admin/system_settings\";'),('n64ks3mu7irao7of3f0r4s18o09p1fkp','127.0.0.1',1628248848,_binary '__ci_last_regenerate|i:1628248848;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628247160;'),('n882qsb77um6v2apvlqtacbbtt42qecn','127.0.0.1',1632057520,_binary '__ci_last_regenerate|i:1632057520;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632056941;'),('n8shk8dm1qe81jm5pon9fk0vkbika3fo','127.0.0.1',1626259362,_binary '__ci_last_regenerate|i:1626259362;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('ncodo8h7i06iia3jftkntr42b44kvgni','127.0.0.1',1626255386,_binary '__ci_last_regenerate|i:1626255386;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('nctahf6h817dmdh9rchvu3d8rl76h1iu','127.0.0.1',1631627473,_binary '__ci_last_regenerate|i:1631627473;requested_page|s:21:\"admin/system_settings\";'),('nf2vf6d6pn99cghran3gb7ta6lccc3at','127.0.0.1',1628334379,_binary '__ci_last_regenerate|i:1628334379;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"emzt2OhgY7rCipyK8aSq\";'),('nhb67to31hi9jull1tig3pfcv5ul8tp3','127.0.0.1',1625762269,_binary '__ci_last_regenerate|i:1625762181;'),('nidq5k2ceudfj5qui8efu61543jc5vv8','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625718800,_binary '__ci_last_regenerate|i:1625718618;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625713768\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('niqi0o8tdc49810ueo2eoksdbtmndrh7','127.0.0.1',1630921923,_binary '__ci_last_regenerate|i:1630921782;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1630414983\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";error|s:103:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('nkvlqlcqur3coe94v111jt2vu3n5t4eq','127.0.0.1',1626988740,_binary '__ci_last_regenerate|i:1626988740;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626962308\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('nmhs6qilak78hl40ampe7b6to0n2c9ir','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625244746,_binary '__ci_last_regenerate|i:1625244746;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625243954;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('nq0tu0pc3b7bm75ql0v11ouvh0i0kpei','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625250021,_binary '__ci_last_regenerate|i:1625250021;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('nrm5a2qdpkp9j3ksobr73tbnfnscgthu','127.0.0.1',1632058087,_binary '__ci_last_regenerate|i:1632058087;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632056941;'),('o2h6lrnbbkrcm32r9v7sva09mcjjr2cl','127.0.0.1',1629164601,_binary '__ci_last_regenerate|i:1629164601;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('o36lvlovgrfh5uh03l6o5k4pn7gtp6am','127.0.0.1',1631530724,_binary '__ci_last_regenerate|i:1631530724;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('o5j4cfeka1afbtq2s63qn04a2gfcsi5r','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625712368,_binary '__ci_last_regenerate|i:1625712368;requested_page|s:13:\"shop/products\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('oa4jau7gj07jaquo97sphq0l4aht5tle','127.0.0.1',1628333170,_binary '__ci_last_regenerate|i:1628333170;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('og61tl0atpp8cu4njjj8fmndu8utk5vc','127.0.0.1',1630326901,_binary '__ci_last_regenerate|i:1630326901;'),('ohplm7hr6esp902aukjh25lshmtoh4ki','127.0.0.1',1625760530,_binary '__ci_last_regenerate|i:1625760530;'),('okk2v2dh4qr5fq7g8i134pvv0g6oh2rf','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625261589,_binary '__ci_last_regenerate|i:1625261589;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625253140\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('okng9vnhvrjqcvbtl970nvd00c7s4pep','127.0.0.1',1628348919,_binary '__ci_last_regenerate|i:1628348919;requested_page|s:28:\"admin/system_settings/boleto\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628332165\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('oll57kii0moc2u16us9eojc5eav5c4t5','127.0.0.1',1629245185,_binary '__ci_last_regenerate|i:1629245185;'),('ommhq0j12l3eo9it3b79plugog2cl2at','127.0.0.1',1628247182,_binary '__ci_last_regenerate|i:1628247182;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628247160;'),('ovc9icn5qp2e6h9eu7jll06s6hrg6f64','127.0.0.1',1626990722,_binary '__ci_last_regenerate|i:1626990721;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626962308\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('p1huqkco6l79fj61nb1rbr2fr8paequs','127.0.0.1',1629168364,_binary '__ci_last_regenerate|i:1629168142;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629167212\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('pacfrshsmp1msmkulqikan2987nhfpal','127.0.0.1',1628249417,_binary '__ci_last_regenerate|i:1628249417;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628247160;'),('pbuph3llvlhnb9fkpal46b7jleqdkd8n','127.0.0.1',1626962462,_binary '__ci_last_regenerate|i:1626962462;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('pgjlftsb2ig89bhipp3dpb8s6p2jub06','127.0.0.1',1626442577,_binary '__ci_last_regenerate|i:1626442577;'),('pk9c9qob56kms0ck237d4m0g21rmjovf','127.0.0.1',1630415434,_binary '__ci_last_regenerate|i:1630415434;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1630325549\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";error|s:137:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/boleto/sicoob/boleto_sicoobnet.php\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('q2b45arc40hmls0h404gi31i4uvudp8b','127.0.0.1',1627566769,_binary '__ci_last_regenerate|i:1627566475;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('q2u89efakf099arq6rt1k04rj4dla1jt','127.0.0.1',1631537089,_binary '__ci_last_regenerate|i:1631537089;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('q3upv3lq0q2od4ka2ita6cqnf4stvkla','127.0.0.1',1628292413,_binary '__ci_last_regenerate|i:1628292413;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628244511\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('q5lgvc93e34mqjnk6t7bmojj6tjrg558','127.0.0.1',1630328058,_binary '__ci_last_regenerate|i:1630328058;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629373702\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('qaa62fl9gcg736hi3hhq2euk6otrtdg9','127.0.0.1',1631550213,_binary '__ci_last_regenerate|i:1631550213;requested_page|s:31:\"admin/system_settings/tax_rates\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631529390\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('qb8mtau13vbrmrvot69adj08c71f8g9q','127.0.0.1',1628294620,_binary '__ci_last_regenerate|i:1628294465;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628244511\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('qi5ug4hvla557v64el9m6pqtj7pqifk3','127.0.0.1',1627383034,_binary '__ci_last_regenerate|i:1627383034;'),('qmme9h4q5ekmfu23n02r3j4c902khabt','127.0.0.1',1628294155,_binary '__ci_last_regenerate|i:1628294155;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628244511\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('qnltgcs4h1tp4eh9mfliu6p1mm8agj9o','2804:7f2:298d:9518:f8a3:a9b2:de40:9858',1625254990,_binary '__ci_last_regenerate|i:1625254990;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625252814\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625254015;user_csrf|s:20:\"DZGlR13PaAHcWS8e5Oq4\";register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";requested_page|s:13:\"shop/products\";'),('qq53flg1mg7vn73jb5fp36nn4pu3vd75','127.0.0.1',1626431517,_binary '__ci_last_regenerate|i:1626431517;'),('qripsm9d6b5d4aiv8n5aq372i5ve52qp','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625249412,_binary '__ci_last_regenerate|i:1625249243;'),('qsdnugshn4jhivvji1eoot4krpe2i4ii','127.0.0.1',1628350031,_binary '__ci_last_regenerate|i:1628350031;requested_page|s:28:\"admin/system_settings/boleto\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628332165\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('r4j7qp8ctu76g5t7oodrjnf3sqp697u7','127.0.0.1',1628284569,_binary '__ci_last_regenerate|i:1628284562;requested_page|s:5:\"admin\";'),('r5i1u0ng8vtrsi8q7cuq2n9kp38s4qna','127.0.0.1',1627564585,_binary '__ci_last_regenerate|i:1627564585;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('r64hccbtqk68cut7k31nucms6i5938on','127.0.0.1',1631616019,_binary '__ci_last_regenerate|i:1631616019;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('r6ielg9lbqv6k7f9ip5ksc6lbp4kgs9g','127.0.0.1',1628333547,_binary '__ci_last_regenerate|i:1628333547;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628291989\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('r88l4juj030uhdmbj2t8k143hmb410t8','127.0.0.1',1625760443,_binary '__ci_last_regenerate|i:1625760443;'),('r8khn5rl28l97aokni68d7bh1nliq40i','127.0.0.1',1626989607,_binary '__ci_last_regenerate|i:1626989607;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626962308\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('r9b0sa19r3n0u62ve9aqfu6nr3ehmnsd','127.0.0.1',1630327060,_binary '__ci_last_regenerate|i:1630327060;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629373702\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('rbv2q0j0krdatbj7e7b6ie539tg9bo49','127.0.0.1',1631529832,_binary '__ci_last_regenerate|i:1631529832;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('rl61jm4o5qhdoto5c3pg6u8jlm0rtncj','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625725129,_binary '__ci_last_regenerate|i:1625725129;requested_page|s:4:\"cart\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('rmfg482n1ks7jsjvnlu8g3v41h5bpsha','127.0.0.1',1626962462,_binary '__ci_last_regenerate|i:1626962462;'),('rmmh68aqm52ao2m3brorq6hdha129210','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625711120,_binary '__ci_last_regenerate|i:1625711120;'),('ro2tjt36eaqc7mrm205n1hdika84flt0','127.0.0.1',1632098430,_binary '__ci_last_regenerate|i:1632098430;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632068467\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632096640;'),('rpuo9qr7i2mnn2ihjtlnm63ihhoa73tt','127.0.0.1',1629166016,_binary '__ci_last_regenerate|i:1629166016;__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('ru1ct4vvbrkvta54lo44c1j6dn9oek7r','127.0.0.1',1627385977,_binary '__ci_last_regenerate|i:1627385977;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('s1nkoi67qusfobncpmopks59t537r60p','127.0.0.1',1626259355,_binary '__ci_last_regenerate|i:1626259355;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('s70eeg8m1e7hjshcua0phppiarkee7ul','127.0.0.1',1632094867,_binary '__ci_last_regenerate|i:1632094867;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632068467\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632089847;'),('saikipph3c9gqhkeca7m648p2u6oc3l1','127.0.0.1',1630324068,_binary '__ci_last_regenerate|i:1630324068;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('scvbsg064s1rd978fo7bh95452du7ugf','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625717329,_binary '__ci_last_regenerate|i:1625717328;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625493425\";last_ip|s:1:\"?\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('sgl2j34gubrd0kp541i65dfc6pfgouam','127.0.0.1',1628244204,_binary '__ci_last_regenerate|i:1628244204;requested_page|s:21:\"admin/system_settings\";'),('sj8augrer6hdjuai8pkh638mp4m5bht5','127.0.0.1',1632057211,_binary '__ci_last_regenerate|i:1632057211;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631975166\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632056941;'),('so8tjfk3ukgdo7kinudfnof4bp9jqcmi','127.0.0.1',1631535532,_binary '__ci_last_regenerate|i:1631535532;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('sqhvq07ou3arqiam6520t793ro35s2no','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625716217,_binary '__ci_last_regenerate|i:1625716217;requested_page|s:13:\"shop/products\";'),('st0m8ba9sb1dmoluuo5fv6b79a91q8p5','127.0.0.1',1625832539,_binary '__ci_last_regenerate|i:1625832539;'),('sthf8rdgb8ntknimqmpu22l6cld0p8hh','10.10.10.31',1625498371,_binary '__ci_last_regenerate|i:1625498371;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('sugn18gorcodb6rba0dldrub9m0sc9sv','127.0.0.1',1632098430,_binary '__ci_last_regenerate|i:1632098430;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632068467\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632096640;error|s:97:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>admin/system_settings\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('sv08ek8ka9k7u1k6ud3dtgcnkqu70gc3','127.0.0.1',1631628304,_binary '__ci_last_regenerate|i:1631628304;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('t0cvsrk4c18tmirrihrfn23tkklt9md0','127.0.0.1',1631815722,_binary '__ci_last_regenerate|i:1631815722;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631614086\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";error|s:120:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/nfe/certificados/\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('t1gf7ru77thqfm3qq9vdnd8g4fr0dthg','127.0.0.1',1632096640,_binary '__ci_last_regenerate|i:1632096640;requested_page|s:21:\"admin/system_settings\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1632068467\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1632094867;'),('t6i3q7oqlchhlnt3b8io1q27v3kbeehc','127.0.0.1',1627563621,_binary '__ci_last_regenerate|i:1627563621;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('t9bkrfvpo0e8iik32jefci64nsvb1pad','127.0.0.1',1631532163,_binary '__ci_last_regenerate|i:1631532163;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1629165217\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1631529452;'),('tc90ikhh8k6clu0ujn6gpqi8ho4kapoa','127.0.0.1',1626962384,_binary '__ci_last_regenerate|i:1626962384;'),('te6brtcmves216pifkpkl5905b10flsf','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625247639,_binary '__ci_last_regenerate|i:1625247639;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625246857;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('thn5c81ompmci1sgnd8s5gsm9nu85rpn','127.0.0.1',1626348551,_binary '__ci_last_regenerate|i:1626348551;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626255057\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626344047;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('tlp8rriiqajicco0d6h7dbmsvgtuhe5o','127.0.0.1',1628245335,_binary '__ci_last_regenerate|i:1628245335;'),('tpv7183gfetgq585aaofbuip6jt8fsel','127.0.0.1',1630327644,_binary '__ci_last_regenerate|i:1630327644;'),('tsd98v6b4mnu5tqlp0ssdsup3jc12kud','127.0.0.1',1626345283,_binary '__ci_last_regenerate|i:1626345283;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626255057\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626344047;'),('tt1tssbd7kf18nbtrk2hsnunge2du95a','10.10.10.31',1625513832,_binary '__ci_last_regenerate|i:1625513832;requested_page|s:4:\"cart\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('u2o74gir7chf3rnk2hgtt4qpe3ve7va3','127.0.0.1',1629319081,_binary '__ci_last_regenerate|i:1629319081;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629168153\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";error|s:135:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>http://stock.localhost.com/boleto/sicoob/boleto_bancoob.php\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),('u4jeebm0fnrn93h1m791gfl79neak3qv','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625722286,_binary '__ci_last_regenerate|i:1625722286;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625718831\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('u8dbbvt89dh36k186s1sog9vr6biqpul','127.0.0.1',1627563505,_binary '__ci_last_regenerate|i:1627563505;'),('uabqdk64ldept59938lj8j68jcovj1c3','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625721845,_binary '__ci_last_regenerate|i:1625721845;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625718831\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('uesuo973iribl71kmkfgl5ruhecpakvk','127.0.0.1',1627556089,_binary '__ci_last_regenerate|i:1627556089;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('ugs3jb8a1f13iqk05rfkpiuu7uft3ejm','127.0.0.1',1628349660,_binary '__ci_last_regenerate|i:1628349660;requested_page|s:28:\"admin/system_settings/boleto\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628332165\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('uhig2ief8fo9n2qo3cim2prs6sqjlamb','127.0.0.1',1626264894,_binary '__ci_last_regenerate|i:1626264894;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1626202669\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626261615;user_csrf|s:20:\"lpv9MZDQqHRz3oXWGN6n\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('uku2ocl1jpjhsuigdqi17o2u1ld9hknf','127.0.0.1',1631618788,_binary '__ci_last_regenerate|i:1631618788;requested_page|s:15:\"admin/customers\";'),('ulrlnbqt7ajf6mgu72bsl8g7r7gkq30m','2804:7f2:298d:9518:e927:8329:f0e7:dd8b',1625715257,_binary '__ci_last_regenerate|i:1625715257;requested_page|s:5:\"admin\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625597872\";last_ip|s:36:\"2804:7f2:298d:9518:c9a1:39ac:f6:3fc0\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('umevagku72vcq5etd1jksokuv35bvmv6','2804:7f2:298d:9518:a850:746:13b9:d630',1625511172,_binary '__ci_last_regenerate|i:1625511172;requested_page|s:5:\"admin\";identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625261122\";last_ip|s:38:\"2804:7f2:298d:9518:f8a3:a9b2:de40:9858\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('unf5cun834ulom9jro5jkk4e2fp5cjdm','127.0.0.1',1630321589,_binary '__ci_last_regenerate|i:1630321589;__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),('uqiog0btd8ch3fsv7bv3j714uov94p33','127.0.0.1',1629167185,_binary '__ci_last_regenerate|i:1629167185;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1628160941\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('urgk57ie3jti14e7ll3293hk8ag1dg79','127.0.0.1',1628245720,_binary '__ci_last_regenerate|i:1628245720;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628244754;'),('v0n8hukc7m4fhbrfn4p6ujrck29v5d76','127.0.0.1',1628244205,_binary '__ci_last_regenerate|i:1628244205;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1628243856;'),('v224ucb27lgprjj602ig3gnu9fl73v0a','127.0.0.1',1627645260,_binary '__ci_last_regenerate|i:1627645011;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627553703\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('v4eoga8dggkakki1esk5na9oonji2m59','127.0.0.1',1630327699,_binary '__ci_last_regenerate|i:1630327699;identity|s:23:\"flavianogjc@hotmail.com\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1629373702\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vbnge8ahq8e832ilegg4s79sav7gdn43','127.0.0.1',1627386319,_binary '__ci_last_regenerate|i:1627386319;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1626986632\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vcbujqes3k9043p16pja073j01h37f0r','127.0.0.1',1627563068,_binary '__ci_last_regenerate|i:1627563068;identity|s:8:\"flaviano\";username|s:8:\"flaviano\";email|s:23:\"flavianogjc@hotmail.com\";user_id|s:1:\"4\";old_last_login|s:10:\"1627380315\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"3\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|s:1:\"6\";show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vdmj8gpfopjfruo5ma8r4h6p3iqemufc','2804:7f2:298d:9518:652c:4a7:58c1:cba2',1625246549,_binary '__ci_last_regenerate|i:1625246549;identity|s:10:\"alliancets\";username|s:10:\"alliancets\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"1\";old_last_login|s:10:\"1625243776\";last_ip|s:37:\"2804:7f2:298d:9518:652c:4a7:58c1:cba2\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1625245228;register_id|s:1:\"1\";cash_in_hand|s:9:\"3000.0000\";register_open_time|s:19:\"2021-07-02 12:59:25\";'),('vem4cgu7r2i36okvk89c4iohbk2k97j0','127.0.0.1',1628243856,_binary '__ci_last_regenerate|i:1628243856;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628161528\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vggpafi2pk3i5seiouoagei642hroic9','127.0.0.1',1628348594,_binary '__ci_last_regenerate|i:1628348594;requested_page|s:28:\"admin/system_settings/boleto\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628332165\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vj2p3gadb4sai9fte1h658mm9smcv7e0','127.0.0.1',1626100450,_binary '__ci_last_regenerate|i:1626100450;requested_page|s:13:\"shop/products\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1625719116\";last_ip|s:38:\"2804:7f2:298d:9518:e927:8329:f0e7:dd8b\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1626100141;'),('vkpa1uugcs2otc6govmj6mbnbekaegsm','127.0.0.1',1631616472,_binary '__ci_last_regenerate|i:1631616472;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1631560969\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vnpdg70g7immm1ghsn0mr6s4d0fmrcf2','127.0.0.1',1628350031,_binary '__ci_last_regenerate|i:1628350031;requested_page|s:28:\"admin/system_settings/boleto\";identity|s:5:\"admin\";username|s:5:\"admin\";email|s:22:\"suporte@alliancets.dev\";user_id|s:1:\"2\";old_last_login|s:10:\"1628332165\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),('vr3i2eqksijfq7q57qn7ap1bui2o44pt','127.0.0.1',1625760756,_binary '__ci_last_regenerate|i:1625760756;');
/*!40000 ALTER TABLE `sma_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_settings`
--

DROP TABLE IF EXISTS `sma_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_settings` (
  `setting_id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(11) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(11) NOT NULL,
  `rows_per_page` int(11) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
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
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
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
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(4) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(4) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  `certificate_password` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_settings`
--

LOCK TABLES `sma_settings` WRITE;
/*!40000 ALTER TABLE `sma_settings` DISABLE KEYS */;
INSERT INTO `sma_settings` VALUES (1,'Screenshot_from_2021-.png','logotipo_300x801.png','Exata Materiais Elétricos','portuguese-brazilian',1,0,'BRL',1,10,'3.4.47',1,5,'VEN','COT','PC','TR','ENT','RPAG','DEV','DEVC','',0,'default',1,1,1,1,1,1,0,1,0,'America/Sao_Paulo',800,800,150,150,0,0,0,0,NULL,'mail','/usr/sbin/sendmail','pop.gmail.com','contact@sma.tecdiary.org','jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==','25',NULL,NULL,1,'contato@alliancetechsystem.com',0,4,1,0,2,1,1,0,2,2,',','.',0,3,'ATS','VWVC895WERD',0,NULL,NULL,NULL,NULL,0,0,0,1,'R$ ',0,'-',0,1,1,'PAG',90,'',1,0,'AN','dompdf',0,'weight',0,0,0,0,0,0,0,0,0,0,'zdb6s1d=');
/*!40000 ALTER TABLE `sma_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_shop_settings`
--

DROP TABLE IF EXISTS `sma_shop_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
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
  `shipping` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_user_logins`
--

LOCK TABLES `sma_user_logins` WRITE;
/*!40000 ALTER TABLE `sma_user_logins` DISABLE KEYS */;
INSERT INTO `sma_user_logins` VALUES (1,1,NULL,_binary '2804:7f2:298d:95','owner@alliancets.dev','2021-07-02 14:20:37'),(2,1,NULL,_binary '2804:7f2:298d:95','owner@alliancets.dev','2021-07-02 15:06:32'),(3,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 15:58:11'),(4,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 16:36:16'),(5,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 16:39:10'),(6,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 19:06:54'),(7,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 19:12:21'),(8,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-02 21:25:23'),(9,1,NULL,_binary '10.10.10.31','alliancets','2021-07-05 13:57:05'),(10,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-06 18:57:10'),(11,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-06 18:57:52'),(12,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-08 03:09:28'),(13,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-08 03:35:01'),(14,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-08 04:09:13'),(15,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-08 04:31:34'),(16,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-08 04:33:51'),(17,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-08 04:35:51'),(18,2,NULL,_binary '2804:7f2:298d:95','admin','2021-07-08 04:38:36'),(19,1,NULL,_binary '2804:7f2:298d:95','alliancets','2021-07-08 05:32:00'),(20,3,NULL,_binary '2804:7f2:298d:95','rafaelvc','2021-07-08 06:18:50'),(21,2,NULL,_binary '127.0.0.1','admin','2021-07-12 14:03:40'),(22,2,NULL,_binary '127.0.0.1','admin','2021-07-13 18:57:49'),(23,2,NULL,_binary '127.0.0.1','admin','2021-07-14 09:30:57'),(24,2,NULL,_binary '127.0.0.1','admin','2021-07-15 10:12:23'),(25,2,NULL,_binary '127.0.0.1','admin','2021-07-16 13:35:28'),(26,2,NULL,_binary '127.0.0.1','admin','2021-07-22 09:59:51'),(27,2,NULL,_binary '127.0.0.1','admin','2021-07-22 13:16:40'),(28,4,NULL,_binary '127.0.0.1','flaviano','2021-07-22 13:58:28'),(29,4,NULL,_binary '127.0.0.1','flavianogjc@hotmail.com','2021-07-22 20:43:52'),(30,4,NULL,_binary '127.0.0.1','flaviano','2021-07-27 10:05:15'),(31,4,NULL,_binary '127.0.0.1','flaviano','2021-07-29 10:15:03'),(32,4,NULL,_binary '127.0.0.1','flaviano','2021-07-30 11:37:26'),(33,4,NULL,_binary '127.0.0.1','flaviano','2021-08-01 14:23:44'),(34,4,NULL,_binary '127.0.0.1','flaviano','2021-08-05 10:55:41'),(35,2,NULL,_binary '127.0.0.1','admin','2021-08-05 11:05:28'),(36,2,NULL,_binary '127.0.0.1','admin','2021-08-06 09:50:11'),(37,2,NULL,_binary '127.0.0.1','admin','2021-08-06 10:08:31'),(38,2,NULL,_binary '127.0.0.1','admin','2021-08-06 23:19:49'),(39,2,NULL,_binary '127.0.0.1','admin','2021-08-07 10:29:25'),(40,2,NULL,_binary '127.0.0.1','admin','2021-08-07 13:48:32'),(41,2,NULL,_binary '127.0.0.1','admin','2021-08-17 01:34:18'),(42,2,NULL,_binary '127.0.0.1','admin','2021-08-17 01:52:01'),(43,2,NULL,_binary '127.0.0.1','admin','2021-08-17 01:53:37'),(44,4,NULL,_binary '127.0.0.1','flaviano','2021-08-17 02:19:29'),(45,4,NULL,_binary '127.0.0.1','flaviano','2021-08-17 02:26:52'),(46,4,NULL,_binary '127.0.0.1','flaviano','2021-08-17 02:42:33'),(47,4,NULL,_binary '127.0.0.1','flaviano','2021-08-18 20:05:56'),(48,4,NULL,_binary '127.0.0.1','flaviano','2021-08-19 11:48:22'),(49,4,NULL,_binary '127.0.0.1','flavianogjc@hotmail.com','2021-08-30 12:12:29'),(50,4,NULL,_binary '127.0.0.1','flavianogjc@hotmail.com','2021-08-31 13:03:03'),(51,4,NULL,_binary '127.0.0.1','flaviano','2021-09-06 09:51:31'),(52,4,NULL,_binary '127.0.0.1','flaviano','2021-09-13 10:33:00'),(53,2,NULL,_binary '127.0.0.1','admin','2021-09-13 10:36:31'),(54,2,NULL,_binary '127.0.0.1','admin','2021-09-13 15:47:38'),(55,2,NULL,_binary '127.0.0.1','admin','2021-09-13 19:22:49'),(56,2,NULL,_binary '127.0.0.1','admin','2021-09-14 10:08:06'),(57,2,NULL,_binary '127.0.0.1','admin','2021-09-16 17:54:16'),(58,2,NULL,_binary '127.0.0.1','admin','2021-09-18 14:26:06'),(59,2,NULL,_binary '127.0.0.1','admin','2021-09-19 12:54:20'),(60,2,NULL,_binary '127.0.0.1','admin','2021-09-19 16:21:08'),(61,2,NULL,_binary '127.0.0.1','admin','2021-09-19 21:10:39');
/*!40000 ALTER TABLE `sma_user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_users`
--

DROP TABLE IF EXISTS `sma_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(10) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(10) unsigned NOT NULL,
  `last_login` int(10) unsigned DEFAULT NULL,
  `active` tinyint(3) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned DEFAULT NULL,
  `biller_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sma_users`
--

LOCK TABLES `sma_users` WRITE;
/*!40000 ALTER TABLE `sma_users` DISABLE KEYS */;
INSERT INTO `sma_users` VALUES (1,_binary '2804:7f2:298d:9518:e927:8329:f0e7:dd8b',_binary '?','alliancets','562d905ae86c1be5174b154bce9db46e3249ddcd',NULL,'suporte@alliancets.dev',NULL,NULL,NULL,NULL,1351661704,1625722320,1,'Administrador','ATS','ALLIANCE TECH SYSTEM','62999132635',NULL,'male',1,NULL,NULL,NULL,0,0,0,0,0,0),(2,_binary '127.0.0.1',_binary '?','admin','562d905ae86c1be5174b154bce9db46e3249ddcd',NULL,'suporte@alliancets.dev',NULL,NULL,NULL,NULL,1351661704,1632085839,1,'Administrador','ATS','ALLIANCE TECH SYSTEM','62999132635',NULL,'male',1,NULL,NULL,NULL,0,0,0,0,0,0),(3,_binary '2804:7f2:298d:9518:e927:8329:f0e7:dd8b',_binary '2804:7f2:298d:9518:e927:8329:f0e7:dd8b','rafaelvc','e13d49942f9df63adc99668ba5bbb6937f847a59',NULL,'rafael.sabino@hotmail.com.br','db873f6787dc4981fd7a766a29b7c9b410d9f794',NULL,NULL,NULL,1625724865,1625725130,1,'Rafael','Costa','GR WEB','62999132635',NULL,'male',3,NULL,NULL,5,0,0,0,0,0,0),(4,_binary '127.0.0.1',_binary '127.0.0.1','flaviano','73cc5811dc51e19aebb1c3c93979377e4fb4b79e',NULL,'flavianogjc@hotmail.com','8133258da14bfd3e9a64e1f584e76f23df08b4cd','3fbec388b715d43d91b391048444baa8d402ff9f',1629164654,NULL,1626961965,1631529179,1,'flaviano','cruz','jeca','11111111111',NULL,'male',3,NULL,NULL,6,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sma_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sma_variants`
--

DROP TABLE IF EXISTS `sma_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
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

-- Dump completed on 2021-09-21 11:06:27
