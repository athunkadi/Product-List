-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Feb 2021 pada 05.22
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_product`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_merk`
--

CREATE TABLE `category_merk` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `slug` varchar(25) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '1=aktif, 2=tidak aktif',
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category_merk`
--

INSERT INTO `category_merk` (`id`, `name`, `slug`, `description`, `status`, `updated_by`, `updated_on`) VALUES
(1, 'Samsung', 'samsung', 'merk samsung', 1, NULL, NULL),
(2, 'Apple', 'apple', 'merk Apple', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `id_category` int(11) UNSIGNED DEFAULT NULL,
  `id_category_brand` int(11) UNSIGNED DEFAULT NULL COMMENT 'fk to category, with type=5 ',
  `warna` varchar(100) NOT NULL,
  `variant` varchar(50) DEFAULT NULL,
  `tipe_produk` int(11) UNSIGNED DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description2` text DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '0=unpublish, 1=publish',
  `price` int(11) UNSIGNED DEFAULT NULL,
  `stock` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `weight` float NOT NULL DEFAULT 0,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `name`, `id_category`, `id_category_brand`, `warna`, `variant`, `tipe_produk`, `description`, `description2`, `slug`, `image`, `status`, `price`, `stock`, `weight`, `created_by`, `created_on`, `view`) VALUES
(1, 'Samsung s21', 3, 1, 'Black', NULL, 2, 'test', 'test', 'samsung-s21', NULL, 1, 16000000, 100, 1, NULL, NULL, 0),
(2, 'Samsung s21 plus', 3, 1, 'Black', NULL, 2, 'test', 'test', 'samsung-s21-plus', NULL, 1, 18000000, 100, 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `slug` varchar(25) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '0=aktif, 1=aktif',
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_type`
--

INSERT INTO `product_type` (`id`, `name`, `slug`, `description`, `status`, `updated_by`, `updated_on`) VALUES
(1, 'Audio', 'audio', 'Product audio', 1, NULL, NULL),
(2, 'Smartphone', 'smartphone', 'Product Smartphone', 1, NULL, NULL),
(3, 'Gadget', 'gadget', 'Product Gadget', 1, NULL, NULL),
(4, 'Accessories', 'accessories', 'Product Accessories', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_category`
--

CREATE TABLE `t_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_parent` int(11) DEFAULT 0 COMMENT 'fk to self',
  `level` smallint(6) DEFAULT NULL COMMENT 'level of the cat sub cat',
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `href` varchar(250) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1=publish,0=unpublish',
  `display_order` smallint(6) DEFAULT 0 COMMENT 'display order',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_category`
--

INSERT INTO `t_category` (`id`, `id_parent`, `level`, `name`, `image`, `description`, `slug`, `href`, `status`, `display_order`, `created_on`, `created_by`, `updated_on`, `updated_by`) VALUES
(1, 1, 1, 'Promo Bank', NULL, 'Promo Bank', 'Promo-Bank', NULL, 1, 0, NULL, NULL, NULL, NULL),
(2, 1, 1, 'Promo Bank BCA', NULL, 'Promo Bank BCA', 'Promo-Bank-BCA', NULL, 1, 0, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Samsung S Series', NULL, 'Product Samsung S Series', 'Samsung-S-Series', NULL, 1, 0, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category_merk`
--
ALTER TABLE `category_merk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_decms_product_decms_product_category_1` (`id_category`),
  ADD KEY `fk_decms_product_decms_users_1` (`created_by`),
  ADD KEY `fk_decms_product_decms_slug1` (`slug`),
  ADD KEY `created_on` (`created_on`),
  ADD KEY `id_category_brand` (`id_category_brand`),
  ADD KEY `status` (`status`),
  ADD KEY `tipe_produk` (`tipe_produk`),
  ADD KEY `tipe_produk_2` (`tipe_produk`);

--
-- Indeks untuk tabel `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_decms_category_decms_users_1` (`created_by`),
  ADD KEY `fk_decms_category_decms_users_2` (`updated_by`),
  ADD KEY `fk_decms_category_slug_1` (`slug`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category_merk`
--
ALTER TABLE `category_merk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_category`
--
ALTER TABLE `t_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `t_category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_category_brand`) REFERENCES `category_merk` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`tipe_produk`) REFERENCES `product_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
