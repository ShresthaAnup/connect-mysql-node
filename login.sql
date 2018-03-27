-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2018 at 02:01 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`node`@`localhost` PROCEDURE `sp_getall` ()  BEGIN
  SELECT first_name,last_name,email FROM users;
END$$

CREATE DEFINER=`node`@`localhost` PROCEDURE `sp_get_user_detail` (IN `passed_id` INT)  BEGIN
  SELECT first_name, last_name, email FROM users where id = passed_id;
END$$

CREATE DEFINER=`node`@`localhost` PROCEDURE `sp_insert_user` (IN `first_name` VARCHAR(25), IN `last_name` VARCHAR(25), IN `email` VARCHAR(25), IN `password` VARCHAR(25))  BEGIN
  insert into users(first_name,last_name,email,password)
  values(first_name,last_name,email,password);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Anup', 'Shrestha', 'anup.shrestha@infotmt.com', 'HelloWorld'),
(2, 'Benson', 'Bishural', 'benson.bishural@infotmt.com', 'HelloNepal'),
(3, 'Brijan', 'Shrestha', 'brijan.shrestha@infotmt.com', 'HelloWorld'),
(8, 'Sajag', 'Shakya', 'sajag.shakya@infotmt.com', 'HelloWorld');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
