-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2024 at 09:09 AM
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
-- Database: `farmket`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `farmer_name` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `farmer_name`, `product_name`, `product_desc`, `price`, `location`, `username`) VALUES
(93, 'Apil', 'Apple', 'This Apple is imported from Surkhet', 180.00, 'Kalopul', 'Safal'),
(94, 'Apil', 'Apple', 'This Apple is imported from Surkhet', 180.00, 'Kalopul', 'Kshitij'),
(95, 'Apil', 'Apple', 'This Apple is imported from Surkhet', 180.00, 'Kalopul', 'Kshitij'),
(96, 'Basanta', 'apple', 'This Apple is imported from Dailekh', 150.00, 'Dailekh', 'Kshitij'),
(97, 'Apil', 'Apple', 'This Apple is imported from Surkhet', 180.00, 'Kalopul', 'Kshitij');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `product_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`products`)),
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`product_id`, `username`, `products`, `total_amount`, `created_at`, `email`) VALUES
(65, 'Sandip', '[{\"product_name\":\"Carrot\",\"price\":100,\"quantity\":1,\"product_id\":17},{\"product_name\":\"Milk\",\"price\":60,\"quantity\":1,\"product_id\":16}]', 160.00, '2024-05-15 14:50:28', 'sandipmahat@gmail.com'),
(77, 'apil karki', '[{\"product_name\":\"chicken\",\"price\":350,\"quantity\":1,\"product_id\":19},{\"product_name\":\"Mutton\",\"price\":1000,\"quantity\":1,\"product_id\":20},{\"product_name\":\"Apple\",\"price\":180,\"quantity\":1,\"product_id\":2}]', 1530.00, '2024-05-17 02:50:12', 'apilkarki@gmail.com'),
(98, 'Apil', '[{\"product_name\":\"Cabbage\",\"price\":80,\"quantity\":1,\"product_id\":14}]', 80.00, '2024-05-23 23:02:18', 'apil@gmail.com'),
(107, 'Kshitij', '[{\"product_name\":\"Cabbage\",\"price\":80,\"quantity\":1,\"product_id\":14},{\"product_name\":\"Apple\",\"price\":200,\"quantity\":1,\"product_id\":13}]', 280.00, '2024-05-23 23:29:05', 'kshitij@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `google_users`
--

CREATE TABLE `google_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `username`, `email`, `message`, `timestamp`, `status`) VALUES
(1, 'Kshitij', 'kshitij@gmail.com', 'Your order has been cancelled', '2024-05-15 20:10:07', 0),
(2, 'Kshitij', 'kshitij@gmail.com', 'Your order has been cancelled', '2024-05-15 20:26:19', 0),
(3, 'Kshitij', 'kshitij@gmail.com', 'Your order has been placed', '2024-05-15 20:30:24', 1),
(4, 'Kshitij', 'kshitij@gmail.com', 'Your order has been cancelled', '2024-05-15 20:30:49', 0),
(5, 'Sandip', 'sandipmahat@gmail.com', 'Your order has been cancelled', '2024-05-15 20:35:48', 0),
(6, 'Sandip', 'sandipmahat@gmail.com', 'Your order has been placed', '2024-05-15 20:35:53', 1),
(7, 'Safal', 'safal@gmail.com', 'Your order has been placed', '2024-05-16 12:23:48', 1),
(8, 'Sandip', 'sandipmahat@gmail.com', 'Your order has been placed', '2024-05-16 19:13:19', 1),
(9, 'Kshitij', 'kshitij@gmail.com', 'Your order has been cancelled', '2024-05-16 19:15:14', 0),
(10, 'Kshitij', 'kshitij@gmail.com', 'Your order has been placed', '2024-05-16 19:15:28', 1),
(11, 'Sandip', 'sandipmahat@gmail.com', 'Your order has been cancelled', '2024-05-16 19:15:36', 0),
(12, 'Sandip', 'sandipmahat@gmail.com', 'Your order has been placed', '2024-05-16 19:15:44', 1),
(15, 'apil karki', 'apilkarki@gmail.com', 'Your order has been cancelled', '2024-05-17 08:42:22', 0),
(16, 'apil karki', 'apilkarki@gmail.com', 'Your order has been placed', '2024-05-17 08:42:24', 1),
(17, 'Apil', 'apil@gmail.com', 'Your order has been placed', '2024-05-24 04:48:22', 1),
(18, 'Kshitij', 'kshitij@gmail.com', 'Your order has been placed', '2024-05-24 05:02:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_view`
--

CREATE TABLE `product_view` (
  `farmer_name` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(200) NOT NULL,
  `stock` varchar(100) NOT NULL,
  `price` int(255) NOT NULL,
  `location` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_view`
--

INSERT INTO `product_view` (`farmer_name`, `product_name`, `product_desc`, `stock`, `price`, `location`, `product_id`) VALUES
('Kshitij', 'Mango', 'This Mango is imported from Surkhet', '30', 150, 'Surkhet', 12),
('Safal', 'Apple', 'This Apple is imported from Galkot', '30', 200, 'Naxal', 13),
('Safal', 'Cabbage', 'This Cabbage is fresh and is imported from Galkot', '30', 80, 'Baglung', 14),
('Kshitij', 'Strawberry', 'This Strawberry is fresh and is imported from Galkot', '30', 150, 'Surkhet', 15),
('Apil', 'Milk', 'This is the Cow milk', '20', 60, 'Chitwan', 16),
('Basanta', 'Carrot', 'This Carrot is organic and imported from Dailekh', '20', 100, 'Dailekh', 17),
('Safal', 'chicken', 'this is from home', '50', 350, 'bhaneshwor', 19),
('Butcher', 'Mutton', 'Yo local Khasi ho', '10', 1000, 'Kathmandu', 20),
('Safal', 'Butter', 'Galkot ko butter', '20', 500, 'Galkot', 23);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `product_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `cartItems` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cartItems`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `phone_num`, `cartItems`) VALUES
(15, 'Kshitij', 'kshitij@gmail.com', '$2b$10$TVCnBwBvS1G2R.216kno6upZ6geYIiNTopt.ONKLGFsq8Rt2O9uf6', '9822414661', '[]'),
(22, 'admin', 'admin@gmail.com', '$2b$10$kIMCxtBS2.TCOnoPGIZCz.NJUCdlIOCXJrgmtvFlJCCwIcF731wIu', '9812345678', NULL),
(26, 'Sandip', 'sandipmahat@gmail.com', '$2b$10$gTkD35ONW5Bb3HKBf8XDc.sLDdMsS38JkSzFIxGtFKeDb8zxpGqBq', '9767208068', '[]'),
(29, 'apil karki', 'apilkarki@gmail.com', '$2b$10$Wb0hT6pb60CL9mz7B.ZlfenHTkRTOVogkVE96yq1hd7j2rfGInDzG', '9810203040', '[]'),
(31, 'Safal', 'safal@gmail.com', '$2b$10$PSHxGtqbUoa/tTFKVYeL1ucz4.vmSML8JRZVE6aF1r4sFTX0x7dyG', '9840331727', NULL),
(32, 'Apil', 'apil@gmail.com', '$2b$10$o//5fXQUgBAVVKwd0u3OzODzrzArzl59SrMBfo7dRX.NbXeOxvM82', '9812345678', '[]'),
(33, 'Basanta', 'basanta@gmail.com', '$2b$10$otiTLbh4U33/FafKShMrYePcR1Tc.Pkst6s6gNpy3fZSjGHQCi7Ri', '9812345678', '[{\"product_name\":\"Apple\",\"price\":180,\"quantity\":1,\"product_id\":2}]'),
(34, 'Aashish', 'aashish@gmail.com', '$2b$10$DlVr2B7q0I2Eo0e8XJKrLe.5KB2auSOiiOF1Vd96wNZaRDW1E.9Mq', '9812345678', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vegetables`
--

CREATE TABLE `vegetables` (
  `veg_name` varchar(255) DEFAULT NULL,
  `initial_price` decimal(10,2) DEFAULT NULL,
  `sn_number` int(11) DEFAULT NULL,
  `veg_image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `google_users`
--
ALTER TABLE `google_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_view`
--
ALTER TABLE `product_view`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `google_users`
--
ALTER TABLE `google_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_view`
--
ALTER TABLE `product_view`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `cart_items` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_status_cart_items` FOREIGN KEY (`product_id`) REFERENCES `cart_items` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
