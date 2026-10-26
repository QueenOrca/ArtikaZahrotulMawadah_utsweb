-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 04:26 PM
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
-- Database: `dbnilai`
--

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `nim` char(10) NOT NULL,
  `nm_lengkap` varchar(100) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) NOT NULL,
  `nilai_huruf` char(1) NOT NULL,
  `predikat` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`nim`, `nm_lengkap`, `foto`, `nilai_akhir`, `nilai_huruf`, `predikat`, `created_date`, `modified_date`) VALUES
('3202516001', 'Abyan', '1793028189_3202516001.jpeg', 95.00, 'A', 'Sangat Memuaskan', '2026-10-26 15:23:09', '2026-10-26 15:23:09'),
('3202516002', 'Rifdah', '1793028237_3202516002.jpeg', 85.00, 'A', 'Sangat Memuaskan', '2026-10-26 15:23:57', '2026-10-26 15:23:57'),
('3202516003', 'Caesha', '1793028263_3202516003.jpeg', 100.00, 'A', 'Sangat Memuaskan', '2026-10-26 15:24:23', '2026-10-26 15:24:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
