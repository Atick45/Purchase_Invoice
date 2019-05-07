-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.34-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shopping_cart
--

CREATE DATABASE IF NOT EXISTS shopping_cart;
USE shopping_cart;

--
-- Definition of table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer` varchar(45) NOT NULL,
  `shipping_address` text NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`id`,`customer`,`shipping_address`,`invoice_date`) VALUES 
 (1,'Md Shafique','Gazipur','2018-07-18 11:12:11'),
 (2,'Salauddin','Commilla','2018-07-18 11:13:27'),
 (3,'Jakariya','Sherpur','2018-07-18 11:14:39'),
 (4,'Rowdro','Gulishthan','2018-07-18 12:33:58'),
 (5,'Lucky','Polton','2018-07-18 12:34:41'),
 (6,'Abdullah','Dhanmondi','2018-07-18 13:01:32');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;


--
-- Definition of table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
CREATE TABLE `invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `uom` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` (`id`,`invoice_id`,`item_id`,`qty`,`price`,`uom`) VALUES 
 (1,1,11,1,8000,'pcs'),
 (2,1,10,1,7000,'pcs'),
 (3,1,9,1,2000,'pcs'),
 (4,1,8,1,500,'pcs'),
 (5,1,7,1,500,'pcs'),
 (6,1,6,1,2000,'pcs'),
 (7,1,5,1,4000,'pcs'),
 (8,1,4,1,3000,'pcs'),
 (9,2,1,1,5000,'pcs'),
 (10,3,3,1,50000,'pcs'),
 (11,4,4,1,3000,'pcs'),
 (12,4,2,1,500,'pcs'),
 (13,4,1,1,5000,'pcs'),
 (14,4,8,1,500,'pcs'),
 (15,5,10,2,7000,'pcs'),
 (16,6,7,1,500,'pcs'),
 (17,6,6,1,2000,'pcs'),
 (18,6,4,1,3000,'pcs');
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;


--
-- Definition of table `mfg_master`
--

DROP TABLE IF EXISTS `mfg_master`;
CREATE TABLE `mfg_master` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mfg_master`
--

/*!40000 ALTER TABLE `mfg_master` DISABLE KEYS */;
INSERT INTO `mfg_master` (`id`,`name`) VALUES 
 (1,'A'),
 (2,'B'),
 (3,'C');
/*!40000 ALTER TABLE `mfg_master` ENABLE KEYS */;


--
-- Definition of table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text,
  `price` text,
  `uom` text,
  `mfg_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`,`name`,`price`,`uom`,`mfg_id`) VALUES 
 (1,'mobile','5000','pcs',1),
 (2,'headPhone','500','pcs',1),
 (3,'laptop','50000','pcs',1),
 (4,'RAM','3000','pcs',1),
 (5,'Motherboard','4000','pcs',2),
 (6,'HDD','2000','pcs',2),
 (7,'Mouse','500','pcs',2),
 (8,'Keyboard','500','pcs',2),
 (9,'Casing','2000','pcs',3),
 (10,'Monitor','7000','pcs',3),
 (11,'Processor','8000','pcs',3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


--
-- Definition of table `purchase_invoice`
--

DROP TABLE IF EXISTS `purchase_invoice`;
CREATE TABLE `purchase_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL,
  `purchase_date` date NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_invoice`
--

/*!40000 ALTER TABLE `purchase_invoice` DISABLE KEYS */;
INSERT INTO `purchase_invoice` (`id`,`supplier_id`,`purchase_date`,`created_on`) VALUES 
 (1,1,'2018-01-01','2018-10-03 12:46:25'),
 (2,2,'2019-02-04','2018-10-03 12:48:28');
/*!40000 ALTER TABLE `purchase_invoice` ENABLE KEYS */;


--
-- Definition of table `purchase_invoice_details`
--

DROP TABLE IF EXISTS `purchase_invoice_details`;
CREATE TABLE `purchase_invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `qty` double NOT NULL,
  `uom` varchar(10) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_invoice_details`
--

/*!40000 ALTER TABLE `purchase_invoice_details` DISABLE KEYS */;
INSERT INTO `purchase_invoice_details` (`id`,`invoice_id`,`item_id`,`qty`,`uom`,`price`) VALUES 
 (1,1,3,1,'Piece',20000),
 (2,1,7,1,'Piece',500),
 (3,2,1,1,'Piece',5000);
/*!40000 ALTER TABLE `purchase_invoice_details` ENABLE KEYS */;


--
-- Definition of table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id`,`name`,`phone`,`address`) VALUES 
 (1,'Mohib','3434343','na'),
 (2,'Saidul','34333332','na');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
