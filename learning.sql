-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2019 at 09:03 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'კაცი'),
(2, 'ქალი');

-- --------------------------------------------------------

--
-- Table structure for table `professions`
--

CREATE TABLE `professions` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professions`
--

INSERT INTO `professions` (`id`, `name`) VALUES
(1, 'მოსწავლე'),
(2, 'აბიტურიენტი'),
(3, 'სტიქაროსანი'),
(4, 'მონდომებული'),
(5, 'მძღოლი'),
(6, 'ფიზიკოსი'),
(7, 'სპეციალისტი'),
(8, 'ტექნიკურ-ადმინისტრაციულ-ეკონომიკური სისტემების მართვა და კომპიუტერული ავტომატიზაცია');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `profession` varchar(100) NOT NULL,
  `gender_id` int(1) NOT NULL,
  `deleted` int(11) NOT NULL,
  `inserted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `email`, `mobile`, `birth_date`, `profession`, `gender_id`, `deleted`, `inserted_at`) VALUES
(1, 'ამირან', 'ივანიძე', 'amiran.ivanidz3@gmail.com', '596107255', '2001-05-15', 'მოსწავლე', 1, 0, '2019-04-07 14:55:15'),
(4, 'გიორგი', 'უზნაძე', 'giouzznaz@mail.ru', '557589684', '2002-12-08', 'მოსწავლე', 1, 1, '2019-04-07 14:55:15'),
(6, 'დავით', 'ბორჩხაძე', 'datoborchxadze103@gmail.com', '557394010', '2002-09-25', 'მოსწავლე', 1, 0, '2019-04-07 15:00:50'),
(7, 'რაზმიკ', 'ხაჩატურიანი', 'razmikxachaturiani@gmail.com', '579705349', '1992-07-20', 'მონდომებული', 1, 1, '2019-04-07 15:00:50'),
(8, 'თორნიკე', 'ხუციშვილი', 'gsmwork2015@gmail.com', '571006493', '1980-12-07', 'მძღოლი', 1, 1, '2019-04-07 15:06:42'),
(10, 'ლევან', 'ხარატიშვილი', 'levanikharatishvili@gmail.com', '577014206', '1985-04-27', 'სპეციალისტი', 1, 1, '2019-04-07 15:09:59'),
(11, 'შოთა', 'გოგიჩაიშვილი', 'shotagogichaishvili@yahoo.com', '599352978', '1980-09-04', 'ფიზიკოსი', 1, 0, '2019-04-07 15:09:59'),
(12, 'გიორგი', 'გოგუაძე', 'goguadzegiorgi@gmail.com', '598251534', '1988-02-26', 'ტექნიკურ-ადმინისტრაციულ-ეკონომიკური სისტემების მართვა და კომპიუტერული ავტომატიზაცია', 1, 1, '2019-04-07 15:11:34'),
(22, 'Tata', 'Batashვილი', 'tata@gmail.com', '555555555', '0000-00-00', '', 2, 1, '2019-04-07 19:49:34'),
(23, 'first nm', 'last nm', 'email@email.com', '555555555', '0000-00-00', '', 1, 1, '2019-04-21 19:26:08'),
(24, 'st2', 'st2 last name', 'st2 email addr', '555555558', '0000-00-00', '', 2, 1, '2019-04-21 19:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `students_old`
--

CREATE TABLE `students_old` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `profession` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL DEFAULT 'კაცი',
  `inserted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students_old`
--

INSERT INTO `students_old` (`id`, `first_name`, `last_name`, `email`, `mobile`, `birth_date`, `profession`, `gender`, `inserted_at`) VALUES
(1, 'ამირან', 'ივანიძე', 'amiran.ivanidz3@gmail.com', '596107255', '2001-05-15', 'მოსწავლე', 'კაცი', '2019-04-07 14:55:15'),
(2, 'გიორგი', 'ივანიძე', 'amirani.lowriders@gmail.com', '596107252', '2002-05-06', 'მოსწავლე', 'კაცი', '2019-04-07 14:55:15'),
(3, 'ლუკა', 'თათარიშვილი', 'luka000777@gmail.com', '574067369', '2001-04-16', 'აბიტურიენტი', 'კაცი', '2019-04-07 14:55:15'),
(4, 'გიორგი', 'უზნაძე', 'giouzznaz@mail.ru', '557589684', '2002-12-08', 'მოსწავლე', 'კაცი', '2019-04-07 14:55:15'),
(5, 'ალექსანდრე', 'ფილიშვილი', 'apilishvili444@gmail.com', '593764475', '1979-05-10', 'სტიქაროსანი', 'კაცი', '2019-04-07 15:00:50'),
(6, 'დავით', 'ბორჩხაძე', 'datoborchxadze103@gmail.com', '557394010', '2002-09-25', 'მოსწავლე', 'კაცი', '2019-04-07 15:00:50'),
(7, 'რაზმიკ', 'ხაჩატურიანი', 'razmikxachaturiani@gmail.com', '579705349', '1992-07-20', 'მონდომებული', 'კაცი', '2019-04-07 15:00:50'),
(8, 'თორნიკე', 'ხუციშვილი', 'gsmwork2015@gmail.com', '571006493', '1980-12-07', 'მძღოლი', 'კაცი', '2019-04-07 15:06:42'),
(9, 'ალექსანდრე', 'ჭანკვეტაძე', 'achankvetadze@gmail.com', '598261336', '1981-05-16', 'ფიზიკოსი', 'კაცი', '2019-04-07 15:06:42'),
(10, 'ლევან', 'ხარატიშვილი', 'levanikharatishvili@gmail.com', '577014206', '1985-04-27', 'სპეციალისტი', 'კაცი', '2019-04-07 15:09:59'),
(11, 'შოთა', 'გოგიჩაიშვილი', 'shotagogichaishvili@yahoo.com', '599352978', '1980-09-04', 'ფიზიკოსი', 'კაცი', '2019-04-07 15:09:59'),
(12, 'გიორგი', 'გოგუაძე', 'goguadzegiorgi@gmail.com', '598251534', '1988-02-26', 'ვებ-დეველოპერი', 'კაცი', '2019-04-07 15:11:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_old`
--
ALTER TABLE `students_old`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `professions`
--
ALTER TABLE `professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `students_old`
--
ALTER TABLE `students_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
