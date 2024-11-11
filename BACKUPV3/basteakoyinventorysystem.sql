-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2024 at 07:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basteakoyinventorysystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkout_transactions`
--

CREATE TABLE `checkout_transactions` (
  `id` int(11) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `change` decimal(10,2) DEFAULT NULL,
  `size` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_transactions`
--

INSERT INTO `checkout_transactions` (`id`, `payment_method`, `product_name`, `quantity`, `amount_paid`, `total_amount`, `transaction_date`, `user_id`, `change`, `size`) VALUES
(1, '', NULL, NULL, 0.00, 90.00, '2024-10-30 13:38:40', 0, NULL, ''),
(2, 'cash', NULL, NULL, 23.00, NULL, '2024-10-30 13:45:41', 0, NULL, ''),
(3, NULL, NULL, NULL, NULL, NULL, '2024-10-30 13:50:39', 0, NULL, ''),
(4, NULL, NULL, NULL, NULL, NULL, '2024-10-30 13:52:21', 0, NULL, ''),
(5, 'cash', NULL, NULL, 120.00, 110.00, '2024-10-30 13:56:32', 0, NULL, ''),
(6, 'gcash', NULL, NULL, 160.00, 180.00, '2024-10-30 13:57:56', 0, NULL, ''),
(7, 'cash', NULL, NULL, 120.00, 110.00, '2024-10-30 14:01:13', 0, NULL, ''),
(8, 'cash', NULL, NULL, 120.00, 110.00, '2024-10-30 14:04:40', 0, NULL, ''),
(9, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-30 14:16:23', 0, 10.00, ''),
(10, 'cash', NULL, NULL, 300.00, 120.00, '2024-10-30 14:17:08', 0, 180.00, ''),
(11, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-30 14:18:41', 0, 10.00, ''),
(12, 'cash', NULL, NULL, 190.00, 180.00, '2024-10-30 14:34:46', 0, 10.00, ''),
(13, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-30 14:36:40', 0, 10.00, ''),
(14, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-30 14:37:00', 0, 10.00, ''),
(15, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-30 20:17:40', 0, 10.00, ''),
(16, 'cash', NULL, NULL, 200.00, 90.00, '2024-10-30 20:27:33', NULL, 110.00, ''),
(17, 'cash', NULL, NULL, 200.00, 110.00, '2024-10-30 20:31:52', NULL, 90.00, ''),
(18, 'cash', NULL, NULL, 233.00, 90.00, '2024-10-30 20:40:32', NULL, 143.00, ''),
(19, 'cash', NULL, NULL, 200.00, 90.00, '2024-10-30 20:41:44', NULL, 110.00, ''),
(20, 'cash', NULL, NULL, 120.00, 110.00, '2024-10-30 20:44:04', 12, 10.00, ''),
(21, 'gcash', NULL, NULL, 144.00, 144.00, '2024-10-30 20:45:08', NULL, 0.00, ''),
(22, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-31 05:23:56', NULL, 10.00, ''),
(23, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 05:29:21', 12, 20.00, ''),
(24, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-31 05:32:00', 12, 10.00, ''),
(25, 'cash', NULL, NULL, 180.00, 180.00, '2024-10-31 05:38:53', 12, 0.00, ''),
(26, 'gcash', NULL, NULL, 110.00, 110.00, '2024-10-31 05:45:16', 12, 0.00, ''),
(27, 'gcash', NULL, NULL, 144.00, 144.00, '2024-10-31 05:45:49', 12, 0.00, ''),
(28, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-31 05:46:18', 12, 10.00, ''),
(29, 'gcash', NULL, NULL, 110.00, 110.00, '2024-10-31 05:47:06', 12, 0.00, ''),
(30, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-31 15:00:54', 12, 10.00, ''),
(31, 'cash', NULL, NULL, 250.00, 220.00, '2024-10-31 15:04:35', 12, 30.00, ''),
(32, 'gcash', NULL, NULL, 110.00, 110.00, '2024-10-31 15:06:27', 12, 0.00, ''),
(33, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-31 15:08:41', 12, 10.00, ''),
(34, 'cash', NULL, NULL, 200.00, 110.00, '2024-10-31 15:10:50', 12, 90.00, ''),
(35, 'cash', NULL, NULL, 300.00, 110.00, '2024-10-31 15:20:34', 12, 190.00, ''),
(36, 'cash', NULL, NULL, 200.00, 110.00, '2024-10-31 15:26:39', 12, 90.00, ''),
(37, 'cash', NULL, NULL, 500.00, 420.00, '2024-10-31 15:59:09', 12, 80.00, ''),
(38, 'cash', 'Mango Graham', 2, 0.00, 180.00, '2024-10-31 16:04:42', NULL, NULL, ''),
(39, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:06:33', 12, 20.00, ''),
(40, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:07:39', 12, 20.00, ''),
(41, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:13:02', 12, 20.00, ''),
(42, 'cash', 'Mango Oreo', 1, 0.00, 110.00, '2024-10-31 16:13:58', NULL, NULL, ''),
(43, 'cash', 'Mango Oreo', 1, 0.00, 110.00, '2024-10-31 16:16:56', NULL, NULL, ''),
(44, 'cash', 'Mango Oreo', 1, 0.00, 90.00, '2024-10-31 16:16:56', NULL, NULL, ''),
(45, 'cash', NULL, NULL, 200.00, 200.00, '2024-10-31 16:18:19', 12, 0.00, ''),
(46, 'cash', NULL, NULL, 1800.00, 1.00, '2024-10-31 16:27:54', 12, 1799.00, ''),
(47, 'cash', NULL, NULL, 1800.00, 1.00, '2024-10-31 16:28:18', 12, 1799.00, ''),
(48, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:30:36', 12, 20.00, ''),
(49, 'cash', NULL, NULL, 250.00, 220.00, '2024-10-31 16:33:52', 12, 30.00, ''),
(50, 'cash', NULL, NULL, 100.00, 90.00, '2024-10-31 16:37:12', 12, 10.00, ''),
(51, 'gcash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:41:27', 12, 0.00, ''),
(52, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:45:19', 12, 20.00, ''),
(53, 'cash', 'Mango Oreo', 2, 0.00, 180.00, '2024-10-31 16:51:01', NULL, 0.00, ''),
(54, 'cash', NULL, NULL, 220.00, 110.00, '2024-10-31 16:53:27', 12, 110.00, ''),
(55, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:54:18', 12, 20.00, ''),
(56, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 16:55:29', 12, 20.00, ''),
(57, 'cash', NULL, NULL, 250.00, 220.00, '2024-10-31 17:03:38', 12, 30.00, ''),
(58, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 17:06:32', 12, 20.00, ''),
(59, NULL, NULL, NULL, NULL, NULL, '2024-10-31 17:08:19', NULL, NULL, ''),
(60, 'cash', NULL, NULL, 240.00, 220.00, '2024-10-31 17:08:26', 12, 20.00, ''),
(61, NULL, NULL, NULL, NULL, NULL, '2024-10-31 17:13:05', 12, 0.00, ''),
(62, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 17:13:15', 12, 20.00, ''),
(63, 'cash', NULL, NULL, 0.00, 120.00, '2024-10-31 17:16:59', 12, -120.00, ''),
(64, 'cash', NULL, NULL, 250.00, 220.00, '2024-10-31 17:17:38', 12, 30.00, ''),
(65, 'gcash', NULL, NULL, 100.00, 90.00, '2024-10-31 19:24:11', 12, 0.00, ''),
(66, 'cash', NULL, NULL, 200.00, 180.00, '2024-10-31 19:31:44', 12, 20.00, ''),
(67, 'cash', 'Mango Oreo', 2, 0.00, 220.00, '2024-10-31 19:32:35', NULL, 0.00, ''),
(68, 'cash', 'Mango Graham', 2, 400.00, 180.00, '2024-10-31 19:35:45', 12, 0.00, ''),
(69, 'cash', 'Mango Oreo', 2, 400.00, 220.00, '2024-10-31 19:35:45', 12, 0.00, ''),
(70, 'cash', NULL, NULL, 200.00, 110.00, '2024-10-31 19:41:33', 12, 90.00, ''),
(71, 'cash', 'Strawberry Cheesecake', 2, 288.00, 288.00, '2024-10-31 19:42:03', 12, 0.00, ''),
(72, 'cash', NULL, NULL, 200.00, 110.00, '2024-10-31 19:46:45', 12, 90.00, ''),
(73, 'cash', NULL, NULL, 220.00, 110.00, '2024-10-31 19:49:42', 12, 110.00, ''),
(74, 'cash', 'Mango Oreo', 2, 180.00, 180.00, '2024-10-31 19:50:19', 12, 0.00, ''),
(75, 'cash', 'Mango Oreo', 3, 330.00, 330.00, '2024-10-31 19:54:53', 12, 0.00, ''),
(76, 'cash', 'Mango Graham', 2, 180.00, 180.00, '2024-10-31 19:58:38', 12, 0.00, ''),
(77, 'cash', 'Mango Graham', 1, 200.00, 90.00, '2024-10-31 20:00:11', 12, 0.00, ''),
(78, 'cash', 'Mango Oreo', 1, 200.00, 110.00, '2024-10-31 20:00:11', 12, 0.00, ''),
(79, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-10-31 20:01:07', 12, 10.00, ''),
(80, 'cash', 'Mango Graham', 2, 200.00, 180.00, '2024-10-31 20:02:45', 12, 20.00, ''),
(81, 'cash', 'Mango Graham', 3, 300.00, 270.00, '2024-10-31 20:08:01', 12, 30.00, ''),
(82, 'cash', 'Mango Oreo', 2, 220.00, 220.00, '2024-10-31 20:13:10', 12, 0.00, ''),
(83, 'cash', 'Mango Graham', 1, 200.00, 90.00, '2024-10-31 20:17:45', 12, 110.00, ''),
(84, 'cash', 'Mango Oreo', 1, 120.00, 110.00, '2024-10-31 20:19:31', 12, 10.00, ''),
(85, 'cash', 'Mango Oreo', 4, 500.00, 440.00, '2024-10-31 20:21:55', 12, 60.00, ''),
(86, 'gcash', 'Strawberry Cheesecake', 1, 144.00, 144.00, '2024-10-31 20:33:26', 12, 0.00, ''),
(87, 'cash', 'Mango Oreo', 2, 220.00, 220.00, '2024-10-31 20:34:37', 12, 0.00, ''),
(88, 'cash', 'Mango Oreo', 1, 100.00, 90.00, '2024-10-31 20:58:13', 12, 10.00, ''),
(89, 'gcash', 'Strawberry Cheesecake', 2, 180.00, 180.00, '2024-10-31 21:09:42', 12, 0.00, ''),
(90, 'cash', 'Mango Oreo', 2, 200.00, 180.00, '2024-10-31 21:12:59', 14, 20.00, ''),
(91, 'gcash', 'Mango Oreo', 1, 150.00, 110.00, '2024-11-01 07:00:40', 14, 40.00, ''),
(92, 'gcash', 'Strawberry Cheesecake', 1, 144.00, 144.00, '2024-11-01 07:04:19', 14, 0.00, ''),
(93, 'gcash', 'Mango Oreo', 1, 90.00, 90.00, '2024-11-01 07:06:43', 14, 0.00, ''),
(94, 'gcash', 'Strawberry Cheesecake', 1, 200.00, 144.00, '2024-11-01 07:12:39', 14, 56.00, ''),
(95, 'cash', 'Mango Graham', 2, 200.00, 180.00, '2024-11-01 07:16:12', 14, 20.00, ''),
(96, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-01 07:27:30', 14, 10.00, '16oz'),
(97, 'gcash', 'Strawberry Cheesecake', 1, 144.00, 144.00, '2024-11-01 07:28:08', 14, 0.00, '22oz'),
(98, 'gcash', 'Mango Graham', 1, 90.00, 90.00, '2024-11-01 07:30:21', 14, 0.00, '16oz'),
(99, 'gcash', 'Mango Graham', 1, 90.00, 90.00, '2024-11-01 07:30:37', 14, 0.00, '16oz'),
(100, 'gcash', 'Mango Oreo', 2, 180.00, 180.00, '2024-11-01 07:31:29', 14, 0.00, '16oz'),
(101, 'gcash', 'Mango Oreo', 1, 110.00, 110.00, '2024-11-01 07:32:34', 14, 0.00, '22oz'),
(102, 'gcash', 'Mango Oreo', 1, 110.00, 110.00, '2024-11-01 07:34:28', 14, 0.00, '22oz'),
(103, 'cash', 'Mango Graham', 1, 120.00, 120.00, '2024-11-06 06:30:36', 12, 0.00, '16oz'),
(104, 'cash', 'Mango Graham', 3, 400.00, 360.00, '2024-11-06 06:35:50', 12, 40.00, '16oz'),
(105, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-06 09:35:13', 12, 10.00, '22oz'),
(106, 'cash', 'Mango Graham', 4, 500.00, 480.00, '2024-11-06 09:36:40', 12, 20.00, '16oz'),
(107, 'cash', 'Mango Graham', 1, 120.00, 120.00, '2024-11-06 17:08:33', 12, 0.00, '16oz'),
(108, 'cash', 'Mango Graham', 2, 240.00, 240.00, '2024-11-06 17:12:46', 12, 0.00, '16oz'),
(109, 'cash', 'Mango Graham', 2, 500.00, 240.00, '2024-11-06 17:15:00', 12, 40.00, '16oz'),
(110, 'cash', 'Mango Oreo', 2, 500.00, 220.00, '2024-11-06 17:15:00', 12, 40.00, '16oz'),
(111, 'cash', 'Mango Graham', 1, 120.00, 120.00, '2024-11-06 17:15:35', 12, 0.00, '16oz'),
(112, 'cash', 'Mango Graham', 1, 300.00, 120.00, '2024-11-06 17:32:34', 12, 180.00, '16oz'),
(113, 'gcash', 'Mango Graham', 2, 2286.00, 240.00, '2024-11-06 17:39:42', 12, 0.00, '16oz'),
(114, 'gcash', 'Mango Graham', 4, 2286.00, 360.00, '2024-11-06 17:39:42', 12, 0.00, '22oz'),
(115, 'gcash', 'Mango Oreo', 6, 2286.00, 660.00, '2024-11-06 17:39:42', 12, 0.00, '16oz'),
(116, 'gcash', 'Mango Oreo', 2, 2286.00, 180.00, '2024-11-06 17:39:42', 12, 0.00, '22oz'),
(117, 'gcash', 'Strawberry Cheesecake', 4, 2286.00, 576.00, '2024-11-06 17:39:42', 12, 0.00, '16oz'),
(118, 'gcash', 'Strawberry Cheesecake', 3, 2286.00, 270.00, '2024-11-06 17:39:42', 12, 0.00, '22oz'),
(119, 'cash', 'Mango Graham', 3, 300.00, 270.00, '2024-11-06 17:40:57', 12, 30.00, '22oz'),
(120, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-06 17:42:56', 12, 10.00, '22oz'),
(121, 'cash', 'Mango Graham', 1, 150.00, 120.00, '2024-11-07 04:18:06', 17, 30.00, '16oz'),
(122, 'cash', 'Mango Graham', 1, 120.00, 120.00, '2024-11-07 07:46:24', 12, 0.00, '16oz'),
(123, 'cash', 'Mango Cream', 3, 400.00, 360.00, '2024-11-07 07:47:21', 12, 40.00, '16oz'),
(124, 'cash', 'Mango Graham', 2, 800.00, 180.00, '2024-11-09 12:24:36', 12, 180.00, '22oz'),
(125, 'cash', 'Mango Oreo', 4, 800.00, 440.00, '2024-11-09 12:24:36', 12, 180.00, '16oz'),
(126, 'cash', 'Mango Graham', 2, 200.00, 180.00, '2024-11-09 12:25:06', 12, 20.00, '22oz'),
(127, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-09 12:25:45', 12, 10.00, '22oz'),
(128, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-09 12:27:32', 12, 10.00, '22oz'),
(129, 'cash', 'Mango Graham', 3, 300.00, 270.00, '2024-11-09 12:27:55', 12, 30.00, '22oz'),
(130, 'cash', 'Mango Graham', 5, 500.00, 450.00, '2024-11-09 12:28:12', 12, 50.00, '22oz'),
(131, 'cash', 'Mango Oreo', 3, 500.00, 330.00, '2024-11-09 12:28:41', 12, 170.00, '16oz'),
(132, 'cash', 'Mango Oreo', 1, 200.00, 110.00, '2024-11-09 12:28:55', 12, 90.00, '16oz'),
(133, 'cash', 'Mango Oreo', 1, 200.00, 110.00, '2024-11-09 12:29:15', 12, 90.00, '16oz'),
(134, 'cash', 'Mango Oreo', 1, 200.00, 110.00, '2024-11-09 12:29:40', 12, 90.00, '16oz'),
(135, 'cash', 'Mango Graham', 3, 300.00, 270.00, '2024-11-09 12:30:51', 12, 30.00, '22oz'),
(136, 'cash', 'Mango Graham', 2, 200.00, 180.00, '2024-11-09 12:37:19', 12, 20.00, '22oz'),
(137, 'cash', 'Mango Graham', 2, 250.00, 240.00, '2024-11-09 12:39:42', 12, 10.00, '16oz'),
(138, 'cash', 'Mango Graham', 2, 300.00, 240.00, '2024-11-09 12:39:57', 12, 60.00, '16oz'),
(139, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-09 12:42:27', 12, 80.00, '16oz'),
(140, 'cash', 'Mango Graham', 5, 700.00, 600.00, '2024-11-09 12:42:38', 12, 100.00, '16oz'),
(141, 'cash', 'Mango Graham', 2, 500.00, 240.00, '2024-11-09 12:43:35', 12, 260.00, '16oz'),
(142, 'cash', 'Mango Graham', 3, 400.00, 360.00, '2024-11-09 12:44:46', 12, 40.00, '16oz'),
(143, 'cash', 'Mango Graham', 2, 200.00, 180.00, '2024-11-09 12:49:44', 12, 20.00, '22oz'),
(144, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-09 12:49:57', 12, 10.00, '22oz'),
(145, 'cash', 'Mango Oreo', 5, 600.00, 550.00, '2024-11-09 12:50:19', 12, 50.00, '16oz'),
(146, 'cash', 'Mango Oreo', 3, 400.00, 330.00, '2024-11-09 12:50:34', 12, 70.00, '16oz'),
(147, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-09 12:55:11', 12, 80.00, '16oz'),
(148, 'cash', 'Mango Graham', 2, 250.00, 240.00, '2024-11-09 12:57:23', 12, 10.00, '16oz'),
(149, 'cash', 'Mango Graham', 2, 300.00, 240.00, '2024-11-09 12:57:41', 12, 60.00, '16oz'),
(150, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-09 13:01:12', 12, 80.00, '16oz'),
(151, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-09 13:05:16', 12, 80.00, '16oz'),
(152, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-09 13:06:58', 12, 10.00, '22oz'),
(153, 'cash', 'Mango Oreo', 1, 100.00, 90.00, '2024-11-10 13:06:47', 12, 10.00, '22oz'),
(154, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-10 13:18:41', 12, 80.00, '16oz'),
(155, 'cash', 'Mango Graham', 3, 400.00, 360.00, '2024-11-10 13:24:34', 12, 40.00, '16oz'),
(156, 'cash', 'Mango Graham', 2, 300.00, 240.00, '2024-11-10 13:35:36', 12, 60.00, '16oz'),
(157, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-10 13:36:15', 12, 80.00, '16oz'),
(158, 'cash', 'Mango Graham', 1, 200.00, 120.00, '2024-11-10 21:17:18', 12, 80.00, '16oz'),
(159, 'cash', 'Mango Oreo', 2, 200.00, 180.00, '2024-11-10 21:26:31', 12, 20.00, '22oz'),
(160, 'cash', 'Mango Graham', 2, 300.00, 240.00, '2024-11-10 21:30:32', 12, 60.00, '16oz'),
(161, 'cash', 'Mango Oreo', 2, 200.00, 180.00, '2024-11-10 21:31:09', 12, 20.00, '22oz'),
(162, 'cash', 'Mango Oreo', 3, 400.00, 330.00, '2024-11-10 21:33:00', 12, 70.00, '16oz'),
(163, 'cash', 'Mango Oreo', 1, 100.00, 90.00, '2024-11-10 21:33:31', 12, 10.00, '22oz'),
(164, 'cash', 'Mango Graham', 1, 150.00, 120.00, '2024-11-10 21:35:40', 12, 30.00, '16oz'),
(165, 'cash', 'Mango Graham', 1, 100.00, 90.00, '2024-11-10 21:36:24', 12, 10.00, '22oz'),
(166, 'cash', 'Mango Graham', 1, 120.00, 120.00, '2024-11-10 21:37:10', 12, 0.00, '16oz'),
(167, 'cash', 'Mango Graham', 3, 400.00, 360.00, '2024-11-10 21:49:55', 12, 40.00, '16oz');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `invested_price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `status` enum('Available','Not Available') DEFAULT 'Available',
  `cups` int(11) DEFAULT 0,
  `edit_by` int(11) DEFAULT NULL,
  `last_editby` int(11) DEFAULT NULL,
  `last_editedtime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `size`, `price`, `invested_price`, `stock`, `status`, `cups`, `edit_by`, `last_editby`, `last_editedtime`) VALUES
(1, 'Mango Graham', 'Milkshake', '16oz', 95.00, 20.00, 65, 'Available', 35, 12, 12, '2024-11-11 06:13:21'),
(2, 'Mango Graham', 'Milkshake', '22oz', 85.00, 47.00, 22, 'Available', 9, 12, 12, '2024-11-11 06:14:19'),
(3, 'Mango Oreo', 'Milkshake', '16oz', 110.00, 30.00, 29, 'Available', 29, 12, 12, '2024-11-10 21:33:00'),
(4, 'Mango Oreo', 'Milkshake', '22oz', 90.00, 50.00, 14, 'Available', 24, 12, 12, '2024-11-11 06:21:44'),
(33, 'Strawberry Cheesecake', 'Frapp', '16oz', 244.00, 144.00, 24, 'Available', 23, 12, 12, '2024-11-11 06:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `checkout_id` int(11) NOT NULL,
  `quantity_sold` int(11) DEFAULT 0,
  `cups_sold` int(11) DEFAULT 0,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `expenses` decimal(10,2) DEFAULT 0.00,
  `today` decimal(10,2) DEFAULT 0.00,
  `this_month` decimal(10,2) DEFAULT 0.00,
  `this_year` decimal(10,2) DEFAULT 0.00,
  `sale_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `checkout_id`, `quantity_sold`, `cups_sold`, `total_amount`, `expenses`, `today`, `this_month`, `this_year`, `sale_date`) VALUES
(1, 1, 155, 3, 3, 360.00, 0.00, 0.00, 0.00, 0.00, '2024-11-10 21:24:34'),
(2, 1, 156, 2, 2, 240.00, 0.00, 0.00, 0.00, 0.00, '2024-11-10 21:35:36'),
(3, 1, 157, 1, 1, 120.00, 0.00, 0.00, 0.00, 0.00, '2024-11-10 21:36:15'),
(4, 1, 158, 1, 1, 120.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:17:18'),
(5, 4, 159, 2, 2, 180.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:26:31'),
(6, 1, 160, 2, 2, 240.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:30:32'),
(7, 4, 161, 2, 2, 180.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:31:09'),
(8, 3, 162, 3, 3, 330.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:33:00'),
(9, 4, 163, 1, 1, 90.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:33:31'),
(10, 1, 164, 1, 1, 120.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:35:40'),
(11, 2, 165, 1, 1, 90.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:36:24'),
(12, 1, 166, 1, 1, 120.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:37:10'),
(13, 1, 167, 3, 3, 360.00, 0.00, 0.00, 0.00, 0.00, '2024-11-11 05:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('admin','staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`) VALUES
(12, 'test_user', '$2y$10$0DH7jMVhL./TkNZ.pZ9fZOvA7oNpy7RvxnshXnB9H7f9VxSvQaeta', 'admin'),
(14, 'staff_test', '$2y$10$AiGJgou90esije7wITJQWOZEcpH9nbX1x0RYVnFFyRX5xia/d4DFi', 'staff'),
(15, 'bk_admin', '$2y$10$DJHOynhZc1WKtWsK2fqHZ.0Y9nRx4kb7Rx/XvKLHlgGxHFbUS8GYO', 'admin'),
(17, 'bk_staff', '$2y$10$IZtXRYvZGa1xMLHEEpkNaOtcGeCCsFmMNFS34vqZjcUED4DPqgDL2', 'staff'),
(19, 'bk_makmak', '$2y$10$12dN37EPVlWu32PVteRI5u9qoXAlCELBEb88f0gDmvlU6D645uci2', 'admin'),
(20, 'bk_garcia', '$2y$10$/PXQVqH90SDBHUp0zUkdkumMXEb4c2DPReWPcFhQ39GDOuc6xrkIu', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`id`, `user_id`, `login_time`, `logout_time`) VALUES
(1, 12, '2024-10-23 21:05:24', '2024-10-23 21:06:18'),
(2, 12, '2024-10-24 03:07:43', '2024-10-24 03:08:15'),
(3, 12, '2024-10-24 03:16:30', '2024-10-24 03:39:08'),
(4, 12, '2024-10-24 03:40:54', '2024-10-24 03:43:28'),
(5, 12, '2024-10-24 04:04:55', '2024-10-24 15:42:47'),
(6, 12, '2024-10-24 15:41:38', '2024-10-24 15:42:47'),
(7, 12, '2024-10-25 02:31:27', '2024-10-25 03:32:13'),
(8, 12, '2024-10-25 03:17:49', '2024-10-25 03:32:13'),
(9, 12, '2024-10-25 03:22:12', '2024-10-25 03:32:13'),
(10, 12, '2024-10-25 03:22:29', '2024-10-25 03:32:13'),
(11, 12, '2024-10-25 03:32:20', '2024-10-25 03:35:27'),
(12, 12, '2024-10-25 03:34:32', '2024-10-25 03:35:27'),
(13, 12, '2024-10-25 03:36:17', '2024-10-25 03:42:03'),
(14, 12, '2024-10-25 03:42:17', '2024-10-25 03:43:10'),
(15, 12, '2024-10-25 03:43:22', '2024-10-25 03:47:02'),
(16, 12, '2024-10-25 03:48:48', '2024-10-25 03:49:46'),
(17, NULL, '2024-10-25 04:05:48', NULL),
(18, 12, '2024-10-25 04:08:24', '2024-10-25 04:09:10'),
(19, 12, '2024-10-25 04:10:52', '2024-10-25 04:17:07'),
(20, 12, '2024-10-25 15:08:14', '2024-10-25 15:09:18'),
(21, 12, '2024-10-28 16:15:47', '2024-10-28 16:16:31'),
(22, 14, '2024-10-28 16:19:54', '2024-10-28 16:20:24'),
(23, 12, '2024-10-28 16:20:32', '2024-10-28 16:42:05'),
(24, 12, '2024-10-29 00:30:14', '2024-10-29 12:40:23'),
(25, 12, '2024-10-29 12:38:26', '2024-10-29 12:40:23'),
(26, 12, '2024-10-30 13:44:07', '2024-10-30 13:44:18'),
(27, 12, '2024-10-30 13:54:43', '2024-10-30 14:05:56'),
(28, 12, '2024-10-30 14:05:28', '2024-10-30 14:05:56'),
(29, 12, '2024-10-30 22:17:01', '2024-10-31 04:53:00'),
(30, 12, '2024-10-30 22:19:39', '2024-10-31 04:53:00'),
(31, 12, '2024-10-30 22:22:57', '2024-10-31 04:53:00'),
(32, 12, '2024-10-30 22:26:06', '2024-10-31 04:53:00'),
(33, 12, '2024-10-30 22:26:41', '2024-10-31 04:53:00'),
(34, 12, '2024-10-31 04:16:59', '2024-10-31 04:53:00'),
(35, 12, '2024-10-31 04:17:27', '2024-10-31 04:53:00'),
(36, 12, '2024-10-31 04:26:18', '2024-10-31 04:53:00'),
(37, 12, '2024-10-31 04:36:49', '2024-10-31 04:53:00'),
(38, 12, '2024-10-31 04:43:42', '2024-10-31 04:53:00'),
(39, 12, '2024-10-31 13:23:48', '2024-10-31 13:30:10'),
(40, 12, '2024-10-31 13:29:06', '2024-10-31 13:30:10'),
(41, 12, '2024-10-31 13:31:36', '2024-10-31 13:46:41'),
(42, 12, '2024-10-31 13:46:51', '2024-10-31 14:00:57'),
(43, 12, '2024-10-31 23:00:41', '2024-11-01 05:11:39'),
(44, 12, '2024-11-01 03:23:57', '2024-11-01 05:11:39'),
(45, 14, '2024-11-01 05:12:06', '2024-11-01 05:13:37'),
(46, 14, '2024-11-01 15:00:01', '2024-11-01 16:10:57'),
(47, 12, '2024-11-01 16:11:11', '2024-11-01 16:15:31'),
(48, 15, '2024-11-01 16:15:38', '2024-11-02 13:37:15'),
(49, 15, '2024-11-02 13:34:43', '2024-11-02 13:37:15'),
(50, 15, '2024-11-04 15:48:16', '2024-11-04 15:50:30'),
(51, 12, '2024-11-06 14:30:15', '2024-11-06 14:36:25'),
(52, 12, '2024-11-06 17:24:41', '2024-11-06 17:25:04'),
(53, 14, '2024-11-06 17:25:43', '2024-11-06 17:33:00'),
(54, 12, '2024-11-06 17:33:04', '2024-11-06 17:39:38'),
(55, 12, '2024-11-07 01:08:21', '2024-11-07 01:19:57'),
(56, 15, '2024-11-07 01:20:07', '2024-11-07 01:27:55'),
(57, 12, '2024-11-07 01:28:07', '2024-11-07 01:35:07'),
(58, 14, '2024-11-07 01:35:27', '2024-11-07 01:35:33'),
(59, 12, '2024-11-07 01:35:39', '2024-11-07 01:50:35'),
(60, 12, '2024-11-07 01:38:47', '2024-11-07 01:50:35'),
(61, 17, '2024-11-07 11:52:56', '2024-11-07 11:53:24'),
(62, 12, '2024-11-07 12:13:54', '2024-11-07 12:13:57'),
(63, 17, '2024-11-07 12:14:07', '2024-11-07 12:17:44'),
(64, 17, '2024-11-07 12:15:06', '2024-11-07 12:17:44'),
(65, 17, '2024-11-07 12:16:45', '2024-11-07 12:17:44'),
(66, 17, '2024-11-07 12:17:53', '2024-11-07 12:20:02'),
(67, 12, '2024-11-07 12:20:08', '2024-11-07 12:20:44'),
(68, 12, '2024-11-07 12:25:37', '2024-11-07 12:27:43'),
(69, 12, '2024-11-07 15:45:44', '2024-11-07 16:01:10'),
(70, 12, '2024-11-07 17:29:53', '2024-11-07 17:36:39'),
(71, 14, '2024-11-08 13:36:49', '2024-11-08 13:37:05'),
(72, 12, '2024-11-09 18:40:38', '2024-11-09 19:52:04'),
(73, 14, '2024-11-09 19:52:12', '2024-11-09 20:01:17'),
(74, 12, '2024-11-09 20:01:24', '2024-11-09 21:16:42'),
(75, 14, '2024-11-09 21:16:50', '2024-11-09 21:20:50'),
(76, 12, '2024-11-09 21:20:57', '2024-11-09 21:26:01'),
(77, 12, '2024-11-09 23:47:45', '2024-11-09 23:49:11'),
(78, 12, '2024-11-10 20:48:28', '2024-11-10 21:48:42'),
(79, 12, '2024-11-11 03:47:21', '2024-11-11 05:41:22'),
(80, 12, '2024-11-11 05:41:29', '2024-11-11 05:51:55'),
(81, 12, '2024-11-11 14:02:32', '2024-11-11 14:38:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkout_transactions`
--
ALTER TABLE `checkout_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_edit_by` (`edit_by`),
  ADD KEY `fk_last_editby` (`last_editby`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `checkout_id` (`checkout_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkout_transactions`
--
ALTER TABLE `checkout_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout_transactions`
--
ALTER TABLE `checkout_transactions`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_edit_by` FOREIGN KEY (`edit_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_last_editby` FOREIGN KEY (`last_editby`) REFERENCES `users` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`checkout_id`) REFERENCES `checkout_transactions` (`id`);

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
