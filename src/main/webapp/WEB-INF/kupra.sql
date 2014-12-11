-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 11, 2014 at 08:56 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `kupra`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `ingredients`
-- 

CREATE TABLE `ingredients` (
  `ingrId` int(10) NOT NULL auto_increment,
  `recId` int(10) NOT NULL,
  `productId` int(10) NOT NULL,
  `unitId` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY  (`ingrId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `ingredients`
-- 

INSERT INTO `ingredients` VALUES (1, 1, 1, 1, 200);

-- --------------------------------------------------------

-- 
-- Table structure for table `products`
-- 

CREATE TABLE `products` (
  `productId` bigint(20) NOT NULL auto_increment,
  `product_name` varchar(30) NOT NULL,
  `product_description` varchar(2000) NOT NULL,
  `imgName` varchar(256) default NULL,
  `imgType` varchar(8) default NULL,
  `img` blob,
  PRIMARY KEY  (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `products`
-- 

INSERT INTO `products` VALUES (1, 'Kiausiniai', 'sdadassadasda', NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `recipe_product`
-- 

CREATE TABLE `recipe_product` (
  `recId` int(10) NOT NULL,
  `productId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `recipe_product`
-- 

INSERT INTO `recipe_product` VALUES (1, 1); 

-- --------------------------------------------------------

-- 
-- Table structure for table `recipies`
-- 

CREATE TABLE `recipies` (
  `recId` bigint(20) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `visibility` int(11) NOT NULL default '0',
  `imgName` varchar(256) NOT NULL,
  `imgType` varchar(8) NOT NULL,
  `img` blob NOT NULL,
  `rating` int(3) NOT NULL,
  `ratingCount` int(5) NOT NULL,
  `userId` int(5) NOT NULL,
  PRIMARY KEY  (`recId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `recipies`
-- 

INSERT INTO `recipies` VALUES (1, 'Kiausiniene', 'Puikus patiekalas pusryciams.', 1, '', '', '', 7, 100, 1);
INSERT INTO `recipies` VALUES (2, 'Spageciai su suriu', 'Labai pigu ir skanu.', 1, '', '', '', 5, 75, 1);
INSERT INTO `recipies` VALUES (3, 'Koldunai', 'Puikus patiekalas studentams, kurie neturi daug pinigu ir laiko.', 1, '', '', '', 6, 80, 1);
INSERT INTO `recipies` VALUES (4, 'Pica', 'Sunkiai pagaminama, taciau labai skanu.', 1, '', '', '', 9, 55, 1);
INSERT INTO `recipies` VALUES (5, 'Ledai', 'Sunkiai ir ilgai gaminama, taciau labai skanu.', 1, '', '', '', 10, 65, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `units`
-- 

CREATE TABLE `units` (
  `unitId` bigint(20) NOT NULL auto_increment,
  `name` varchar(16) NOT NULL,
  `abbreviation` varchar(16) NOT NULL,
  PRIMARY KEY  (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `units`
-- 

INSERT INTO `units` VALUES (1, 'kilogramai', 'kg');

-- --------------------------------------------------------

-- 
-- Table structure for table `unit_product`
-- 

CREATE TABLE `unit_product` (
  `productId` int(10) NOT NULL,
  `unitId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `unit_product`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `userId` bigint(20) NOT NULL auto_increment,
  `loginname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `name` varchar(30) default NULL,
  `lastname` varchar(30) default NULL,
  `address` varchar(64) default NULL,
  `description` varchar(256) default NULL,
  `imgName` varchar(256) default NULL,
  `imgType` varchar(8) default NULL,
  `img` blob,
  `role` enum('ROLE_ADMIN','ROLE_USER') NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY  (`userId`),
  UNIQUE KEY `loginname` (`loginname`),
  UNIQUE KEY `loginname_2` (`loginname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES (1, 'admin@kupra.lt', 'Pirmasis administratorius', '123456', 'admin@kupra.lt', 'Jonas', 'Jonaitis', 'Universiteto g. 3', 'As pirmasis sistemos administratorius', NULL, NULL, NULL, 'ROLE_ADMIN', 1);
INSERT INTO `users` VALUES (2, 'administrator@kupra.lt', 'Antrasis administratorius', '123456', 'administratorius@kupra.lt', 'Petras', 'Petraitis', 'Pylimo g. 8', 'As antrasis sistemos administratorius', NULL, NULL, NULL, 'ROLE_ADMIN', 1);
INSERT INTO `users` VALUES (3, 'user@kupra.lt', 'Vartotojas', '123456', 'vartotojas@kupra.lt', 'Antanas', 'Antanaitis', 'Tauro g. 1', 'As sistemos vartotojas', NULL, NULL, NULL, 'ROLE_USER', 1);