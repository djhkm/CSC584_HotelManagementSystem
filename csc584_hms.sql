-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 07, 2023 at 08:24 PM
-- Server version: 5.7.41
-- PHP Version: 7.4.32

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
  `BOOKING_ID` int(11) NOT NULL,
  `INVOICE_NUMBER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INV231230001',
  `BOOKING_DATE` datetime DEFAULT NULL,
  `BOOKING_PAX` int(11) DEFAULT NULL,
  `BOOKING_DAYSOFSTAY` int(11) DEFAULT NULL,
  `BOOKING_CHECKINDATE` datetime DEFAULT NULL,
  `BOOKING_CHECKOUTDATE` datetime DEFAULT NULL,
  `BOOKING_TOTALFEE` double DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `ROOM_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BOOKING_ID`, `INVOICE_NUMBER`, `BOOKING_DATE`, `BOOKING_PAX`, `BOOKING_DAYSOFSTAY`, `BOOKING_CHECKINDATE`, `BOOKING_CHECKOUTDATE`, `BOOKING_TOTALFEE`, `CUSTOMER_ID`, `ROOM_ID`) VALUES
(1, 'INV2307071', '2023-07-07 13:45:29', 1, 1, '2023-07-08 13:45:29', '2023-07-13 13:45:29', 1500, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `CUSTOMER_HONORIFIC` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mr. Mrs. Miss. Ms.',
  `CUSTOMER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CUSTOMER_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CUSTOMER_PHONENUMBER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `CUSTOMER_HONORIFIC`, `CUSTOMER_NAME`, `CUSTOMER_EMAIL`, `CUSTOMER_PHONENUMBER`, `USER_ID`) VALUES
(1, 'Mr.', 'qwe', 'qwe@qwe', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOM_ID` int(11) NOT NULL,
  `ROOM_NUMBER` int(11) DEFAULT NULL COMMENT '1(Level)01(Room Number)',
  `ROOM_STATUS` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Booked, Occupied, Needs Cleaning, Available',
  `ROOMTYPE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOM_ID`, `ROOM_NUMBER`, `ROOM_STATUS`, `ROOMTYPE_ID`) VALUES
(1, 101, 'Available', 1),
(2, 102, 'Available', 1),
(3, 103, 'Available', 1),
(4, 104, 'Needs Cleaning', 2),
(5, 105, 'Needs Cleaning', 2),
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
  `ROOMTYPE_ID` int(11) NOT NULL,
  `ROOM_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Guest Room, Executive Suite, Presidential Suite',
  `ROOM_DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '2 Twin Beds, Guest Room (ExtraBeds:1) (MaxPeople:3) (Rooms:3)\r\n1 King Bed, Guest Room (ExtraBeds:NA) (MaxPeople:2) (Rooms:3)\r\n2 Twin Beds, Executive Suite (ExtraBeds:1) (MaxPeople:3) (Rooms:2)\r\n1 King Bed, Executive Suite (ExtraBeds:1) (MaxPeople:3) (Rooms:2)\r\n1 King Bed, Presidential Suite (ExtraBeds:NA) (MaxPeople:2) (Rooms:1)',
  `ROOM_MAXPAX` int(11) DEFAULT NULL,
  `ROOM_EXTRABEDCOUNT` int(11) DEFAULT NULL,
  `ROOM_PRICE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`ROOMTYPE_ID`, `ROOM_NAME`, `ROOM_DESCRIPTION`, `ROOM_MAXPAX`, `ROOM_EXTRABEDCOUNT`, `ROOM_PRICE`) VALUES
(1, 'Guest Room (Twin)', '2 Twin Beds, Guest Room', 3, 1, 410),
(2, 'Guest Room (King)', '1 King Bed, Guest Room', 2, 0, 430),
(3, 'Executive Suite (Twin)', '2 Twin Beds, Concierge Lounge Access, Executive Suite', 3, 1, 800),
(4, 'Executive Suite (King)', '1 King Bed, Pool View, Concierge Lounge Access, Patio, Executive Suite', 3, 1, 1130),
(5, 'Presidential Suite', '1 King Bed, Bay View, Concierge Lounge Access, Patio, Presidential Suite', 2, 0, 5420);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `STAFF_ID` int(11) NOT NULL,
  `STAFF_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STAFF_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STAFF_PHONENUMBER` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_PASSWORD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_TYPE` int(11) DEFAULT NULL COMMENT '1 - Staff, 2 - Customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USERNAME`, `USER_PASSWORD`, `USER_TYPE`) VALUES
(1, 'qwe', 'qwe', 2);

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
  MODIFY `BOOKING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `ROOM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `ROOMTYPE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `STAFF_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
