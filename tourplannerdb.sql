-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2023 at 11:41 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tourplannerdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `acc_number` varchar(50) NOT NULL,
  `cust_name` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `card_type` varchar(50) NOT NULL,
  `card_no` varchar(50) NOT NULL DEFAULT '',
  `exp_date` varchar(10) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`card_no`),
  UNIQUE KEY `acc_number` (`acc_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_number`, `cust_name`, `address`, `mobile`, `email`, `card_type`, `card_no`, `exp_date`, `cvv`, `balance`) VALUES
('100000000001', 'Tour Planner', 'America', '972398478', 'tourplanner@gmail.com', 'Debit Card', '100000000001', '11/23', 123, 102000),
('1234554321', 'Putta Kiran', 'America', '9652612227', 'puttakiran@gmail.com', 'Debit Card', '12345678910', '10/24', 567, 100000),
('83092307', 'Kumar', 'America', '9409998574', 'kumar@gmail.com', 'Credit Card', '9878965765', '08/25', 852, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `package_id` (`package_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pic` varchar(150) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `registerDate` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `address`, `zipcode`, `mobile`, `email`, `pic`, `password`, `registerDate`) VALUES
(1, 'Customer1', 'New york', '234234', '9409998574', 'raju@gmail.com', '3704calf2.jpg', '54321', '2023-04-04'),
(2, 'Customer2', 'New york2', '23423', '97987498722', 'kumar12@gmail.com', '8121calfornia.jpg', '123455', NULL),
(3, 'Customer4', 'New york', '234234', '979874598789', 'rajesh@gmail.com', '4094', '112233445', '2023-03-22'),
(4, 'Vamshi', 'Warangal', '878723', '980980809', 'vamshi@gmail.com', '20611admin1.png', '1122334455', '2023-04-04'),
(5, 'Customer22', 'New york', '2342', '9652612227', 'mallikarjun.vanam1978@gmail.com', '89321_download.jpg', 'Mallik@123', '2023-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `feedback` varchar(300) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `package_id` (`package_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_date`, `customer_id`, `package_id`, `feedback`, `rating`) VALUES
(1, '2023-04-04', 4, 1, 'account problem', 4),
(2, '2023-04-29', 1, 1, 'Good Package', 5);

-- --------------------------------------------------------

--
-- Table structure for table `guides`
--

CREATE TABLE IF NOT EXISTS `guides` (
  `guide_id` int(11) NOT NULL AUTO_INCREMENT,
  `guide_name` varchar(60) NOT NULL,
  `address` varchar(500) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `guide_pic` varchar(150) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`guide_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `guides`
--

INSERT INTO `guides` (`guide_id`, `guide_name`, `address`, `mobile`, `email`, `guide_pic`, `password`) VALUES
(1, 'Rachana', 'Waranagl', '00808098', 'rachana@gmail.com', '182581_download.jpg', '12345'),
(2, 'Kiran Putta', 'Waangal', '080808', 'vamshi@gmail.com', '219691_laptop.jpg', '54321');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) NOT NULL,
  `hotel_type` varchar(60) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `country` varchar(60) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `latitute` varchar(30) DEFAULT NULL,
  `longitute` varchar(30) DEFAULT NULL,
  `hotel_pic` varchar(150) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_type`, `address`, `city`, `state`, `country`, `zipcode`, `mobile`, `email`, `latitute`, `longitute`, `hotel_pic`, `password`) VALUES
(1, 'Ashoka hotel', 'Hotel', 'Warangal', 'Warangal', 'Telangana', 'India', '9723', '9729837987', 'rajesh@gmail.co', '23', '23', '23', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_date` datetime DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_type` varchar(30) DEFAULT NULL,
  `card_type` varchar(100) DEFAULT NULL,
  `card_no` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `package_id` (`package_id`),
  KEY `customer_id` (`customer_id`),
  KEY `card_no` (`card_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_date`, `package_id`, `customer_id`, `payment_type`, `card_type`, `card_no`, `price`) VALUES
(1, '2023-04-09 00:00:00', 2, 1, 'online', 'Debit Card', '100000000001', 2000),
(2, '2023-04-09 00:00:00', 2, 1, 'online', 'Debit Card', '100000000001', 2000),
(3, '2023-04-29 00:00:00', 1, 1, 'online', 'Debit Card', '100000000001', 1500),
(4, '2023-04-29 00:00:00', 2, 1, 'online', 'Debit Card', '100000000001', 2000),
(5, '2023-04-29 00:00:00', 2, 1, 'online', 'Credit Card', '9878965765', 2000),
(6, '2023-04-29 00:00:00', 2, 1, 'online', 'Credit Card', '9878965765', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `tour_package`
--

CREATE TABLE IF NOT EXISTS `tour_package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) DEFAULT NULL,
  `package_description` varchar(300) DEFAULT NULL,
  `package_pic` varchar(150) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tour_package`
--

INSERT INTO `tour_package` (`package_id`, `package_name`, `package_description`, `package_pic`, `price`, `start_date`, `end_date`) VALUES
(1, 'New York', 'Visit the Empire State Building, enjoy the view from Edges observation deck, cruise by the Statue of Liberty and see so many more New York attractions.', '12381newyork.jpg', 1500, '2023-03-20', '2023-03-25'),
(2, 'California', 'Northern California is the perfect destination for travelers looking for beautiful scenery, incredible food and not-so-typical attractions. If youâ€™re planning a trip to Northern California, make the most of your visit and add these popular destinations to your itinerary.', '23337calfornia.jpg', 2000, '2023-03-25', '2023-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `tour_package_guide_hotel`
--

CREATE TABLE IF NOT EXISTS `tour_package_guide_hotel` (
  `tour_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_place_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `guide_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tour_id`),
  KEY `tour_place_id` (`tour_place_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `guide_id` (`guide_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tour_package_guide_hotel`
--

INSERT INTO `tour_package_guide_hotel` (`tour_id`, `tour_place_id`, `hotel_id`, `guide_id`) VALUES
(4, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tour_package_places`
--

CREATE TABLE IF NOT EXISTS `tour_package_places` (
  `tour_place_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tour_place_id`),
  KEY `package_id` (`package_id`),
  KEY `place_id` (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tour_package_places`
--

INSERT INTO `tour_package_places` (`tour_place_id`, `package_id`, `place_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(6, 1, 1),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tour_places`
--

CREATE TABLE IF NOT EXISTS `tour_places` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `tour_pic` varchar(150) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `latitute` varchar(30) DEFAULT NULL,
  `longitute` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tour_places`
--

INSERT INTO `tour_places` (`place_id`, `place_name`, `description`, `tour_pic`, `address`, `latitute`, `longitute`) VALUES
(1, 'Empire State Building Observatory', 'See Manhattan in all its glory from the top of the Empire State Building.', '17816empire.jpg', 'New York City, New York', '1.9', '1.8'),
(2, 'Top of the Rock Observation Deck', 'Take in 360 panoramic views of NYC on Top of the Rocks 70th-floor outdoor observ', '4566top.jpeg', 'New york', '1.9', '1.8'),
(3, 'Edge', 'open air on a glass platform 100 stories in the sky and be wowed by the state-of-the-art architecture.', '6708edge.jpg', 'New York', '1.9', '1.8'),
(4, 'The Mystery Spot', 'Located just outside of Santa Cruz, the Mystery Spot is a gravitational anomaly that attracts visitors from across the country.', '31831calf1.jpg', 'California', '1.9', '1.8'),
(5, 'Stanford', 'Located in Salinas (the setting for many Steinbeck novels), the National Steinbeck Center honors Nobel prize winning author John Steinbeck.', '16560calf2.jpg', 'California', '1.9', '1.8');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `tour_package` (`package_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `tour_package` (`package_id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `tour_package` (`package_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `accounts` (`card_no`);

--
-- Constraints for table `tour_package_guide_hotel`
--
ALTER TABLE `tour_package_guide_hotel`
  ADD CONSTRAINT `tour_package_guide_hotel_ibfk_1` FOREIGN KEY (`tour_place_id`) REFERENCES `tour_package_places` (`tour_place_id`),
  ADD CONSTRAINT `tour_package_guide_hotel_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  ADD CONSTRAINT `tour_package_guide_hotel_ibfk_3` FOREIGN KEY (`guide_id`) REFERENCES `guides` (`guide_id`);

--
-- Constraints for table `tour_package_places`
--
ALTER TABLE `tour_package_places`
  ADD CONSTRAINT `tour_package_places_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `tour_package` (`package_id`),
  ADD CONSTRAINT `tour_package_places_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `tour_places` (`place_id`);
