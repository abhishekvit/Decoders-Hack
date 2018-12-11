-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2018 at 11:45 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xpense`
--

-- --------------------------------------------------------

--
-- Table structure for table `expdetails`
--

CREATE TABLE `expdetails` (
  `ExpID` int(11) NOT NULL,
  `RepID` int(11) DEFAULT NULL,
  `DateOfSub` date NOT NULL,
  `DateOfClose` date NOT NULL,
  `NumOfReverts` int(10) NOT NULL,
  `EaseOfProc` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expenseitems`
--

CREATE TABLE `expenseitems` (
  `ExpID` int(8) NOT NULL,
  `RepID` int(8) NOT NULL,
  `MerchantName` varchar(100) NOT NULL,
  `ExpType` varchar(100) NOT NULL,
  `InvoiceNum` varchar(100) NOT NULL,
  `Amount` int(20) NOT NULL,
  `TxnDt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expensereport`
--

CREATE TABLE `expensereport` (
  `RepName` varchar(100) NOT NULL,
  `Username` int(8) NOT NULL,
  `ReportID` int(8) NOT NULL,
  `Status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `Username` int(8) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `ApprCreditScore` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenseitems`
--
ALTER TABLE `expenseitems`
  ADD PRIMARY KEY (`ExpID`);

--
-- Indexes for table `expensereport`
--
ALTER TABLE `expensereport`
  ADD PRIMARY KEY (`ReportID`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenseitems`
--
ALTER TABLE `expenseitems`
  MODIFY `ExpID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expensereport`
--
ALTER TABLE `expensereport`
  MODIFY `ReportID` int(8) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
