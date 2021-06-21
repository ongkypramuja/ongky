/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.11-MariaDB : Database - laravel-ecommerce
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel-ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `laravel-ecommerce`;

/*Table structure for table `addresses` */

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `area` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `addresses` */

insert  into `addresses`(`id`,`area`,`city`,`zip`,`created_at`,`updated_at`) values 
(1,'131, Dhanmondi','Dhaka',1229,NULL,NULL),
(2,'Mirpur 10','Dhaka',1772,NULL,NULL),
(3,'Mirpur 2','Dhaka',1223,NULL,NULL),
(4,'Uttora','Dhaka',1233,NULL,NULL),
(5,'wonorejo','surabaya',60297,'2021-06-20 08:20:22','2021-06-20 08:20:22');

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`,`name`,`created_at`,`updated_at`) values 
(1,'admin','12345','suarti','2018-08-28 00:00:00','2018-08-28 00:00:00'),
(2,'admin','123456','suarti','2021-06-20 03:18:35','2021-06-20 03:18:40');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`type`,`created_at`,`updated_at`) values 
(11,'Kue Basah','Kue Basah','2021-06-19 20:23:33','2021-06-19 20:23:33'),
(12,'Kue Kering','Kue Kering','2021-06-20 08:42:39','2021-06-20 08:42:39');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2020_04_19_173215_create_admins_table',1),
(2,'2020_04_19_175655_create_addresses_table',1),
(3,'2020_04_19_175938_create_categories_table',1),
(4,'2020_04_20_141633_create_products_table',1),
(5,'2020_04_20_142309_create_users_table',1),
(6,'2020_04_20_142632_create_sales_table',1);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`image_name`,`description`,`colors`,`price`,`discount`,`tag`,`category_id`,`created_at`,`updated_at`) values 
(46,'dada','1.jpg','adadw','#000000,#ff4747',5000,5000,'dd',11,'2021-06-19 20:26:38','2021-06-19 20:26:38'),
(47,'nannawd','1.jpg','adwdadawdad','#ffffff,#d98c8c',75000,5000,'naga',11,'2021-06-19 20:45:19','2021-06-19 20:45:19');

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales` */

insert  into `sales`(`id`,`user_id`,`product_id`,`order_status`,`price`,`created_at`,`updated_at`) values 
(1,1,'3:1:#000000:1','Delivered',91000,'2019-02-02 07:32:33','2019-02-11 00:00:00'),
(2,2,'5:1:#c0c0c0:1,30:2:#000000:2','Delivered',93000,'2019-02-11 14:12:27','2019-02-11 00:00:00'),
(3,2,'22:1:#000000:1','Delivered',43999,'2019-02-07 16:29:16','2019-02-11 00:00:00'),
(4,3,'18:2:#000000:1,38:1:#8080ff:2,30:1:#000000:3','On Process',209998,'2019-02-06 12:05:30','2019-02-11 00:00:00'),
(5,4,'12:1:#000000:2,17:1:#c0c0c0:3','On Process',79500,'2019-02-11 16:56:54','2019-02-11 00:00:00'),
(6,4,'5:1:#c0c0c0:1','Cancel',71000,'2019-02-11 17:07:40','2019-02-11 00:00:00'),
(7,4,'1:1:#c0c0c0:1','Placed',205000,'2019-02-05 12:24:53','2019-02-11 00:00:00'),
(8,2,'20:1:#000000:1,25:1:#000000:2','Delivered',21500,'2019-02-13 09:51:07','2019-02-11 00:00:00'),
(9,2,'27:1:#000000:1','Delivered',30000,'2019-02-10 07:33:46','2019-02-11 00:00:00'),
(10,2,'44:1:#ff0000:1','Cancel',3500,'2019-02-11 17:09:12','2019-02-11 00:00:00'),
(11,2,'28:1:#400080:1','On Process',24000,'2019-02-11 17:09:49','2019-02-11 00:00:00'),
(12,2,'34:1:#ff0000:1','Delivered',10500,'2019-02-05 04:55:26','2019-02-11 00:00:00'),
(13,1,'4:1:#c0c0c0:1','On Process',111000,'2019-02-14 20:54:08','2019-02-14 00:00:00'),
(14,1,'47:1:#ffffff:1','Placed',5000,'2021-06-20 06:28:37','2021-06-20 06:28:37');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_address_id_foreign` (`address_id`),
  CONSTRAINT `users_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`full_name`,`email`,`password`,`phone`,`prev_password`,`address_id`,`created_at`,`updated_at`) values 
(1,'John Doe','john@examle.com','12345','01711001133',NULL,1,'2019-02-09 00:00:00','2019-02-09 00:00:00'),
(2,'Shakib Mostahid','b@gmail.com','12345','01922991100',NULL,2,'2019-02-11 00:00:00','2019-02-11 00:00:00'),
(3,'Nishat Ashraf','c@gmail.com','12345','01899001144',NULL,3,'2019-02-11 00:00:00','2019-02-11 00:00:00'),
(4,'Ayomi Hridy','d@gmail.com','12345','0111111111',NULL,4,'2019-02-11 00:00:00','2019-02-11 00:00:00'),
(5,'Suarti','Suarti@gmail.com','suarti12345','8123456789',NULL,5,'2021-06-20 08:20:22','2021-06-20 08:20:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
