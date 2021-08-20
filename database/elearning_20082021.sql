-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2021 at 07:27 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class`, `grade`, `major_id`) VALUES
(1, 'EA', 10, 3),
(2, 'EB', 10, 3),
(3, 'EC', 10, 3),
(4, 'LA', 10, 4),
(5, 'LB', 10, 4),
(6, 'LC', 10, 4),
(7, 'MA', 10, 5),
(8, 'MB', 10, 5),
(9, 'MC', 10, 5),
(10, 'OA', 10, 6),
(11, 'OB', 10, 6),
(12, 'OC', 10, 6),
(13, 'TIA', 10, 7),
(14, 'TIB', 10, 7),
(15, 'TIC', 10, 7),
(16, 'TKPA', 10, 1),
(17, 'TKPB', 10, 2),
(18, 'TKPC', 10, 2),
(19, 'EA', 11, 3),
(20, 'EB', 11, 3),
(21, 'EC', 11, 3),
(22, 'LA', 11, 4),
(23, 'LB', 11, 4),
(24, 'LC', 11, 4),
(25, 'MA', 11, 5),
(26, 'MB', 11, 5),
(27, 'MC', 11, 5),
(28, 'OA', 11, 6),
(29, 'OB', 11, 6),
(30, 'OC', 11, 6),
(31, 'TIA', 11, 7),
(32, 'TIB', 11, 7),
(33, 'TIC', 11, 7),
(34, 'TKPA', 11, 1),
(35, 'TKPB', 11, 2),
(36, 'TKPC', 11, 2),
(37, 'EA', 12, 3),
(38, 'EB', 12, 3),
(39, 'LA', 12, 4),
(40, 'LB', 12, 4),
(41, 'MA', 12, 5),
(42, 'MB', 12, 5),
(43, 'MC', 12, 5),
(44, 'OA', 12, 6),
(45, 'OB', 12, 6),
(46, 'TIA', 12, 7),
(47, 'TIB', 12, 7),
(48, 'TKPA', 12, 1),
(49, 'TKPB', 12, 2),
(50, 'TKPC', 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`id`, `teacher_id`, `subject_id`, `class_id`) VALUES
(1, 1, 2, 13),
(2, 1, 2, 14),
(3, 1, 2, 15),
(4, 2, 3, 13),
(5, 2, 3, 14),
(6, 2, 3, 15),
(7, 1, 2, 1),
(8, 1, 2, 47),
(11, 2, 3, 47);

-- --------------------------------------------------------

--
-- Table structure for table `classworks`
--

CREATE TABLE `classworks` (
  `id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_matter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classworks`
--

INSERT INTO `classworks` (`id`, `file_path`, `student_id`, `subject_matter_id`) VALUES
(1, 'file.pdf', 37, 2);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `day` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat');

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `major` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `code`, `major`) VALUES
(1, 'BKP', 'Bisnis Konstruksi Properti'),
(2, 'DPIB', 'Desain Pemodelan dan Informasi Bangunan'),
(3, 'TAV', 'Teknik Audio Video'),
(4, 'TITL', 'Teknik Instalasi Tenaga Listrik'),
(5, 'TP', 'Teknik Pemesinan'),
(6, 'TKRO', 'Teknik Kendaraan Ringan Otomotif'),
(7, 'TKJ', 'Teknik Komputer dan Jaringan');

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

CREATE TABLE `presences` (
  `id` int(11) NOT NULL,
  `is_presence` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Teacher'),
(3, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `roomchats`
--

CREATE TABLE `roomchats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `chat` text NOT NULL,
  `is_teacher` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `time_id`, `day_id`, `class_id`, `subject_id`) VALUES
(1, 2, 1, 47, 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `nisn` char(10) NOT NULL,
  `nis` char(9) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `nisn`, `nis`, `name`, `gender`, `birthplace`, `birthdate`, `user_id`, `class_id`) VALUES
(1, '0052445279', '202110001', 'Alfin Algifari', 1, 'Bogor', '2005-01-01', 7, 16),
(2, '0044304496', '202110002', 'Alia Wulandari', 2, 'Bogor', '2005-01-01', 8, 16),
(3, '0055932707', '202110023', 'Abizal Fabiansyah Ahmadaly', 1, 'Bogor', '2005-01-01', 9, 17),
(4, '0046373181', '202110024', 'Ade Aulia Putri', 2, 'Bogor', '2005-01-01', 10, 17),
(5, '0052110660', '202110059', 'Achmad Maulana Hasani', 1, 'Bogor', '2005-01-01', 11, 18),
(6, '0052139820', '202110060', 'Alila Zahra Salsabila', 2, 'Bogor', '2005-01-01', 12, 18),
(7, '0055799581', '202110094', 'Abel Raffi Putra Sulaiman', 1, 'Bogor', '2005-01-01', 13, 1),
(8, '0048855307', '202110095', 'Aldo Baginta Barus', 1, 'Bogor', '2005-01-01', 14, 1),
(9, '3043642428', '202110122', 'Abimanyu Christianto', 1, 'Bogor', '2005-01-01', 15, 2),
(11, '0057739483', '202110150', 'Aditya Toyyibul Ikhsan', 1, 'Bogor', '2005-01-01', 17, 3),
(12, '0044304495', '202110151', 'Alfinnu Prastyawan', 1, 'Bogor', '2005-01-01', 18, 3),
(13, '0051933622', '202110177', 'Adrian Hidayat', 1, 'Bogor', '2005-01-01', 19, 4),
(14, '0041246757', '202110178', 'Agil Muhammad Syafe\'I', 1, 'Bogor', '2005-01-01', 20, 4),
(15, '0058039256', '202110211', 'Aflah Noval Ramadhan', 1, 'Bogor', '2005-01-01', 21, 5),
(16, '0051432430', '202110212', 'Agung Satrya Mahendra', 1, 'Bogor', '2005-01-01', 22, 5),
(17, '0050817097', '202110245', 'Afridho Ibrahim', 1, 'Bogor', '2005-01-01', 23, 6),
(18, '0051431853', '202110246', 'Akmal Ghani Febriansyah', 1, 'Bogor', '2005-01-01', 24, 6),
(19, '0042371795', '202110277', 'Abdul Muhyi Jaka Maudi', 1, 'Bogor', '2005-01-01', 25, 7),
(20, '0044873234', '202110278', 'Ade Abdillah', 1, 'Bogor', '2005-01-01', 26, 7),
(21, '0045666273', '202110313', 'Achmad Badrudin', 1, 'Bogor', '2005-01-01', 27, 8),
(22, '0046097799', '202110314', 'Ade Hermawan', 1, 'Bogor', '2005-01-01', 28, 8),
(23, '0045792293', '202110348', 'Adam Fitrah Rizqi Junaedi', 1, 'Bogor', '2005-01-01', 29, 9),
(24, '0054217599', '202110349', 'Adhimas Dwi Putra', 1, 'Bogor', '2005-01-01', 30, 9),
(25, '0048919668', '202110383', 'Abdul Qodir', 1, 'Bogor', '2005-01-01', 31, 10),
(26, '0054454615', '202110384', 'Aditya Rizki Aulia', 1, 'Bogor', '2005-01-01', 32, 10),
(27, '0053277083', '202110418', 'Achmad Daffa Lutfian Hadi', 1, 'Bogor', '2005-01-01', 33, 11),
(28, '0029051194', '202110419', 'Ahmad Parirudin', 1, 'Bogor', '2005-01-01', 34, 11),
(29, '0051991018', '202110454', 'Adika Fairuz Zahran', 1, 'Bogor', '2005-01-01', 35, 12),
(30, '0040555993', '202110455', 'Ahmad Yasin', 1, 'Bogor', '2005-01-01', 36, 12),
(31, '0051564515', '202110489', 'Abdul Kharies', 1, 'Bogor', '2005-01-01', 37, 13),
(32, '0044693467', '202110490', 'Alvina Salsabila', 2, 'Bogor', '2005-01-01', 38, 13),
(33, '3052558909', '202110525', 'Agnes Anasty Arnanditya', 2, 'Bogor', '2005-01-01', 39, 14),
(34, '0051632235', '202110526', 'Ahmad Kabiru Rifai', 1, 'Bogor', '2005-01-01', 40, 14),
(35, '0056529376', '202110561', 'Aldi Ardana Putra', 1, 'Bogor', '2005-01-01', 41, 15),
(36, '0054125857', '202110562', 'Alexa Maharani Firmansyah', 2, 'Bogor', '2005-01-01', 42, 15),
(37, '1234567890', '123456789', 'Richo', 1, 'Bogor', '1998-12-01', 48, 47),
(38, '1234554321', '123454321', 'Dani', 1, 'Bogor', '2000-06-16', 49, 47);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `subject`) VALUES
(2, 'MTK', 'Matematika'),
(3, 'BIN', 'Bahasa Indonesia'),
(4, 'ENG', 'Bahasa Inggris');

-- --------------------------------------------------------

--
-- Table structure for table `subject_matters`
--

CREATE TABLE `subject_matters` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `is_task` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_matters`
--

INSERT INTO `subject_matters` (`id`, `title`, `content`, `file_path`, `is_task`, `classroom_id`) VALUES
(1, 'LOGARITMA', 'ini isi content logaritma', 'file.pdf', 0, 1),
(2, 'Logaritma', 'ini isi content logaritma', 'file.pdf', 1, 8),
(3, 'Integral', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel tincidunt diam, ut consequat orci. Pellentesque malesuada nisi vitae justo pretium, ac ullamcorper lacus pulvinar. Nullam volutpat justo eu tempor commodo. Maecenas rhoncus et purus at malesuada. Aliquam erat volutpat. Morbi sagittis massa quis dui dictum, ut aliquam ipsum accumsan. Pellentesque urna sem, sollicitudin sed volutpat et, rutrum ut ipsum. Nunc luctus tincidunt purus, sed aliquet eros dictum vel. Nunc sit amet tempor ligula. Nulla facilisi. Vivamus ut risus nec tortor dictum dignissim et in lacus. Morbi consectetur mauris sed erat dignissim, sed pretium neque ultrices. Aenean ligula erat, eleifend.', 'file.pdf', 0, 8),
(4, 'Turunan', 'ini isi content turunan', 'file.pdf', 1, 7),
(7, 'Turunan', 'ini isi content turunan', 'file.pdf', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `nip` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `nip`, `name`, `gender`, `birthplace`, `birthdate`, `user_id`) VALUES
(1, 12345, 'Ahmad Saif Mujahid', 1, 'Kuningan', '1999-10-21', 2),
(2, 54321, 'Mohamad Dani Saputro', 1, 'Banyumas', '2000-06-16', 5);

-- --------------------------------------------------------

--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `id` int(11) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `times`
--

INSERT INTO `times` (`id`, `time_start`, `time_end`) VALUES
(1, '07:00:00', '07:45:00'),
(2, '07:45:00', '08:30:00'),
(3, '08:30:00', '09:15:00'),
(4, '09:15:00', '10:00:00'),
(5, '10:00:00', '10:15:00'),
(6, '10:15:00', '11:00:00'),
(7, '11:45:00', '12:30:00'),
(8, '12:30:00', '13:00:00'),
(9, '13:00:00', '13:45:00'),
(10, '13:45:00', '14:30:00'),
(11, '14:30:00', '15:15:00'),
(12, '15:15:00', '15:30:00'),
(13, '15:30:00', '16:15:00'),
(14, '16:15:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `token_access`
--

CREATE TABLE `token_access` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `expired` bigint(20) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token_access`
--

INSERT INTO `token_access` (`id`, `token`, `expired`, `ip_address`, `user_id`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDY2MzEsImV4cCI6MTYzMTQ0NjYzMX0.e6efiQQqxS4uGnU_YQi3txwm-LGFHaNzfgN9HzB-yRo', 1629049031923, '192.168.95.132', 48),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDY3MDIsImV4cCI6MTYzMTQ0NjcwMn0.Fvb6wdd6Y2sMP7uIByuQ_rkeFTvPc8CIyczsQpAqY4g', 1629049102178, '192.168.95.132', 48),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDY3NzksImV4cCI6MTYzMTQ0Njc3OX0.IIQJZcuQdNFHudjBDRDiVxrMWrFynFO7aBpsDacrlq4', 1629049179684, '192.168.95.132', 48),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDY4MjAsImV4cCI6MTYzMTQ0NjgyMH0.dcOLXuGFCJUBwPeAd5cNN62ijwDNtrm9StvWOrkrWnw', 1629049220567, '192.168.95.132', 48),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDY5MjUsImV4cCI6MTYzMTQ0NjkyNX0.W8qKOsZSZ3hwoNn1o9fHwKEPZR7BZ-XMY9047arwEiU', 1629049325333, '192.168.95.132', 48),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDY5NDUsImV4cCI6MTYzMTQ0Njk0NX0.cBaKlgP2fd7DoS4WbRzjNzNCeCqvCuAZmdfQ3fzbTqY', 1629049345727, '192.168.95.132', 48),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDcwMDQsImV4cCI6MTYzMTQ0NzAwNH0._5i3h3OCAwXoSpqc9PQevwMZMn36sVvJRguziW7jt2Q', 1629049404203, '192.168.95.132', 48),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNDcwMzEsImV4cCI6MTYzMTQ0NzAzMX0.XubX-GDXTHa6w2xmLwpysegZhFHl7TLEHUt5NBThNcY', 1629049431595, '192.168.95.132', 48),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA1MTY3NywiZXhwIjoxNjMxNDUxNjc3fQ.V9jpLcTHJ2PU7WWqBT0-eDcOtx4iR3v55QnHvhQDzF4', 1629054077992, '192.168.95.132', 1),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA1MTcxMiwiZXhwIjoxNjMxNDUxNzEyfQ.ZKfjAwBVBFnd8mndMGL1Zj7rxr63CDkfTP4TlRp7N_I', 1629054112937, '192.168.95.132', 1),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA1MTk0OCwiZXhwIjoxNjMxNDUxOTQ4fQ.BB90Dq3GzkKa4l02ivY-v_UW_tbvplEQeCYZ1LRsusY', 1629054348772, '192.168.95.132', 1),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNTI3NTIsImV4cCI6MTYzMTQ1Mjc1Mn0.DDEwFqeQSWPBxc2f_NJEw2upUh99qtvgKqHRXsNEpx8', 1629055152721, '192.168.95.132', 48),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA1Mjc4MCwiZXhwIjoxNjMxNDUyNzgwfQ._1dG6SReM72UZl3wWIsMr39JXTA6gi3YZBfQ5WsRXQo', 1629055180037, '192.168.95.132', 1),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwNTI4MjIsImV4cCI6MTYzMTQ1MjgyMn0.i_raANNxEyYw8CROw73_mqBqKC8UiKSvWWScm1ulFaM', 1629055222781, '192.168.95.132', 48),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA1Mjg0NCwiZXhwIjoxNjMxNDUyODQ0fQ.B5Gesw-NvLdMUAMk983ijn3FOT4BAXQfFMl6lcpoNxw', 1629055244005, '192.168.95.132', 1),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA5NjU0MiwiZXhwIjoxNjMxNDk2NTQyfQ.5G-G3As9-2kFVxEPeHh3-lYxPdfmNMFi8YLINEdSh3U', 1629098942474, '192.168.0.15', 1),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OSwidXNlcm5hbWUiOiIxMjM0NTU0MzIxIiwiZW1haWwiOiJkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ3YjUxYmIxMCQxJDM0NjA5NWM2MWMxOTk1MDQyOTViY2VjOTkwNTQyN2QxZDEzMDYyNGUiLCJyb2xlX2lkIjozfSwiaWF0IjoxNjI5MDk2ODI3LCJleHAiOjE2MzE0OTY4Mjd9.C67GmmMJXnrCGyM-Seyn9RYCO9caJuub3aAAk5mINCQ', 1629099227760, '192.168.0.15', 49),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA5NjkwOCwiZXhwIjoxNjMxNDk2OTA4fQ.bBR9icj4DaFWOgV8BjJJhTNuqbCuWMHnNuC-mFbam1A', 1629099308764, '192.168.0.15', 1),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkwOTcyNjgsImV4cCI6MTYzMTQ5NzI2OH0.CohPnm_zQZ2kVMZTfJ67f3wASaWbdC6MdPrA4Z-DLkc', 1629099668798, '192.168.0.15', 48),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA5NzI5NSwiZXhwIjoxNjMxNDk3Mjk1fQ.oY_cwcs8rovJM6j_szPaCy-WPi0skZHZlf-TTm5v5_g', 1629099695225, '192.168.0.15', 1),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA5NzMxNiwiZXhwIjoxNjMxNDk3MzE2fQ.Jo_E5QOYZYBLGV7xWnbuiHIKNJSLFM4ufPix8kLsXqk', 1629099716793, '192.168.0.15', 1),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA5ODA3MiwiZXhwIjoxNjMxNDk4MDcyfQ.-qk1b3QFUwp6YY4i96tnW_qq7eC5CSd6eCP7Dw3-hoY', 1629100472004, '192.168.0.15', 1),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTA5OTU0NywiZXhwIjoxNjMxNDk5NTQ3fQ._SA8LcgZZiMnr_cBG1mFkfsJd5p7P0Vsqie9ix9461I', 1629101947378, '192.168.0.15', 1),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxMDAwMjUsImV4cCI6MTYzMTUwMDAyNX0.ciJ5pxo7EbKRACbfx67M5naPbNTpApZiEKCJ_RIGcs4', 1629102425461, '192.168.0.15', 48),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTEwMjQ1NiwiZXhwIjoxNjMxNTAyNDU2fQ.U068mHFI--3NiXnMqCdeVQUxWao0zffWA0cEAl3_VVM', 1629104856677, '192.168.0.15', 1),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OSwidXNlcm5hbWUiOiIxMjM0NTU0MzIxIiwiZW1haWwiOiJkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ3YjUxYmIxMCQxJDM0NjA5NWM2MWMxOTk1MDQyOTViY2VjOTkwNTQyN2QxZDEzMDYyNGUiLCJyb2xlX2lkIjozfSwiaWF0IjoxNjI5MTA0NTE4LCJleHAiOjE2MzE1MDQ1MTh9.AxN2BxSuzMriC_DP1XkkNC25A9UxLoxKKMyNtlhVtYc', 1629106918637, '192.168.0.15', 49),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxMDQ1NTMsImV4cCI6MTYzMTUwNDU1M30.I4SYMdWJHISKoNlh2l6xfY82HEE9vZinecKJ8nGLXeM', 1629106953055, '192.168.0.15', 48),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTEwNDg1MSwiZXhwIjoxNjMxNTA0ODUxfQ.AGKpKxuXXNuYvwosjRw62P9baDmUb9OCkUgODya8L2A', 1629107251121, '192.168.0.15', 1),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjE1MTgwMDE3IiwiZW1haWwiOiJhaG1hZC5zYWlmbTk1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTA2ODQ3LCJleHAiOjE2MzE1MDY4NDd9.AR5Q52zHSy36-bUClWs6MNAfVZA3lGJNt0i7vl2-cEo', 1629109247843, '192.168.0.15', 2),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxMDc1MzQsImV4cCI6MTYzMTUwNzUzNH0.xR_Zd8n5hBDV2nLHN11cr0BTkzq0vT5LSQgyvqQfrqk', 1629109934447, '192.168.0.15', 48),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo1LCJ1c2VybmFtZSI6IjE1MTgwMDM5IiwiZW1haWwiOiJtYXNkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTA3ODQxLCJleHAiOjE2MzE1MDc4NDF9.vNntQ5zjYwr12F-jLUdkAEork5oZhe85C9k9UyoVVGY', 1629110241961, '192.168.0.15', 5),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjE1MTgwMDE3IiwiZW1haWwiOiJhaG1hZC5zYWlmbTk1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTA3OTExLCJleHAiOjE2MzE1MDc5MTF9.3H1_Fkr8CWVoZfgpSwmBCGr1Uvrq-Jzx9w7wizi39Ks', 1629110311113, '192.168.0.15', 2),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTEwODA2MCwiZXhwIjoxNjMxNTA4MDYwfQ.dnhXVGrYRK6IR3_lkJcYNT-pFK1XhfbU58CXKCTM_mk', 1629110460316, '192.168.0.15', 1),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxMDg1ODMsImV4cCI6MTYzMTUwODU4M30.L-Na28Hi33ddjEq5wm0ICOPB6Zrs9m8BNmkhvIQYgi4', 1629110983570, '192.168.0.15', 48),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxNzgyNDEsImV4cCI6MTYzMTU3ODI0MX0.yKsoNXavRahOYA0K9fFrNDtKPPCXZh-OegQpBcODZms', 1629180641507, '192.168.78.132', 48),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjE1MTgwMDE3IiwiZW1haWwiOiJhaG1hZC5zYWlmbTk1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTc4OTAxLCJleHAiOjE2MzE1Nzg5MDF9.JdkTiNtyx5dPBcQ1e1vIBnXJFFE_hQdTwPMf8LcjbhU', 1629181301708, '192.168.78.132', 2),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxNzkwMDEsImV4cCI6MTYzMTU3OTAwMX0.7oPQ1sgGCHmNXpR9xXWyZ28JekzgPHhfIwTxppVnRFI', 1629181401764, '192.168.78.132', 48),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTE4MTQzMiwiZXhwIjoxNjMxNTgxNDMyfQ.4fSu1i3prnHTbHII4AY8Q6KIfvBhssV8wk7zhsGWiz8', 1629183832680, '192.168.78.132', 1),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkxODU1NTYsImV4cCI6MTYzMTU4NTU1Nn0.uff0IUbA5aGEWfWSh8mWuVScsbDpXx1vEmvFIdzj48Q', 1629187956198, '192.168.78.132', 48),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo1LCJ1c2VybmFtZSI6IjE1MTgwMDM5IiwiZW1haWwiOiJtYXNkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTg3NzU4LCJleHAiOjE2MzE1ODc3NTh9.5-xzLvi7gzlLv4uftmoRWikySfKLargmhGwR7R64tX4', 1629190158251, '192.168.78.132', 5),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjE1MTgwMDE3IiwiZW1haWwiOiJhaG1hZC5zYWlmbTk1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTg3Nzc4LCJleHAiOjE2MzE1ODc3Nzh9._2IhTuJ7v5cdsa9uO1PSET54vVg8mR4_NPnmU15hJLg', 1629190178539, '192.168.78.132', 2),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo1LCJ1c2VybmFtZSI6IjE1MTgwMDM5IiwiZW1haWwiOiJtYXNkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTg3Nzk2LCJleHAiOjE2MzE1ODc3OTZ9.RnZIP1t9aAVFbi8Pfp7a-d-HNA5IX_ob07Um95-x7V4', 1629190196786, '192.168.78.132', 5),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTE4Nzg5MiwiZXhwIjoxNjMxNTg3ODkyfQ.GUkhK_PP2pTb5zvcvU-c0QCJ3-4amUrqw5RlElNqtEk', 1629190292385, '192.168.78.132', 1),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjE1MTgwMDE3IiwiZW1haWwiOiJhaG1hZC5zYWlmbTk1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MTg4MzY1LCJleHAiOjE2MzE1ODgzNjV9.CCikRuJOO5TR0dRkNsDsaeSg0_K6LwZXj-0vHS3Hd0g', 1629190765660, '192.168.78.132', 2),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTE5MTAzMiwiZXhwIjoxNjMxNTkxMDMyfQ.pSsxdbQdsbjmKRoJDxkbqLj4083VD4lEp61YwnwXkuE', 1629193432566, '192.168.78.132', 1),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTIwNzIxNywiZXhwIjoxNjMxNjA3MjE3fQ.TZn0zPkxgrAa4B0ls6zwik-WWOmNkBzNTJW5GiHe6WQ', 1629209617891, '192.168.78.132', 1),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0OCwidXNlcm5hbWUiOiJyaWNobyIsImVtYWlsIjoicmljaG9AZ21haWwuY29tIiwicGFzc3dvcmQiOiJzaGExJDQ5MzVkZGQ1JDEkZTQ3MWI3M2U3Y2U2Yzk4MWI4OWIzNmZlYThmZTQ2NzUyYzVmYzc5YyIsInJvbGVfaWQiOjN9LCJpYXQiOjE2MjkyMTAyMDUsImV4cCI6MTYzMTYxMDIwNX0.gG0xm0gqLKUFxei3RdOuVHqO1bKWynyzRgYgn5Dlm9c', 1629212605271, '192.168.78.132', 48),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjE1MTgwMDE3IiwiZW1haWwiOiJhaG1hZC5zYWlmbTk1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoic2hhMSQ0OTM1ZGRkNSQxJGU0NzFiNzNlN2NlNmM5ODFiODliMzZmZWE4ZmU0Njc1MmM1ZmM3OWMiLCJyb2xlX2lkIjoyfSwiaWF0IjoxNjI5MjExMzE3LCJleHAiOjE2MzE2MTEzMTd9.HPpQ_WaKdn78SL858kHCCIgoDibSWGJI0c9uGoh0738', 1629213717751, '192.168.78.132', 2),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InNoYTEkNDkzNWRkZDUkMSRlNDcxYjczZTdjZTZjOTgxYjg5YjM2ZmVhOGZlNDY3NTJjNWZjNzljIiwicm9sZV9pZCI6MX0sImlhdCI6MTYyOTIxMTc3MCwiZXhwIjoxNjMxNjExNzcwfQ.Q6sHvX2FFvj2m4HEAwp1FR9A0wI1v9eDd5qxbQt1KKQ', 1629214170206, '192.168.78.132', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`) VALUES
(1, 'admin', 'admin@gmail.com', 'sha1$4935ddd5$1$e471b73e7ce6c981b89b36fea8fe46752c5fc79c', 1),
(2, '15180017', 'ahmad.saifm95@gmail.com', 'sha1$4935ddd5$1$e471b73e7ce6c981b89b36fea8fe46752c5fc79c', 2),
(5, '15180039', 'masdani@gmail.com', 'sha1$4935ddd5$1$e471b73e7ce6c981b89b36fea8fe46752c5fc79c', 2),
(7, '0052445279', 'alfinalgifari@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(8, '0044304496', 'aliawulandari@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(9, '0055932707', 'abizalfabiansyahahmadaly@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(10, '0046373181', 'adeauliaputri@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(11, '0052110660', 'achmadmaulanahasani@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(12, '0052139820', 'alilazahrasalsabila@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(13, '0055799581', 'abelraffiputrasulaiman@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(14, '0048855307', 'aldobagintabarus@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(15, '3043642428', 'abimanyuchristianto@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(17, '0057739483', 'adityatoyyibulikhsan@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(18, '0044304495', 'alfinnuprastyawan@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(19, '0051933622', 'adrianhidayat@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(20, '0041246757', 'agilmuhammadsyafe\'i@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(21, '0058039256', 'aflahnovalramadhan@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(22, '0051432430', 'agungsatryamahendra@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(23, '0050817097', 'afridhoibrahim@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(24, '0051431853', 'akmalghanifebriansyah@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(25, '0042371795', 'abdulmuhyijakamaudi@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(26, '0044873234', 'adeabdillah@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(27, '0045666273', 'achmadbadrudin@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(28, '0046097799', 'adehermawan@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(29, '0045792293', 'adamfitrahrizqijunaedi@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(30, '0054217599', 'adhimasdwiputra@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(31, '0048919668', 'abdulqodir@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(32, '0054454615', 'adityarizkiaulia@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(33, '0053277083', 'achmaddaffalutfianhadi@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(34, '0029051194', 'ahmadparirudin@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(35, '0051991018', 'adikafairuzzahran@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(36, '0040555993', 'ahmadyasin@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(37, '0051564515', 'abdulkharies@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(38, '0044693467', 'alvinasalsabila@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(39, '3052558909', 'agnesanastyarnanditya@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(40, '0051632235', 'ahmadkabirurifai@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(41, '0056529376', 'aldiardanaputra@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(42, '0054125857', 'alexamaharanifirmansyah@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(48, 'richo', 'richo@gmail.com', 'sha1$4935ddd5$1$e471b73e7ce6c981b89b36fea8fe46752c5fc79c', 3),
(49, '1234554321', 'dani@gmail.com', 'sha1$7b51bb10$1$346095c61c199504295bcec9905427d1d130624e', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_id` (`major_id`);

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `classworks`
--
ALTER TABLE `classworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_matter_id` (`subject_matter_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `presences`
--
ALTER TABLE `presences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomchats`
--
ALTER TABLE `roomchats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomchats_ibfk_1` (`schedule_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nisn` (`nisn`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `students_ibfk_2` (`user_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `subject_matters`
--
ALTER TABLE `subject_matters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_ibfk_1` (`user_id`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_access`
--
ALTER TABLE `token_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `classworks`
--
ALTER TABLE `classworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `presences`
--
ALTER TABLE `presences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roomchats`
--
ALTER TABLE `roomchats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject_matters`
--
ALTER TABLE `subject_matters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `token_access`
--
ALTER TABLE `token_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`);

--
-- Constraints for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `classrooms_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `classrooms_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `classworks`
--
ALTER TABLE `classworks`
  ADD CONSTRAINT `classworks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `classworks_ibfk_2` FOREIGN KEY (`subject_matter_id`) REFERENCES `subject_matters` (`id`);

--
-- Constraints for table `presences`
--
ALTER TABLE `presences`
  ADD CONSTRAINT `presences_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `presences_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `roomchats`
--
ALTER TABLE `roomchats`
  ADD CONSTRAINT `roomchats_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_matters`
--
ALTER TABLE `subject_matters`
  ADD CONSTRAINT `subject_matters_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
