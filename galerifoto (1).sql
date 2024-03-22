-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 07:34 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galerifoto`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `albumid` int(11) NOT NULL,
  `namaalbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggaldibuat` date NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggaldibuat`, `userid`) VALUES
(1, 'Flower', 'bunga bunga kecil', '2024-01-30', 2),
(9, 'Digital Camera', '														taken by vintage digital camera														', '2024-03-20', 3),
(10, 'Animal', 'Cute animal pics', '2024-03-20', 3),
(11, 'Random', 'random thing', '2024-03-20', 5);

-- --------------------------------------------------------

--
-- Table structure for table `dislikefoto`
--

CREATE TABLE `dislikefoto` (
  `dislikeid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tanggaldislike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dislikefoto`
--

INSERT INTO `dislikefoto` (`dislikeid`, `fotoid`, `userid`, `tanggaldislike`) VALUES
(24, 10, 5, '2024-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `fotoid` int(11) NOT NULL,
  `judulfoto` varchar(255) NOT NULL,
  `deskripsifoto` text NOT NULL,
  `tanggalunggah` date NOT NULL,
  `lokasifile` varchar(255) NOT NULL,
  `albumid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`fotoid`, `judulfoto`, `deskripsifoto`, `tanggalunggah`, `lokasifile`, `albumid`, `userid`) VALUES
(4, 'Forest', 'Flower in the forest', '2024-03-20', '557666059-download (3).jfif', 9, 3),
(5, 'Wild Plants', 'Wild plants in the lake', '2024-03-20', '1875212145-Untitled (1).jfif', 9, 3),
(7, 'Bubble', 'Soap Bubble', '2024-03-20', '540468838-download (2).jfif', 9, 3),
(8, 'Cat', 'Cat looking at a bubble', '2024-03-20', '720100977-download (4).jfif', 10, 3),
(10, 'Dog', 'Dog with glasses', '2024-03-20', '652968168-Roxy.jfif', 9, 3),
(11, 'Cat and Goldfish', 'a cat looking at goldfish', '2024-03-20', '738800233-b0e9ff82-add0-4d5f-90cb-c069b3a6cfe0.jfif', 9, 3),
(12, 'Confetti', 'hands full of confetti', '2024-03-20', '1677581684-download (5).jfif', 11, 5),
(13, 'Tomatoes', 'Washing Tomatoes  but make it aesthetic', '2024-03-20', '704669650-download (7).jfif', 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `komentarid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `isikomentar` text NOT NULL,
  `tanggalkomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentarid`, `fotoid`, `userid`, `isikomentar`, `tanggalkomentar`) VALUES
(1, 3, 3, 'kucing', '2024-03-06'),
(2, 1, 3, 'colorful', '2024-03-06'),
(3, 2, 3, 'lucuu bgt', '2024-03-06'),
(4, 1, 3, 'kerenn', '2024-03-18'),
(5, 4, 3, 'Pretty picture !', '2024-03-20'),
(6, 8, 3, 'Cute cat!', '2024-03-20'),
(7, 8, 5, 'what is the race of this cat? ', '2024-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

CREATE TABLE `likefoto` (
  `likeid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tanggallike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likefoto`
--

INSERT INTO `likefoto` (`likeid`, `fotoid`, `userid`, `tanggallike`) VALUES
(21, 5, 3, '2024-03-20'),
(22, 4, 3, '2024-03-20'),
(23, 7, 3, '2024-03-20'),
(24, 8, 3, '2024-03-20'),
(25, 10, 3, '2024-03-20'),
(26, 11, 3, '2024-03-20'),
(27, 11, 5, '2024-03-20'),
(29, 8, 5, '2024-03-20'),
(30, 7, 5, '2024-03-20'),
(31, 5, 5, '2024-03-20'),
(32, 4, 5, '2024-03-20'),
(33, 12, 5, '2024-03-20'),
(34, 13, 5, '2024-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `alamat`) VALUES
(2, 'tomy', '25d55ad283aa400af464c76d713c07ad', 'tomyaditya3012@gmail.com', 'Tomy Aditya', 'komplek rajawali'),
(3, 'tomyy', '202cb962ac59075b964b07152d234b70', 'tomybatubara@gmail.com', 'tomy aditya batubara', 'komplek rajawali'),
(4, 'yofhan', '81dc9bdb52d04dc20036dbd8313ed055', 'yofhan@gmail.com', 'Yofhan', 'Keiza'),
(5, 'Nayya', '81dc9bdb52d04dc20036dbd8313ed055', 'shakilanayyalubis@gmail.com', 'Shakila Nayya Lubis', 'Jl. karya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumid`);

--
-- Indexes for table `dislikefoto`
--
ALTER TABLE `dislikefoto`
  ADD PRIMARY KEY (`dislikeid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`fotoid`),
  ADD KEY `albumid` (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`komentarid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`likeid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dislikefoto`
--
ALTER TABLE `dislikefoto`
  MODIFY `dislikeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `fotoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `komentarid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `likeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dislikefoto`
--
ALTER TABLE `dislikefoto`
  ADD CONSTRAINT `dislikefoto_ibfk_1` FOREIGN KEY (`fotoid`) REFERENCES `foto` (`fotoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dislikefoto_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`fotoid`) REFERENCES `foto` (`fotoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
