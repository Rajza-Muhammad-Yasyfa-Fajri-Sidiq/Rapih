/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: rapih
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `attribute_changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attribute_changes`)),
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES
(1,'default','created','App\\Models\\Barang',1,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0001\",\"nama_barang\":\"Kertas HVS A4 70gsm\",\"kategori_barang_id\":2,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"90000.00\",\"harga_jual\":\"128700.00\",\"stok_minimum\":10}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(2,'default','created','App\\Models\\Barang',2,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0002\",\"nama_barang\":\"Pulpen Pilot G2\",\"kategori_barang_id\":5,\"satuan_id\":2,\"stok\":0,\"harga_beli\":\"13000.00\",\"harga_jual\":\"19200.00\",\"stok_minimum\":5}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(3,'default','created','App\\Models\\Barang',3,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0003\",\"nama_barang\":\"Tinta Printer Canon 790\",\"kategori_barang_id\":3,\"satuan_id\":4,\"stok\":0,\"harga_beli\":\"134000.00\",\"harga_jual\":\"172900.00\",\"stok_minimum\":5}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(4,'default','created','App\\Models\\Barang',4,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0004\",\"nama_barang\":\"Buku Tulis Sidu 58 Lembar\",\"kategori_barang_id\":2,\"satuan_id\":1,\"stok\":0,\"harga_beli\":\"16000.00\",\"harga_jual\":\"20300.00\",\"stok_minimum\":10}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(5,'default','created','App\\Models\\Barang',5,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0005\",\"nama_barang\":\"Pensil 2B Faber Castell\",\"kategori_barang_id\":2,\"satuan_id\":1,\"stok\":0,\"harga_beli\":\"175000.00\",\"harga_jual\":\"204800.00\",\"stok_minimum\":15}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(6,'default','created','App\\Models\\Barang',6,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0006\",\"nama_barang\":\"Spidol Snowman Boardmarker\",\"kategori_barang_id\":4,\"satuan_id\":2,\"stok\":0,\"harga_beli\":\"8000.00\",\"harga_jual\":\"10600.00\",\"stok_minimum\":5}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(7,'default','created','App\\Models\\Barang',7,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0007\",\"nama_barang\":\"Map Plastik Folio\",\"kategori_barang_id\":2,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"76000.00\",\"harga_jual\":\"104100.00\",\"stok_minimum\":10}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(8,'default','created','App\\Models\\Barang',8,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0008\",\"nama_barang\":\"Amplop Coklat Folio\",\"kategori_barang_id\":2,\"satuan_id\":4,\"stok\":0,\"harga_beli\":\"181000.00\",\"harga_jual\":\"248000.00\",\"stok_minimum\":5}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(9,'default','created','App\\Models\\Barang',9,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0009\",\"nama_barang\":\"Stapler Kenko HD-10\",\"kategori_barang_id\":4,\"satuan_id\":4,\"stok\":0,\"harga_beli\":\"98000.00\",\"harga_jual\":\"144100.00\",\"stok_minimum\":15}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(10,'default','created','App\\Models\\Barang',10,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0010\",\"nama_barang\":\"Isi Staples No.10\",\"kategori_barang_id\":1,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"43000.00\",\"harga_jual\":\"60600.00\",\"stok_minimum\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(11,'default','created','App\\Models\\Barang',11,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0011\",\"nama_barang\":\"Penghapus Steadtler\",\"kategori_barang_id\":2,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"118000.00\",\"harga_jual\":\"174600.00\",\"stok_minimum\":15}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(12,'default','created','App\\Models\\Barang',12,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0012\",\"nama_barang\":\"Penggaris 30cm\",\"kategori_barang_id\":2,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"67000.00\",\"harga_jual\":\"93100.00\",\"stok_minimum\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(13,'default','created','App\\Models\\Barang',13,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0013\",\"nama_barang\":\"Gunting Kenko\",\"kategori_barang_id\":2,\"satuan_id\":2,\"stok\":0,\"harga_beli\":\"142000.00\",\"harga_jual\":\"173200.00\",\"stok_minimum\":10}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(14,'default','created','App\\Models\\Barang',14,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0014\",\"nama_barang\":\"Lem Stick UHU 21g\",\"kategori_barang_id\":3,\"satuan_id\":2,\"stok\":0,\"harga_beli\":\"73000.00\",\"harga_jual\":\"91300.00\",\"stok_minimum\":15}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(15,'default','created','App\\Models\\Barang',15,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0015\",\"nama_barang\":\"Correction Pen Joyko\",\"kategori_barang_id\":1,\"satuan_id\":2,\"stok\":0,\"harga_beli\":\"5000.00\",\"harga_jual\":\"6400.00\",\"stok_minimum\":5}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(16,'default','created','App\\Models\\Barang',16,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0016\",\"nama_barang\":\"Paper Clip No.3\",\"kategori_barang_id\":1,\"satuan_id\":4,\"stok\":0,\"harga_beli\":\"24000.00\",\"harga_jual\":\"31000.00\",\"stok_minimum\":10}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(17,'default','created','App\\Models\\Barang',17,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0017\",\"nama_barang\":\"Binder Clip 32mm\",\"kategori_barang_id\":3,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"145000.00\",\"harga_jual\":\"178400.00\",\"stok_minimum\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(18,'default','created','App\\Models\\Barang',18,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0018\",\"nama_barang\":\"Post-it Note 3x3\",\"kategori_barang_id\":2,\"satuan_id\":1,\"stok\":0,\"harga_beli\":\"31000.00\",\"harga_jual\":\"45600.00\",\"stok_minimum\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(19,'default','created','App\\Models\\Barang',19,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0019\",\"nama_barang\":\"Kalkulator Casio MX-12B\",\"kategori_barang_id\":3,\"satuan_id\":3,\"stok\":0,\"harga_beli\":\"124000.00\",\"harga_jual\":\"148800.00\",\"stok_minimum\":5}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(20,'default','created','App\\Models\\Barang',20,'created',NULL,NULL,'{\"attributes\":{\"kode_barang\":\"BRG-0020\",\"nama_barang\":\"Tipe-X Joyko\",\"kategori_barang_id\":4,\"satuan_id\":1,\"stok\":0,\"harga_beli\":\"150000.00\",\"harga_jual\":\"181500.00\",\"stok_minimum\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(21,'default','created','App\\Models\\BarangMasuk',1,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0001\",\"barang_id\":7,\"supplier_id\":5,\"user_id\":1,\"jumlah\":92,\"harga_beli\":\"76000.00\",\"tanggal\":\"2026-03-19T00:00:00.000000Z\",\"keterangan\":\"Eos ut cumque consequatur est ut.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(22,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":92},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(23,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":184},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(24,'default','created','App\\Models\\BarangMasuk',2,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0002\",\"barang_id\":7,\"supplier_id\":3,\"user_id\":2,\"jumlah\":19,\"harga_beli\":\"76000.00\",\"tanggal\":\"2026-03-17T00:00:00.000000Z\",\"keterangan\":\"Itaque laborum harum sunt minima.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(25,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":203},\"old\":{\"stok\":184}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(26,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":222},\"old\":{\"stok\":184}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(27,'default','created','App\\Models\\BarangMasuk',3,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0003\",\"barang_id\":3,\"supplier_id\":2,\"user_id\":3,\"jumlah\":13,\"harga_beli\":\"134000.00\",\"tanggal\":\"2026-05-13T00:00:00.000000Z\",\"keterangan\":\"Accusantium quam quo et animi sunt quia.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(28,'default','updated','App\\Models\\Barang',3,'updated',NULL,NULL,'{\"attributes\":{\"stok\":13},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(29,'default','updated','App\\Models\\Barang',3,'updated',NULL,NULL,'{\"attributes\":{\"stok\":26},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(30,'default','created','App\\Models\\BarangMasuk',4,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0004\",\"barang_id\":12,\"supplier_id\":2,\"user_id\":1,\"jumlah\":38,\"harga_beli\":\"67000.00\",\"tanggal\":\"2026-05-24T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(31,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":38},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(32,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":76},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(33,'default','created','App\\Models\\BarangMasuk',5,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0005\",\"barang_id\":19,\"supplier_id\":1,\"user_id\":1,\"jumlah\":23,\"harga_beli\":\"124000.00\",\"tanggal\":\"2026-04-22T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(34,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":23},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(35,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":46},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(36,'default','created','App\\Models\\BarangMasuk',6,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0006\",\"barang_id\":13,\"supplier_id\":5,\"user_id\":3,\"jumlah\":56,\"harga_beli\":\"142000.00\",\"tanggal\":\"2026-02-01T00:00:00.000000Z\",\"keterangan\":\"Facere est facere dolores omnis ipsa minima sunt.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(37,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":56},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(38,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":112},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(39,'default','created','App\\Models\\BarangMasuk',7,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0007\",\"barang_id\":16,\"supplier_id\":1,\"user_id\":3,\"jumlah\":97,\"harga_beli\":\"24000.00\",\"tanggal\":\"2026-04-15T00:00:00.000000Z\",\"keterangan\":\"Iste suscipit dolorem soluta a.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(40,'default','updated','App\\Models\\Barang',16,'updated',NULL,NULL,'{\"attributes\":{\"stok\":97},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(41,'default','updated','App\\Models\\Barang',16,'updated',NULL,NULL,'{\"attributes\":{\"stok\":194},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(42,'default','created','App\\Models\\BarangMasuk',8,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0008\",\"barang_id\":15,\"supplier_id\":1,\"user_id\":3,\"jumlah\":10,\"harga_beli\":\"5000.00\",\"tanggal\":\"2026-03-06T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(43,'default','updated','App\\Models\\Barang',15,'updated',NULL,NULL,'{\"attributes\":{\"stok\":10},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(44,'default','updated','App\\Models\\Barang',15,'updated',NULL,NULL,'{\"attributes\":{\"stok\":20},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(45,'default','created','App\\Models\\BarangMasuk',9,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0009\",\"barang_id\":10,\"supplier_id\":2,\"user_id\":3,\"jumlah\":25,\"harga_beli\":\"43000.00\",\"tanggal\":\"2026-04-19T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(46,'default','updated','App\\Models\\Barang',10,'updated',NULL,NULL,'{\"attributes\":{\"stok\":25},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(47,'default','updated','App\\Models\\Barang',10,'updated',NULL,NULL,'{\"attributes\":{\"stok\":50},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(48,'default','created','App\\Models\\BarangMasuk',10,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0010\",\"barang_id\":13,\"supplier_id\":4,\"user_id\":1,\"jumlah\":78,\"harga_beli\":\"142000.00\",\"tanggal\":\"2026-05-19T00:00:00.000000Z\",\"keterangan\":\"Ut consequatur at distinctio aut delectus architecto inventore.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(49,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":190},\"old\":{\"stok\":112}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(50,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":268},\"old\":{\"stok\":112}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(51,'default','created','App\\Models\\BarangMasuk',11,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0011\",\"barang_id\":19,\"supplier_id\":5,\"user_id\":1,\"jumlah\":92,\"harga_beli\":\"124000.00\",\"tanggal\":\"2026-06-16T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(52,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":138},\"old\":{\"stok\":46}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(53,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":230},\"old\":{\"stok\":46}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(54,'default','created','App\\Models\\BarangMasuk',12,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0012\",\"barang_id\":12,\"supplier_id\":5,\"user_id\":3,\"jumlah\":16,\"harga_beli\":\"67000.00\",\"tanggal\":\"2026-04-01T00:00:00.000000Z\",\"keterangan\":\"Commodi quasi sed est.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(55,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":92},\"old\":{\"stok\":76}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(56,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":108},\"old\":{\"stok\":76}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(57,'default','created','App\\Models\\BarangMasuk',13,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0013\",\"barang_id\":10,\"supplier_id\":3,\"user_id\":2,\"jumlah\":27,\"harga_beli\":\"43000.00\",\"tanggal\":\"2026-03-14T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(58,'default','updated','App\\Models\\Barang',10,'updated',NULL,NULL,'{\"attributes\":{\"stok\":77},\"old\":{\"stok\":50}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(59,'default','updated','App\\Models\\Barang',10,'updated',NULL,NULL,'{\"attributes\":{\"stok\":104},\"old\":{\"stok\":50}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(60,'default','created','App\\Models\\BarangMasuk',14,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0014\",\"barang_id\":7,\"supplier_id\":3,\"user_id\":1,\"jumlah\":62,\"harga_beli\":\"76000.00\",\"tanggal\":\"2026-05-29T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(61,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":284},\"old\":{\"stok\":222}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(62,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":346},\"old\":{\"stok\":222}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(63,'default','created','App\\Models\\BarangMasuk',15,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BM-20260708-0015\",\"barang_id\":4,\"supplier_id\":3,\"user_id\":1,\"jumlah\":53,\"harga_beli\":\"16000.00\",\"tanggal\":\"2026-01-14T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(64,'default','updated','App\\Models\\Barang',4,'updated',NULL,NULL,'{\"attributes\":{\"stok\":53},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(65,'default','updated','App\\Models\\Barang',4,'updated',NULL,NULL,'{\"attributes\":{\"stok\":106},\"old\":{\"stok\":0}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(66,'default','created','App\\Models\\BarangKeluar',1,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0001\",\"barang_id\":12,\"user_id\":3,\"jumlah\":12,\"tanggal\":\"2026-01-23T00:00:00.000000Z\",\"keterangan\":\"Quasi magnam autem sint voluptatem vitae aut repellendus.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(67,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":96},\"old\":{\"stok\":108}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(68,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":84},\"old\":{\"stok\":108}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(69,'default','created','App\\Models\\BarangKeluar',2,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0002\",\"barang_id\":15,\"user_id\":2,\"jumlah\":6,\"tanggal\":\"2026-06-01T00:00:00.000000Z\",\"keterangan\":\"Debitis ut consequuntur non itaque.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(70,'default','updated','App\\Models\\Barang',15,'updated',NULL,NULL,'{\"attributes\":{\"stok\":14},\"old\":{\"stok\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(71,'default','updated','App\\Models\\Barang',15,'updated',NULL,NULL,'{\"attributes\":{\"stok\":8},\"old\":{\"stok\":20}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(72,'default','created','App\\Models\\BarangKeluar',3,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0003\",\"barang_id\":7,\"user_id\":2,\"jumlah\":20,\"tanggal\":\"2026-03-04T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(73,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":326},\"old\":{\"stok\":346}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(74,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":306},\"old\":{\"stok\":346}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(75,'default','created','App\\Models\\BarangKeluar',4,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0004\",\"barang_id\":16,\"user_id\":3,\"jumlah\":3,\"tanggal\":\"2026-03-24T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(76,'default','updated','App\\Models\\Barang',16,'updated',NULL,NULL,'{\"attributes\":{\"stok\":191},\"old\":{\"stok\":194}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(77,'default','updated','App\\Models\\Barang',16,'updated',NULL,NULL,'{\"attributes\":{\"stok\":188},\"old\":{\"stok\":194}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(78,'default','created','App\\Models\\BarangKeluar',5,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0005\",\"barang_id\":19,\"user_id\":2,\"jumlah\":17,\"tanggal\":\"2026-04-05T00:00:00.000000Z\",\"keterangan\":\"Temporibus corporis aliquid alias eum.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(79,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":213},\"old\":{\"stok\":230}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(80,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":196},\"old\":{\"stok\":230}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(81,'default','created','App\\Models\\BarangKeluar',6,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0006\",\"barang_id\":12,\"user_id\":3,\"jumlah\":17,\"tanggal\":\"2026-02-19T00:00:00.000000Z\",\"keterangan\":\"Voluptatem facere eius quo nesciunt nemo minima aut.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(82,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":67},\"old\":{\"stok\":84}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(83,'default','updated','App\\Models\\Barang',12,'updated',NULL,NULL,'{\"attributes\":{\"stok\":50},\"old\":{\"stok\":84}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(84,'default','created','App\\Models\\BarangKeluar',7,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0007\",\"barang_id\":16,\"user_id\":2,\"jumlah\":12,\"tanggal\":\"2026-06-19T00:00:00.000000Z\",\"keterangan\":\"Voluptates excepturi itaque earum amet quia recusandae beatae.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(85,'default','updated','App\\Models\\Barang',16,'updated',NULL,NULL,'{\"attributes\":{\"stok\":176},\"old\":{\"stok\":188}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(86,'default','updated','App\\Models\\Barang',16,'updated',NULL,NULL,'{\"attributes\":{\"stok\":164},\"old\":{\"stok\":188}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(87,'default','created','App\\Models\\BarangKeluar',8,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0008\",\"barang_id\":13,\"user_id\":2,\"jumlah\":8,\"tanggal\":\"2026-04-16T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(88,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":260},\"old\":{\"stok\":268}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(89,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":252},\"old\":{\"stok\":268}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(90,'default','created','App\\Models\\BarangKeluar',9,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0009\",\"barang_id\":7,\"user_id\":2,\"jumlah\":10,\"tanggal\":\"2026-01-10T00:00:00.000000Z\",\"keterangan\":\"Sed nemo assumenda totam iusto consequuntur officia.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(91,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":296},\"old\":{\"stok\":306}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(92,'default','updated','App\\Models\\Barang',7,'updated',NULL,NULL,'{\"attributes\":{\"stok\":286},\"old\":{\"stok\":306}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(93,'default','created','App\\Models\\BarangKeluar',10,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0010\",\"barang_id\":4,\"user_id\":2,\"jumlah\":18,\"tanggal\":\"2026-05-18T00:00:00.000000Z\",\"keterangan\":\"Corporis illo autem ut omnis id.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(94,'default','updated','App\\Models\\Barang',4,'updated',NULL,NULL,'{\"attributes\":{\"stok\":88},\"old\":{\"stok\":106}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(95,'default','updated','App\\Models\\Barang',4,'updated',NULL,NULL,'{\"attributes\":{\"stok\":70},\"old\":{\"stok\":106}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(96,'default','created','App\\Models\\BarangKeluar',11,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0011\",\"barang_id\":13,\"user_id\":1,\"jumlah\":6,\"tanggal\":\"2026-02-22T00:00:00.000000Z\",\"keterangan\":\"Illum ipsam neque in fugiat suscipit.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(97,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":246},\"old\":{\"stok\":252}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(98,'default','updated','App\\Models\\Barang',13,'updated',NULL,NULL,'{\"attributes\":{\"stok\":240},\"old\":{\"stok\":252}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(99,'default','created','App\\Models\\BarangKeluar',12,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0012\",\"barang_id\":19,\"user_id\":3,\"jumlah\":9,\"tanggal\":\"2026-04-29T00:00:00.000000Z\",\"keterangan\":\"Animi sint totam modi ipsa unde officia.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(100,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":187},\"old\":{\"stok\":196}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(101,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":178},\"old\":{\"stok\":196}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(102,'default','created','App\\Models\\BarangKeluar',13,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0013\",\"barang_id\":15,\"user_id\":2,\"jumlah\":8,\"tanggal\":\"2026-06-25T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(103,'default','updated','App\\Models\\Barang',15,'updated',NULL,NULL,'{\"attributes\":{\"stok\":0},\"old\":{\"stok\":8}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(104,'default','updated','App\\Models\\Barang',15,'updated',NULL,NULL,'{\"attributes\":{\"stok\":-8},\"old\":{\"stok\":8}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(105,'default','created','App\\Models\\BarangKeluar',14,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0014\",\"barang_id\":19,\"user_id\":2,\"jumlah\":19,\"tanggal\":\"2026-04-05T00:00:00.000000Z\",\"keterangan\":null}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(106,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":159},\"old\":{\"stok\":178}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(107,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":140},\"old\":{\"stok\":178}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(108,'default','created','App\\Models\\BarangKeluar',15,'created',NULL,NULL,'{\"attributes\":{\"kode_transaksi\":\"BK-20260708-0015\",\"barang_id\":19,\"user_id\":2,\"jumlah\":18,\"tanggal\":\"2026-04-01T00:00:00.000000Z\",\"keterangan\":\"Est omnis quia odit itaque voluptatum at non at.\"}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(109,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":122},\"old\":{\"stok\":140}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(110,'default','updated','App\\Models\\Barang',19,'updated',NULL,NULL,'{\"attributes\":{\"stok\":104},\"old\":{\"stok\":140}}','[]','2026-07-07 23:23:01','2026-07-07 23:23:01');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kategori_barang_id` bigint(20) unsigned NOT NULL,
  `satuan_id` bigint(20) unsigned NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `harga_beli` decimal(15,2) NOT NULL DEFAULT 0.00,
  `harga_jual` decimal(15,2) NOT NULL DEFAULT 0.00,
  `stok_minimum` int(11) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_kode_barang_unique` (`kode_barang`),
  KEY `barang_kategori_barang_id_foreign` (`kategori_barang_id`),
  KEY `barang_satuan_id_foreign` (`satuan_id`),
  CONSTRAINT `barang_kategori_barang_id_foreign` FOREIGN KEY (`kategori_barang_id`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_satuan_id_foreign` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES
(1,'BRG-0001','Kertas HVS A4 70gsm',2,3,0,90000.00,128700.00,10,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(2,'BRG-0002','Pulpen Pilot G2',5,2,0,13000.00,19200.00,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(3,'BRG-0003','Tinta Printer Canon 790',3,4,26,134000.00,172900.00,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(4,'BRG-0004','Buku Tulis Sidu 58 Lembar',2,1,70,16000.00,20300.00,10,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(5,'BRG-0005','Pensil 2B Faber Castell',2,1,0,175000.00,204800.00,15,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(6,'BRG-0006','Spidol Snowman Boardmarker',4,2,0,8000.00,10600.00,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(7,'BRG-0007','Map Plastik Folio',2,3,286,76000.00,104100.00,10,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(8,'BRG-0008','Amplop Coklat Folio',2,4,0,181000.00,248000.00,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(9,'BRG-0009','Stapler Kenko HD-10',4,4,0,98000.00,144100.00,15,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(10,'BRG-0010','Isi Staples No.10',1,3,104,43000.00,60600.00,20,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(11,'BRG-0011','Penghapus Steadtler',2,3,0,118000.00,174600.00,15,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(12,'BRG-0012','Penggaris 30cm',2,3,50,67000.00,93100.00,20,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(13,'BRG-0013','Gunting Kenko',2,2,240,142000.00,173200.00,10,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(14,'BRG-0014','Lem Stick UHU 21g',3,2,0,73000.00,91300.00,15,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(15,'BRG-0015','Correction Pen Joyko',1,2,-8,5000.00,6400.00,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(16,'BRG-0016','Paper Clip No.3',1,4,164,24000.00,31000.00,10,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(17,'BRG-0017','Binder Clip 32mm',3,3,0,145000.00,178400.00,20,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(18,'BRG-0018','Post-it Note 3x3',2,1,0,31000.00,45600.00,20,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(19,'BRG-0019','Kalkulator Casio MX-12B',3,3,104,124000.00,148800.00,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(20,'BRG-0020','Tipe-X Joyko',4,1,0,150000.00,181500.00,20,'2026-07-07 23:23:01','2026-07-07 23:23:01');
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `barang_images`
--

DROP TABLE IF EXISTS `barang_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` bigint(20) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barang_images_barang_id_foreign` (`barang_id`),
  CONSTRAINT `barang_images_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_images`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `barang_images` WRITE;
/*!40000 ALTER TABLE `barang_images` DISABLE KEYS */;
INSERT INTO `barang_images` VALUES
(1,1,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(2,1,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(3,1,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(4,2,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(5,3,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(6,3,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(7,3,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(8,4,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(9,4,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(10,4,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(11,5,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(12,6,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(13,6,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(14,7,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(15,7,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(16,7,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(17,8,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(18,8,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(19,9,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(20,9,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(21,10,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(22,10,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(23,11,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(24,12,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(25,13,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(26,14,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(27,14,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(28,15,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(29,15,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(30,16,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(31,16,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(32,17,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(33,18,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(34,18,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(35,19,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(36,19,'barang_images/dummy2.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(37,19,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(38,20,'barang_images/dummy1.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(39,20,'barang_images/dummy3.jpg','2026-07-07 23:23:01','2026-07-07 23:23:01');
/*!40000 ALTER TABLE `barang_images` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `barang_keluar`
--

DROP TABLE IF EXISTS `barang_keluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang_keluar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) NOT NULL,
  `barang_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_keluar_kode_transaksi_unique` (`kode_transaksi`),
  KEY `barang_keluar_barang_id_foreign` (`barang_id`),
  KEY `barang_keluar_user_id_foreign` (`user_id`),
  CONSTRAINT `barang_keluar_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_keluar_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_keluar`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `barang_keluar` WRITE;
/*!40000 ALTER TABLE `barang_keluar` DISABLE KEYS */;
INSERT INTO `barang_keluar` VALUES
(1,'BK-20260708-0001',12,3,12,'2026-01-23','Quasi magnam autem sint voluptatem vitae aut repellendus.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(2,'BK-20260708-0002',15,2,6,'2026-06-01','Debitis ut consequuntur non itaque.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(3,'BK-20260708-0003',7,2,20,'2026-03-04',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(4,'BK-20260708-0004',16,3,3,'2026-03-24',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(5,'BK-20260708-0005',19,2,17,'2026-04-05','Temporibus corporis aliquid alias eum.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(6,'BK-20260708-0006',12,3,17,'2026-02-19','Voluptatem facere eius quo nesciunt nemo minima aut.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(7,'BK-20260708-0007',16,2,12,'2026-06-19','Voluptates excepturi itaque earum amet quia recusandae beatae.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(8,'BK-20260708-0008',13,2,8,'2026-04-16',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(9,'BK-20260708-0009',7,2,10,'2026-01-10','Sed nemo assumenda totam iusto consequuntur officia.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(10,'BK-20260708-0010',4,2,18,'2026-05-18','Corporis illo autem ut omnis id.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(11,'BK-20260708-0011',13,1,6,'2026-02-22','Illum ipsam neque in fugiat suscipit.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(12,'BK-20260708-0012',19,3,9,'2026-04-29','Animi sint totam modi ipsa unde officia.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(13,'BK-20260708-0013',15,2,8,'2026-06-25',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(14,'BK-20260708-0014',19,2,19,'2026-04-05',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(15,'BK-20260708-0015',19,2,18,'2026-04-01','Est omnis quia odit itaque voluptatum at non at.','2026-07-07 23:23:01','2026-07-07 23:23:01');
/*!40000 ALTER TABLE `barang_keluar` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `barang_masuk`
--

DROP TABLE IF EXISTS `barang_masuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang_masuk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) NOT NULL,
  `barang_id` bigint(20) unsigned NOT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli` decimal(15,2) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_masuk_kode_transaksi_unique` (`kode_transaksi`),
  KEY `barang_masuk_barang_id_foreign` (`barang_id`),
  KEY `barang_masuk_supplier_id_foreign` (`supplier_id`),
  KEY `barang_masuk_user_id_foreign` (`user_id`),
  CONSTRAINT `barang_masuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_masuk_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_masuk_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_masuk`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `barang_masuk` WRITE;
/*!40000 ALTER TABLE `barang_masuk` DISABLE KEYS */;
INSERT INTO `barang_masuk` VALUES
(1,'BM-20260708-0001',7,5,1,92,76000.00,'2026-03-19','Eos ut cumque consequatur est ut.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(2,'BM-20260708-0002',7,3,2,19,76000.00,'2026-03-17','Itaque laborum harum sunt minima.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(3,'BM-20260708-0003',3,2,3,13,134000.00,'2026-05-13','Accusantium quam quo et animi sunt quia.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(4,'BM-20260708-0004',12,2,1,38,67000.00,'2026-05-24',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(5,'BM-20260708-0005',19,1,1,23,124000.00,'2026-04-22',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(6,'BM-20260708-0006',13,5,3,56,142000.00,'2026-02-01','Facere est facere dolores omnis ipsa minima sunt.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(7,'BM-20260708-0007',16,1,3,97,24000.00,'2026-04-15','Iste suscipit dolorem soluta a.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(8,'BM-20260708-0008',15,1,3,10,5000.00,'2026-03-06',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(9,'BM-20260708-0009',10,2,3,25,43000.00,'2026-04-19',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(10,'BM-20260708-0010',13,4,1,78,142000.00,'2026-05-19','Ut consequatur at distinctio aut delectus architecto inventore.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(11,'BM-20260708-0011',19,5,1,92,124000.00,'2026-06-16',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(12,'BM-20260708-0012',12,5,3,16,67000.00,'2026-04-01','Commodi quasi sed est.','2026-07-07 23:23:01','2026-07-07 23:23:01'),
(13,'BM-20260708-0013',10,3,2,27,43000.00,'2026-03-14',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(14,'BM-20260708-0014',7,3,1,62,76000.00,'2026-05-29',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(15,'BM-20260708-0015',4,3,1,53,16000.00,'2026-01-14',NULL,'2026-07-07 23:23:01','2026-07-07 23:23:01');
/*!40000 ALTER TABLE `barang_masuk` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `barang_supplier`
--

DROP TABLE IF EXISTS `barang_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang_supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` bigint(20) unsigned NOT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barang_supplier_barang_id_foreign` (`barang_id`),
  KEY `barang_supplier_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `barang_supplier_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_supplier_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_supplier`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `barang_supplier` WRITE;
/*!40000 ALTER TABLE `barang_supplier` DISABLE KEYS */;
INSERT INTO `barang_supplier` VALUES
(1,1,4,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(2,1,1,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(3,1,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(4,2,1,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(5,3,2,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(6,3,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(7,3,1,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(8,4,4,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(9,5,1,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(10,6,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(11,7,4,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(12,8,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(13,9,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(14,10,2,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(15,11,3,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(16,12,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(17,12,3,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(18,13,2,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(19,14,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(20,14,4,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(21,15,4,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(22,15,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(23,15,1,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(24,16,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(25,17,1,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(26,17,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(27,18,3,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(28,19,5,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(29,20,4,'2026-07-07 23:23:01','2026-07-07 23:23:01'),
(30,20,2,'2026-07-07 23:23:01','2026-07-07 23:23:01');
/*!40000 ALTER TABLE `barang_supplier` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `kategori_barang`
--

DROP TABLE IF EXISTS `kategori_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori_barang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(255) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_barang`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `kategori_barang` WRITE;
/*!40000 ALTER TABLE `kategori_barang` DISABLE KEYS */;
INSERT INTO `kategori_barang` VALUES
(1,'Alat Tulis Kantor','Perlengkapan tulis menulis untuk kantor','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(2,'Perlengkapan Cetak','Tinta, kertas, dan perlengkapan printer','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(3,'Perlengkapan Filing','Map, amplop, dan perlengkapan arsip','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(4,'Peralatan Kantor','Stapler, gunting, dan peralatan kantor lainnya','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(5,'Perlengkapan Komputer','Aksesoris dan perlengkapan komputer','2026-07-07 23:23:00','2026-07-07 23:23:00');
/*!40000 ALTER TABLE `kategori_barang` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2026_07_08_054026_create_activity_log_table',1),
(5,'2026_07_08_060001_create_kategori_barang_table',1),
(6,'2026_07_08_060002_create_satuan_table',1),
(7,'2026_07_08_060003_create_supplier_table',1),
(8,'2026_07_08_060004_create_barang_table',1),
(9,'2026_07_08_060005_create_barang_supplier_table',1),
(10,'2026_07_08_060006_create_barang_masuk_table',1),
(11,'2026_07_08_060007_create_barang_keluar_table',1),
(12,'2026_07_08_060008_create_barang_images_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `satuan`
--

DROP TABLE IF EXISTS `satuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `satuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satuan`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `satuan` WRITE;
/*!40000 ALTER TABLE `satuan` DISABLE KEYS */;
INSERT INTO `satuan` VALUES
(1,'pcs','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(2,'box','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(3,'rim','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(4,'lusin','2026-07-07 23:23:00','2026-07-07 23:23:00');
/*!40000 ALTER TABLE `satuan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('DzhpyumYkPce6OlykhCTLVUAfujselAXEwfxngn4',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoibXZpMGVXTVNLOGRrUXJJbEh0QXoyeGQySENxSzRscnRybHdRVXVBayI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==',1783494762);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES
(1,'Yayasan Aryani Puspasari','Psr. Dago No. 972, Solok 52559, Lampung','(+62) 984 2281 6930','nyoman.nasyidah@usamah.info','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(2,'PT Wibowo','Ds. Sukabumi No. 296, Tidore Kepulauan 81142, Maluku','0429 7437 9822','rudi64@setiawan.in','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(3,'CV Laksmiwati Habibi (Persero) Tbk','Ki. Hang No. 80, Bekasi 39130, Bali','0949 5312 5415','nrajasa@pertiwi.asia','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(4,'Fa Pertiwi Handayani','Ki. Cikapayang No. 953, Palembang 26787, Sulbar','(+62) 863 558 480','utami.janet@utama.biz.id','2026-07-07 23:23:00','2026-07-07 23:23:00'),
(5,'PT Wastuti','Ds. Bambon No. 876, Prabumulih 80888, DIY','0469 9918 9333','lutfan.purnawati@sinaga.desa.id','2026-07-07 23:23:00','2026-07-07 23:23:00');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas') NOT NULL DEFAULT 'petugas',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Administrator','admin@rapih.test','2026-07-07 23:23:00','$2y$12$3BA08Mo0H4Y/g5VwOFcHv.oCUsvtKzD5YrtqjZfWxkRx8FqyK.rIu','admin',NULL,'2026-07-07 23:23:00','2026-07-07 23:23:00'),
(2,'Budi Santoso','budi@rapih.test','2026-07-07 23:23:00','$2y$12$gzFPx6Q5txkTMyHdAakj5.PoSZUDBVlwvG.YeOycVYw8xMnjLmpvy','petugas',NULL,'2026-07-07 23:23:00','2026-07-07 23:23:00'),
(3,'Siti Rahayu','siti@rapih.test','2026-07-07 23:23:00','$2y$12$EQu8025/BHJyJYOiAF3LgOumgqiTm/2tugnBuZt9aA46espgQor7W','petugas',NULL,'2026-07-07 23:23:00','2026-07-07 23:23:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-07-08 16:12:13
