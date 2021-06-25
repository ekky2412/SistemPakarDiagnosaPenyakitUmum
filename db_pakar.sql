-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2021 at 06:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pakar`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_diagnosa`
--

CREATE TABLE `detail_diagnosa` (
  `id_diagnosa` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `cf_user` enum('0','0.2','0.4','0.6','0.8','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_diagnosa`
--

INSERT INTO `detail_diagnosa` (`id_diagnosa`, `id_gejala`, `cf_user`) VALUES
(1, 1, '1'),
(1, 4, '0.2'),
(1, 10, '1'),
(6, 1, '1'),
(6, 4, '0.2'),
(6, 10, '1'),
(7, 1, '0.8'),
(7, 2, '0.2'),
(7, 3, '0.2'),
(7, 4, '0.2'),
(7, 7, '0.6'),
(7, 8, '0.6'),
(7, 9, '1'),
(7, 10, '0.8'),
(7, 11, '1'),
(7, 12, '0.2'),
(7, 13, '0.6'),
(7, 14, '0.6'),
(7, 15, '0.8'),
(7, 16, '1'),
(7, 17, '0.6'),
(8, 4, '0.2'),
(8, 5, '0.4'),
(8, 6, '0.4'),
(8, 7, '0.4'),
(8, 8, '0.6'),
(8, 9, '0.4'),
(8, 10, '0.2'),
(8, 12, '0.4'),
(8, 13, '0.2'),
(8, 14, '0.4'),
(8, 15, '0.4'),
(8, 16, '1'),
(8, 17, '0.8'),
(9, 3, '1'),
(9, 10, '0.6'),
(9, 12, '1');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa`
--

CREATE TABLE `diagnosa` (
  `id_diagnosa` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `penyakit` int(11) NOT NULL,
  `persentase` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosa`
--

INSERT INTO `diagnosa` (`id_diagnosa`, `id_user`, `penyakit`, `persentase`) VALUES
(1, 1, 1, 0.6928),
(6, 6, 1, 0.6928),
(7, 7, 1, 0.909615),
(8, 8, 1, 0.854762),
(9, 9, 4, 0.8592);

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `nama_gejala` varchar(100) NOT NULL,
  `kode_gejala` varchar(10) NOT NULL,
  `bobot_cf` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `nama_gejala`, `kode_gejala`, `bobot_cf`) VALUES
(1, 'Demam', 'G1', 0.6),
(2, 'Mual', 'G2', 0.4),
(3, 'Lemas', 'G3', 0.2),
(4, 'Sakit Kepala', 'G4', 0.2),
(5, 'BAB Terus Menerus', 'G5', 0.4),
(6, 'Trombosit Turun', 'G6', 1),
(7, 'Perubahan Suhu Badan Tidak Menentu', 'G7', 0.6),
(8, 'Gula Darah Tinggi', 'G8', 1),
(9, 'Kulit Pucat', 'G9', 0.4),
(10, 'Turun Berat Badan', 'G10', 0.2),
(11, 'Nafsu Makan Turun', 'G11', 0.2),
(12, 'Luka Sulit Sembuh', 'G12', 0.8),
(13, 'Nyeri pada Otot', 'G13', 0.2),
(14, 'Dehidrasi', 'G14', 0.4),
(15, 'Perut Mulas', 'G15', 0.4),
(16, 'Menggigil', 'G16', 0.6),
(17, 'Nyeri pada Tulang', 'G17', 0.8);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `nama_penyakit` varchar(30) NOT NULL,
  `kode_penyakit` varchar(10) NOT NULL,
  `penanganan` text NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `nama_penyakit`, `kode_penyakit`, `penanganan`, `deskripsi`) VALUES
(1, 'Demam Berdarah', 'P1', 'Cara penanggulangan penyakit DBD adalah dengan minum banyak cairan, istirahat yang cukup dan mengonsumsi obat penurun panas untuk meredakan demam serta hindari aspirin atau obat antiinflamasi nonsteroid (OAINS) karena dapat memperparah pendarahan.', 'DBD adalah penyakit yang disebabkan oleh infeksi virus Dengue. Virus ini masuk ke dalam tubuh manusia melalui gigitan nyamuk Aedes aegypti dan Aedes albopictus, yang hidup di wilayah tropis dan subtropis.'),
(2, 'Anemia', 'P2', 'Cara penanggulangan penyakit Anemia adalah dengan mengonsumsi makanan dan suplemen zat besi anjuran dokter serta melakukan transfusi darah.', 'Anemia adalah kondisi ketika tubuh kekurangan sel darah merah yang sehat atau ketika sel darah merah tidak berfungsi dengan baik. akibatnya, organ tubuh tidak mendapat cukup oksigen, sehingga membuat penderita anemia pucat dan mudah lelah'),
(3, 'Malaria', 'P3', 'Cara penanggulangan penyakit Malaria adalah dengan pemberian obat antimalaria yang disesuaikan dengan jenis parasit penyebab malaria, tingkat keparahan, atau riwayat area geografis yang pernah ditinggali penderita. penyakit ini harus segera ditangani untuk mencegah risiko komplikasi yang berbahaya. ', 'Malaria adalah penyakit infeksi menular yang menyebar melalui gigitan nyamuk. penderita malaria akan mengeluhkan gejala demam dan menggigil.\r\n'),
(4, 'Diabetes Mellitus', 'P4', 'Cara penanggulangan penyakit Diabetes adalah dengan mengatur pola makan dengan memperbanyak konsumsi buah, sayur, protein dari biji-bijian, serta makanan rendah kalori dan lemak. bila perlu juga mengganti asupan gula dengan pemanis yang lebih aman. \r\n', 'Diabetes Mellitus adalah penyakit kronis yang ditandai dengan ciri-ciri berupa tingginya kadar gula (glukosa) darah.\r\n'),
(5, 'Thypus', 'P5', 'Cara penanggulangan penyakit Thypus adalah dengan pemberian obat antibiotik dengan anjuran dokter. penanggulangan bisa dilakukan di rumah atau perlu dilakukan di rumah sakit.\r\n', 'Thypus adalah penyakit yang disebabkan oleh infeksi bakteri Salmonella typhi. Thypus dapat menular dengan cepat, umumnya melalui konsumsi makanan atau minuman yang sudah terkontaminasi tinja yang mengandung bakteri Salmonella typhi.'),
(6, 'Diarrhea', 'P6', 'Cara penanggulangan penyakit Diarrhea adalah dengan meminum cairan elektrolit untuk mengganti cairan tubuh yang hilang dan mengonsumsi makanan yang lunak serta antibiotik atau obat anti diarrhea', 'Diarrhea adalah penyakit yang membuat penderitanya menjadi sering biang air besar, dengan kondisi tinja yang encer. Pada umumnya, diarrhea terjadi akibat makanan dan minuman yang terpapar virus, bakteri, atau parasit'),
(7, 'Chikungunya', 'P7', 'Cara penanggulangan penyakit Hipertensi adalah dengan banyak minum dan istirahat yang cukup serta meminum obat resep dokter yaitu antiradang atau obat flu tulang seperti paracetamol atau ibuprofen guna meredakan nyeri sendi dan demam. Dalam banyak kasus, gejala akan mereda dalam seminggu dan sembuh dengan sendirinya.', 'Chikungunya adalah infeksi virus yang ditandai dengan serangan demam dan nyeri sendi secara mendadak. Virus ini menyerang dan menulari manusia melalui gigitan nyamuk Aedes aegypti atau Aedes albopictus.');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id_penyakit` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id_penyakit`, `id_gejala`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 6),
(1, 7),
(1, 10),
(1, 11),
(1, 13),
(1, 17),
(2, 3),
(2, 4),
(2, 9),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 13),
(3, 16),
(4, 3),
(4, 8),
(4, 10),
(4, 12),
(5, 1),
(5, 3),
(5, 4),
(5, 5),
(5, 10),
(5, 11),
(5, 13),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 14),
(6, 15),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 13),
(7, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `umur` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `jenis_kelamin`, `umur`, `tanggal`) VALUES
(1, 'Satya', 'L', 90, '2021-06-25 15:04:59'),
(6, 'Rama', 'L', 98, '2021-06-25 15:45:04'),
(7, 'Istik', 'P', 17, '2021-06-25 15:56:19'),
(8, 'Daru', 'L', 20, '2021-06-25 15:57:43'),
(9, 'Kalian', 'L', 21, '2021-06-25 15:59:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_diagnosa`
--
ALTER TABLE `detail_diagnosa`
  ADD KEY `fk_id_diagnosa` (`id_diagnosa`),
  ADD KEY `fk_id_gejala_2` (`id_gejala`);

--
-- Indexes for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD PRIMARY KEY (`id_diagnosa`),
  ADD KEY `fk_id_user` (`id_user`),
  ADD KEY `fk_id_user_kena` (`penyakit`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`),
  ADD UNIQUE KEY `kode_gejala` (`kode_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`),
  ADD UNIQUE KEY `kode_penyakit` (`kode_penyakit`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD KEY `fk_id_penyakit` (`id_penyakit`),
  ADD KEY `fk_id_gejala` (`id_gejala`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosa`
--
ALTER TABLE `diagnosa`
  MODIFY `id_diagnosa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_diagnosa`
--
ALTER TABLE `detail_diagnosa`
  ADD CONSTRAINT `fk_id_diagnosa` FOREIGN KEY (`id_diagnosa`) REFERENCES `diagnosa` (`id_diagnosa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_gejala_2` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_user_kena` FOREIGN KEY (`penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rule`
--
ALTER TABLE `rule`
  ADD CONSTRAINT `fk_id_gejala` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
