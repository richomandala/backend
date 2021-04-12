-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2021 at 08:46 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.14

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
(6, 2, 3, 15);

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
  `time` time NOT NULL,
  `date` date NOT NULL,
  `is_off` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(10, '0052969926', '202110123', 'Alfan Fahmi', 1, 'Bogor', '2005-01-01', 16, 2),
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
(36, '0054125857', '202110562', 'Alexa Maharani Firmansyah', 2, 'Bogor', '2005-01-01', 42, 15);

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
  `classroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `nip` bigint(20) NOT NULL,
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
(1, 'admin', 'admin@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 1),
(2, '15180017', 'ahmad.saifm95@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 2),
(3, '15180032', 'farhan.21144@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 2),
(4, '15180037', 'richomandala12@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 2),
(5, '15180039', 'masdani@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 2),
(6, '15180010', 'fadillahsaidi@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 2),
(7, '0052445279', 'alfinalgifari@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(8, '0044304496', 'aliawulandari@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(9, '0055932707', 'abizalfabiansyahahmadaly@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(10, '0046373181', 'adeauliaputri@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(11, '0052110660', 'achmadmaulanahasani@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(12, '0052139820', 'alilazahrasalsabila@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(13, '0055799581', 'abelraffiputrasulaiman@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(14, '0048855307', 'aldobagintabarus@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(15, '3043642428', 'abimanyuchristianto@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
(16, '0052969926', 'alfanfahmi@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3),
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
(42, '0054125857', 'alexamaharanifirmansyah@gmail.com', 'sha1$8533b740$1$37f6e2df24f26f6a00aecd7e204eea8129f06a33', 3);

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
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_id` (`classroom_id`);

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
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `teachers_ibfk_1` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classworks`
--
ALTER TABLE `classworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject_matters`
--
ALTER TABLE `subject_matters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`);

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
