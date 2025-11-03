-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2025 at 02:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asimos`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(25) NOT NULL,
  `date` varchar(25) NOT NULL,
  `test` varchar(25) NOT NULL,
  `subjectName` varchar(25) NOT NULL,
  `marks` varchar(25) NOT NULL,
  `Result` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `date`, `test`, `subjectName`, `marks`, `Result`) VALUES
(2017115611, '29-06-2024', 'unit-1', 'English', '35/50', 'PASS'),
(2017115611, '29-07-2024', 'unit-1', 'English', '50/50', 'PASS'),
(2017115611, '01-01-2017', 'unit-2', 'Tamil', '0/50', 'FAIL'),
(2017115611, '29-06-2024', 'unit-1', 'English', '12/50', 'FAIL'),
(2017115611, '29-06-2024', 'unit-3', 'Science', '42/50', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `date` varchar(12) NOT NULL,
  `status` int(2) NOT NULL,
  `markedBy` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `name`, `date`, `status`, `markedBy`) VALUES
(2017115611, 'Viswaprasad', '2023-01-01', 0, 'Jayanthi'),
(2017115611, 'Viswaprasad', '2023-01-02', 1, 'Jayanthi'),
(2017115611, 'Viswaprasad', '2023-12-20', 0, 'Jayanthi'),
(2017115611, 'Prasad', '2024-03-02', 0, 'Jayanthi'),
(2017115611, 'Prasad', '2024-03-03', 1, 'Jayanthi'),
(2017115611, 'Prasad', '2024-03-02', 1, 'Jayanthi'),
(2017115611, 'Prasad', '2024-03-02', 0, 'Jayanthi'),
(2017115611, 'Viswaprasad', '2024-03-02', 1, 'Jayanthi'),
(2017115611, 'Prasad', '2024-03-02', 0, 'Jayanthi');

-- --------------------------------------------------------

--
-- Table structure for table `homeworks`
--

CREATE TABLE `homeworks` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `teacher_id` varchar(10) NOT NULL,
  `standard` int(11) NOT NULL,
  `section` varchar(2) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homeworks`
--

INSERT INTO `homeworks` (`id`, `subject_name`, `teacher_id`, `standard`, `section`, `date`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'English', '2017115610', 1, 'A', '2025-08-25', 'Grammar Worksheet', 'Complete exercises on tenses from page 23 to 26.', '2025-08-27 18:51:45', '2025-08-27 18:51:45'),
(2, 'Mathematics', '2017115610', 1, 'A', '2025-08-25', 'Addition Practice', 'Solve problems 1–20 from the class workbook.', '2025-08-27 18:51:45', '2025-08-27 18:51:45'),
(3, 'Science', '2017115610', 1, 'A', '2025-08-26', 'Plants and Animals', 'Draw and label parts of a plant in your notebook.', '2025-08-27 18:51:45', '2025-08-27 18:51:45'),
(4, 'Social', '2017115610', 1, 'A', '2025-08-27', 'Our Neighborhood', 'Write 5 sentences about your neighborhood.', '2025-08-27 18:51:45', '2025-08-27 18:51:45'),
(5, 'Tamil', '2017115610', 1, 'A', '2025-08-27', 'Poem Recitation', 'Memorize the given 4-line Tamil poem and prepare to recite.', '2025-08-27 18:51:45', '2025-08-27 18:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` varchar(20) NOT NULL,
  `subjectName` varchar(50) NOT NULL,
  `testName` varchar(50) NOT NULL,
  `date` varchar(25) NOT NULL,
  `marksObtained` varchar(10) DEFAULT NULL,
  `totalMarks` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `subjectName`, `testName`, `date`, `marksObtained`, `totalMarks`) VALUES
('2017115611', 'English', 'Term 1', '', '100', '100'),
('2017115611', 'Mathematics', 'Term 1', '', '90', '100'),
('2017115611', 'Science', 'Term 1', '', '50', '100'),
('2017115611', 'Social', 'Term 1', '', '20', '100'),
('2017115611', 'Tamil', 'Term 1', '', '35', '100');

-- --------------------------------------------------------

--
-- Table structure for table `marks_new`
--

CREATE TABLE `marks_new` (
  `id` varchar(20) NOT NULL,
  `subjectName` varchar(50) NOT NULL,
  `testName` varchar(50) NOT NULL,
  `date` varchar(25) NOT NULL,
  `grandTotal` varchar(100) NOT NULL,
  `totalMarks` varchar(10) NOT NULL,
  `english` int(10) NOT NULL,
  `tamil` int(10) NOT NULL,
  `maths` int(10) NOT NULL,
  `science` int(10) NOT NULL,
  `social` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks_new`
--

INSERT INTO `marks_new` (`id`, `subjectName`, `testName`, `date`, `grandTotal`, `totalMarks`, `english`, `tamil`, `maths`, `science`, `social`) VALUES
('2017115611', '0', 'Term 1', '2023-01-01', '', '100', 50, 60, 40, 80, 50),
('2017115611', '0', 'Term 2', '2023-01-01', '', '100', 42, 92, 54, 20, 74),
('2017115611', '0', 'Term 3', '2023-01-01', '', '100', 12, 42, 44, 85, 48);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` varchar(20) NOT NULL,
  `notification` varchar(200) NOT NULL,
  `sentBy` varchar(200) NOT NULL,
  `date` varchar(12) NOT NULL,
  `time` varchar(10) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `notification`, `sentBy`, `date`, `time`, `status`) VALUES
('2017115611', 'Please pay the second term fees.', 'Principal', '2023-01-01', '20:30', 0),
('2017115611', 'Complete the homework assignments today', 'Teacher', '2023-01-01', '02:30', 0),
('2017115611', 'Parent-Teachers meeting on saturday afternoon 12:30 PM', 'A.O', '02-03-2024', '05:10 AM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(2) NOT NULL,
  `standard` int(2) NOT NULL,
  `section` varchar(2) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dateOfBirth` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `bloodGroup` varchar(5) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `emailID` varchar(25) NOT NULL,
  `fatherName` varchar(20) NOT NULL,
  `fatherOccupation` varchar(20) NOT NULL,
  `fatherPhone` varchar(15) NOT NULL,
  `fatherAnnualIncome` varchar(15) NOT NULL,
  `motherName` varchar(20) NOT NULL,
  `motherOccupation` varchar(20) NOT NULL,
  `motherPhone` varchar(15) NOT NULL,
  `motherAnnualIncome` varchar(15) NOT NULL,
  `community` varchar(20) NOT NULL,
  `identificationMark` varchar(50) NOT NULL,
  `comments` varchar(50) NOT NULL,
  `previousEducation` varchar(50) NOT NULL,
  `coCurricularActivity` varchar(50) NOT NULL,
  `locOfProfilePic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`id`, `name`, `age`, `standard`, `section`, `gender`, `dateOfBirth`, `address`, `bloodGroup`, `phone`, `emailID`, `fatherName`, `fatherOccupation`, `fatherPhone`, `fatherAnnualIncome`, `motherName`, `motherOccupation`, `motherPhone`, `motherAnnualIncome`, `community`, `identificationMark`, `comments`, `previousEducation`, `coCurricularActivity`, `locOfProfilePic`) VALUES
(2017115611, 'Viswaprasad', 5, 1, 'A', 'Male', '29-06-2000', 'No: 41, First cross, Ramalingam Nagar, Sokkanathenpet, Pondicherry 605010.', 'B +ve', '', 'meetprasadviswa@gmail.com', 'Elumalai', 'Advocate', '9489324639', '100000', 'Bhuvaneswari', 'Assistant Agricultur', '9500215554', '600000', 'General', 'A mole in the chin. A scare in the fore head', '-', 'St. Antony\'s Matric Higher Secondary School. Cudda', 'Null', './assets/img/stdImg/Viswaprasad_Passport_Size.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `access` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `name`, `password`, `access`) VALUES
('2017115610', 'Zamp', 'Zamp', 1),
('2017115611', 'Viswaprasad', 'Viswa', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_homework_teacher` (`teacher_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`,`subjectName`,`testName`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD CONSTRAINT `fk_homework_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `user_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
