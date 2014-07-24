CREATE DATABASE  IF NOT EXISTS `salonbooks` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `salonbooks`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: salonbooks
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPOINTMENT_DATE` datetime DEFAULT NULL,
  `NOTES` varchar(1000) DEFAULT NULL,
  `PERSON_ID` int(11) DEFAULT '0',
  `EMPLOYEE_ID` int(11) DEFAULT '0',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `APPOINTMENT_STATUS` varchar(45) DEFAULT 'OPEN',
  PRIMARY KEY (`APPOINTMENT_ID`),
  KEY `EMPLOYEE_FK` (`EMPLOYEE_ID`),
  KEY `APPOINT_PERSON_FK` (`PERSON_ID`),
  CONSTRAINT `APPOINT_PERSON_FK` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `EMPLOYEE_FK` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (0,'2014-05-22 16:00:00','TEST DEFAULT',0,0,'2014-05-22 21:00:00','2014-05-22 21:00:00','OPEN');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method` (
  `METHOD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `METHOD_NAME` varchar(45) DEFAULT 'WALKIN',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`METHOD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (0,'WALKIN','2014-05-15 19:49:00','2014-05-15 19:49:00'),(1,'SCHEDULED_APPT','2014-05-29 18:37:00','2014-05-29 18:37:00'),(2,'USMAIL','2014-05-29 18:37:00','2014-05-29 18:37:00'),(3,'FEDEX','2014-05-29 18:37:00','2014-05-29 18:37:00'),(4,'UPS','2014-05-29 18:37:00','2014-05-29 18:37:00');
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT 'MOBILE_PHONE',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (0,'MOBILE_PHONE'),(1,'HOME_PHONE'),(2,'WORK_PHONE'),(3,'FACEBOOK'),(4,'TWITTER'),(5,'WEBSITE'),(6,'EMAIL');
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method` (
  `PAYMENT_METHOD_ID` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (0,'CASH','2014-05-29 20:37:00','2014-05-29 20:37:00'),(1,'CHECK','2014-05-29 20:37:00','2014-05-29 20:37:00'),(2,'CREDIT_CARD','2014-05-29 20:37:00','2014-05-29 20:37:00'),(3,'PAYPAL','2014-05-29 20:37:00','2014-05-29 20:37:00'),(4,'DWOLLA','2014-05-29 20:37:00','2014-05-29 20:37:00'),(5,'SNEAKOUTWINDOW','2014-05-29 20:37:00','2014-05-29 20:37:00');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `ORDER_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  `QUANTITY` decimal(5,2) DEFAULT '0.00',
  `NOTES` varchar(250) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`,`ITEM_ID`),
  KEY `ORDER_FK` (`ORDER_ID`),
  KEY `ITEMS_FK` (`ITEM_ID`),
  CONSTRAINT `ORDER_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `order` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ITEMS_FK` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `PERSON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_NAME` varchar(60) DEFAULT NULL,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  `DELETED_FLAG` varchar(1) DEFAULT 'N',
  `PRIMARY_PHONENUMBER` varchar(12) NOT NULL DEFAULT '5152106660',
  `MIDDLE_NAME` varchar(45) DEFAULT NULL,
  `PREFIX` varchar(10) DEFAULT NULL,
  `SUFFIX` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT 'DEFAULT@EMAIL.CA',
  `TWITTER` varchar(20) DEFAULT '@DEFAULT',
  `HOME_PHONE` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PERSON_ID`),
  UNIQUE KEY `PRIMARY_PHONENUMBER_UNIQUE` (`PRIMARY_PHONENUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (0,'TESTER','TEST','1980-01-01','2014-05-14 15:05:00','2014-05-14 15:05:00','U','N','5152201111',NULL,NULL,NULL,'DEFAULT@EMAIL.CA','@DEFAULT',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_ID` int(11) DEFAULT NULL,
  `TYPE_ID` int(11) NOT NULL DEFAULT '0',
  `LABEL` varchar(45) DEFAULT '515.210.6660',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ISACTIVE` varchar(1) DEFAULT 'Y',
  `ISURL` varchar(1) DEFAULT 'N',
  `FORMAT` varchar(50) DEFAULT 'PHONE:',
  PRIMARY KEY (`CONTACT_ID`),
  KEY `CONTACT_PERSON_FK` (`PERSON_ID`),
  KEY `CONTACT_TYPE_FK` (`TYPE_ID`),
  KEY `CONTACT_TYPE_FL` (`TYPE_ID`),
  CONSTRAINT `CONTACT_PERSON_FK` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONTACT_TYPE_FL` FOREIGN KEY (`TYPE_ID`) REFERENCES `contact_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (0,0,0,'3196210000','2014-05-30 15:00:00','2014-05-30 15:00:00','N','N','PHONE:');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funding_card`
--

DROP TABLE IF EXISTS `funding_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_card` (
  `FUNDING_CARD` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) DEFAULT 'VISA',
  `NUMBER` varchar(200) DEFAULT NULL COMMENT 'ENCRYPTED',
  `EXPIRE_MONTH` varchar(2) DEFAULT '01',
  `EXPIRE_YEAR` varchar(4) DEFAULT '2014',
  `CVV2` varchar(4) DEFAULT '000',
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PERSON_ID` int(11) NOT NULL,
  PRIMARY KEY (`FUNDING_CARD`),
  KEY `FUNDING_PERSON_FK` (`PERSON_ID`),
  CONSTRAINT `FUNDING_PERSON_FK` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funding_card`
--

LOCK TABLES `funding_card` WRITE;
/*!40000 ALTER TABLE `funding_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `funding_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_SERVICE` varchar(1) NOT NULL DEFAULT 'N',
  `LABEL` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `PRICE` decimal(5,2) DEFAULT '0.00',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SKU` varchar(6) NOT NULL DEFAULT 'SERV01',
  `DELETED_FLAG` varchar(45) DEFAULT 'N',
  `UNIT_COST` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`ITEM_ID`),
  UNIQUE KEY `IDX_SKU` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (0,'1','TEST','IS FOR TEST',0.01,'2014-05-14 15:05:00','2014-05-14 15:05:00','TEST01','N',0.00),(1,'1','MISC','Miscellaneous',1.00,'2014-05-29 18:37:00','2014-05-29 18:37:00','MISC00','N',0.00),(2,'1','BASIC_MENCUT','BASIC HAIRCUT FOR MEN',20.00,'2014-05-14 15:05:00','2014-05-14 15:05:00','SERV01','N',0.00),(3,'1','BASIC_BOY','HAIRCUT FOR BOY',15.00,'2014-05-29 18:37:00','2014-05-29 18:37:00','SERV02','N',0.00),(4,'1','BASIC_WOMENCUT','Basic Haircut for Women',30.00,'2014-05-29 18:37:00','2014-05-29 18:37:00','SERV03','N',0.00),(5,'0','AQUAGE_PASTE','Aquage Paste',30.00,'2014-05-29 18:37:00','2014-05-29 18:37:00','AQU100','N',0.00),(12,'1','BASIC_PERM','Basic Perm no spec',0.00,'2014-06-27 02:02:14','2014-06-27 02:02:14','PERM00','N',0.00);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `ADDRESS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LINE1` varchar(100) DEFAULT NULL,
  `LINE2` varchar(100) DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT 'IA',
  `ZIPCODE` varchar(10) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PERSON_ID` int(11) DEFAULT NULL,
  `BILLING_ADDRESS` int(11) DEFAULT '1',
  `ZIP4` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `PERSON_ADDRESS_FK` (`PERSON_ID`),
  CONSTRAINT `PERSON_ADDRESS_FK` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (0,'default',NULL,'Des Moines','IA','50315','2014-05-30 20:44:00','2014-05-30 20:44:00',0,1,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `EMPLOYEE_NAME` varchar(100) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(150) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'Default','2014-05-14 15:05:00','2014-05-14 15:05:00','default','password1');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TOTAL` decimal(5,2) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `NUM_OF_ITEMS` int(11) DEFAULT NULL,
  `TAX` decimal(5,2) DEFAULT NULL,
  `CURRENCY` varchar(5) DEFAULT 'USD',
  `SUBTOTAL` decimal(5,2) DEFAULT NULL,
  `SHIPPING` decimal(5,2) DEFAULT '0.00',
  `PAYMENT_METHOD_ID` int(11) DEFAULT '0',
  `SHIPPER_ID` int(11) DEFAULT '0',
  `STATUS` varchar(45) DEFAULT 'DELIVERED',
  `APPOINTMENT_ID` int(11) DEFAULT NULL,
  `PERSON_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ORDER_ID`),
  KEY `PAYMENT_METHOD_FK` (`PAYMENT_METHOD_ID`),
  KEY `SHIP_VIA_FK` (`SHIPPER_ID`),
  KEY `APPOINTMENT_ORDER_FK` (`APPOINTMENT_ID`),
  KEY `PERSON_ORDER_FK` (`PERSON_ID`),
  CONSTRAINT `APPOINTMENT_ORDER_FK` FOREIGN KEY (`APPOINTMENT_ID`) REFERENCES `appointment` (`APPOINTMENT_ID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `PAYMENT_METHOD_FK` FOREIGN KEY (`PAYMENT_METHOD_ID`) REFERENCES `payment_method` (`PAYMENT_METHOD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PERSON_ORDER_FK` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SHIP_VIA_FK` FOREIGN KEY (`SHIPPER_ID`) REFERENCES `shipping_method` (`METHOD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (0,0.00,'2014-05-29 13:37:00','2014-05-29 13:37:00',0,0.00,'USD',0.00,0.00,0,0,'OPEN',0,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-24 12:17:35
