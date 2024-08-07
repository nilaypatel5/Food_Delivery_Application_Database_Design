-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2024 at 01:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodapp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `user_id`, `street`, `city`, `state`, `zip_code`, `country`) VALUES
(1, 1, 'MG Road', 'Bengaluru', 'Karnataka', '560001', 'India'),
(2, 2, 'Park Street', 'Kolkata', 'West Bengal', '700016', 'India'),
(3, 3, 'Marine Drive', 'Mumbai', 'Maharashtra', '400020', 'India'),
(4, 4, 'Connaught Place', 'New Delhi', 'Delhi', '110001', 'India'),
(5, 5, 'T Nagar', 'Chennai', 'Tamil Nadu', '600017', 'India'),
(6, 6, 'Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'India'),
(7, 7, 'Law Garden', 'Ahmedabad', 'Gujarat', '380009', 'India'),
(8, 8, 'Sinhagad Road', 'Pune', 'Maharashtra', '411030', 'India'),
(9, 9, 'Sector 18', 'Noida', 'Uttar Pradesh', '201301', 'India'),
(10, 10, 'Bapuji Nagar', 'Bhubaneswar', 'Odisha', '751009', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `order_id`, `amount`, `payment_status`) VALUES
(1, 1, 250.00, 'Paid'),
(2, 2, 300.00, 'Unpaid'),
(3, 3, 150.00, 'Paid'),
(4, 4, 200.00, 'Cancelled'),
(5, 5, 120.00, 'Paid'),
(6, 6, 350.00, 'Unpaid'),
(7, 7, 100.00, 'Paid'),
(8, 8, 50.00, 'Cancelled'),
(9, 9, 180.00, 'Paid'),
(10, 10, 140.00, 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `menu_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 5, 2),
(6, 6, 6, 1),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 3),
(10, 10, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `order_id`, `delivery_status`, `delivery_date`, `delivery_address`) VALUES
(1, 1, 'Delivered', '2023-06-01 13:00:00', 1),
(2, 2, 'Pending', '2023-06-02 14:00:00', 2),
(3, 3, 'Delivered', '2023-06-03 15:00:00', 3),
(4, 4, 'Cancelled', '2023-06-04 16:00:00', 4),
(5, 5, 'Delivered', '2023-06-05 17:00:00', 5),
(6, 6, 'Pending', '2023-06-06 18:00:00', 6),
(7, 7, 'Delivered', '2023-06-07 19:00:00', 7),
(8, 8, 'Cancelled', '2023-06-08 20:00:00', 8),
(9, 9, 'Delivered', '2023-06-09 21:00:00', 9),
(10, 10, 'Pending', '2023-06-10 22:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `restaurant_id`, `item_name`, `item_description`, `price`) VALUES
(1, 1, 'Paneer Butter Masala', 'Paneer cooked in rich tomato gravy', 250.00),
(2, 2, 'Chicken Biryani', 'Aromatic basmati rice with tender chicken', 300.00),
(3, 3, 'Pav Bhaji', 'Spicy mashed vegetable curry with buttered bread', 150.00),
(4, 4, 'Dal Makhani', 'Black lentils cooked with butter and cream', 200.00),
(5, 5, 'Masala Dosa', 'Crispy dosa stuffed with spiced potatoes', 120.00),
(6, 6, 'Hyderabadi Dum Biryani', 'Slow-cooked biryani with rich flavors', 350.00),
(7, 7, 'Dhokla', 'Steamed fermented batter made from rice and chickpeas', 100.00),
(8, 8, 'Vada Pav', 'Spicy potato filling in a bread bun', 50.00),
(9, 9, 'Chole Bhature', 'Spicy chickpeas with fried bread', 180.00),
(10, 10, 'Pakhala Bhata', 'Fermented rice dish from Odisha', 140.00);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `user_id`, `message`, `status`) VALUES
(1, 1, 'Your order has been delivered.', 'Read'),
(2, 2, 'Your order is pending.', 'Unread'),
(3, 3, 'Your order has been delivered.', 'Read'),
(4, 4, 'Your order has been cancelled.', 'Read'),
(5, 5, 'Your order has been delivered.', 'Read'),
(6, 6, 'Your order is pending.', 'Unread'),
(7, 7, 'Your order has been delivered.', 'Read'),
(8, 8, 'Your order has been cancelled.', 'Read'),
(9, 9, 'Your order has been delivered.', 'Read'),
(10, 10, 'Your order is pending.', 'Unread');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `restaurant_id`, `order_date`, `order_status`) VALUES
(1, 1, 1, '2023-06-01 12:00:00', 'Delivered'),
(2, 2, 2, '2023-06-02 13:00:00', 'Pending'),
(3, 3, 3, '2023-06-03 14:00:00', 'Delivered'),
(4, 4, 4, '2023-06-04 15:00:00', 'Cancelled'),
(5, 5, 5, '2023-06-05 16:00:00', 'Delivered'),
(6, 6, 6, '2023-06-06 17:00:00', 'Pending'),
(7, 7, 7, '2023-06-07 18:00:00', 'Delivered'),
(8, 8, 8, '2023-06-08 19:00:00', 'Cancelled'),
(9, 9, 9, '2023-06-09 20:00:00', 'Delivered'),
(10, 10, 10, '2023-06-10 21:00:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `payment_method`, `payment_date`, `payment_status`) VALUES
(1, 9, 'Cash on Delivery', '2023-06-09 21:30:00', 'Paid'),
(2, 10, 'Credit Card', '2023-06-10 22:30:00', 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `name`, `address_id`, `phone`, `email`) VALUES
(1, 'Spice Kitchen', 1, '080-12345678', 'spice.kitchen@example.com'),
(2, 'Flavours of India', 2, '033-87654321', 'flavours.india@example.com'),
(3, 'Bombay Bistro', 3, '022-23456789', 'bombay.bistro@example.com'),
(4, 'Delhi Delight', 4, '011-34567890', 'delhi.delight@example.com'),
(5, 'Southern Spice', 5, '044-45678901', 'southern.spice@example.com'),
(6, 'Hyderabad House', 6, '040-56789012', 'hyderabad.house@example.com'),
(7, 'Gujarati Thali', 7, '079-67890123', 'gujarati.thali@example.com'),
(8, 'Pune Tadka', 8, '020-78901234', 'pune.tadka@example.com'),
(9, 'Noida Nook', 9, '0120-89012345', 'noida.nook@example.com'),
(10, 'Odisha Odissi', 10, '0674-90123456', 'odisha.odissi@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@example.com', 'password123'),
(2, 'Vivaan Khanna', 'vivaan.khanna@example.com', 'password123'),
(3, 'Aditya Kapoor', 'aditya.kapoor@example.com', 'password123'),
(4, 'Vihaan Gupta', 'vihaan.gupta@example.com', 'password123'),
(5, 'Arjun Verma', 'arjun.verma@example.com', 'password123'),
(6, 'Sai Iyer', 'sai.iyer@example.com', 'password123'),
(7, 'Krishna Das', 'krishna.das@example.com', 'password123'),
(8, 'Ishaan Mehta', 'ishaan.mehta@example.com', 'password123'),
(9, 'Rohan Patil', 'rohan.patil@example.com', 'password123'),
(10, 'Aryan Rao', 'aryan.rao@example.com', 'password123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `delivery_address` (`delivery_address`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`delivery_address`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
