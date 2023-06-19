-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 12, 2023 at 03:57 PM
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
-- Database: `csc584_hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BOOKING_ID` int NOT NULL,
  `INVOICE_NUMBER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INV231230001',
  `BOOKING_PAX` int DEFAULT NULL,
  `BOOKING_DAYSOFSTAY` int DEFAULT NULL,
  `BOOKING_CHECKINDATE` datetime DEFAULT NULL,
  `BOOKING_CHECKOUTDATE` datetime DEFAULT NULL,
  `BOOKING_TOTALFEE` double DEFAULT NULL,
  `CUSTOMER_ID` int DEFAULT NULL,
  `ROOM_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` int NOT NULL,
  `CUSTOMER_HONORIFIC` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mr. Mrs. Miss. Ms.',
  `CUSTOMER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CUSTOMER_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CUSTOMER_PHONENUMBER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOM_ID` int NOT NULL,
  `ROOM_NUMBER` int DEFAULT NULL COMMENT '1(Level)01(Room Number)',
  `ROOM_STATUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Occupied, Needs Cleaning, Booked, Available',
  `ROOMTYPE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOM_ID`, `ROOM_NUMBER`, `ROOM_STATUS`, `ROOMTYPE_ID`) VALUES
(1, 101, 'Available', 1),
(2, 102, 'Available', 1),
(3, 103, 'Available', 1),
(4, 104, 'Available', 2),
(5, 105, 'Available', 2),
(6, 106, 'Available', 2),
(7, 201, 'Available', 3),
(8, 202, 'Available', 3),
(9, 203, 'Available', 4),
(10, 204, 'Available', 4),
(11, 300, 'Available', 5);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `ROOMTYPE_ID` int NOT NULL,
  `ROOM_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Guest Room, Executive Suite, Presidential Suite',
  `ROOM_DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '2 Twin Beds, Guest Room (ExtraBeds:1) (MaxPeople:3) (Rooms:3)\r\n1 King Bed, Guest Room (ExtraBeds:NA) (MaxPeople:2) (Rooms:3)\r\n2 Twin Beds, Executive Suite (ExtraBeds:1) (MaxPeople:3) (Rooms:2)\r\n1 King Bed, Executive Suite (ExtraBeds:1) (MaxPeople:3) (Rooms:2)\r\n1 King Bed, Presidential Suite (ExtraBeds:NA) (MaxPeople:2) (Rooms:1)',
  `ROOM_MAXPAX` int DEFAULT NULL,
  `ROOM_EXTRABEDCOUNT` int DEFAULT NULL,
  `ROOM_PRICE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`ROOMTYPE_ID`, `ROOM_NAME`, `ROOM_DESCRIPTION`, `ROOM_MAXPAX`, `ROOM_EXTRABEDCOUNT`, `ROOM_PRICE`) VALUES
(1, 'Guest Room (Twin)', '2 Twin Beds', 3, 1, 410),
(2, 'Guest Room (King)', '1 King Bed', 2, 0, 430),
(3, 'Executive Suite (Twin)', '2 Twin Beds, Concierge Lounge Access', 3, 1, 800),
(4, 'Executive Suite (King)', '1 King Bed, Pool View, Concierge Lounge Access, Patio', 3, 1, 1130),
(5, 'Presidential Suite', '1 King Bed, Bay View, Concierge Lounge Access, Patio', 2, 0, 5420);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `STAFF_ID` int NOT NULL,
  `STAFF_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STAFF_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STAFF_PHONENUMBER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_PASSWORD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_TYPE` int DEFAULT NULL COMMENT '1 - Staff, 2 - Customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `ROOM_ID` (`ROOM_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ROOM_ID`),
  ADD KEY `ROOMTYPE_ID` (`ROOMTYPE_ID`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`ROOMTYPE_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFF_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BOOKING_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUSTOMER_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `ROOM_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `ROOMTYPE_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `STAFF_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ROOM_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ROOMTYPE_ID`) REFERENCES `roomtype` (`ROOMTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
