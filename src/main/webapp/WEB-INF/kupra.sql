-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2014 at 10:34 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kupra`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`productId` bigint(20) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_description` varchar(2000) NOT NULL,
  `imgName` varchar(256) DEFAULT NULL,
  `imgType` varchar(8) DEFAULT NULL,
  `img` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recipies`
--

CREATE TABLE IF NOT EXISTS `recipies` (
`recId` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT '0',
  `imgName` varchar(256) NOT NULL,
  `imgType` varchar(8) NOT NULL,
  `img` blob NOT NULL,
  `rating` int(3) NOT NULL,
  `ratingCount` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipies`
--

INSERT INTO `recipies` (`recId`, `name`, `description`, `visibility`, `imgName`, `imgType`, `img`, `rating`, `ratingCount`) VALUES
(1, 'dfsfdsf', 'dsfsdfsdfdsfsd', 1, '', '', '', 2, 100),
(2, 'Geras receptukas', 'aurio plauku tirpalas', 1, '', '', '', 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
`unitId` bigint(20) NOT NULL,
  `name` varchar(16) NOT NULL,
  `abbreviation` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`userId` bigint(20) NOT NULL,
  `loginname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `imgName` varchar(256) DEFAULT NULL,
  `imgType` varchar(8) DEFAULT NULL,
  `img` blob,
  `role` enum('ROLE_ADMIN','ROLE_USER') NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `loginname`, `username`, `password`, `email`, `name`, `lastname`, `address`, `description`, `imgName`, `imgType`, `img`, `role`, `enabled`) VALUES
(1, 'lopas@lopas', 'duchas@duchas', '123456', 'tomas@auris.lt', 'Ryzas', 'Invalidas', 'sadasdsaada', 'sadasdsad', NULL, NULL, NULL, 'ROLE_ADMIN', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `recipies`
--
ALTER TABLE `recipies`
 ADD PRIMARY KEY (`recId`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
 ADD PRIMARY KEY (`unitId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userId`), ADD UNIQUE KEY `loginname` (`loginname`), ADD UNIQUE KEY `loginname_2` (`loginname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `productId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recipies`
--
ALTER TABLE `recipies`
MODIFY `recId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
MODIFY `unitId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
