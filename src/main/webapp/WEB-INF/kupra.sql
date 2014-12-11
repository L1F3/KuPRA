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

INSERT INTO `recipies` VALUES (1, 'dfsfdsf', 'dsfsdfsdfdsfsd', 1, '', '', '', 2, 100, 1);
INSERT INTO `recipies` VALUES (2, 'Geras receptukas', 'aurio plauku tirpalas', 1, '', '', '', 6, 10, 1);

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

INSERT INTO `users` VALUES (1, 'lopas@lopas', 'duchas@duchas', '123456', 'tomas@auris.lt', 'Ryzas', 'Invalidas', 'sadasdsaada', 'sadasdsad', NULL, NULL, NULL, 'ROLE_ADMIN', 1);
