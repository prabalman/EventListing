-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 21, 2019 at 08:45 AM
-- Server version: 5.7.26-0ubuntu0.18.10.1
-- PHP Version: 7.2.19-0ubuntu0.18.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `e_events`
--

CREATE TABLE `e_events` (
  `e_id` int(11) NOT NULL,
  `e_name` varchar(200) DEFAULT NULL,
  `e_start_date` datetime DEFAULT NULL,
  `e_end_date` datetime DEFAULT NULL,
  `e_date_added` datetime DEFAULT NULL,
  `e_date_modified` datetime DEFAULT NULL,
  `e_desc` text,
  `e_location` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_events`
--

INSERT INTO `e_events` (`e_id`, `e_name`, `e_start_date`, `e_end_date`, `e_date_added`, `e_date_modified`, `e_desc`, `e_location`) VALUES
(1, 'Event 1', '2019-04-02 00:00:00', '2019-05-02 00:00:00', '2019-04-03 00:00:00', '2019-04-05 00:00:00', '   Matchday', ' pokhara '),
(2, 'Event 2', '2019-04-01 00:00:00', '2019-04-30 00:00:00', '2019-04-04 00:00:00', '2019-04-05 00:00:00', '  SuperBowl', 'lamechane'),
(3, 'Event 3', '2019-05-04 00:00:00', '2019-05-11 00:00:00', NULL, NULL, ' Desc ', ' Loc'),
(4, 'Event 4', '2019-05-25 00:00:00', '2019-05-25 00:00:00', NULL, NULL, 'No desc', 'BKT'),
(6, 'Event 7 ', '2019-05-09 00:00:00', '2019-05-03 00:00:00', NULL, NULL, 'Dinner', 'BKT'),
(7, 'Event 9', '2019-01-01 00:00:00', '2562-02-02 00:00:00', NULL, NULL, 'hello world ', 'nepal '),
(8, 'Event 10', '6565-02-05 00:00:00', '5555-05-05 00:00:00', NULL, NULL, 'Hello Girl ', 'Budapest '),
(9, 'Master Party', '2019-06-21 00:00:00', '2019-06-22 00:00:00', NULL, NULL, ' inserted from server', ' MyPC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `e_events`
--
ALTER TABLE `e_events`
  ADD PRIMARY KEY (`e_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `e_events`
--
ALTER TABLE `e_events`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
