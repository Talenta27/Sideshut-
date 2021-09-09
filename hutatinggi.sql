/*
SQLyog - Free MySQL GUI v5.0
Host - 5.5.5-10.1.31-MariaDB : Database - hutatinggi
*********************************************************************
Server version : 5.5.5-10.1.31-MariaDB
*/


create database if not exists `hutatinggi`;

USE `hutatinggi`;

/*Table structure for table `data_diri` */

DROP TABLE IF EXISTS `data_diri`;

CREATE TABLE `data_diri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `usia` int(11) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `NIK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `data_diri` */

insert into `data_diri` values 
(1,'Junika H Tobing',18,'2001-06-23','Wanita',13318005),
(2,'Abonando Simarmata',19,'2000-06-17','Pria',13318020),
(4,'Yolanda',17,'2019-12-06','Wanita',13318001),
(5,'Trifani',19,'2019-12-20','Wanita',13318010),
(6,'Immanuel',19,'2000-04-21','Pria',13318015),
(7,'Dahlia W Silaen',20,'2020-02-15','Wanita',13318032),
(8,'Yeremia W Tambunan',19,'2001-08-15','Wanita',13318040),
(9,'Daniel Sibarani',21,'1995-02-10','Pria',13318080),
(10,'Jessia Hutauruk',22,'1996-06-06','Wanita',13318023),
(11,'Vivi vini',25,'1998-09-09','Wanita',13318024);

/*Table structure for table `grafik` */

DROP TABLE IF EXISTS `grafik`;

CREATE TABLE `grafik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `grafik` */

insert into `grafik` values 
(1,'Pria',20),
(2,'Wanita',31);

/*Table structure for table `kategori_surat` */

DROP TABLE IF EXISTS `kategori_surat`;

CREATE TABLE `kategori_surat` (
  `id_kategori` int(30) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori_surat` */

insert into `kategori_surat` values 
(1,'KTP'),
(2,'Surat Pindah'),
(3,'Surat Miskin'),
(4,'KK');

/*Table structure for table `layanan` */

DROP TABLE IF EXISTS `layanan`;

CREATE TABLE `layanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(30) DEFAULT NULL,
  `subjek` varchar(30) DEFAULT NULL,
  `isi` varchar(300) DEFAULT NULL,
  `tanggapan` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `layanan` */

insert into `layanan` values 
(1,'user2','w','w','ok'),
(2,'user','Jalan','kek mananya jalan disini','ok'),
(3,'user','surat','gk siap sut','');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_kategori_surat` int(11) NOT NULL,
  `tanggal_request` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert into `request` values 
(2,4,3,1,'0000-00-00 00:00:00'),
(3,4,2,3,'0000-00-00 00:00:00'),
(4,4,2,4,'0000-00-00 00:00:00'),
(5,3,2,3,'0000-00-00 00:00:00'),
(6,18,2,4,'0000-00-00 00:00:00'),
(7,3,1,4,'0000-00-00 00:00:00'),
(8,3,2,1,'0000-00-00 00:00:00'),
(9,3,1,1,'0000-00-00 00:00:00');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id_role` int(30) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert into `role` values 
(1,'penduduk'),
(2,'admin');

/*Table structure for table `status_request` */

DROP TABLE IF EXISTS `status_request`;

CREATE TABLE `status_request` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `status_request` */

insert into `status_request` values 
(1,'Baru','Permintaan baru dilakukan'),
(2,'Konfirmasi','Permintaan telah di konfirmasi'),
(3,'Selesai','Surat telah selesai');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user` (`role`),
  CONSTRAINT `role_user` FOREIGN KEY (`role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert into `user` values 
(2,'admin','0000-00-00','Wanita','hutatinggi','admin','admin','admin@',2),
(22,'user','1997-12-09','','Pardomuan','user','ee11cbb19052e40b07aac0ca060c23ee','user@',1);
