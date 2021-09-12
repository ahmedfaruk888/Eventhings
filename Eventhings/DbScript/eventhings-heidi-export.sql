-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.26 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table deveventhings.tcoreitem
CREATE TABLE IF NOT EXISTS `tcoreitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `cost` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `category` int NOT NULL,
  `stock_unit` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcoreitem: ~0 rows (approximately)
DELETE FROM `tcoreitem`;
/*!40000 ALTER TABLE `tcoreitem` DISABLE KEYS */;
INSERT INTO `tcoreitem` (`id`, `name`, `description`, `cost`, `price`, `category`, `stock_unit`, `active`, `is_deleted`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
	(1, 'Hennesey', 'Alcoholic drink', 8000.0000, 15000.0000, 1, 0, 1, 0, NULL, '2021-09-12 13:12:02', NULL, '2021-09-12 13:12:03');
/*!40000 ALTER TABLE `tcoreitem` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcoreitemcost
CREATE TABLE IF NOT EXISTS `tcoreitemcost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` varchar(128) NOT NULL,
  `unit_id` int NOT NULL,
  `cost` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(19,4) DEFAULT '0.0000',
  `point` decimal(20,6) DEFAULT '0.000000',
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_unitid_tmstrunitmeasurement` (`unit_id`),
  CONSTRAINT `fk_unitid_tmstrunitmeasurement` FOREIGN KEY (`unit_id`) REFERENCES `tcoreunitofmeasurement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcoreitemcost: ~0 rows (approximately)
DELETE FROM `tcoreitemcost`;
/*!40000 ALTER TABLE `tcoreitemcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoreitemcost` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcorejobapplicants
CREATE TABLE IF NOT EXISTS `tcorejobapplicants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `other_name` varchar(128) DEFAULT NULL,
  `address` varchar(256) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `cover_letter` text,
  `cv_ext` varchar(50) DEFAULT NULL,
  `file_name` varchar(128) DEFAULT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcorejobapplicants: ~0 rows (approximately)
DELETE FROM `tcorejobapplicants`;
/*!40000 ALTER TABLE `tcorejobapplicants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcorejobapplicants` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcorejobs
CREATE TABLE IF NOT EXISTS `tcorejobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_title` varchar(256) NOT NULL DEFAULT '0',
  `state` varchar(256) NOT NULL DEFAULT '0',
  `address` varchar(256) NOT NULL DEFAULT '0',
  `description` text,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcorejobs: ~0 rows (approximately)
DELETE FROM `tcorejobs`;
/*!40000 ALTER TABLE `tcorejobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcorejobs` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcorerole
CREATE TABLE IF NOT EXISTS `tcorerole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcorerole: ~0 rows (approximately)
DELETE FROM `tcorerole`;
/*!40000 ALTER TABLE `tcorerole` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcorerole` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcoresales
CREATE TABLE IF NOT EXISTS `tcoresales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcoresales: ~0 rows (approximately)
DELETE FROM `tcoresales`;
/*!40000 ALTER TABLE `tcoresales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoresales` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcoretransaction
CREATE TABLE IF NOT EXISTS `tcoretransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_code` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `channel` varchar(128) DEFAULT '0',
  `tranx_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_code` (`ref_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcoretransaction: ~0 rows (approximately)
DELETE FROM `tcoretransaction`;
/*!40000 ALTER TABLE `tcoretransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoretransaction` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcoreunitofmeasurement
CREATE TABLE IF NOT EXISTS `tcoreunitofmeasurement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit_of_measurement` varchar(128) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_of_measurement` (`unit_of_measurement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcoreunitofmeasurement: ~0 rows (approximately)
DELETE FROM `tcoreunitofmeasurement`;
/*!40000 ALTER TABLE `tcoreunitofmeasurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoreunitofmeasurement` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcoreuser
CREATE TABLE IF NOT EXISTS `tcoreuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_confirmed` timestamp NULL DEFAULT NULL,
  `password_hash` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `require_password_change` int NOT NULL DEFAULT '0',
  `phone_number` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number_confirmed` timestamp NULL DEFAULT NULL,
  `two_factor_enabled` int NOT NULL DEFAULT '0',
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `other_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This object is responsible for storing in users information, ';

-- Dumping data for table deveventhings.tcoreuser: ~0 rows (approximately)
DELETE FROM `tcoreuser`;
/*!40000 ALTER TABLE `tcoreuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoreuser` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcoreuserrole
CREATE TABLE IF NOT EXISTS `tcoreuserrole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `role_id` (`role_id`),
  CONSTRAINT `fk_roleid_tcoreuserrole` FOREIGN KEY (`role_id`) REFERENCES `tcorerole` (`id`),
  CONSTRAINT `fk_user_id_tcoreuserrole` FOREIGN KEY (`user_id`) REFERENCES `tcoreuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcoreuserrole: ~0 rows (approximately)
DELETE FROM `tcoreuserrole`;
/*!40000 ALTER TABLE `tcoreuserrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoreuserrole` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tcorewallet
CREATE TABLE IF NOT EXISTS `tcorewallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) NOT NULL,
  `prev_balance` decimal(19,4) DEFAULT NULL,
  `amount_paid` decimal(19,4) DEFAULT NULL,
  `current_balance` decimal(19,4) DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tcorewallet: ~0 rows (approximately)
DELETE FROM `tcorewallet`;
/*!40000 ALTER TABLE `tcorewallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcorewallet` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tmstrcategory
CREATE TABLE IF NOT EXISTS `tmstrcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int NOT NULL,
  `description` varchar(512) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tmstrcategory: ~0 rows (approximately)
DELETE FROM `tmstrcategory`;
/*!40000 ALTER TABLE `tmstrcategory` DISABLE KEYS */;
INSERT INTO `tmstrcategory` (`id`, `name`, `parent`, `description`, `active`, `is_deleted`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
	(1, 'Drinks', 0, 'General drinks, such as alcoholic drinks, carbonated drinks, water etc', 1, 0, NULL, '2021-09-12 13:14:26', NULL, '2021-09-12 13:14:27'),
	(2, 'Alcoholic Drinks', 1, 'Alcoholic Drinks', 1, 0, NULL, '2021-09-12 13:15:04', NULL, '2021-09-12 13:15:04'),
	(3, 'Non-alcoholic drinks', 1, 'Non-alcoholic drinks', 1, 0, NULL, '2021-09-12 13:15:27', NULL, '2021-09-12 13:15:27'),
	(4, 'Carbonated Drinks', 1, 'Carbonated Drinks', 1, 0, NULL, '2021-09-12 13:15:45', NULL, '2021-09-12 13:15:45'),
	(5, 'Gin', 2, 'Gin drinks', 1, 0, NULL, '2021-09-12 13:16:45', NULL, '2021-09-12 13:16:46'),
	(6, 'Food', 0, 'Local and continental dishes', 1, 0, NULL, '2021-09-12 13:18:27', NULL, '2021-09-12 13:18:28');
/*!40000 ALTER TABLE `tmstrcategory` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tmstrcodegen
CREATE TABLE IF NOT EXISTS `tmstrcodegen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL DEFAULT '1',
  `date_used` timestamp NULL DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tmstrcodegen: ~0 rows (approximately)
DELETE FROM `tmstrcodegen`;
/*!40000 ALTER TABLE `tmstrcodegen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmstrcodegen` ENABLE KEYS */;

-- Dumping structure for table deveventhings.tmstrtranxchannel
CREATE TABLE IF NOT EXISTS `tmstrtranxchannel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `is_deleted` int NOT NULL DEFAULT '0',
  `created_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table deveventhings.tmstrtranxchannel: ~0 rows (approximately)
DELETE FROM `tmstrtranxchannel`;
/*!40000 ALTER TABLE `tmstrtranxchannel` DISABLE KEYS */;
INSERT INTO `tmstrtranxchannel` (`id`, `name`, `description`, `active`, `is_deleted`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
	(1, 'Transfer', '', 1, 0, NULL, '2021-09-11 16:01:02', NULL, '2021-09-11 16:01:03'),
	(2, 'Payment Gateway', '', 1, 0, NULL, '2021-09-11 16:02:05', NULL, '2021-09-11 16:02:05'),
	(3, 'POS', '', 1, 0, NULL, '2021-09-11 16:02:40', NULL, '2021-09-11 16:02:40'),
	(4, 'Cash Payment', NULL, 1, 0, NULL, '2021-09-11 16:02:55', NULL, '2021-09-11 16:02:55');
/*!40000 ALTER TABLE `tmstrtranxchannel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
