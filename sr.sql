-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2016 at 01:27 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `ref_klasifikasi`
--

CREATE TABLE IF NOT EXISTS `ref_klasifikasi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tr_instansi`
--

CREATE TABLE IF NOT EXISTS `tr_instansi` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kepsek` varchar(100) NOT NULL,
  `nip_kepsek` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tr_instansi`
--

INSERT INTO `tr_instansi` (`id`, `nama`, `alamat`, `kepsek`, `nip_kepsek`, `logo`) VALUES
(1, 'KPPBC Tipe Madya Pabean C Bontang', 'Jl. Pelabuhan No.1 , Kel.Tanjung Laut Indah, Bontang Selatan, Bontang 75321\r\n\r\n               ', 'Iwan Setyaboedhi', '197010051991011001', 'untitled-1_28.png');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(75) NOT NULL,
  `nama` varchar(99) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `level` enum('Super Admin','Admin') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `t_admin`
--

INSERT INTO `t_admin` (`id`, `username`, `password`, `nama`, `nip`, `level`) VALUES
(1, 'hendra', '5bc1a9ece165ea1809ff1e336599f069', 'Raditya Mahendra Wirayoga', '199403012015021005', 'Super Admin'),
(2, 'umum', 'adfab9c56b8b16d6c067f8d3cff8818e', 'Luthfi', '199411182015021001', 'Admin'),
(3, 'kipbcbontang', 'bf21caee39a57a554310c8966b72f245', 'KIP', '190000000000000000', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `t_disposisi`
--

CREATE TABLE IF NOT EXISTS `t_disposisi` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_surat` int(6) NOT NULL,
  `kpd_yth` varchar(250) NOT NULL,
  `isi_disposisi` varchar(250) NOT NULL,
  `sifat` enum('Biasa','Segera','Perlu Perhatian Khusus','Perhatian Batas Waktu') NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `t_disposisi`
--

INSERT INTO `t_disposisi` (`id`, `id_surat`, `kpd_yth`, `isi_disposisi`, `sifat`, `batas_waktu`, `catatan`) VALUES
(1, 1, 'fff', 'ffff', 'Segera', '2016-01-13', 'ffff'),
(3, 2, 'Kasi P2', 'grbrgbtrbrt', 'Biasa', '2016-01-06', 'nrfhnghng'),
(4, 3, 'Kasi P2', 'Teruskan', 'Perlu Perhatian Khusus', '2016-01-12', 'trtertwe'),
(5, 8, 'kasi P2', 'kapal sandar', 'Perlu Perhatian Khusus', '2016-01-01', 'Jalur Merah'),
(7, 11, 'Kasi P2', 'Segera', 'Perlu Perhatian Khusus', '2016-01-08', 'jalur Merah');

-- --------------------------------------------------------

--
-- Table structure for table `t_surat_keluar`
--

CREATE TABLE IF NOT EXISTS `t_surat_keluar` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `no_agenda` varchar(7) NOT NULL,
  `isi_ringkas` mediumtext NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `pengolah` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_surat_keluar`
--

INSERT INTO `t_surat_keluar` (`id`, `kode`, `no_agenda`, `isi_ringkas`, `tujuan`, `no_surat`, `tgl_surat`, `tgl_catat`, `keterangan`, `file`, `pengolah`) VALUES
(1, '56', '0001', 'Hotel Sintuk', 'PKT', '45', '2016-01-01', '2016-01-13', 'segera', 'org_1c581a91b444b91f_1451272872000.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_surat_keputusan`
--

CREATE TABLE IF NOT EXISTS `t_surat_keputusan` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(20) NOT NULL,
  `tahun` varchar(7) NOT NULL,
  `tentang` mediumtext NOT NULL,
  `tgl_surat` date NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `pengolah` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_surat_masuk`
--

CREATE TABLE IF NOT EXISTS `t_surat_masuk` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `no_agenda` varchar(7) NOT NULL,
  `indek_berkas` varchar(100) NOT NULL,
  `isi_ringkas` mediumtext NOT NULL,
  `dari` varchar(250) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_diterima` date NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `pengolah` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `t_surat_masuk`
--

INSERT INTO `t_surat_masuk` (`id`, `kode`, `no_agenda`, `indek_berkas`, `isi_ringkas`, `dari`, `no_surat`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `pengolah`) VALUES
(11, '13', '56', '45', 'Izin Timbun Golar Mazo', 'PT Pertamina Patra Niaga', '456', '2016-01-01', '2016-01-13', 'sukses', 'org_1c581a91b444b91f_1451272872000.jpg', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
