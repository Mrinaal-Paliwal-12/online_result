-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 03:35 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resultproj`
--
CREATE DATABASE IF NOT EXISTS `resultproj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `resultproj`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `password`, `email`) VALUES
(0, 'Mrinaal', 'mrinaal', 'superfastmrinaal@gmail.com'),
(1, 'calvin', 'calvin', 'cv@gmail.com'),
(2, 'jeff', 'jeff', 'jeff@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(25) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_name`, `course_id`) VALUES
(21, '2020-2022', 11),
(22, '2021-2023', 11),
(23, '2020-2022', 12),
(24, '2021-2023', 12);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`) VALUES
(11, 'MCA'),
(12, 'MBA');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `marks_id` int(11) NOT NULL,
  `st_id` int(11) DEFAULT NULL,
  `sem_id` int(11) DEFAULT NULL,
  `sub1` int(11) DEFAULT NULL,
  `sub2` int(11) DEFAULT NULL,
  `prac1` int(11) DEFAULT NULL,
  `prac2` int(11) DEFAULT NULL,
  `percentage` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`marks_id`, `st_id`, `sem_id`, `sub1`, `sub2`, `prac1`, `prac2`, `percentage`) VALUES
(1004, 104, 43, 90, 50, 50, 50, 60),
(1005, 120, 32, 100, 90, 80, 70, 85),
(1006, 105, 43, 90, 90, 80, 70, 82.5),
(1007, 106, 43, 80, 80, 80, 80, 80),
(1008, 107, 43, 70, 70, 70, 70, 70),
(1009, 108, 43, 65, 65, 65, 65, 65),
(1010, 109, 43, 60, 60, 60, 60, 60),
(1011, 111, 43, 99, 99, 20, 20, 59.5),
(1012, 110, 43, 50, 50, 50, 50, 50),
(1013, 112, 31, 100, 90, 80, 70, 85),
(1014, 113, 31, 70, 70, 70, 70, 70),
(1016, 114, 31, 70, 70, 50, 50, 60),
(1017, 115, 31, 70, 20, 50, 50, 47.5),
(1018, 116, 31, 90, 90, 80, 70, 82.5),
(1019, 117, 31, 70, 70, 70, 70, 70),
(1020, 118, 31, 90, 20, 65, 50, 56.25),
(1021, 119, 31, 70, 70, 70, 50, 65),
(1022, 121, 31, 90, 20, 50, 80, 60),
(1023, 112, 33, 60, 60, 60, 60, 60),
(1024, 113, 33, 66, 69, 69, 67, 67.75),
(1025, 114, 33, 78, 79, 77, 76, 77.5),
(1026, 115, 33, 88, 89, 80, 87, 86),
(1027, 116, 33, 55, 56, 54, 53, 54.5),
(1028, 117, 33, 43, 43, 41, 99, 56.5),
(1029, 118, 33, 32, 35, 34, 23, 31),
(1030, 122, 31, 100, 20, 20, 50, 47.5),
(1031, 119, 33, 70, 70, 50, 50, 60),
(1032, 104, 45, 50, 50, 50, 10, 40),
(1033, 104, 47, 100, 90, 80, 70, 85);

-- --------------------------------------------------------

--
-- Table structure for table `sem`
--

CREATE TABLE `sem` (
  `sem_id` int(11) NOT NULL,
  `sem_name` varchar(25) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sem`
--

INSERT INTO `sem` (`sem_id`, `sem_name`, `batch_id`) VALUES
(31, 'sem1', 21),
(32, 'sem1', 23),
(33, 'sem2', 21),
(34, 'sem2', 23),
(35, 'sem3', 21),
(36, 'sem3', 23),
(37, 'sem4', 21),
(38, 'sem4', 23),
(39, 'sem5', 21),
(40, 'sem5', 23),
(41, 'sem6', 21),
(42, 'sem6', 23),
(43, 'sem1', 22),
(44, 'sem1', 24),
(45, 'sem2', 22),
(46, 'sem2', 24),
(47, 'sem3', 22),
(48, 'sem3', 24),
(49, 'sem4', 22),
(50, 'sem4', 24),
(51, 'sem5', 22),
(52, 'sem5', 24),
(53, 'sem6', 22),
(54, 'sem6', 24);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `password`, `email`, `batch_id`) VALUES
(101, 'Mrinaal', '1234', 'mrinaal.p@somaiya.edu', 24),
(102, 'Kunal', 'kunal', 'paliwalkunal19@gmail.com', 24),
(104, 'Shannon Scott', 'shannon', 'shannon@gmail.com', 22),
(105, 'Kim Duke', 'kim', 'kim@gmail.com', 22),
(106, 'Jason Chandler', 'jason', 'jason@gmail.com', 22),
(107, 'Jeff Moore', 'jeff', 'jeff@gmail.com', 22),
(108, 'Nicholas Turner', 'nicholas', 'nicholas@gmail.com', 22),
(109, 'Steve Mitchell', 'steve', 'steve@gmail.com', 22),
(110, 'Anthony Harriso', 'anthony', 'anthony@gmail.com', 22),
(111, 'David Gree', 'david', 'david@gmail.com', 22),
(112, 'Mary Mckee', 'mary', 'mary@gmail.com', 21),
(113, 'Kathryn Lopez', 'kathryn', 'kathryn@gmail.com', 21),
(114, 'Bryan Ramirez', 'bryan ', 'bryan@gmail.com', 21),
(115, 'Justin Hudson I', 'justin', 'justin@gmail.com', 21),
(116, 'Leonard Miller', 'leonard', 'leonard@gmail.com', 21),
(117, 'Erika Delacruz', 'erika', 'erika@gmail.com', 21),
(118, 'William Long', 'william', 'william@gmail.com', 21),
(119, 'Angela George', 'angela', 'angela@gmail.com', 21),
(120, 'Caitlin Stephen', 'caitlin', 'caitlin@gmail.com', 23),
(121, 'Timothy Mcfarla', 'timothy', 'timothy@gmail.com', 21),
(122, 'alpha', 'alpha', 'alpha@gmail.com', 21),
(123, 'beta', 'beta', 'beta@gmail.com', 22),
(124, 'Theta', 'beta', 'theta@gmail.com', 23),
(125, 'Gamma', 'gamma', 'gamma@gmail.com', 22),
(126, 'Bhavana Goswami', 'bhavana', 'bhavana@gmail.com', 23),
(127, 'ramu', 'ramu', 'ramu@gmail.com', 24);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `name`, `email`, `password`, `course_id`) VALUES
(61, 'Prof. Jaya ', 'jaya_mam@gmail.com', 'jaya', 11),
(62, 'Sudarshan Sir', 'sudarshan_sir@gmail.com', 'sudarshan', 11),
(63, 'Julie Mam', 'julie@gmail.com', 'julie', 12),
(64, 'Mary', 'mary@gmail.com', 'mary', 12),
(65, 'Reyansh Dugar', 'reyansh@gmail.com', 'reyansh', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `FK_course_id` (`course_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`marks_id`),
  ADD KEY `fk_marks_st_id` (`st_id`),
  ADD KEY `fk_marks_sem_id` (`sem_id`);

--
-- Indexes for table `sem`
--
ALTER TABLE `sem`
  ADD PRIMARY KEY (`sem_id`),
  ADD KEY `FK_batch_id` (`batch_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_student_batch_id` (`batch_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_teacher_course_id` (`course_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `FK_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_marks_sem_id` FOREIGN KEY (`sem_id`) REFERENCES `sem` (`sem_id`),
  ADD CONSTRAINT `fk_marks_st_id` FOREIGN KEY (`st_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `sem`
--
ALTER TABLE `sem`
  ADD CONSTRAINT `FK_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fk_teacher_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
