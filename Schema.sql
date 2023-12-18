-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: company_db
-- ------------------------------------------------------
-- Server version       8.0.34

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `agencyNumber` int NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logoPath` varchar(255) NOT NULL,
  `templateSelection` varchar(10) DEFAULT NULL,
  `isAdmin` boolean NOT NULL,
  `invoiceTemplateSelection` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`agencyNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;







--
-- Table structure for table `invoice_pdfs`
--

DROP TABLE IF EXISTS `invoice_pdfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_pdfs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agencyNumber` int DEFAULT NULL,
  `invoiceNumber` int DEFAULT NULL,
  `clientName` varchar(255) NOT NULL,
  `pdfPath` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quotationNumber` INT NOT NULL ,
  PRIMARY KEY (`id`),
  KEY `agencyNumber` (`agencyNumber`),
  CONSTRAINT `invoice_pdfs_ibfk_1` FOREIGN KEY (`agencyNumber`) REFERENCES `companies` (`agencyNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotation_pdfs`
--

DROP TABLE IF EXISTS `quotation_pdfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation_pdfs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agencyNumber` int DEFAULT NULL,
  `quotationNumber` int NOT NULL,
  `clientName` varchar(255) NOT NULL,
  `pdfPath` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agencyNumber` (`agencyNumber`),
  CONSTRAINT `quotation_pdfs_ibfk_1` FOREIGN KEY (`agencyNumber`) REFERENCES `companies` (`agencyNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `quotation_data`;
CREATE TABLE quotation_data (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `agencyNumber` INT,
  `quotationNumber` INT,
  `clientName` VARCHAR(255) NOT NULL,
  `distance` FLOAT,
  `distanceChargePerKm` FLOAT,
  `loadingFloor` INT,
  `loadingFloorCharge` FLOAT,
  `unloadingFloor` INT,
  `unloadingFloorCharge` FLOAT,
  `items` JSON, -- New column to store items as JSON
  `totalCharges` FLOAT,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `fromLocation` VARCHAR(255),
  `toLocation` VARCHAR(255),
  FOREIGN KEY (agencyNumber) REFERENCES companies(agencyNumber),
  FOREIGN KEY (quotationNumber) REFERENCES quotation_pdfs(quotationNumber)
);


/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 15:25:07
