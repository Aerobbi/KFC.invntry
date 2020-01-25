-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2020 at 02:34 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kfcyahut`
--

-- --------------------------------------------------------

--
-- Table structure for table `brg_keluar`
--

CREATE TABLE `brg_keluar` (
  `kd_stok` varchar(20) NOT NULL,
  `kd_keluar` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `jmlh_stok` int(20) NOT NULL,
  `jmlh_keluar` int(20) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `ket` varchar(30) NOT NULL,
  `tgl_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brg_keluar`
--

INSERT INTO `brg_keluar` (`kd_stok`, `kd_keluar`, `nama_brg`, `jmlh_stok`, `jmlh_keluar`, `satuan`, `ket`, `tgl_keluar`) VALUES
('BRG-01', 'BRK-01', 'Cheese Slice', 180, 180, 'Pcs', 'Proses Operator', '2020-01-27'),
('BRG-02', 'BRK-02', 'Wipping Cream', 130, 130, 'Pck', 'Proses Operator', '2020-01-28'),
('BRG-03', 'BRK-03', 'Bubble Warp', 15, 15, 'Roll', 'Dikirim Ke Gerai', '2020-01-29'),
('BRG-04', 'BRK-04', 'Cup', 175, 175, 'Pck', 'Dikirim Ke Gerai', '2020-01-30'),
('BRG-05', 'BRK-05', 'Butter Ancor', 200, 200, 'Pck', 'Proses Operator', '2020-01-31'),
('BRG-06', 'BRK-06', 'Air Mineral', 250, 250, 'Pck', 'Dikirim Ke Gerai', '2020-02-01'),
('BRG-07', 'BRK-07', 'Plate', 80, 80, 'Pck', 'Dikirim Ke Gerai', '2020-02-03');

--
-- Triggers `brg_keluar`
--
DELIMITER $$
CREATE TRIGGER `kuar` AFTER INSERT ON `brg_keluar` FOR EACH ROW BEGIN
UPDATE stok_brg SET jmlh_stok=jmlh_stok-new.jmlh_keluar
WHERE kd_brg=new.kd_stok;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brg_masuk`
--

CREATE TABLE `brg_masuk` (
  `id` int(15) NOT NULL,
  `kd_brg` varchar(20) NOT NULL,
  `kd_sup` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `kuantitas` int(20) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `supplier` varchar(140) NOT NULL,
  `spek` varchar(20) NOT NULL,
  `tgl_en` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brg_masuk`
--

INSERT INTO `brg_masuk` (`id`, `kd_brg`, `kd_sup`, `nama_brg`, `kuantitas`, `satuan`, `supplier`, `spek`, `tgl_en`) VALUES
(16, 'BRG-01', 'SUP-01', 'Cheese Slice', 200, 'Pcs', 'PT. Akasha Wira International .Tbk', '250gr', '2020-01-13'),
(17, 'BRG-02', 'SUP-02', 'Wipping Cream', 150, 'Pck', 'PT. Tiga Pilar Sejahtera Food .Tbk', '100ml', '2020-01-14'),
(18, 'BRG-03', 'SUP-03', 'Bubble Warp', 15, 'Roll', 'PT. Tri Banyan Tirta .Tbk', '5x5meter', '2020-01-15'),
(19, 'BRG-04', 'SUP-04', 'Cup', 200, 'Pck', 'PT. Bumi Teknokultura Unggul .Tbk', 'Large', '2020-01-16'),
(20, 'BRG-05', 'SUP-05', 'Butter Ancor', 200, 'Pck', 'PT. Budi Starch & Sweetener .Tbk', '300gr', '2020-01-17'),
(21, 'BRG-06', 'SUP-06', 'Air Mineral', 300, 'Pck', 'PT. Wilmar Cahaya Indonesia .Tbk', '250ml', '2020-01-18'),
(22, 'BRG-07', 'SUP-07', 'Plate', 100, 'Pck', 'PT. Sariguna Primatirta .Tbk', '12buah', '2020-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `brg_reject`
--

CREATE TABLE `brg_reject` (
  `kd_stok` varchar(20) NOT NULL,
  `kd_reject` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `jumlah_stok` int(20) NOT NULL,
  `jumlah_reject` int(20) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `supplier` varchar(140) NOT NULL,
  `ket` varchar(30) NOT NULL,
  `tgl_reject` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brg_reject`
--

INSERT INTO `brg_reject` (`kd_stok`, `kd_reject`, `nama_brg`, `jumlah_stok`, `jumlah_reject`, `satuan`, `supplier`, `ket`, `tgl_reject`) VALUES
('BRG-01', 'BRJCT-01', 'Cheese Slice', 200, 20, 'Pcs', 'PT. Akasha Wira International .Tbk', 'Kadaluwarsa', '2020-01-21'),
('BRG-02', 'BRJCT-02', 'Wipping Cream', 150, 20, 'Pck', 'PT. Tiga Pilar Sejahtera Food .Tbk', 'Rusak pengiriman', '2020-01-22'),
('BRG-04', 'BRJCT-03', 'Cup', 200, 25, 'Pck', 'PT. Bumi Teknokultura Unggul .Tbk', 'Cacat fisik', '2020-01-23'),
('BRG-06', 'BRJCT-04', 'Air Mineral', 300, 50, 'Pck', 'PT. Wilmar Cahaya Indonesia .Tbk', 'Cacat fisik', '2020-01-24'),
('BRG-07', 'BRJCT-05', 'Plate', 100, 20, 'Pck', 'PT. Sariguna Primatirta .Tbk', 'Rusak pengiriman', '2020-01-25');

--
-- Triggers `brg_reject`
--
DELIMITER $$
CREATE TRIGGER `rijek` AFTER INSERT ON `brg_reject` FOR EACH ROW BEGIN
UPDATE stok_brg SET jmlh_stok=jmlh_stok-new.jumlah_reject
WHERE kd_brg=new.kd_stok;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kebut`
--

CREATE TABLE `kebut` (
  `kode_brg` varchar(20) NOT NULL,
  `kd_sup` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `jumlah_butuh` int(20) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `tgl_but` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kebut`
--

INSERT INTO `kebut` (`kode_brg`, `kd_sup`, `nama_brg`, `jumlah_butuh`, `satuan`, `tgl_but`) VALUES
('BRG-01', 'SUP-01', 'Cheese Slice', 200, 'Pcs', '2020-01-01'),
('BRG-02', 'SUP-02', 'Wipping Cream', 150, 'Pck', '2020-01-02'),
('BRG-03', 'SUP-03', 'Bubble Warp', 15, 'Roll', '2020-01-03'),
('BRG-04', 'SUP-04', 'Cup', 200, 'Pck', '2020-01-04'),
('BRG-05', 'SUP-05', 'Butter Ancor', 200, 'Pck', '2020-01-06'),
('BRG-06', 'SUP-06', 'Air Mineral', 300, 'Pck', '2020-01-07'),
('BRG-07', 'SUP-07', 'Plate', 100, 'Pck', '2020-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `siapa`
--

CREATE TABLE `siapa` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siapa`
--

INSERT INTO `siapa` (`id`, `user`, `password`, `nama`) VALUES
(1, 'admin', '12345678', 'Sintia'),
(2, 'staff', '87654321', 'Okta');

-- --------------------------------------------------------

--
-- Table structure for table `stok_brg`
--

CREATE TABLE `stok_brg` (
  `kd_brg` varchar(20) NOT NULL,
  `kd_stok` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `jmlh_stok` int(30) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `supplier` varchar(140) NOT NULL,
  `spek` varchar(20) NOT NULL,
  `tgl_simpan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok_brg`
--

INSERT INTO `stok_brg` (`kd_brg`, `kd_stok`, `nama_brg`, `jmlh_stok`, `satuan`, `supplier`, `spek`, `tgl_simpan`) VALUES
('BRG-01', 'STK-01', 'Cheese Slice', 0, 'Pcs', 'PT. Akasha Wira International .Tbk', '250gr', '2020-01-13'),
('BRG-02', 'STK-02', 'Wipping Cream', 0, 'Pck', 'PT. Tiga Pilar Sejahtera Food .Tbk', '100ml', '2020-01-14'),
('BRG-03', 'STK-03', 'Bubble Warp', 0, 'Roll', 'PT. Tri Banyan Tirta .Tbk', '5x5meter', '2020-01-15'),
('BRG-04', 'STK-04', 'Cup', 0, 'Pck', 'PT. Bumi Teknokultura Unggul .Tbk', 'Large', '2020-01-16'),
('BRG-05', 'STK-05', 'Butter Ancor', 0, 'Pck', 'PT. Budi Starch & Sweetener .Tbk', '300gr', '2020-01-17'),
('BRG-06', 'STK-06', 'Air Mineral', 0, 'Pck', 'PT. Wilmar Cahaya Indonesia .Tbk', '250ml', '2020-01-18'),
('BRG-07', 'STK-07', 'Plate', 0, 'Pck', 'PT. Sariguna Primatirta .Tbk', '12buah', '2020-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `supp`
--

CREATE TABLE `supp` (
  `kd_sup` varchar(20) NOT NULL,
  `nama_sup` varchar(140) NOT NULL,
  `no_telp` int(20) NOT NULL,
  `alamat` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supp`
--

INSERT INTO `supp` (`kd_sup`, `nama_sup`, `no_telp`, `alamat`) VALUES
('SUP-01', 'PT. Akasha Wira International .Tbk', 210888111, 'Jl. TB Simatupang No.Kav. 88,\nKebagusan, Kec. Ps. Minggu,\nKota Jakarta Selatan,\nDaerah Khusus Ibukota Jakarta 12520'),
('SUP-02', 'PT. Tiga Pilar Sejahtera Food .Tbk', 217822425, 'Jl. Raya Solo Sragen Km. 16\nDesa Sepat, Masaran, Sragen\nJawa Tengah, Indonesia'),
('SUP-03', 'PT. Tri Banyan Tirta .Tbk', 215300689, 'Kp. Pasir Dalem, Desa Babakan pari,\nKecamatan Cidahu Kabupaten Sukabumi,\nJawa Barat 43158'),
('SUP-04', 'PT. Bumi Teknokultura Unggul .Tbk', 215365316, 'Komplek Permata Senayan\nRukan Blok No.38\nJl. Tentara Pelajar\nJakarta Selatan 12210'),
('SUP-05', 'PT. Budi Starch & Sweetener .Tbk', 215213383, 'Wisma Budi, Lt 8 – 9\nJl. H.R. Rasuna Said Kav. C-6\nJakarta, Indonesia 12940'),
('SUP-06', 'PT. Wilmar Cahaya Indonesia .Tbk', 218983003, 'Jl. Industri Selatan 3 Blok GG1,\nKawasan Industri Jababeka, Pasirsari, Cikarang Selatan,\nBekasi - Jawa Barat 17550 - INDONESIA'),
('SUP-07', 'PT. Sariguna Primatirta .Tbk', 318544400, 'JL. RAYA A YANI NO. 41-43 KOMPLEK CENTRAL SQUARE BLOK C\nSIDOARJO, Ji 61254 Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brg_keluar`
--
ALTER TABLE `brg_keluar`
  ADD PRIMARY KEY (`kd_keluar`),
  ADD KEY `kd_stok` (`kd_stok`);

--
-- Indexes for table `brg_masuk`
--
ALTER TABLE `brg_masuk`
  ADD PRIMARY KEY (`kd_brg`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `kd_sup` (`kd_sup`);

--
-- Indexes for table `brg_reject`
--
ALTER TABLE `brg_reject`
  ADD PRIMARY KEY (`kd_reject`),
  ADD KEY `kd_stok` (`kd_stok`) USING BTREE;

--
-- Indexes for table `kebut`
--
ALTER TABLE `kebut`
  ADD PRIMARY KEY (`kode_brg`),
  ADD KEY `kd_sup` (`kd_sup`);

--
-- Indexes for table `siapa`
--
ALTER TABLE `siapa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok_brg`
--
ALTER TABLE `stok_brg`
  ADD PRIMARY KEY (`kd_stok`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `supp`
--
ALTER TABLE `supp`
  ADD PRIMARY KEY (`kd_sup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brg_masuk`
--
ALTER TABLE `brg_masuk`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `siapa`
--
ALTER TABLE `siapa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
