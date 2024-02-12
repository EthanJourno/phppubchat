-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 12, 2024 at 02:20 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `user_id`, `message`, `timestamp`) VALUES
(1, 1, 'essai', '2024-01-23 09:54:46'),
(2, 2, 'Bonjour!', '2024-01-23 09:57:28'),
(4, 4, 'Coucou!', '2024-01-23 10:02:40'),
(7, 7, 'non', '2024-01-23 10:04:32'),
(8, 7, 'non', '2024-01-23 10:04:32'),
(9, 8, 'uh', '2024-01-23 10:04:56'),
(10, 8, 'uh', '2024-01-23 10:04:56'),
(11, 9, 'est-ce que les messages sont doublés?', '2024-01-23 10:05:13'),
(12, 9, 'est-ce que les messages sont doublés?', '2024-01-23 10:05:13'),
(13, 10, 'double', '2024-01-23 10:08:37'),
(14, 10, 'bonjour', '2024-01-23 10:11:37'),
(15, 11, 'coucou', '2024-01-23 10:11:49'),
(16, 11, 'ça marche?\r\n', '2024-01-23 10:11:55'),
(17, 1, '8ème message', '2024-01-23 10:14:19'),
(18, 1, 'kopi', '2024-01-23 10:27:34'),
(19, 1, 'truc', '2024-01-23 10:27:49'),
(20, 1, 'machin', '2024-01-23 10:35:40'),
(21, 12, 'Coucou!', '2024-01-23 10:36:52'),
(22, 1, 'ça marche!', '2024-01-23 10:51:25'),
(23, 1, 'Kofi', '2024-01-23 10:52:36'),
(24, 1, 'ceci', '2024-01-23 10:54:28'),
(25, 1, 'ça marche!', '2024-01-23 10:54:34'),
(26, 13, '8ème message', '2024-01-23 11:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`) VALUES
(9, 'double'),
(10, 'essai'),
(4, 'essai2'),
(1, 'Ethan'),
(2, 'Haim '),
(8, 'huh'),
(13, 'Kapoi'),
(11, 'kopi'),
(12, 'Livyth'),
(7, 'oui');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
