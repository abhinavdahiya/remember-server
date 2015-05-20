-- phpMyAdmin SQL Dump
-- version 4.4.6.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2015 at 09:14 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `remember_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`) VALUES
(1, 'abhinav-opo');

-- --------------------------------------------------------

--
-- Table structure for table `equip`
--

CREATE TABLE IF NOT EXISTS `equip` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `states` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equip`
--

INSERT INTO `equip` (`id`, `name`, `type`, `states`) VALUES
(1, 'LED1', 'LED', 'ON,OFF'),
(2, 'LED2', 'LED', 'ON,OFF'),
(3, 'LED3', 'LED', 'ON,OFF'),
(4, 'LED4', 'LED', 'ON,OFF'),
(5, 'LED5', 'LED', 'ON,OFF'),
(6, 'LED6', 'LED', 'ON,OFF'),
(7, 'LED7', 'LED', 'ON,OFF'),
(8, 'LED8', 'LED', 'ON,OFF');

-- --------------------------------------------------------

--
-- Table structure for table `prefrences`
--

CREATE TABLE IF NOT EXISTS `prefrences` (
  `user_id` int(11) NOT NULL,
  `equip_id` int(11) NOT NULL,
  `equip_state` varchar(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `active_user` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prefrences`
--

INSERT INTO `prefrences` (`user_id`, `equip_id`, `equip_state`, `priority`, `active_user`, `timestamp`) VALUES
(1, 1, 'ON', 2, 1, 1432148954),
(1, 2, 'OFF', 2, 1, 1432148954),
(1, 5, 'ON', 2, 1, 1432148954),
(1, 6, 'OFF', 2, 1, 1432148954),
(2, 1, 'OFF', 3, 1, 1432148954),
(2, 2, 'OFF', 3, 1, 1432148954),
(2, 5, 'OFF', 3, 1, 1432148954),
(2, 6, 'ON', 3, 1, 1432148954);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `name`) VALUES
(1, 'abhinav room'),
(2, 'minhaz room');

-- --------------------------------------------------------

--
-- Table structure for table `room_equip`
--

CREATE TABLE IF NOT EXISTS `room_equip` (
  `room_id` int(11) NOT NULL,
  `equip_id` int(11) NOT NULL,
  `pins` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_equip`
--

INSERT INTO `room_equip` (`room_id`, `equip_id`, `pins`) VALUES
(1, 2, ''),
(1, 1, ''),
(2, 3, ''),
(2, 4, ''),
(1, 5, ''),
(1, 6, ''),
(2, 7, ''),
(2, 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`) VALUES
(1, 'Abhinav Dahiya'),
(2, 'Minhaz');

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE IF NOT EXISTS `user_devices` (
  `user_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_devices`
--

INSERT INTO `user_devices` (`user_id`, `device_id`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equip`
--
ALTER TABLE `equip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `equip`
--
ALTER TABLE `equip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
