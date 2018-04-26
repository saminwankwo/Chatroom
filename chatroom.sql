-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 26, 2018 at 06:25 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `msg_id` bigint(14) NOT NULL,
  `chat_id` bigint(10) NOT NULL,
  `to_enroll` int(8) NOT NULL,
  `to_user` varchar(30) NOT NULL,
  `from_enroll` int(8) NOT NULL,
  `from_user` varchar(30) NOT NULL,
  `msg` text NOT NULL,
  `time` bigint(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_session`
--

CREATE TABLE `chat_session` (
  `chat_id` bigint(10) NOT NULL,
  `from_enroll` int(8) NOT NULL,
  `to_enroll` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stud_data`
--

CREATE TABLE `stud_data` (
  `id` int(4) NOT NULL,
  `usr_name` varchar(25) NOT NULL,
  `usr_roll` int(10) NOT NULL,
  `usr_pass` varchar(36) NOT NULL,
  `online` varchar(3) NOT NULL,
  `time` bigint(18) NOT NULL COMMENT 'this time get updated via script show_online.php when the user is online'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stud_data`
--

INSERT INTO `stud_data` (`id`, `usr_name`, `usr_roll`, `usr_pass`, `online`, `time`) VALUES
(5, 'samuel', 54546, 'fea815c9e35d67d744a50f68cc2ce3fd', '', 0),
(6, 'sunday', 54547, 'fea815c9e35d67d744a50f68cc2ce3fd', '', 0),
(7, 'decide', 898988, '38ab040a0f927e85a5a742c69c218224', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` bigint(10) NOT NULL,
  `enroll` int(8) NOT NULL,
  `writing` varchar(3) NOT NULL DEFAULT 'no',
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `chat_session`
--
ALTER TABLE `chat_session`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `to_user` (`to_enroll`);

--
-- Indexes for table `stud_data`
--
ALTER TABLE `stud_data`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enroll` (`enroll`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `msg_id` bigint(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_session`
--
ALTER TABLE `chat_session`
  MODIFY `chat_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stud_data`
--
ALTER TABLE `stud_data`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
