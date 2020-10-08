-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2020 at 01:33 PM
-- Server version: 10.3.24-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devuuopu_ultraswift`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_addresses`
--

INSERT INTO `sma_addresses` (`id`, `company_id`, `line1`, `line2`, `city`, `postal_code`, `state`, `country`, `phone`, `updated_at`) VALUES
(1, 9, 'Ole Sangale Rd, Nairobi, Woodvale Groove, Westland', '', 'Nairobi', '00200', 'Nairobi', 'Kenya', '+254722320589', '2020-06-20 07:06:40'),
(2, 10, 'Name', '', 'Nairobi', '00200', 'Nairobi', 'Kenya', '65544335', '2020-06-20 07:18:47'),
(3, 14, 'Saika', 'ghjvk', 'Borama', '00200', 'Awdal', 'Somalia', '0725463214', '2020-07-12 18:00:18'),
(4, 24, 'hazina', 'hse 89', 'Nairobi', '254', 'Nairobi', 'Kenya', '0735320589', '2020-08-24 17:24:36'),
(5, 24, 'Golden gate', '', 'Nairobi', '00200', 'Nairobi', 'Kenya', '65544335', '2020-09-12 05:07:48'),
(6, 30, 'South B', '', 'Nairobi', '00200', 'Kenya', 'Kenya', '+10717525690', '2020-09-12 18:55:32'),
(7, 31, 'Zakria Town', '', 'Multan', '66000', 'Punjab', 'Pakistan', '03125238126', '2020-09-12 19:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_keys`
--

CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_limits`
--

CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_logs`
--

CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text DEFAULT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_cart`
--

CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_cart`
--

INSERT INTO `sma_cart` (`id`, `time`, `user_id`, `data`) VALUES
('084de1e843df7e7b1c30535c66dc75e4', '1595243132', NULL, '{\"cart_total\":850,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"8a6dbf554746d73e62de6e21509b6ee2\":{\"id\":\"3416a75f4cea9109507cacd8e2f2aefc\",\"product_id\":\"41\",\"qty\":1,\"name\":\"Black and White 750 ml\",\"slug\":\"94091833\",\"code\":\"94091833\",\"price\":850,\"tax\":\"0\",\"image\":\"f3578d04607df3e9ebe02b8a595f52fe.jpg\",\"option\":false,\"options\":null,\"rowid\":\"8a6dbf554746d73e62de6e21509b6ee2\",\"row_tax\":\"0.0000\",\"subtotal\":\"850.0000\"}}'),
('21e1a4da2029b0df6ead8e32b131cb1a', '1599938807', NULL, '{\"cart_total\":3900,\"total_item_tax\":0,\"total_items\":2,\"total_unique_items\":2,\"04a07b023cbd8f09dc35bd8b47655431\":{\"id\":\"19ca14e7ea6328a42e0eb13d585e4c22\",\"product_id\":\"36\",\"qty\":1,\"name\":\"Jack Daniels 1Ltr\",\"slug\":\"95703941\",\"code\":\"95703941\",\"price\":2900,\"tax\":\"0\",\"image\":\"0a269ae63e2373dd563935827bab6259.jpg\",\"option\":false,\"options\":null,\"rowid\":\"04a07b023cbd8f09dc35bd8b47655431\",\"row_tax\":\"0.0000\",\"subtotal\":\"2900.0000\"},\"df2421eaa7ede544d2f2769c55a5adc8\":{\"id\":\"d67d8ab4f4c10bf22aa353e27879133c\",\"product_id\":\"39\",\"qty\":1,\"name\":\"Smirnoff Red 750 Ml\",\"slug\":\"77735314\",\"code\":\"77735314\",\"price\":1000,\"tax\":\"0\",\"image\":\"e29dc0f9612db9fc8d93b665b1f7863e.jpeg\",\"option\":false,\"options\":null,\"rowid\":\"df2421eaa7ede544d2f2769c55a5adc8\",\"row_tax\":\"0.0000\",\"subtotal\":\"1000.0000\"}}'),
('2488acc4f0934f81662fa7ef6f383a10', '1599328055', NULL, '{\"cart_total\":1900,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"53789382e3fb63cee9397c2b29bba037\":{\"id\":\"a5771bce93e200c36f7cd9dfd0e5deaa\",\"product_id\":\"38\",\"qty\":1,\"name\":\"John Walker Red Label 1 Ltr\",\"slug\":\"24433212\",\"code\":\"24433212\",\"price\":1900,\"tax\":\"0\",\"image\":\"d1fd61f2d9f7248fefa2fd1b936ccce2.jpeg\",\"option\":false,\"options\":null,\"rowid\":\"53789382e3fb63cee9397c2b29bba037\",\"row_tax\":\"0.0000\",\"subtotal\":\"1900.0000\"}}'),
('3123b24c293e7c92338508df526e96c4', '1592679792', NULL, '{\"cart_total\":1960,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"81bfe3d26724c2c12d83e4c702d6976b\":{\"id\":\"719c2b0557651b1f9c366516a7c1e89e\",\"product_id\":\"5\",\"qty\":1,\"name\":\"Jameson \",\"slug\":\"99745898\",\"code\":\"99745898\",\"price\":1960,\"tax\":\"0.00\",\"image\":\"8bf17575c894e13d6f481d38ead7d4b4.jpeg\",\"option\":false,\"options\":null,\"rowid\":\"81bfe3d26724c2c12d83e4c702d6976b\",\"row_tax\":\"0.0000\",\"subtotal\":\"1960.0000\"}}'),
('3d63f79112b156674c04ade4aa7eaf62', '1599948636', 17, '{\"cart_total\":3600,\"total_item_tax\":0,\"total_items\":2,\"total_unique_items\":1,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":2,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"3600.0000\"}}'),
('447ba2885c71a5dbd0b6e04f420fb5fc', '1599314004', NULL, '{\"cart_total\":8480,\"total_item_tax\":0,\"total_items\":6,\"total_unique_items\":3,\"9b9f61043b8207928dc0e060b9ac584f\":{\"id\":\"182be0c5cdcd5072bb1864cdee4d3d6e\",\"product_id\":\"33\",\"qty\":3,\"name\":\"Famous Grouse 1Ltr\",\"slug\":\"73937508\",\"code\":\"73937508\",\"price\":1760,\"tax\":\"0\",\"image\":\"8edcb3615dd82934a9ace4fefa2bda34.jpg\",\"option\":false,\"options\":null,\"rowid\":\"9b9f61043b8207928dc0e060b9ac584f\",\"row_tax\":\"0.0000\",\"subtotal\":\"5280.0000\"},\"86b9b2f8b5ca8fbcc8ec6579adff87eb\":{\"id\":\"d645920e395fedad7bbbed0eca3fe2e0\",\"product_id\":\"40\",\"qty\":2,\"name\":\"Viceroy 750 Ml\",\"slug\":\"36687552\",\"code\":\"36687552\",\"price\":1100,\"tax\":\"0\",\"image\":\"935b9da7a0638d05989b8e25452699e0.jpg\",\"option\":false,\"options\":null,\"rowid\":\"86b9b2f8b5ca8fbcc8ec6579adff87eb\",\"row_tax\":\"0.0000\",\"subtotal\":\"2200.0000\"},\"5ff05a9d6ad1d0373d6cfaf43a9d1228\":{\"id\":\"e369853df766fa44e1ed0ff613f563bd\",\"product_id\":\"34\",\"qty\":1,\"name\":\"Gilbeys 750 Ml\",\"slug\":\"12313203\",\"code\":\"12313203\",\"price\":1000,\"tax\":\"0\",\"image\":\"c7e0c2342ef348ab61c4ccc1ce229807.jpg\",\"option\":false,\"options\":null,\"rowid\":\"5ff05a9d6ad1d0373d6cfaf43a9d1228\",\"row_tax\":\"0.0000\",\"subtotal\":\"1000.0000\"}}'),
('54729773ba2fd888aacd886e16f4c0c7', '1598295483', NULL, '{\"cart_total\":3600,\"total_item_tax\":0,\"total_items\":2,\"total_unique_items\":1,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":2,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"3600.0000\"}}'),
('549736a73ff0f314720c8076f9820fa2', '1598034162', NULL, '{\"cart_total\":500,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"87f6950fc1f2acc4e329cc2c4d0b7643\":{\"id\":\"6c8349cc7260ae62e3b1396831a8398f\",\"product_id\":\"45\",\"qty\":1,\"name\":\"Kane Extra 750ml\",\"slug\":\"34646082\",\"code\":\"34646082\",\"price\":500,\"tax\":\"0\",\"image\":\"575ba2e49ee5892268ec1fba88373d2e.jpg\",\"option\":false,\"options\":null,\"rowid\":\"87f6950fc1f2acc4e329cc2c4d0b7643\",\"row_tax\":\"0.0000\",\"subtotal\":\"500.0000\"}}'),
('57cc07e3f92d09f187f3cbb32e9d16a7', '1595248267', NULL, '{\"cart_total\":1100,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"86b9b2f8b5ca8fbcc8ec6579adff87eb\":{\"id\":\"d645920e395fedad7bbbed0eca3fe2e0\",\"product_id\":\"40\",\"qty\":1,\"name\":\"Viceroy 750 Ml\",\"slug\":\"36687552\",\"code\":\"36687552\",\"price\":1100,\"tax\":\"0\",\"image\":\"935b9da7a0638d05989b8e25452699e0.jpg\",\"option\":false,\"options\":null,\"rowid\":\"86b9b2f8b5ca8fbcc8ec6579adff87eb\",\"row_tax\":\"0.0000\",\"subtotal\":\"1100.0000\"}}'),
('586cd4d7ba22ffab9ca0511ae91abd91', '1599071939', NULL, '{\"cart_total\":3400,\"total_item_tax\":0,\"total_items\":3,\"total_unique_items\":3,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":1,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"1800.0000\"},\"c210316aa28429797908af0d5b50cad7\":{\"id\":\"a1d0c6e83f027327d8461063f4ac58a6\",\"product_id\":\"42\",\"qty\":1,\"name\":\"All Seasons 750ml\",\"slug\":\"78492315\",\"code\":\"78492315\",\"price\":750,\"tax\":\"0\",\"image\":\"2502ea2b20468eac7205a015ab5ed5f7.jpg\",\"option\":false,\"options\":null,\"rowid\":\"c210316aa28429797908af0d5b50cad7\",\"row_tax\":\"0.0000\",\"subtotal\":\"750.0000\"},\"8a6dbf554746d73e62de6e21509b6ee2\":{\"id\":\"3416a75f4cea9109507cacd8e2f2aefc\",\"product_id\":\"41\",\"qty\":1,\"name\":\"Black and White 750 ml\",\"slug\":\"94091833\",\"code\":\"94091833\",\"price\":850,\"tax\":\"0\",\"image\":\"f3578d04607df3e9ebe02b8a595f52fe.jpg\",\"option\":false,\"options\":null,\"rowid\":\"8a6dbf554746d73e62de6e21509b6ee2\",\"row_tax\":\"0.0000\",\"subtotal\":\"850.0000\"}}'),
('5e7adf4815ac76eecc8c9923b3b9e6cd', '1595866156', NULL, '{\"cart_total\":1600,\"total_item_tax\":0,\"total_items\":2,\"total_unique_items\":2,\"8a6dbf554746d73e62de6e21509b6ee2\":{\"id\":\"3416a75f4cea9109507cacd8e2f2aefc\",\"product_id\":\"41\",\"qty\":1,\"name\":\"Black and White 750 ml\",\"slug\":\"94091833\",\"code\":\"94091833\",\"price\":850,\"tax\":\"0\",\"image\":\"f3578d04607df3e9ebe02b8a595f52fe.jpg\",\"option\":false,\"options\":null,\"rowid\":\"8a6dbf554746d73e62de6e21509b6ee2\",\"row_tax\":\"0.0000\",\"subtotal\":\"850.0000\"},\"c210316aa28429797908af0d5b50cad7\":{\"id\":\"a1d0c6e83f027327d8461063f4ac58a6\",\"product_id\":\"42\",\"qty\":1,\"name\":\"All Seasons 750ml\",\"slug\":\"78492315\",\"code\":\"78492315\",\"price\":750,\"tax\":\"0\",\"image\":\"2502ea2b20468eac7205a015ab5ed5f7.jpg\",\"option\":false,\"options\":null,\"rowid\":\"c210316aa28429797908af0d5b50cad7\",\"row_tax\":\"0.0000\",\"subtotal\":\"750.0000\"}}'),
('6c1656dfa7603606fefb8c825fc7aea7', '1599925236', NULL, '{\"cart_total\":11630,\"total_item_tax\":0,\"total_items\":10,\"total_unique_items\":7,\"8a6dbf554746d73e62de6e21509b6ee2\":{\"id\":\"3416a75f4cea9109507cacd8e2f2aefc\",\"product_id\":\"41\",\"qty\":1,\"name\":\"Black and White 750 ml\",\"slug\":\"94091833\",\"code\":\"94091833\",\"price\":850,\"tax\":\"0\",\"image\":\"f3578d04607df3e9ebe02b8a595f52fe.jpg\",\"option\":false,\"options\":null,\"rowid\":\"8a6dbf554746d73e62de6e21509b6ee2\",\"row_tax\":\"0.0000\",\"subtotal\":\"850.0000\"},\"87f6950fc1f2acc4e329cc2c4d0b7643\":{\"id\":\"6c8349cc7260ae62e3b1396831a8398f\",\"product_id\":\"45\",\"qty\":3,\"name\":\"Kane Extra 750ml\",\"slug\":\"34646082\",\"code\":\"34646082\",\"price\":500,\"tax\":\"0\",\"image\":\"575ba2e49ee5892268ec1fba88373d2e.jpg\",\"option\":false,\"options\":null,\"rowid\":\"87f6950fc1f2acc4e329cc2c4d0b7643\",\"row_tax\":\"0.0000\",\"subtotal\":\"1500.0000\"},\"c210316aa28429797908af0d5b50cad7\":{\"id\":\"a1d0c6e83f027327d8461063f4ac58a6\",\"product_id\":\"42\",\"qty\":1,\"name\":\"All Seasons 750ml\",\"slug\":\"78492315\",\"code\":\"78492315\",\"price\":750,\"tax\":\"0\",\"image\":\"2502ea2b20468eac7205a015ab5ed5f7.jpg\",\"option\":false,\"options\":null,\"rowid\":\"c210316aa28429797908af0d5b50cad7\",\"row_tax\":\"0.0000\",\"subtotal\":\"750.0000\"},\"04a07b023cbd8f09dc35bd8b47655431\":{\"id\":\"19ca14e7ea6328a42e0eb13d585e4c22\",\"product_id\":\"36\",\"qty\":2,\"name\":\"Jack Daniels 1Ltr\",\"slug\":\"95703941\",\"code\":\"95703941\",\"price\":2900,\"tax\":\"0\",\"image\":\"0a269ae63e2373dd563935827bab6259.jpg\",\"option\":false,\"options\":null,\"rowid\":\"04a07b023cbd8f09dc35bd8b47655431\",\"row_tax\":\"0.0000\",\"subtotal\":\"5800.0000\"},\"1cdebc4405e3610c2b0ac08b81789cc9\":{\"id\":\"f7177163c833dff4b38fc8d2872f1ec6\",\"product_id\":\"44\",\"qty\":1,\"name\":\"Kibao Vodka 750ml\",\"slug\":\"39211282\",\"code\":\"39211282\",\"price\":450,\"tax\":\"0\",\"image\":\"c2f96592c3fe30345dbe90db62163d0d.jpg\",\"option\":false,\"options\":null,\"rowid\":\"1cdebc4405e3610c2b0ac08b81789cc9\",\"row_tax\":\"0.0000\",\"subtotal\":\"450.0000\"},\"d15509b48113ffaf089d780645d022ee\":{\"id\":\"17e62166fc8586dfa4d1bc0e1742c08b\",\"product_id\":\"43\",\"qty\":1,\"name\":\"Chrome 750ml\",\"slug\":\"34847847\",\"code\":\"34847847\",\"price\":520,\"tax\":\"0\",\"image\":\"66a55ad1b0d139d24c29e5465c3c4f83.png\",\"option\":false,\"options\":null,\"rowid\":\"d15509b48113ffaf089d780645d022ee\",\"row_tax\":\"0.0000\",\"subtotal\":\"520.0000\"},\"9b9f61043b8207928dc0e060b9ac584f\":{\"id\":\"182be0c5cdcd5072bb1864cdee4d3d6e\",\"product_id\":\"33\",\"qty\":1,\"name\":\"Famous Grouse 1Ltr\",\"slug\":\"73937508\",\"code\":\"73937508\",\"price\":1760,\"tax\":\"0\",\"image\":\"8edcb3615dd82934a9ace4fefa2bda34.jpg\",\"option\":false,\"options\":null,\"rowid\":\"9b9f61043b8207928dc0e060b9ac584f\",\"row_tax\":\"0.0000\",\"subtotal\":\"1760.0000\"}}'),
('72b55a47b1ad22f3af0a522b66d9f0da', '1599333890', NULL, '{\"cart_total\":750,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"c210316aa28429797908af0d5b50cad7\":{\"id\":\"a1d0c6e83f027327d8461063f4ac58a6\",\"product_id\":\"42\",\"qty\":1,\"name\":\"All Seasons 750ml\",\"slug\":\"78492315\",\"code\":\"78492315\",\"price\":750,\"tax\":\"0\",\"image\":\"2502ea2b20468eac7205a015ab5ed5f7.jpg\",\"option\":false,\"options\":null,\"rowid\":\"c210316aa28429797908af0d5b50cad7\",\"row_tax\":\"0.0000\",\"subtotal\":\"750.0000\"}}'),
('739f2b6584f4cf7954f491b09f9621df', '1599314105', NULL, '{\"cart_total\":7700,\"total_item_tax\":0,\"total_items\":5,\"total_unique_items\":4,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":1,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"1800.0000\"},\"5ff05a9d6ad1d0373d6cfaf43a9d1228\":{\"id\":\"e369853df766fa44e1ed0ff613f563bd\",\"product_id\":\"34\",\"qty\":1,\"name\":\"Gilbeys 750 Ml\",\"slug\":\"12313203\",\"code\":\"12313203\",\"price\":1000,\"tax\":\"0\",\"image\":\"c7e0c2342ef348ab61c4ccc1ce229807.jpg\",\"option\":false,\"options\":null,\"rowid\":\"5ff05a9d6ad1d0373d6cfaf43a9d1228\",\"row_tax\":\"0.0000\",\"subtotal\":\"1000.0000\"},\"86b9b2f8b5ca8fbcc8ec6579adff87eb\":{\"id\":\"d645920e395fedad7bbbed0eca3fe2e0\",\"product_id\":\"40\",\"qty\":1,\"name\":\"Viceroy 750 Ml\",\"slug\":\"36687552\",\"code\":\"36687552\",\"price\":1100,\"tax\":\"0\",\"image\":\"935b9da7a0638d05989b8e25452699e0.jpg\",\"option\":false,\"options\":null,\"rowid\":\"86b9b2f8b5ca8fbcc8ec6579adff87eb\",\"row_tax\":\"0.0000\",\"subtotal\":\"1100.0000\"},\"53789382e3fb63cee9397c2b29bba037\":{\"id\":\"a5771bce93e200c36f7cd9dfd0e5deaa\",\"product_id\":\"38\",\"qty\":2,\"name\":\"John Walker Red Label 1 Ltr\",\"slug\":\"24433212\",\"code\":\"24433212\",\"price\":1900,\"tax\":\"0\",\"image\":\"d1fd61f2d9f7248fefa2fd1b936ccce2.jpeg\",\"option\":false,\"options\":null,\"rowid\":\"53789382e3fb63cee9397c2b29bba037\",\"row_tax\":\"0.0000\",\"subtotal\":\"3800.0000\"}}'),
('77872d0a145bb06a4cd74f9abe3d6819', '1595252130', NULL, '{\"cart_total\":2000,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"3834e6081af73a9608a25be3c410478c\":{\"id\":\"a5bfc9e07964f8dddeb95fc584cd965d\",\"product_id\":\"37\",\"qty\":1,\"name\":\"Jameson 1 Ltr\",\"slug\":\"64434898\",\"code\":\"64434898\",\"price\":2000,\"tax\":\"0\",\"image\":\"af1064f5dbbb6e4c6206fc34ddac3c47.jpeg\",\"option\":false,\"options\":null,\"rowid\":\"3834e6081af73a9608a25be3c410478c\",\"row_tax\":\"0.0000\",\"subtotal\":\"2000.0000\"}}'),
('826f26ab19849bbbfa3f2e69b85e4a26', '1599763198', NULL, '{\"cart_total\":1800,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":1,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"1800.0000\"}}'),
('86396a8a07ec71e538624ecaf271ea71', '1599937524', 16, '{\"cart_total\":1800,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":1,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"1800.0000\"}}'),
('96a34737f32ec2cdd52054efbfa3d7d4', '1592654155', NULL, '{\"cart_total\":2200,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"a2ca0c9691149077ebe9be3e5e83edbd\":{\"id\":\"199151a3fe3b280aad264de87044c06d\",\"product_id\":\"17\",\"qty\":1,\"name\":\"Amarula\",\"slug\":\"15432989\",\"code\":\"15432989\",\"price\":2200,\"tax\":\"0.00\",\"image\":\"2b094036aa3273f1e3a21e076ee495f1.jpg\",\"option\":false,\"options\":null,\"rowid\":\"a2ca0c9691149077ebe9be3e5e83edbd\",\"row_tax\":\"0.0000\",\"subtotal\":\"2200.0000\"}}'),
('a3b36aace17f2bb00db0b75d196c89f8', '1595249855', 4, '{\"cart_total\":850,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"8a6dbf554746d73e62de6e21509b6ee2\":{\"id\":\"3416a75f4cea9109507cacd8e2f2aefc\",\"product_id\":\"41\",\"qty\":1,\"name\":\"Black and White 750 ml\",\"slug\":\"94091833\",\"code\":\"94091833\",\"price\":850,\"tax\":\"0\",\"image\":\"f3578d04607df3e9ebe02b8a595f52fe.jpg\",\"option\":false,\"options\":null,\"rowid\":\"8a6dbf554746d73e62de6e21509b6ee2\",\"row_tax\":\"0.0000\",\"subtotal\":\"850.0000\"}}'),
('be0dd893932ad2c7bba727550321f9ef', '1599320967', NULL, '{\"cart_total\":1100,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"86b9b2f8b5ca8fbcc8ec6579adff87eb\":{\"id\":\"d645920e395fedad7bbbed0eca3fe2e0\",\"product_id\":\"40\",\"qty\":1,\"name\":\"Viceroy 750 Ml\",\"slug\":\"36687552\",\"code\":\"36687552\",\"price\":1100,\"tax\":\"0\",\"image\":\"935b9da7a0638d05989b8e25452699e0.jpg\",\"option\":false,\"options\":null,\"rowid\":\"86b9b2f8b5ca8fbcc8ec6579adff87eb\",\"row_tax\":\"0.0000\",\"subtotal\":\"1100.0000\"}}'),
('d75cfbbb2b0c3fc170e9aa61b7b74c8d', '1592637776', NULL, '{\"cart_total\":1100,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"1c747cc3b90ab2f2b08bdf4443dd30b6\":{\"id\":\"334fd23d7b6dcac938cd08ce7fb333ac\",\"product_id\":\"29\",\"qty\":1,\"name\":\"Zappa blue\",\"slug\":\"60585642\",\"code\":\"60585642\",\"price\":1100,\"tax\":\"0.00\",\"image\":\"699b69f344d194c8f0a3b8dc85b495fa.jpg\",\"option\":false,\"options\":null,\"rowid\":\"1c747cc3b90ab2f2b08bdf4443dd30b6\",\"row_tax\":\"0.0000\",\"subtotal\":\"1100.0000\"}}'),
('dab4072dec3783425221261dcda053fd', '1595255729', 10, '{\"cart_total\":1800,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"817808d063b210535f9a3ebbf173ea3d\":{\"id\":\"6364d3f0f495b6ab9dcf8d3b5c6e0b01\",\"product_id\":\"32\",\"qty\":1,\"name\":\"Absolut Vodka 1L\",\"slug\":\"76980698\",\"code\":\"76980698\",\"price\":1800,\"tax\":\"0\",\"image\":\"b1c3093edc436d9b55659fe66bb6149a.jpg\",\"option\":false,\"options\":null,\"rowid\":\"817808d063b210535f9a3ebbf173ea3d\",\"row_tax\":\"0.0000\",\"subtotal\":\"1800.0000\"}}'),
('e8737c0e745c109dc269300777297f13', '1595245450', NULL, '{\"cart_total\":1000,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"5ff05a9d6ad1d0373d6cfaf43a9d1228\":{\"id\":\"e369853df766fa44e1ed0ff613f563bd\",\"product_id\":\"34\",\"qty\":1,\"name\":\"Gilbeys 750 Ml\",\"slug\":\"12313203\",\"code\":\"12313203\",\"price\":1000,\"tax\":\"0\",\"image\":\"c7e0c2342ef348ab61c4ccc1ce229807.jpg\",\"option\":false,\"options\":null,\"rowid\":\"5ff05a9d6ad1d0373d6cfaf43a9d1228\",\"row_tax\":\"0.0000\",\"subtotal\":\"1000.0000\"}}'),
('e8c4677e960add423dddc8ca89a5419d', '1592678374', NULL, '{\"cart_total\":660,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"85c2efd6b9a6a9a05c392e2bf0288ec3\":{\"id\":\"d09558ece8234adac1eb8429b754e5ce\",\"product_id\":\"28\",\"qty\":1,\"name\":\"Kenya Cane\",\"slug\":\"94387135\",\"code\":\"94387135\",\"price\":660,\"tax\":\"0.00\",\"image\":\"ba25947fa32e24a7558b4359d6353b09.jpg\",\"option\":false,\"options\":null,\"rowid\":\"85c2efd6b9a6a9a05c392e2bf0288ec3\",\"row_tax\":\"0.0000\",\"subtotal\":\"660.0000\"}}'),
('e8e24aa27fd1e8480030e2f9c5948d15', '1595257115', NULL, '{\"cart_total\":1100,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"86b9b2f8b5ca8fbcc8ec6579adff87eb\":{\"id\":\"d645920e395fedad7bbbed0eca3fe2e0\",\"product_id\":\"40\",\"qty\":1,\"name\":\"Viceroy 750 Ml\",\"slug\":\"36687552\",\"code\":\"36687552\",\"price\":1100,\"tax\":\"0\",\"image\":\"935b9da7a0638d05989b8e25452699e0.jpg\",\"option\":false,\"options\":null,\"rowid\":\"86b9b2f8b5ca8fbcc8ec6579adff87eb\",\"row_tax\":\"0.0000\",\"subtotal\":\"1100.0000\"}}'),
('f4d5628fa99cbf57a2e40e84320f75ae', '1599329060', NULL, '{\"cart_total\":2000,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"3834e6081af73a9608a25be3c410478c\":{\"id\":\"a5bfc9e07964f8dddeb95fc584cd965d\",\"product_id\":\"37\",\"qty\":1,\"name\":\"Jameson 1 Ltr\",\"slug\":\"64434898\",\"code\":\"64434898\",\"price\":2000,\"tax\":\"0\",\"image\":\"af1064f5dbbb6e4c6206fc34ddac3c47.jpeg\",\"option\":false,\"options\":null,\"rowid\":\"3834e6081af73a9608a25be3c410478c\",\"row_tax\":\"0.0000\",\"subtotal\":\"2000.0000\"}}'),
('ffc5909bce4987b2d414f5bbb699d774', '1598294735', 12, '{\"cart_total\":520,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"d15509b48113ffaf089d780645d022ee\":{\"id\":\"17e62166fc8586dfa4d1bc0e1742c08b\",\"product_id\":\"43\",\"qty\":1,\"name\":\"Chrome 750ml\",\"slug\":\"34847847\",\"code\":\"34847847\",\"price\":520,\"tax\":\"0\",\"image\":\"66a55ad1b0d139d24c29e5465c3c4f83.png\",\"option\":false,\"options\":null,\"rowid\":\"d15509b48113ffaf089d780645d022ee\",\"row_tax\":\"0.0000\",\"subtotal\":\"520.0000\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(3, 'DR', 'Drinks', NULL, 0, 'drinks', 'Alcoholic drinks'),
(4, '1', 'Vodka', NULL, 0, 'vodka', 'Vodka'),
(5, '2', 'Whiskey', NULL, 0, 'whiskey', 'Whiskey');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(7, 4, 'supplier', NULL, NULL, 'SosPeter', 'ultra swift', '', 'Embakasi', 'Nairobi', 'Nairobi', '00200', 'Kenya', '0759531403', 'ultraswiftblue@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, ''),
(8, NULL, 'biller', NULL, NULL, 'SosPeter', 'ultra swift ', '', 'Embakasi', 'Nairobi', 'Nairobi', '00200', 'Kenya', '0759531403', 'ultraswiftblue@gmail.com', '', '', '', '', '', '', '', 0, 'logo6.png', 0, NULL, NULL, NULL, ''),
(9, 3, 'customer', 1, 'General', 'David Dut', 'ultra liquor', NULL, 'madaraka<br>', 'Nairobi', 'Nairobi', '00200', 'Kenya', '0714378596', 'dutdavid7@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(15, 3, 'customer', 1, 'General', 'sos', '', NULL, 'kisumu<br>', NULL, NULL, NULL, NULL, '073456789', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(17, 3, 'customer', 1, 'General', 'Frederick', 'Kalangi', NULL, 'South B<br>Golden Gate Drive', NULL, NULL, NULL, NULL, '0722982976', 'fredkalangi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(18, 3, 'customer', 1, 'General', 'test buyer', '', NULL, 'Reliance Centre, 4th floor, 405<br>Reliance Centre, 4th floor, 405, Woodvale Groove, Westlands', NULL, NULL, NULL, NULL, '0725463214', 'dutdavid@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(19, 3, 'customer', 1, 'General', 'David Dut', 'ultra liquor', NULL, NULL, NULL, NULL, NULL, NULL, '0714378596', 'dutdavid@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(20, 3, 'customer', 1, 'General', 'David Dut', '', NULL, 'Reliance Centre, 4th floor, 405<br>Reliance Centre, 4th floor, 405, Woodvale Groove, Westlands', NULL, NULL, NULL, NULL, '0714378596', 'dutdavid7@protonmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(21, 3, 'customer', 1, 'General', 'Dut David', '', NULL, 'Ole Sangale Rd, Nairobi<br>Ole Sangale Rd, Nairobi, Woodvale Groove, Westlands', NULL, NULL, NULL, NULL, '0714378596', 'david.dut@strathmore.edu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(22, 3, 'customer', 1, 'General', 'Mark Muthii', 'Mark Muthii', NULL, '30178<br>30178', NULL, NULL, NULL, NULL, '0772219258', 'mainamark20@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(23, 3, 'customer', 1, 'General', 'Jean Pierre', 'strathmore', NULL, 'Portal homes<br>langata road', NULL, NULL, NULL, NULL, '+254715476494', 'jeanpierrendagije0@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(24, 3, 'customer', 1, 'General', 'Shaz Shaz', '-', NULL, NULL, NULL, NULL, NULL, NULL, '0722320412', 'soswafs@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(25, 3, 'customer', 1, 'General', 'Test  User', 'test company', NULL, NULL, NULL, NULL, NULL, NULL, '0714378596', 'david.dut@strathmore.edu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(26, 3, 'customer', 1, 'General', 'arthur BUSAKA', 'Free Air LLC', NULL, NULL, NULL, NULL, NULL, NULL, '0722806299', 'arthurbusaka@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(27, 3, 'customer', 1, 'General', 'test test', 'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, '070000000', 'test@testing.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(28, 3, 'customer', 1, 'General', 'Muhammad Saim', 'Diginess World Wide', NULL, 'House # 112/133 Street # 4/5<br>House # 112/133 Street # 4/5, New latifabad vehari road multan', NULL, NULL, NULL, NULL, '03136194473', 'muhammadsaim494@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(29, 3, 'customer', 1, 'General', 'Saaud Iqbal', '-', NULL, NULL, NULL, NULL, NULL, NULL, '+923125238126', 'saaudsdk@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(30, 3, 'customer', 1, 'General', 'Dennis Max', 'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, '+10717525690', 'dennmax@rocketmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL),
(31, 3, 'customer', 1, 'General', 'Muhammad Iqbal', 'Cyclone Coders', NULL, NULL, NULL, NULL, NULL, NULL, '03125238126', 'saaudpro@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, 1, 'Default', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', 1.0000, 0, NULL),
(2, 'EUR', 'EURO', 0.7340, 0, NULL),
(3, 'KES', 'Kenyan shilling', 0.0094, 1, 'sh');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deliveries`
--

INSERT INTO `sma_deliveries` (`id`, `date`, `sale_id`, `do_reference_no`, `sale_reference_no`, `customer`, `address`, `note`, `status`, `attachment`, `delivered_by`, `received_by`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2020-07-18 12:33:00', 6, 'DO2020/07/0001', 'SALE2020/07/0006', 'New Employee', '<p>Ole Sangale Rd, Nairobi<br>Ole Sangale Rd, Nairobi, Woodvale Groove, Westlands    <br>Tel: 0714375896 Email: david.dut3@tafensw.net.au</p>', '', 'delivered', NULL, 'Nduthi guy', 'David dut', 4, NULL, NULL),
(2, '2020-07-19 15:57:00', 5, 'DO2020/07/0002', 'SALE2020/07/0005', 'David Dut', '<p>madaraka<br> Nairobi Nairobi 00200 Kenya<br>Tel: 0714378596 Email: dutdavid7@gmail.com</p>', '', 'delivered', NULL, 'Nduthi guy', 'David dut', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_login_attempts`
--

INSERT INTO `sma_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(2, 0x33392e35332e37382e313331, 'saaudsdk', 1599937681),
(3, 0x33392e35332e37382e313331, 'saaudsdk', 1599937753),
(4, 0x33392e35332e37382e313331, 'saaudsdk', 1599937762);

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 31, 1, 30, 1, 1, 3, 4, 1, 1, 1, 30, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pages`
--

CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_no` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pages`
--

INSERT INTO `sma_pages` (`id`, `name`, `title`, `description`, `slug`, `body`, `active`, `updated_at`, `order_no`) VALUES
(1, 'terms', 'Terms &amp; Conditions', 'Terms &amp; Conditions', 'terms', '<p><strong>Terms and conditions</strong></p><p>This website is operated by\r\nUltraswift Ltd. Throughout the site, the terms “we”, “us” and “our” refer\r\nto Ultraswift Ltd. Ultraswift Ltd offers this website, including\r\nall information, tools and services available from this site to you, the user,\r\nconditioned upon your acceptance of all terms, conditions, policies and notices\r\nstated here.</p><p>The site is intended for your use\r\nonly if you are over 18 years old. If you do not fall within this category, you\r\nwill be in breach of laws or regulations and you should leave the site\r\nimmediately.</p><p>By visiting our site and/ or\r\npurchasing something from us, you engage in our “Service” and agree to be bound\r\nby the following terms and conditions (“Terms of Service”, “Terms”), including\r\nthose additional terms and conditions and policies referenced herein and/or\r\navailable by hyperlink. These Terms of Service apply to all users of the site,\r\nincluding without limitation users who are browsers, vendors, customers,\r\nmerchants, and/ or contributors of content.</p><p>Please read these Terms of\r\nService carefully before accessing or using our website. By accessing or using\r\nany part of the site, you agree to be bound by these Terms of Service. If you\r\ndo not agree to all the terms and conditions of this agreement, then you may\r\nnot access the website or use any services. If these Terms of Service are\r\nconsidered an offer, acceptance is expressly limited to these Terms of Service.</p><p>Any new features or tools which\r\nare added to the current store shall also be subject to the Terms of Service.\r\nYou can review the most current version of the Terms of Service at any time on\r\nthis page. We reserve the right to update, change or replace any part of these\r\nTerms of Service by posting updates and/or changes to our website. It is your\r\nresponsibility to check this page periodically for changes. Your continued use\r\nof or access to the website following the posting of any changes constitutes\r\nacceptance of those changes.</p><p>Our store is hosted on Digital\r\nOcean. </p><p>SECTION 1 – ONLINE STORE TERMS</p><p>By agreeing to these Terms of\r\nService, you represent that you are at least 18 years.</p><p>You may not use our products for\r\nany illegal or unauthorized purpose nor may you, in the use of the Service,\r\nviolate any laws in your jurisdiction (including but not limited to copyright\r\nlaws).</p><p>You must not transmit any worms\r\nor viruses or any code of a destructive nature.</p><p>A breach or violation of any of\r\nthe Terms will result in an immediate termination of your Services.</p><p>SECTION 2 – GENERAL CONDITIONS</p><p>We reserve the right to refuse service\r\nto anyone for any reason at any time.</p><p>You understand that your content\r\n(not including credit card information), may be transferred unencrypted and\r\ninvolve (a) transmissions over various networks; and (b) changes to conform and\r\nadapt to technical requirements of connecting networks or devices. Credit card\r\ninformation is always encrypted during transfer over networks.</p><p>You agree not to reproduce,\r\nduplicate, copy, sell, resell or exploit any portion of the Service, use of the\r\nService, or access to the Service or any contact on the website through which\r\nthe service is provided, without express written permission by us.</p><p>The headings used in this\r\nagreement are included for convenience only and will not limit or otherwise\r\naffect these Terms.</p><p>SECTION 3 – ACCURACY,\r\nCOMPLETENESS AND TIMELINESS OF INFORMATION</p><p>We are not responsible if\r\ninformation made available on this site is not accurate, complete or current.\r\nThe material on this site is provided for general information only and should\r\nnot be relied upon or used as the sole basis for making decisions without\r\nconsulting primary, more accurate, more complete or more timely sources of\r\ninformation. Any reliance on the material on this site is at your own risk.</p><p>This site may contain certain\r\nhistorical information. Historical information, necessarily, is not current and\r\nis provided for your reference only. We reserve the right to modify the\r\ncontents of this site at any time, but we have no obligation to update any\r\ninformation on our site. You agree that it is your responsibility to monitor\r\nchanges to our site.</p><p>SECTION 4 – MODIFICATIONS TO THE\r\nSERVICE AND PRICES</p><p>Prices for our products are\r\nsubject to change without notice.</p><p>We reserve the right at any time\r\nto modify or discontinue the Service (or any part or content thereof) without\r\nnotice at any time.</p><p>We shall not be liable to you or\r\nto any third-party for any modification, price change, suspension or\r\ndiscontinuance of the Service.</p><p>SECTION 5 – PRODUCTS OR SERVICES\r\n(if applicable)</p><p>Certain products or services may\r\nbe available exclusively online through the website. These products or services\r\nmay have limited quantities and are subject to return or exchange only\r\naccording to our Return Policy.</p><p>We have made every effort to\r\ndisplay as accurately as possible the colors and images of our products that\r\nappear at the store. We cannot guarantee that your computer monitor’s display\r\nof any color will be accurate.</p><p>We reserve the right, but are not\r\nobligated, to limit the sales of our products or Services to any person,\r\ngeographic region or jurisdiction. We may exercise this right on a case-by-case\r\nbasis. We reserve the right to limit the quantities of any products or services\r\nthat we offer. All descriptions of products or product pricing are subject to\r\nchange at anytime without notice, at the sole discretion of us. We reserve the\r\nright to discontinue any product at any time. Any offer for any product or\r\nservice made on this site is void where prohibited.</p><p>We do not warrant that the\r\nquality of any products, services, information, or other material purchased or\r\nobtained by you will meet your expectations, or that any errors in the Service\r\nwill be corrected.</p><p>SECTION 6 – ACCURACY OF BILLING\r\nAND ACCOUNT INFORMATION</p><p>We reserve the right to refuse\r\nany order you place with us. We may, in our sole discretion, limit or cancel\r\nquantities purchased per person, per household or per order. These restrictions\r\nmay include orders placed by or under the same customer account, the same\r\ncredit card, and/or orders that use the same billing and/or shipping address.\r\nIn the event that we make a change to or cancel an order, we may attempt to\r\nnotify you by contacting the e-mail and/or billing address/phone number\r\nprovided at the time the order was made. We reserve the right to limit or\r\nprohibit orders that, in our sole judgment, appear to be placed by dealers,\r\nresellers or distributors.</p><p>You agree to provide current,\r\ncomplete and accurate purchase and account information for all purchases made\r\nat our store. You agree to promptly update your account and other information,\r\nincluding your email address and credit card numbers and expiration dates, so\r\nthat we can complete your transactions and contact you as needed.</p><p>For more detail, please review\r\nour Returns Policy.</p><p>SECTION 7 – OPTIONAL TOOLS</p><p>We may provide you with access to\r\nthird-party tools over which we neither monitor nor have any control nor input.</p><p>You acknowledge and agree that we\r\nprovide access to such tools ”as is” and “as available” without any warranties,\r\nrepresentations or conditions of any kind and without any endorsement. We shall\r\nhave no liability whatsoever arising from or relating to your use of optional\r\nthird-party tools.</p><p>Any use by you of optional tools\r\noffered through the site is entirely at your own risk and discretion and you\r\nshould ensure that you are familiar with and approve of the terms on which\r\ntools are provided by the relevant third-party provider(s).</p><p>We may also, in the future, offer\r\nnew services and/or features through the website (including, the release of new\r\ntools and resources). Such new features and/or services shall also be subject\r\nto these Terms of Service.</p><p>SECTION 8 – THIRD-PARTY LINKS</p><p>Certain content, products and\r\nservices available via our Service may include materials from third-parties.</p><p>Third-party links on this site\r\nmay direct you to third-party websites that are not affiliated with us. We are\r\nnot responsible for examining or evaluating the content or accuracy and we do\r\nnot warrant and will not have any liability or responsibility for any\r\nthird-party materials or websites, or for any other materials, products, or\r\nservices of third-parties.</p><p>We are not liable for any harm or\r\ndamages related to the purchase or use of goods, services, resources, content,\r\nor any other transactions made in connection with any third-party websites.\r\nPlease review carefully the third-party’s policies and practices and make sure\r\nyou understand them before you engage in any transaction. Complaints, claims,\r\nconcerns, or questions regarding third-party products should be directed to the\r\nthird-party.</p><p>SECTION 9 – USER COMMENTS,\r\nFEEDBACK AND OTHER SUBMISSIONS</p><p>If, at our request, you send\r\ncertain specific submissions (for example contest entries) or without a request\r\nfrom us you send creative ideas, suggestions, proposals, plans, or other\r\nmaterials, whether online, by email, by postal mail, or otherwise\r\n(collectively, ‘comments’), you agree that we may, at any time, without\r\nrestriction, edit, copy, publish, distribute, translate and otherwise use in\r\nany medium any comments that you forward to us. We are and shall be under no\r\nobligation (1) to maintain any comments in confidence; (2) to pay compensation\r\nfor any comments; or (3) to respond to any comments.</p><p>We may, but have no obligation\r\nto, monitor, edit or remove content that we determine in our sole discretion\r\nare unlawful, offensive, threatening, libelous, defamatory, pornographic,\r\nobscene or otherwise objectionable or violates any party’s intellectual\r\nproperty or these Terms of Service.</p><p>You agree that your comments will\r\nnot violate any right of any third-party, including copyright, trademark,\r\nprivacy, personality or other personal or proprietary right. You further agree\r\nthat your comments will not contain libelous or otherwise unlawful, abusive or\r\nobscene material, or contain any computer virus or other malware that could in\r\nany way affect the operation of the Service or any related website. You may not\r\nuse a false e-mail address, pretend to be someone other than yourself, or\r\notherwise mislead us or third-parties as to the origin of any comments. You are\r\nsolely responsible for any comments you make and their accuracy. We take no\r\nresponsibility and assume no liability for any comments posted by you or any\r\nthird-party.</p><p>SECTION 10 – PERSONAL INFORMATION</p><p>Your submission of personal\r\ninformation through the store is governed by our Privacy Policy.</p><p>Ultraswift Ltd collects\r\ninformation directly from you for your registration, payment, transactions, and\r\nuser profile. We also automatically collect from you your usage information,\r\ncookies and similar technologies, and device information, subject, where\r\nnecessary, to your consent. Ultraswift Ltd may also collect User\r\nPersonal Information from third parties. We only collect the minimum amount of\r\npersonal information necessary from you, unless you choose to provide more.</p><p>SECTION 11 – ERRORS, INACCURACIES\r\nAND OMISSIONS</p><p>Occasionally there may be\r\ninformation on our site or in the Service that contains typographical errors,\r\ninaccuracies or omissions that may relate to product descriptions, pricing,\r\npromotions, offers, product shipping charges, transit times and availability.\r\nWe reserve the right to correct any errors, inaccuracies or omissions, and to\r\nchange or update information or cancel orders if any information in the Service\r\nor on any related website is inaccurate at any time without prior notice\r\n(including after you have submitted your order).</p><p>We undertake no obligation to\r\nupdate, amend or clarify information in the Service or on any related website,\r\nincluding without limitation, pricing information, except as required by law.\r\nNo specified update or refresh date applied in the Service or on any related\r\nwebsite, should be taken to indicate that all information in the Service or on\r\nany related website has been modified or updated.</p><p>SECTION 12 – PROHIBITED USES</p><p>In addition to other prohibitions\r\nas set forth in the Terms of Service, you are prohibited from using the site or\r\nits content: (a) for any unlawful purpose; (b) to solicit others to perform or\r\nparticipate in any unlawful acts; (c) to violate any international, federal,\r\nprovincial or state regulations, rules, laws, or local ordinances; (d) to\r\ninfringe upon or violate our intellectual property rights or the intellectual\r\nproperty rights of others; (e) to harass, abuse, insult, harm, defame, slander,\r\ndisparage, intimidate, or discriminate based on gender, sexual orientation,\r\nreligion, ethnicity, race, age, national origin, or disability; (f) to submit\r\nfalse or misleading information; (g) to upload or transmit viruses or any other\r\ntype of malicious code that will or may be used in any way that will affect the\r\nfunctionality or operation of the Service or of any related website, other\r\nwebsites, or the Internet; (h) to collect or track the personal information of\r\nothers; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for\r\nany obscene or immoral purpose; or (k) to interfere with or circumvent the\r\nsecurity features of the Service or any related website, other websites, or the\r\nInternet. We reserve the right to terminate your use of the Service or any\r\nrelated website for violating any of the prohibited uses.</p><p>SECTION 13 – DISCLAIMER OF\r\nWARRANTIES; LIMITATION OF LIABILITY</p><p>We do not guarantee, represent or\r\nwarrant that your use of our service will be uninterrupted, timely, secure or\r\nerror-free.</p><p>We do not warrant that the\r\nresults that may be obtained from the use of the service will be accurate or\r\nreliable.</p><p>You agree that from time to time\r\nwe may remove the service for indefinite periods of time or cancel the service\r\nat any time, without notice to you.</p><p>You expressly agree that your use\r\nof, or inability to use, the service is at your sole risk. The service and all\r\nproducts and services delivered to you through the service are (except as\r\nexpressly stated by us) provided ‘as is’ and ‘as available’ for your use,\r\nwithout any representation, warranties or conditions of any kind, either\r\nexpress or implied, including all implied warranties or conditions of\r\nmerchantability, merchantable quality, fitness for a particular purpose,\r\ndurability, title, and non-infringement.</p><p>In no case shall Ultraswift Ltd,\r\nour directors, officers, employees, affiliates, agents, contractors, interns,\r\nsuppliers, service providers or licensors be liable for any injury, loss,\r\nclaim, or any direct, indirect, incidental, punitive, special, or consequential\r\ndamages of any kind, including, without limitation lost profits, lost revenue,\r\nlost savings, loss of data, replacement costs, or any similar damages, whether\r\nbased in contract, tort (including negligence), strict liability or otherwise,\r\narising from your use of any of the service or any products procured using the\r\nservice, or for any other claim related in any way to your use of the service\r\nor any product, including, but not limited to, any errors or omissions in any\r\ncontent, or any loss or damage of any kind incurred as a result of the use of\r\nthe service or any content (or product) posted, transmitted, or otherwise made\r\navailable via the service, even if advised of their possibility. Because some\r\njurisdictions do not allow the exclusion or the limitation of liability for\r\nconsequential or incidental damages, in such states or jurisdictions, our\r\nliability shall be limited to the maximum extent permitted by law.</p><p>SECTION 14 – INDEMNIFICATION</p><p>You agree to indemnify, defend\r\nand hold harmless Ultraswift Ltd and our parent, subsidiaries,\r\naffiliates, partners, officers, directors, agents, contractors, licensors,\r\nservice providers, subcontractors, suppliers, interns and employees, harmless\r\nfrom any claim or demand, including reasonable attorneys’ fees, made by any\r\nthird-party due to or arising out of your breach of these Terms of Service or\r\nthe documents they incorporate by reference, or your violation of any law or\r\nthe rights of a third-party.</p><p>SECTION 15 – SEVERABILITY</p><p>In the event that any provision\r\nof these Terms of Service is determined to be unlawful, void or unenforceable,\r\nsuch provision shall nonetheless be enforceable to the fullest extent permitted\r\nby applicable law, and the unenforceable portion shall be deemed to be severed\r\nfrom these Terms of Service, such determination shall not affect the validity\r\nand enforceability of any other remaining provisions.</p><p>SECTION 16 – TERMINATION</p><p>The obligations and liabilities\r\nof the parties incurred prior to the termination date shall survive the\r\ntermination of this agreement for all purposes.</p><p>These Terms of Service are\r\neffective unless and until terminated by either you or us. You may terminate\r\nthese Terms of Service at any time by notifying us that you no longer wish to\r\nuse our Services, or when you cease using our site.</p><p>If in our sole judgment you fail,\r\nor we suspect that you have failed, to comply with any term or provision of\r\nthese Terms of Service, we also may terminate this agreement at any time\r\nwithout notice and you will remain liable for all amounts due up to and\r\nincluding the date of termination; and/or accordingly may deny you access to\r\nour Services (or any part thereof).</p><p>SECTION 17 – ENTIRE AGREEMENT</p><p>The failure of us to exercise or\r\nenforce any right or provision of these Terms of Service shall not constitute a\r\nwaiver of such right or provision.</p><p>These Terms of Service and any\r\npolicies or operating rules posted by us on this site or in respect to The\r\nService constitutes the entire agreement and understanding between you and us\r\nand govern your use of the Service, superseding any prior or contemporaneous\r\nagreements, communications and proposals, whether oral or written, between you\r\nand us (including, but not limited to, any prior versions of the Terms of\r\nService).</p><p>Any ambiguities in the\r\ninterpretation of these Terms of Service shall not be construed against the\r\ndrafting party.</p><p>SECTION 18 – GOVERNING LAW</p><p>These Terms of Service and any\r\nseparate agreements whereby we provide you Services shall be governed by and\r\nconstrued in accordance with the laws of Kenya.</p><p>SECTION 19 – CHANGES TO TERMS OF\r\nSERVICE</p><p>You can review the most current\r\nversion of the Terms of Service at any time at this page.</p><p>We reserve the right, at our sole\r\ndiscretion, to update, change or replace any part of these Terms of Service by\r\nposting updates and changes to our website. It is your responsibility to check\r\nour website periodically for changes. Your continued use of or access to our\r\nwebsite or the Service following the posting of any changes to these Terms of\r\nService constitutes acceptance of those changes.</p><p>SECTION 20 – CONTACT INFORMATION</p><p><strong></strong></p><p>Questions about the Terms of\r\nService should be sent to us at ultraswiftblue@gmail.com</p>', 0, '2020-07-13 18:05:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(45, '2020-07-16 11:34:00', NULL, NULL, 44, 'POP2020/07/0015', NULL, 'cash', '', '', '', '', '', 'Visa', 9000.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(46, '2020-07-16 11:35:00', NULL, NULL, 45, 'POP2020/07/0016', NULL, 'cash', '', '', '', '', '', 'Visa', 8800.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(47, '2020-07-16 11:35:00', NULL, NULL, 46, 'POP2020/07/0017', NULL, 'cash', '', '', '', '', '', 'Visa', 5000.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(48, '2020-07-16 11:36:00', NULL, NULL, 47, 'POP2020/07/0018', NULL, 'cash', '', '', '', '', '', 'Visa', 3250.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(49, '2020-07-16 11:36:00', NULL, NULL, 48, 'POP2020/07/0019', NULL, 'cash', '', '', '', '', '', 'Visa', 14500.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(50, '2020-07-16 11:37:00', NULL, NULL, 49, 'POP2020/07/0020', NULL, 'cash', '', '', '', '', '', 'Visa', 10000.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(51, '2020-07-16 11:37:00', NULL, NULL, 50, 'POP2020/07/0021', NULL, 'cash', '', '', '', '', '', 'Visa', 9500.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(52, '2020-07-16 11:38:00', NULL, NULL, 51, 'POP2020/07/0022', NULL, 'cash', '', '', '', '', '', 'Visa', 5000.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(53, '2020-07-16 11:38:00', NULL, NULL, 52, 'POP2020/07/0023', NULL, 'cash', '', '', '', '', '', 'Visa', 5500.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(54, '2020-07-16 11:39:00', NULL, NULL, 53, 'POP2020/07/0024', NULL, 'cash', '', '', '', '', '', 'Visa', 4250.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(55, '2020-07-16 11:39:00', NULL, NULL, 54, 'POP2020/07/0025', NULL, 'cash', '', '', '', '', '', 'Visa', 3750.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(56, '2020-07-16 11:40:00', NULL, NULL, 55, 'POP2020/07/0026', NULL, 'cash', '', '', '', '', '', 'Visa', 2600.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(57, '2020-07-16 11:40:00', NULL, NULL, 56, 'POP2020/07/0027', NULL, 'cash', '', '', '', '', '', 'Visa', 2250.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(58, '2020-07-16 11:41:00', NULL, NULL, 57, 'POP2020/07/0028', NULL, 'cash', '', '', '', '', '', 'Visa', 2500.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL),
(61, '2020-07-18 13:13:00', NULL, NULL, 58, 'POP2020/07/0029', NULL, 'cash', '', '', '', '', '', 'Visa', 6000.0000, NULL, 4, NULL, 'sent', '', 0.0000, 0.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 0, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(32, '76980698', 'Absolut Vodka 1L', 2, 1800.0000, 1800.0000, 0.0000, 'b1c3093edc436d9b55659fe66bb6149a.jpg', 4, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '76980698', 1, 0.0000, NULL, 9, 0, '', 0),
(33, '73937508', 'Famous Grouse 1Ltr', 2, 1760.0000, 1760.0000, 0.0000, '8edcb3615dd82934a9ace4fefa2bda34.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '73937508', 1, 0.0000, NULL, 6, 0, '', 0),
(34, '12313203', 'Gilbeys 750 Ml', 2, 1000.0000, 1000.0000, 0.0000, 'c7e0c2342ef348ab61c4ccc1ce229807.jpg', 4, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '12313203', 1, 0.0000, NULL, 11, 0, '', 0),
(35, '44906015', 'Imperial blue 750ml', 2, 650.0000, 650.0000, 0.0000, 'b8fb7ba2921a3a866c3d0acf2c7f091f.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '44906015', 1, 0.0000, NULL, 12, 0, '', 0),
(36, '95703941', 'Jack Daniels 1Ltr', 2, 2900.0000, 2900.0000, 0.0000, '0a269ae63e2373dd563935827bab6259.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '95703941', 1, 0.0000, NULL, 15, 0, '', 0),
(37, '64434898', 'Jameson 1 Ltr', 2, 2000.0000, 2000.0000, 0.0000, 'af1064f5dbbb6e4c6206fc34ddac3c47.jpeg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '64434898', 1, 0.0000, NULL, 10, 0, '', 0),
(38, '24433212', 'John Walker Red Label 1 Ltr', 2, 1900.0000, 1900.0000, 0.0000, 'd1fd61f2d9f7248fefa2fd1b936ccce2.jpeg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '24433212', 1, 0.0000, NULL, 7, 0, '', 0),
(39, '77735314', 'Smirnoff Red 750 Ml', 2, 1000.0000, 1000.0000, 0.0000, 'e29dc0f9612db9fc8d93b665b1f7863e.jpeg', 4, NULL, '', '', '', '', '', '', 11.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '77735314', 1, 0.0000, NULL, 5, 0, '', 0),
(40, '36687552', 'Viceroy 750 Ml', 2, 1100.0000, 1100.0000, 0.0000, '935b9da7a0638d05989b8e25452699e0.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '36687552', 1, 0.0000, NULL, 9, 0, '', 0),
(41, '94091833', 'Black and White 750 ml', 2, 850.0000, 850.0000, 0.0000, 'f3578d04607df3e9ebe02b8a595f52fe.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '94091833', 1, 0.0000, NULL, 6, 0, '', 0),
(42, '78492315', 'All Seasons 750ml', 2, 750.0000, 750.0000, 0.0000, '2502ea2b20468eac7205a015ab5ed5f7.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '78492315', 1, 0.0000, NULL, 12, 0, '', 0),
(43, '34847847', 'Chrome 750ml', 2, 520.0000, 520.0000, 0.0000, '66a55ad1b0d139d24c29e5465c3c4f83.png', 4, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '34847847', 1, 0.0000, NULL, 4, 0, '', 0),
(44, '39211282', 'Kibao Vodka 750ml', 2, 450.0000, 450.0000, 0.0000, 'c2f96592c3fe30345dbe90db62163d0d.jpg', 4, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '39211282', 1, 0.0000, NULL, 4, 0, '', 0),
(45, '34646082', 'Kane Extra 750ml', 2, 500.0000, 500.0000, 0.0000, '575ba2e49ee5892268ec1fba88373d2e.jpg', 5, NULL, '', '', '', '', '', '', 5.0000, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, '34646082', 1, 0.0000, NULL, 14, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(32, 32, '912e797825c7b4f8f078f25ff4981220.jpg'),
(33, 33, '966ff66c51693407a308a0cfd3aafe68.jpg'),
(34, 34, '139e5be1f1bad3c32ddd77fbc08deda5.jpg'),
(35, 35, '88c30680a6561686aee6a78b3b0b4b4d.jpg'),
(36, 36, '280b9455c212a6c2709d17448a022320.jpg'),
(37, 37, '3d8333a046517d1e12a7302f3f7d1fa8.jpeg'),
(38, 38, 'af1aed22b0f18b8e4225b5946424b0e0.jpeg'),
(39, 39, '8eccc9adcff31fac0addb54fd5f42e6a.jpeg'),
(40, 40, '860274c2739577129e83f391c9c22406.jpg'),
(41, 41, 'b189612bc63542647cbb08e02bae9db0.jpg'),
(42, 42, 'a9393b2a11ac9d5de8649ce3437f5fc8.jpg'),
(43, 43, '887132a66979f83de73fbed03c25bab4.png'),
(44, 44, 'f9cecf81325ad732cb20d1d140886c93.jpg'),
(45, 45, 'dae05261cfb9ededf82371e66bde53fa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(44, 'PO2020/07/0015', '2020-07-16 11:34:00', 7, 'ultra liquor', 5, '', 9000.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 9000.0000, 9000.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(45, 'PO2020/07/0016', '2020-07-16 11:34:00', 7, 'ultra liquor', 5, '', 8800.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 8800.0000, 8800.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(46, 'PO2020/07/0017', '2020-07-16 11:35:00', 7, 'ultra liquor', 5, '', 5000.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 5000.0000, 5000.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(47, 'PO2020/07/0018', '2020-07-16 11:35:00', 7, 'ultra liquor', 5, '', 3250.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 3250.0000, 3250.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(48, 'PO2020/07/0019', '2020-07-16 11:36:00', 7, 'ultra liquor', 5, '', 14500.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 14500.0000, 14500.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(49, 'PO2020/07/0020', '2020-07-16 11:36:00', 7, 'ultra liquor', 5, '', 10000.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 10000.0000, 10000.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(50, 'PO2020/07/0021', '2020-07-16 11:37:00', 7, 'ultra liquor', 5, '', 9500.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 9500.0000, 9500.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(51, 'PO2020/07/0022', '2020-07-16 11:38:00', 7, 'ultra liquor', 5, '', 5000.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 5000.0000, 5000.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(52, 'PO2020/07/0023', '2020-07-16 11:38:00', 7, 'ultra liquor', 5, '', 5500.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 5500.0000, 5500.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(53, 'PO2020/07/0024', '2020-07-16 11:39:00', 7, 'ultra liquor', 5, '', 4250.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 4250.0000, 4250.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(54, 'PO2020/07/0025', '2020-07-16 11:39:00', 7, 'ultra liquor', 5, '', 3750.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 3750.0000, 3750.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(55, 'PO2020/07/0026', '2020-07-16 11:39:00', 7, 'ultra liquor', 5, '', 2600.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 2600.0000, 2600.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(56, 'PO2020/07/0027', '2020-07-16 11:40:00', 7, 'ultra liquor', 5, '', 2250.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 2250.0000, 2250.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(57, 'PO2020/07/0028', '2020-07-16 11:40:00', 7, 'ultra liquor', 5, '', 2500.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 2500.0000, 2500.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL),
(58, 'PO2020/07/0029', '2020-07-18 13:12:00', 7, 'ultra liquor', 5, '', 6000.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 6000.0000, 6000.0000, 'received', 'paid', 4, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, NULL, NULL, 2, '03767837', 'Johhnie Walker Red', NULL, 1625.0000, 10.0000, 4, NULL, NULL, NULL, NULL, NULL, NULL, 16250.0000, 10.0000, '2020-06-19', 'received', 1625.0000, 1625.0000, 10.0000, NULL, NULL, 2, 'U1', 10.0000, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 4, '04975417', 'Johnie walker', NULL, 1625.0000, 10.0000, 4, NULL, NULL, NULL, NULL, NULL, NULL, 16250.0000, 0.0000, '2020-06-19', 'received', 1625.0000, 1625.0000, 10.0000, NULL, NULL, 2, 'U1', 10.0000, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 17, '15432989', 'Amarula', NULL, 2000.0000, -1.0000, 5, NULL, NULL, NULL, NULL, NULL, NULL, -2000.0000, 0.0000, '2020-06-20', 'received', 2000.0000, 2000.0000, -1.0000, NULL, NULL, 2, 'U1', -1.0000, NULL, NULL, NULL, NULL),
(47, 44, NULL, 32, '76980698', 'Absolut Vodka 1L', NULL, 1800.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 9000.0000, 5.0000, '2020-07-16', 'received', 1800.0000, 1800.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(48, 45, NULL, 33, '73937508', 'Famous Grouse 1Ltr', NULL, 1760.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 8800.0000, 5.0000, '2020-07-16', 'received', 1760.0000, 1760.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(49, 46, NULL, 34, '12313203', 'Gilbeys 750 Ml', NULL, 1000.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 5000.0000, 5.0000, '2020-07-16', 'received', 1000.0000, 1000.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(50, 47, NULL, 35, '44906015', 'Imperial blue 750ml', NULL, 650.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 3250.0000, 5.0000, '2020-07-16', 'received', 650.0000, 650.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(51, 48, NULL, 36, '95703941', 'Jack Daniels 1Ltr', NULL, 2900.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 14500.0000, 5.0000, '2020-07-16', 'received', 2900.0000, 2900.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(52, 49, NULL, 37, '64434898', 'Jameson 1 Ltr', NULL, 2000.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 10000.0000, 5.0000, '2020-07-16', 'received', 2000.0000, 2000.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(53, 50, NULL, 38, '24433212', 'John Walker Red Label 1 Ltr', NULL, 1900.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 9500.0000, 5.0000, '2020-07-16', 'received', 1900.0000, 1900.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(54, 51, NULL, 39, '77735314', 'Smirnoff Red 750 Ml', NULL, 1000.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 5000.0000, 5.0000, '2020-07-16', 'received', 1000.0000, 1000.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(55, 52, NULL, 40, '36687552', 'Viceroy 750 Ml', NULL, 1100.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 5500.0000, 5.0000, '2020-07-16', 'received', 1100.0000, 1100.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(56, 53, NULL, 41, '94091833', 'Black and White 750 ml', NULL, 850.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 4250.0000, 5.0000, '2020-07-16', 'received', 850.0000, 850.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(57, 54, NULL, 42, '78492315', 'All Seasons 750ml', NULL, 750.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 3750.0000, 5.0000, '2020-07-16', 'received', 750.0000, 750.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(58, 55, NULL, 43, '34847847', 'Chrome 750ml', NULL, 520.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 2600.0000, 5.0000, '2020-07-16', 'received', 520.0000, 520.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(59, 56, NULL, 44, '39211282', 'Kibao Vodka 750ml', NULL, 450.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 2250.0000, 5.0000, '2020-07-16', 'received', 450.0000, 450.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(60, 57, NULL, 45, '34646082', 'Kane Extra 750ml', NULL, 500.0000, 5.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 2500.0000, 5.0000, '2020-07-16', 'received', 500.0000, 500.0000, 5.0000, NULL, NULL, 2, 'U1', 5.0000, NULL, NULL, NULL, NULL),
(61, 58, NULL, 39, '77735314', 'Smirnoff Red 750 Ml', NULL, 1000.0000, 6.0000, 5, 0.0000, NULL, '', '0', 0.0000, NULL, 6000.0000, 6.0000, '2020-07-18', 'received', 1000.0000, 1000.0000, 6.0000, NULL, NULL, 2, 'U1', 6.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES
(15, '2020-07-20 16:33:23', 'SALE2020/07/0015', 18, 'test buyer', 8, 'ultra swift ', 5, '', NULL, 450.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 650.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 18, NULL, '6fac096788cbd3244a83184c328f1ff8542639565e0d03b83ce0127c2d976961', NULL, NULL, NULL, NULL, 'cod'),
(16, '2020-07-20 17:34:08', 'SALE2020/07/0016', 20, 'David Dut', 8, 'ultra swift ', 5, '', NULL, 750.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 950.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 20, NULL, 'cea8c12f322d083e17d7434d10668aed59c164b283d69b38c112c7a0f353854f', NULL, NULL, NULL, NULL, 'skrill'),
(17, '2020-07-20 17:47:23', 'SALE2020/07/0017', 20, 'David Dut', 8, 'ultra swift ', 5, '', NULL, 750.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 950.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 0, NULL, '5de8b0b6e9e1521b20ec38b001dda34fce5b11f510cecc62e7ad70d7a1bf2a3b', NULL, NULL, NULL, NULL, 'skrill'),
(18, '2020-07-27 18:19:00', 'SALE2020/07/0018', 21, 'Dut David', 8, 'ultra swift ', 5, '', NULL, 1760.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 1960.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 21, NULL, '40b11fe8d872caed6e23372dc22d0a3d7dd6c845d784f1ef7c8a5c6d52b9cec4', NULL, NULL, NULL, NULL, 'cod'),
(19, '2020-07-27 18:52:32', 'SALE2020/07/0019', 22, 'Mark Muthii', 8, 'ultra swift ', 5, '', NULL, 2100.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 2300.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 2, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 22, NULL, '86d85ad0d33e9bec59de9b55544ee8e0badd8ce4434e3ef12be1a160b952602a', NULL, NULL, NULL, NULL, 'cod'),
(20, '2020-07-27 19:05:24', 'SALE2020/07/0020', 23, 'strathmore', 8, 'ultra swift ', 5, '', NULL, 1600.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 1800.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 2, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 23, NULL, '6c7c818213e542dc497e6daf6d19fd942caa80f69bedd5fc80a302f02d054047', NULL, NULL, NULL, NULL, 'cod'),
(21, '2020-07-29 13:56:02', 'SALE2020/07/0021', 15, 'sos', 8, 'ultra swift ', 5, '', NULL, 3800.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 4000.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 2, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 0, NULL, '943125ed0a19ac5d645af710ea6f702dd27f3efeb1c1d780a4bafa5cf43733dd', NULL, NULL, NULL, NULL, 'cod'),
(22, '2020-08-05 13:00:37', 'SALE2020/08/0022', 9, 'ultra liquor', 8, 'ultra swift ', 5, '', NULL, 1000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 1200.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 0, NULL, '746f24c6603d3ea901b2109341b2fcbc1eaac1150d8e1a0d1a3fa0ad70ba26c3', NULL, NULL, NULL, NULL, 'cod'),
(23, '2020-08-24 20:27:17', 'SALE2020/08/0023', 24, 'Shaz Shaz', 8, 'ultra swift ', 5, '', NULL, 1760.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 1960.0000, 'pending', 'pending', NULL, NULL, 11, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 4, NULL, '359e840bc8774ce2687dcf8da604b53de0fb891f44c8947adad969f9e5e20790', NULL, NULL, NULL, NULL, 'cod'),
(24, '2020-09-06 15:57:15', 'SALE2020/09/0024', 28, 'Diginess World Wide', 8, 'ultra swift ', 5, '', NULL, 2000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 2200.0000, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 28, NULL, '5806606ae053c89211254a185467c7facfc3bea63a3ee8bb64c2856663d601cf', NULL, NULL, NULL, NULL, 'skrill'),
(25, '2020-09-12 12:08:14', 'SALE2020/09/0025', 24, 'Shaz Shaz', 8, 'ultra swift ', 5, '', NULL, 750.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 950.0000, 'pending', 'pending', NULL, NULL, 11, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 5, NULL, 'ac7ac281560e475481e5ec387ac64ac004bfd3a274d1108f3cef18a727508191', NULL, NULL, NULL, NULL, 'skrill'),
(26, '2020-09-12 12:11:06', 'SALE2020/09/0026', 24, 'Shaz Shaz', 8, 'ultra swift ', 5, 'Testing', NULL, 450.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 650.0000, 'pending', 'pending', NULL, NULL, 11, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 4, NULL, '2e993bdeb15fe84998ce35716af16c00624e04ddceb150174a898e0b563b972e', NULL, NULL, NULL, NULL, 'cod'),
(27, '2020-09-13 01:56:07', 'SALE2020/09/0027', 30, 'Paypal', 8, 'ultra swift ', 5, '', NULL, 1000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 1200.0000, 'pending', 'pending', NULL, NULL, 16, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 6, NULL, '6630329a611fbd05ee3b49f2e6b93405c50ff05560e7582a725a7f506dfb0aaa', NULL, NULL, NULL, NULL, 'cod'),
(28, '2020-09-13 02:29:57', 'SALE2020/09/0028', 31, 'Cyclone Coders', 8, 'ultra swift ', 5, '', NULL, 2450.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 2650.0000, 'pending', 'pending', NULL, NULL, 17, NULL, NULL, 2, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 7, NULL, '1bb1dad3d66cc993fcecb22e794e92d3070e281f4281796926233881a5a48951', NULL, NULL, NULL, NULL, 'cod'),
(29, '2020-09-13 02:32:41', 'SALE2020/09/0029', 31, 'Cyclone Coders', 8, 'ultra swift ', 5, '', NULL, 1800.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 2000.0000, 'pending', 'pending', NULL, NULL, 17, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 7, NULL, '3c8843d51900819c70db45f9ec803603e2d7b3e8aa4a1214f7c4ff3a849db8a7', NULL, NULL, NULL, NULL, 'skrill'),
(30, '2020-09-13 11:55:06', 'SALE2020/09/0030', 24, 'Shaz Shaz', 8, 'ultra swift ', 5, '', NULL, 500.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 200.0000, 700.0000, 'pending', 'pending', NULL, NULL, 11, NULL, NULL, 1, 0, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 1, 5, NULL, 'b135ca16b8b354be788922e27a9da102e0315bcb5ea03865b1352fea7915debb', NULL, NULL, NULL, NULL, 'skrill');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(19, 15, 44, '39211282', 'Kibao Vodka 750ml', 'standard', NULL, 450.0000, 450.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 450.0000, NULL, 450.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(20, 16, 42, '78492315', 'All Seasons 750ml', 'standard', NULL, 750.0000, 750.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 750.0000, NULL, 750.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(21, 17, 42, '78492315', 'All Seasons 750ml', 'standard', NULL, 750.0000, 750.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 750.0000, NULL, 750.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(22, 18, 33, '73937508', 'Famous Grouse 1Ltr', 'standard', NULL, 1760.0000, 1760.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1760.0000, NULL, 1760.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(23, 19, 40, '36687552', 'Viceroy 750 Ml', 'standard', NULL, 1100.0000, 1100.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1100.0000, NULL, 1100.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(24, 19, 34, '12313203', 'Gilbeys 750 Ml', 'standard', NULL, 1000.0000, 1000.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1000.0000, NULL, 1000.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(25, 20, 42, '78492315', 'All Seasons 750ml', 'standard', NULL, 750.0000, 750.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 750.0000, NULL, 750.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(26, 20, 41, '94091833', 'Black and White 750 ml', 'standard', NULL, 850.0000, 850.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 850.0000, NULL, 850.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(27, 21, 38, '24433212', 'John Walker Red Label 1 Ltr', 'standard', NULL, 1900.0000, 1900.0000, 2.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 3800.0000, NULL, 1900.0000, NULL, 2, 'U1', 2.0000, NULL, NULL, NULL, NULL, NULL),
(28, 22, 34, '12313203', 'Gilbeys 750 Ml', 'standard', NULL, 1000.0000, 1000.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1000.0000, NULL, 1000.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(29, 23, 33, '73937508', 'Famous Grouse 1Ltr', 'standard', NULL, 1760.0000, 1760.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1760.0000, NULL, 1760.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(30, 24, 37, '64434898', 'Jameson 1 Ltr', 'standard', NULL, 2000.0000, 2000.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 2000.0000, NULL, 2000.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(31, 25, 42, '78492315', 'All Seasons 750ml', 'standard', NULL, 750.0000, 750.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 750.0000, NULL, 750.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(32, 26, 44, '39211282', 'Kibao Vodka 750ml', 'standard', NULL, 450.0000, 450.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 450.0000, NULL, 450.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(33, 27, 34, '12313203', 'Gilbeys 750 Ml', 'standard', NULL, 1000.0000, 1000.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1000.0000, NULL, 1000.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(34, 28, 35, '44906015', 'Imperial blue 750ml', 'standard', NULL, 650.0000, 650.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 650.0000, NULL, 650.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(35, 28, 32, '76980698', 'Absolut Vodka 1L', 'standard', NULL, 1800.0000, 1800.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1800.0000, NULL, 1800.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(36, 29, 32, '76980698', 'Absolut Vodka 1L', 'standard', NULL, 1800.0000, 1800.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 1800.0000, NULL, 1800.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL),
(37, 30, 45, '34646082', 'Kane Extra 750ml', 'standard', NULL, 500.0000, 500.0000, 1.0000, 5, 0.0000, NULL, '', NULL, 0.0000, 500.0000, NULL, 500.0000, NULL, 2, 'U1', 1.0000, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('06183bf15715a3ba5df6981d1a7a1ea56228f255', '52.114.6.38', 1599940496, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934303439363b),
('076cf43462e557d4c42cc3551917d716fdb493e7', '39.53.78.131', 1599944754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934343536393b),
('0b04ed8a2b9e58dc3dd8022c50d5984b4aad5224', '41.139.200.42', 1599982400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393938323430303b),
('0bbc58b3cfef87a1c858425362dd5dbd9401e7e7', '39.53.78.131', 1599945176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934353137363b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0c0360ffaaca0b74605f2d14ccf48aa70e3432c3', '66.102.8.109', 1599937800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373830303b),
('0c29c0031d6a733603ec8fc6d1d9c885ce26947f', '105.163.215.42', 1599974752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937343735323b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a31373a22736f737761667340676d61696c2e636f6d223b757365726e616d657c733a343a227368617a223b656d61696c7c733a31373a22736f737761667340676d61696c2e636f6d223b757365725f69647c733a323a223131223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939383836393238223b6c6173745f69707c733a31343a223130352e3136332e3231352e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223234223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('0ccb4784ced9d4daabdf8669dcdf3f1f61f441e0', '212.113.172.5', 1599972746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937323734363b),
('0d4dd3d685dc6654f533b3f8596f9b8305b87d7a', '105.163.81.80', 1599938825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383832353b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('16ab46417cc0823bc3e469413c32d309358a7874', '39.53.78.131', 1599941902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313930323b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('17a00042bf1771f89225a4c252b345a09dbcf5bf', '39.53.78.131', 1599942551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934323535313b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('18039285bbd6d02827bec1e261eccfbd83c67c66', '39.53.78.131', 1599943030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934333033303b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('193fe91333a09893d9e726002630b503254b37cd', '198.54.114.76', 1599938997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383939373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1af611eea178d0466c45ca3368dde90cf3c92fa5', '39.53.78.131', 1599951124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393935313132343b),
('1c0a6500ef4ad866724c4a0ff31f0b37517f16f5', '198.54.114.76', 1599939161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393136313b),
('22476c4df4c2ef6cd14264c080f44f19ea84a4f3', '105.163.80.10', 1600064635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303036343633353b),
('2264d6c1ab82cdb767dffcd1464665d425cc0547', '39.53.78.131', 1599941386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313338363b),
('22fa9e665d5f65f4abefbca29883cd9764b19ee0', '195.74.76.194', 1599937998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373939373b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('28302ef51f14e34135d11e988a31c553bc07c11f', '195.74.76.194', 1599937360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373336303b),
('2bfa2d74e8e4826f32d837482ca858c0bde88fb0', '66.102.8.111', 1599937740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373734303b),
('301db0814a736471e5d183f47e672a4c29bd24d3', '102.5.72.113', 1599932065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933323036343b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b),
('30e69a2148e45954b3dd0c670bd7d3ae1e38bac0', '198.54.114.76', 1599936968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363936383b),
('338d51327453c46c5a22a736602cba80d89b097e', '39.53.78.131', 1599947391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934373339313b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('351cd89b1c6ef6562c35643c1a6829f96c0a788f', '195.74.76.194', 1599936887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363838373b6572726f727c733a303a22223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('35db20b21c59f06e501d203e7dd39ec6152d7963', '195.74.76.194', 1599946384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934363338343b),
('363ab46e990a63b0ab6048d941ec45d0e06c32d4', '39.53.78.131', 1599938890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383839303b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('36e6bad9648d21361a87c40775df53f448841df9', '39.53.78.131', 1599942231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934323233313b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('376b6b5f2e8746ee68ca5be47eb185c4e4112726', '195.74.76.194', 1599936758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363735373b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('39645777c28d153b3a98277c083e3fd0cfb78942', '39.53.78.131', 1599943862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934333836323b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3bfcb6a6e3779d83eb3abd935723a2d73f3f7227', '39.53.78.131', 1599946936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934363933363b),
('3f19147df20ec83489a764ca82b0ff54af9a8e98', '195.74.76.194', 1599941558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313535383b),
('42464a502f64bb2aa1ea0a23752d19533c949aa6', '39.53.78.131', 1599943553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934333535333b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('44a5f5730ad60c72c391da9ad54afad6fb5b355f', '39.53.78.131', 1599944542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934343534323b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('44c1ff908148969f2953f900b488ec01dcf93323', '202.47.56.213', 1600111860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303131313836303b),
('4863bb1feb755226d805adac999c6a44499f319c', '195.74.76.194', 1599937022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373032323b),
('518e57e3d5db73ba0feb77dedf34c5ebab9c43f6', '195.74.76.194', 1599941468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313436383b),
('53932570cd3e5ecc506fca56d687a95a4cd54785', '102.7.2.184', 1600006258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303030363235383b),
('55654b696f3046d4a10a1f3c99db600967ae1073', '39.53.78.131', 1599948641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934383634313b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('58d7bdab691592b8c24de6f6705a19fcc25433d8', '202.47.56.213', 1600190304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303139303330333b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('59c470ff4a5a66d8831d4d85c622e801e90a3053', '39.53.78.131', 1599944207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934343230373b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5a06d23a78170563af2be3f8cabeb5e3ab69b32e', '39.53.78.131', 1599951224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393935313232343b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5b8bfd161cf39771b20d30b41731783aa8e2c185', '195.74.76.194', 1599937731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373732393b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('5d7a107085ec3c1df4143fb57f767eda62e2f19b', '39.53.78.131', 1599944569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934343536393b),
('63fddba0d11b87a311c1c79d00b6140928397c7a', '208.117.236.19', 1599940506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934303530363b),
('67b6488b17b993528a2947f73eeb44abf42732d9', '195.74.76.194', 1599941558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313535383b),
('695076d2f3f71edf4d6a605868c41c04c8df7120', '39.53.78.131', 1599944854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934343835343b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6a57d3d2758829c6a5e715a58b44873a8b2ac279', '102.5.72.113', 1599932064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933323036343b),
('6cf96d4458f925a220e3cd1f19932fa947593c69', '39.53.78.131', 1599951242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393935313232343b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7509f26a4cb3286d69184c3212fe602618344738', '202.47.56.213', 1599940504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934303530343b),
('7669ce7e9d3bc41a448568068c51974f078d93c1', '198.54.114.76', 1599972907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937323930373b),
('7add4b5fa1c33af391037d01863f8e930a6e3eea', '41.139.200.42', 1599990535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393939303533353b),
('7c4023ca35d7449edfa1ec72608c1d8b3a8fff2f', '39.53.78.131', 1599939193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393139333b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b72656d696e6465727c733a36353a2253686f7070696e67206361727420697320656d7074792c20706c6561736520616464206974656d20616e6420766973697420746865207061676520616761696e2e223b5f5f63695f766172737c613a313a7b733a383a2272656d696e646572223b733a333a226e6577223b7d),
('7fecc0ad3145d4d4a5b1e37b2b371d8710ba696b', '66.102.8.111', 1599937986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373938363b),
('8093ca300d6dc508875e0507f5c137271f98640d', '198.54.114.76', 1599936968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363936383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('82833878c9b4d958bcaf961c337e2a3eed9b3e5e', '39.53.78.131', 1599937944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373934343b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('85543fd194d689f73e1225d1dae5ed90c1f9af0f', '202.47.56.213', 1600190028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303139303032383b),
('86eee7495c02863b8aad3acfe3d5a19fa5fb29bd', '195.74.76.194', 1599939910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393931303b),
('87c79aa0f687c63f8d5b43bc0ee18458d0502e8f', '105.163.81.80', 1599937514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373531343b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a32323a2264656e6e6d617840726f636b65746d61696c2e636f6d223b757365726e616d657c733a373a2264656e6e6d6178223b656d61696c7c733a32323a2264656e6e6d617840726f636b65746d61696c2e636f6d223b757365725f69647c733a323a223136223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393336373031223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223330223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8b37241c85e3aa50b1a40b4137c985b7e76a0255', '39.53.78.131', 1599941272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313237323b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('90301741cccdb2ffd674316c0fc2ada12f2a4644', '39.53.78.131', 1599939613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393631333b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a38393a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e636172742f636865636b6f7574223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('961cdb2b8bccb1737712b99872152ad00ce0248b', '39.53.78.131', 1599940182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934303138323b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9c79f6803b1cad12fece6b71266c9993c01e97f2', '195.74.76.194', 1599936787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363738373b),
('9e35e6791ee1754aa95fe1c7ff793eb36863f47a', '105.163.215.42', 1599972958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937323935383b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a31373a22736f737761667340676d61696c2e636f6d223b757365726e616d657c733a343a227368617a223b656d61696c7c733a31373a22736f737761667340676d61696c2e636f6d223b757365725f69647c733a323a223131223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939383836393238223b6c6173745f69707c733a31343a223130352e3136332e3231352e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223234223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9eae150c37c23f9ca0aef7e97f4a34cbcdd6ecf3', '39.53.78.131', 1599941591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313539313b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9f3e147b0ce1dd18305517909ead72122f7f3e4c', '198.54.114.76', 1599939161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393136313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9fa3c89fee0c6cc8ab297c4994bc408ea8957da1', '202.47.56.213', 1600111816, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303131313831363b),
('a06847e22d960fa45a42e3ef26c2057b85dd8c4c', '66.102.8.111', 1599937741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373734313b),
('a0d563992938a3ec5be04d1bb03b2ebec510c7dc', '39.53.78.131', 1599937611, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373631313b),
('a28780f8f7c486373510e76634b71764c57fa63b', '195.74.76.194', 1599938014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383031343b),
('a6a2661020220535f14df11a66217a7aa852c52a', '195.74.76.194', 1599936883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363838333b),
('a754fb91a055b65e1c26db830f990bd7deb39e14', '195.74.76.194', 1599940062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934303036323b),
('a88b1bb5f7a68deb7b888a10a2bc94b7f87b8e7c', '105.163.81.80', 1599937835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373831383b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a32323a2264656e6e6d617840726f636b65746d61696c2e636f6d223b757365726e616d657c733a373a2264656e6e6d6178223b656d61696c7c733a32323a2264656e6e6d617840726f636b65746d61696c2e636f6d223b757365725f69647c733a323a223136223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393336373031223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223330223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ad33cb20a6c1c80400c158cf0bfee35212fafd79', '198.54.114.76', 1599939162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393136323b),
('ad6c54e4adb537068a6ebe6cf243ea2185320f7c', '105.163.81.80', 1599937818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373831383b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a32323a2264656e6e6d617840726f636b65746d61696c2e636f6d223b757365726e616d657c733a373a2264656e6e6d6178223b656d61696c7c733a32323a2264656e6e6d617840726f636b65746d61696c2e636f6d223b757365725f69647c733a323a223136223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393336373031223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223330223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ad9c10b2b002b370c3854bfddf83fb5154959961', '66.102.8.113', 1599937800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373830303b),
('b146358144e78bab4b2e6e3e0f1e6ea669dd808c', '202.47.56.213', 1600111859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303131313835393b),
('b24a79e609292530b7f6f39493125c8e45a028ac', '105.163.81.80', 1599936847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363834373b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6d6573736167657c733a33343a223c703e55736572207375636365737366756c6c79206163746976617465643c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('b662bf760669a46642e31396fce5592bdc1f4193', '195.74.76.194', 1599939910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393931303b),
('ba235c4c479eb60aaa3058084e63427c912b7dac', '198.54.114.76', 1599972908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937323930383b),
('bd881fc503d37253227968e6ba679e6f2bc4364f', '195.74.76.194', 1600184110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303138343131303b),
('bd9e75b3fdb80ac1f71e16bd721b9f886d669db7', '66.102.8.107', 1599937986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933373938363b),
('be54875ec268948f0f7fe0593837639fd5b97127', '39.53.78.131', 1599940535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934303533353b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c39a1ead4ca9459f47d6db352d3da1dd03939a4c', '39.53.78.131', 1599947029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934373032393b7265717565737465645f706167657c733a31333a22636172742f636865636b6f7574223b6964656e746974797c733a383a22736161756470726f223b757365726e616d657c733a383a22736161756470726f223b656d61696c7c733a31383a22736161756470726f40676d61696c2e636f6d223b757365725f69647c733a323a223137223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939393337393434223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223331223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c60f301f13332a008306087d11b513bae9dcd1fa', '39.53.78.131', 1600032640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303033323634303b),
('caa80b9fdd47086245dceab80e64a44adfabbe74', '105.163.81.80', 1599938832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383832353b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('ced36d2b9756874d08bdc253f606e378b7b3f7dc', '195.74.76.194', 1599939801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393830313b),
('d356e70d9bfb03efd9053848752053d7d64a4445', '198.54.114.76', 1599938997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383939373b),
('d5a0daf1db1d8465e36ffe962ee40882e8773045', '193.170.141.197', 1600064638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303036343633383b),
('d913a61319ac102ae3923e611c764962321e28d1', '195.74.76.194', 1599939798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393739383b),
('dc82204f3f889956e5eb41692e029de15c911ae1', '39.53.78.131', 1599941386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313338363b),
('e6d8c7735736b51834f03b5bb802f09a4658fb3e', '105.163.215.42', 1599974752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937343735323b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a31373a22736f737761667340676d61696c2e636f6d223b757365726e616d657c733a343a227368617a223b656d61696c7c733a31373a22736f737761667340676d61696c2e636f6d223b757365725f69647c733a323a223131223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939383836393238223b6c6173745f69707c733a31343a223130352e3136332e3231352e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223234223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('e7530f3a94863146db4a9cbf7145ad5d9b6dcde7', '39.53.87.70', 1600188095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303138383039353b),
('e8fe49cc62b32a7bb30492b3d8bc9aab75720488', '195.74.76.194', 1599939801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933393830313b),
('ea96e69d73769c2f7e09486a9d10d2522fff22ed', '39.53.78.131', 1599951124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393935313132343b),
('ed373acc9a9f458c0c0329bc33f1adf7b7084009', '105.163.215.42', 1599974417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937343431373b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b6964656e746974797c733a31373a22736f737761667340676d61696c2e636f6d223b757365726e616d657c733a343a227368617a223b656d61696c7c733a31373a22736f737761667340676d61696c2e636f6d223b757365725f69647c733a323a223131223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353939383836393238223b6c6173745f69707c733a31343a223130352e3136332e3231352e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a323a223234223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ef08aa44caab39436594509ca25fe10ed4bf7d7b', '198.54.114.76', 1599938998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933383939383b),
('f1468d52449e0723dd033dd9ec7d7cc99c2acb9a', '202.47.56.213', 1600190276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630303139303032383b7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('f8e1648cba7c2d0fc6ed759f84fddae75283b7ab', '198.54.114.76', 1599936968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393933363936383b),
('fa00d7c4add7a35a2121eac049d570dd9ad42665', '198.54.114.76', 1599972908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393937323930383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fb66d08f8ec903bc148404aefef06e9c4ed4a489', '195.74.76.194', 1599941468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393934313436383b),
('fe5367350c5dab1621545483687cefb1c6c1b116', '41.139.200.42', 1599982400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393938323430303b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`) VALUES
(1, 'logo61.png', 'logo62.png', 'Ultra Swift Liquor', 'english', 5, 0, 'KES', 0, 100, '3.4.35', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 1, 'default', 1, 1, 1, 1, 0, 1, 0, 1, 0, 'Africa/Nairobi', 800, 800, 200, 200, 0, 0, 0, 0, NULL, 'smtp', '/usr/sbin/sendmail', 'smtp.gmail.com', 'dutdavid7@gmail.com', 'beogiysjizjsjlpx', '465', 'ssl', NULL, 1, 'ultraswiftblue@gmail.com', 0, 4, 1, 0, 2, 1, 0, 1, 0, 0, '.', ',', 0, 8, 'dutdavid', 'a12c5a76-8070-476c-8238-97ba66439310', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, '', 0, '~', 0, 1, 1, 'POP', 90, '', 1, 0, 'AN', 'dompdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_shop_settings`
--

CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.35',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT 0,
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT 0,
  `hide_price` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_shop_settings`
--

INSERT INTO `sma_shop_settings` (`shop_id`, `shop_name`, `description`, `warehouse`, `biller`, `about_link`, `terms_link`, `privacy_link`, `contact_link`, `payment_text`, `follow_text`, `facebook`, `twitter`, `google_plus`, `instagram`, `phone`, `email`, `cookie_message`, `cookie_link`, `slider`, `shipping`, `purchase_code`, `envato_username`, `version`, `logo`, `bank_details`, `products_page`, `hide0`, `products_description`, `private`, `hide_price`, `stripe`) VALUES
(1, 'Ultraswift', 'ultra swift liquor is an online alcohol selling and distribution store', 5, 8, '', 'terms', '', '', 'Mpesa Till number 5247335', 'Please click the link below to follow us on social media.', 'http://facebook.com/', 'http://twitter.com/', '', '', '0759531403', 'ultraswiftblue@gmail.com', '', '', '[{\"image\":\"0daf96f081138890fea109f50d224f88.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"e23988848a4325d6df6e961939da7c79.jpg\",\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"}]', 200, 'df85f630-1404-4387-a503-8ba306067129', 'dutdavid', '3.4.35', 'logo6.png', '<p>We only accept Mpesa and cash payment. Mpesa Till number 5247335</p>', 0, 0, 'We deal in all brands of alcoholic drinks', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sms_settings`
--

CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sms_settings`
--

INSERT INTO `sma_sms_settings` (`id`, `auto_send`, `config`) VALUES
(1, NULL, '{\"gateway\":\"Log\",\"Log\":{}');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2020-06-19 04:48:00', '', 3, 'full', '859cae822577e48b3d7547ce5a99f872.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, '2020-06-19 23:08:00', 'jw', 4, 'full', '3c7dc693c9a9c23aea8f26145c7e402c.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', 0.0000, '2'),
(2, 'VAT @10%', 'VAT10', 10.0000, '1'),
(3, 'GST @6%', 'GST', 6.0000, '1'),
(4, 'VAT @20%', 'VT20', 20.0000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(2, 'U1', 'Drinks', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x34312e39302e37362e323334, 0x0000, 'owner', '8198eb3af296e0c7dae0359ea5699742bc8dcb6a', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, NULL, 1351661704, 1592593697, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(4, 0x34312e38302e3234302e323130, 0x34312e39302e35372e3935, 'dutdavid', '209e3956d6ea279b47ddceb1854258479b482dfd', NULL, 'dutdavid7@gmail.com', NULL, NULL, NULL, NULL, 1592534293, 1598294118, 1, 'David', 'Dut', 'Meta', '0714378596', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(5, 0x3130352e3136332e3232322e323138, 0x34312e38312e33382e3231, 'sospeter', 'f0ac86491843a36ae3e2f4fb532544bfb274fdd1', NULL, 'soswafs@yahoo.com', NULL, NULL, NULL, '40c1770728f67c86c3d553fffaa258824a9cd3ec', 1592576798, 1594656394, 1, 'Sos', 'Peter', 'ultra liquor', '0722320589', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(10, 0x34312e39302e34352e313433, 0x34312e39302e34352e313433, 'test user', 'b3edc9348a13d7dd7205137927617d2e597c0264', NULL, 'dutdavid@hotmail.com', NULL, NULL, NULL, NULL, 1595254588, 1595256232, 1, 'David', 'Dut', 'ultra liquor', '0714378596', NULL, 'male', 3, NULL, NULL, 19, 0, 0, 0, 0, 0, 0),
(11, 0x3130352e3136332e3231352e3432, 0x3130352e3136332e3230312e313038, 'shaz', '569c030ddc0373a1578853c1a70172ff06d7c956', NULL, 'soswafs@gmail.com', NULL, NULL, NULL, NULL, 1598289071, 1599972767, 1, 'Shaz', 'Shaz', '', '0722320412', NULL, 'male', 3, NULL, NULL, 24, 0, 0, 0, 0, 0, 0),
(12, 0x34312e38302e3234302e323130, 0x34312e38302e3234302e323130, 'testuser', 'a97fe0495430524f0147502ecb5fcda1b62f93fa', NULL, 'david.dut@strathmore.edu', NULL, NULL, NULL, NULL, 1598293782, 1598294730, 1, 'Test ', 'User', 'test company', '0714378596', NULL, 'male', 3, NULL, NULL, 25, 0, 0, 0, 0, 0, 0),
(13, 0x34312e39302e372e3334, 0x34312e39302e372e31, 'arthurbusaka', 'e65db355dd73acf32f0d909b2c3a160a79906f75', NULL, 'arthurbusaka@gmail.com', NULL, NULL, NULL, '92866da83e5d98453fe9481be5277c66f673567e', 1599072110, 1599072156, 1, 'arthur', 'BUSAKA', 'Free Air LLC', '0722806299', NULL, 'male', 3, NULL, NULL, 26, 0, 0, 0, 0, 0, 0),
(14, NULL, 0x34312e39302e35342e3738, 'test', 'b94e4fd9872838eae8c85287d48f357a3e5045f2', NULL, 'test@testing.com', 'd74f4c7e355f77920f011440c5449af29404c8a7', NULL, NULL, NULL, 1599314279, 1599314279, 0, 'test', 'test', 'Paypal', '070000000', NULL, 'male', 3, NULL, NULL, 27, 0, 0, 0, 0, 0, 0),
(15, NULL, 0x33392e35332e37382e313331, 'saaudsdk', 'cd4a7cddf693e142d35c86d4536feb79839e2449', NULL, 'saaudsdk@gmail.com', NULL, NULL, NULL, NULL, 1599925935, 1599925935, 1, 'Saaud', 'Iqbal', '', '+923125238126', NULL, 'male', 3, NULL, NULL, 29, 0, 0, 0, 0, 0, 0),
(16, 0x3130352e3136332e38312e3830, 0x3130352e3136332e38312e3830, 'dennmax', 'fb04a12c052c9abfb13d2f2426ff15a23832816b', NULL, 'dennmax@rocketmail.com', NULL, NULL, NULL, NULL, 1599936701, 1599936868, 1, 'Dennis', 'Max', 'Paypal', '+10717525690', NULL, 'male', 3, NULL, NULL, 30, 0, 0, 0, 0, 0, 0),
(17, 0x33392e35332e37382e313331, 0x33392e35332e37382e313331, 'saaudpro', 'e468514662a5d2cdd17ea4fdad91a6b73f6118da', NULL, 'saaudpro@gmail.com', NULL, NULL, NULL, NULL, 1599937944, 1599938001, 1, 'Muhammad', 'Iqbal', 'Cyclone Coders', '03125238126', NULL, 'male', 3, NULL, NULL, 31, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x34312e39302e33352e323136, 'owner@tecdiary.com', '2020-06-18 03:02:54'),
(2, 1, NULL, 0x34312e39302e33352e323136, 'owner@tecdiary.com', '2020-06-18 03:04:06'),
(3, 1, NULL, 0x34312e39302e33352e323136, 'owner@tecdiary.com', '2020-06-18 03:08:46'),
(4, 1, NULL, 0x34312e39302e33352e323136, 'owner@tecdiary.com', '2020-06-18 03:15:33'),
(5, 1, NULL, 0x34312e39302e33352e323136, 'owner@tecdiary.com', '2020-06-18 04:00:09'),
(6, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-18 13:33:37'),
(7, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-18 22:49:47'),
(8, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-18 23:27:43'),
(9, 2, NULL, 0x34312e39302e35372e3935, 'dutdavid7@gmail.com', '2020-06-19 00:56:02'),
(10, 2, NULL, 0x34312e39302e35372e3935, 'dutdavid7@gmail.com', '2020-06-19 00:56:23'),
(11, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-19 01:10:22'),
(12, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-19 01:29:23'),
(13, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-19 02:34:34'),
(14, 1, NULL, 0x34312e39302e35372e3935, 'owner@tecdiary.com', '2020-06-19 02:51:32'),
(15, 4, NULL, 0x34312e39302e35372e3935, 'dutdavid7@gmail.com', '2020-06-19 02:51:56'),
(16, 4, NULL, 0x34312e39302e35372e3935, 'dutdavid7@gmail.com', '2020-06-19 03:13:25'),
(17, 4, NULL, 0x34312e39302e35372e3935, 'dutdavid7@gmail.com', '2020-06-19 05:58:02'),
(18, 4, NULL, 0x34312e38312e33382e3231, 'dutdavid7@gmail.com', '2020-06-19 14:08:24'),
(19, 5, NULL, 0x3135342e37382e33372e313638, 'Soswafs@yahoo.com', '2020-06-19 14:29:55'),
(20, 5, NULL, 0x3130352e3136332e3138332e323535, 'Soswafs@yahoo.com', '2020-06-19 18:06:29'),
(21, 1, NULL, 0x34312e39302e37362e323334, 'owner@tecdiary.com', '2020-06-19 19:08:17'),
(22, 4, NULL, 0x34312e39302e37362e323334, 'dutdavid7@gmail.com', '2020-06-20 04:25:41'),
(23, 4, NULL, 0x3137352e3133372e35302e323533, 'dutdavid7@gmail.com', '2020-06-20 04:50:57'),
(24, 4, NULL, 0x34312e39302e37362e323334, 'dutdavid7@gmail.com', '2020-06-20 05:53:09'),
(25, 5, NULL, 0x3130352e3136332e3138332e323535, 'Soswafs@yahoo.com', '2020-06-20 06:54:31'),
(26, 4, NULL, 0x34312e39302e37362e323334, 'dutdavid7@gmail.com', '2020-06-20 07:10:59'),
(27, 5, NULL, 0x3130352e3136332e3138332e323535, 'Soswafs@yahoo.com', '2020-06-20 07:23:46'),
(28, 4, NULL, 0x34312e39302e37362e323334, 'dutdavid7@gmail.com', '2020-06-20 08:43:20'),
(29, 4, NULL, 0x34312e38302e3132392e3833, 'dutdavid7@gmail.com', '2020-06-20 20:38:16'),
(30, 4, NULL, 0x34312e38302e3233392e3833, 'dutdavid7@gmail.com', '2020-07-09 12:07:11'),
(31, 4, NULL, 0x34312e38302e3233392e3833, 'dutdavid7@gmail.com', '2020-07-09 12:15:48'),
(32, 4, NULL, 0x34312e38302e3233392e3833, 'dutdavid7@gmail.com', '2020-07-09 12:19:19'),
(33, 4, NULL, 0x34312e38302e3233392e3833, 'dutdavid7@gmail.com', '2020-07-09 12:22:23'),
(34, 4, NULL, 0x34312e38302e3233392e3833, 'dutdavid7@gmail.com', '2020-07-09 12:36:00'),
(35, 9, NULL, 0x34312e38302e3233392e3833, 'dutdavid@hotmail.com', '2020-07-09 12:38:17'),
(36, 4, NULL, 0x34312e38302e3233392e3833, 'dutdavid7@gmail.com', '2020-07-09 12:41:31'),
(37, 9, NULL, 0x34312e39302e37362e313635, 'dutdavid@hotmail.com', '2020-07-12 10:03:31'),
(38, 4, NULL, 0x34312e39302e37362e313635, 'dutdavid7@gmail.com', '2020-07-12 10:04:55'),
(39, 4, NULL, 0x34312e39302e37362e313635, 'dutdavid7@gmail.com', '2020-07-12 17:07:56'),
(40, 9, NULL, 0x34312e39302e37362e313635, 'dutdavid@hotmail.com', '2020-07-12 18:00:00'),
(41, 4, NULL, 0x34312e39302e37362e313635, 'dutdavid7@gmail.com', '2020-07-13 07:31:00'),
(42, 4, NULL, 0x34312e39302e37332e313237, 'dutdavid7@gmail.com', '2020-07-13 15:04:37'),
(43, 5, NULL, 0x3130352e3136332e3232322e323138, 'soswafs@yahoo.com', '2020-07-13 16:06:34'),
(44, 9, NULL, 0x34312e39302e37332e313237, 'dutdavid@hotmail.com', '2020-07-13 16:13:08'),
(45, 4, NULL, 0x34312e39302e37332e313237, 'dutdavid7@gmail.com', '2020-07-13 16:14:39'),
(46, 4, NULL, 0x3139362e3130392e3136342e3437, 'dutdavid7@gmail.com', '2020-07-14 10:21:16'),
(47, 4, NULL, 0x34312e38302e3135322e313739, 'dutdavid7@gmail.com', '2020-07-15 17:03:15'),
(48, 4, NULL, 0x34312e38302e3135322e313739, 'dutdavid7@gmail.com', '2020-07-15 20:00:38'),
(49, 4, NULL, 0x34312e38302e3135322e313739, 'dutdavid7@gmail.com', '2020-07-15 21:17:42'),
(50, 4, NULL, 0x34312e38302e3135322e313739, 'dutdavid7@gmail.com', '2020-07-16 08:31:31'),
(51, 4, NULL, 0x34312e38302e39352e3634, 'dutdavid7@gmail.com', '2020-07-18 09:29:14'),
(52, 4, NULL, 0x34312e38302e3133352e3230, 'dutdavid7@gmail.com', '2020-07-18 20:03:05'),
(53, 4, NULL, 0x34312e39302e36342e313435, 'dutdavid7@gmail.com', '2020-07-19 12:37:02'),
(54, 4, NULL, 0x34312e39302e34352e313433, 'dutdavid7@gmail.com', '2020-07-20 12:41:15'),
(55, 4, NULL, 0x34312e39302e34352e313433, 'dutdavid7@gmail.com', '2020-07-20 12:45:19'),
(56, 10, NULL, 0x34312e39302e34352e313433, 'dutdavid@hotmail.com', '2020-07-20 14:16:59'),
(57, 10, NULL, 0x34312e39302e34352e313433, 'dutdavid@hotmail.com', '2020-07-20 14:35:21'),
(58, 10, NULL, 0x34312e39302e34352e313433, 'dutdavid@hotmail.com', '2020-07-20 14:43:52'),
(59, 4, NULL, 0x34312e38302e3130352e313338, 'dutdavid7@gmail.com', '2020-07-30 20:07:25'),
(60, 4, NULL, 0x34312e38302e34352e323139, 'dutdavid7@gmail.com', '2020-08-07 17:02:41'),
(61, 4, NULL, 0x3139372e3137362e3233352e3334, 'dutdavid7@gmail.com', '2020-08-21 13:34:05'),
(62, 11, NULL, 0x3130352e3136332e3230312e313038, 'shaz', '2020-08-24 17:19:58'),
(63, 4, NULL, 0x34312e38302e3234302e323130, 'dutdavid7@gmail.com', '2020-08-24 18:19:13'),
(64, 4, NULL, 0x34312e38302e3234302e323130, 'dutdavid7@gmail.com', '2020-08-24 18:35:18'),
(65, 12, NULL, 0x34312e38302e3234302e323130, 'david.dut@strathmore.edu', '2020-08-24 18:45:30'),
(66, 13, NULL, 0x34312e39302e372e3334, 'arthurbusaka', '2020-09-02 18:42:36'),
(67, 11, NULL, 0x3130352e3136332e3231352e3432, 'Soswafs@gmail.com', '2020-09-12 05:02:08'),
(68, 16, NULL, 0x3130352e3136332e38312e3830, 'dennmax@rocketmail.com', '2020-09-12 18:54:28'),
(69, 17, NULL, 0x33392e35332e37382e313331, 'saaudpro', '2020-09-12 19:13:21'),
(70, 11, NULL, 0x3130352e3136332e3231352e3432, 'Soswafs@gmail.com', '2020-09-13 04:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, '1 litre'),
(2, '750ml');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(5, 'W1', 'shop1', '<p>nairobi, kenya</p>', NULL, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(43, 30, 5, 0.0000, NULL, 1000.0000),
(44, 29, 5, 0.0000, NULL, 1000.0000),
(45, 28, 5, 0.0000, NULL, 600.0000),
(46, 26, 5, 0.0000, NULL, 8400.0000),
(47, 25, 5, 0.0000, NULL, 600.0000),
(48, 24, 5, 0.0000, NULL, 2700.0000),
(49, 23, 5, 0.0000, NULL, 1500.0000),
(50, 22, 5, 0.0000, NULL, 1100.0000),
(51, 21, 5, 0.0000, NULL, 1004.0000),
(52, 20, 5, 0.0000, NULL, 1550.0000),
(53, 19, 5, 0.0000, NULL, 1500.0000),
(54, 18, 5, 0.0000, NULL, 1550.0000),
(55, 17, 5, 0.0000, NULL, 2000.0000),
(56, 16, 5, 0.0000, NULL, 1625.0000),
(57, 15, 5, 0.0000, NULL, 1480.0000),
(58, 14, 5, 0.0000, NULL, 1500.0000),
(59, 13, 5, 0.0000, NULL, 2200.0000),
(60, 10, 5, 0.0000, NULL, 3125.0000),
(61, 11, 5, 0.0000, NULL, 6770.0000),
(62, 9, 5, 0.0000, NULL, 1600.0000),
(63, 8, 5, 0.0000, NULL, 3750.0000),
(64, 7, 5, 0.0000, NULL, 2600.0000),
(65, 6, 5, 0.0000, NULL, 1100.0000),
(66, 5, 5, 0.0000, NULL, 1782.0000),
(67, 4, 5, 0.0000, NULL, 1625.0000),
(68, 32, 5, 5.0000, NULL, 1800.0000),
(69, 33, 5, 5.0000, NULL, 1760.0000),
(70, 34, 5, 5.0000, NULL, 1000.0000),
(71, 35, 5, 5.0000, NULL, 650.0000),
(72, 36, 5, 5.0000, NULL, 2900.0000),
(73, 37, 5, 5.0000, NULL, 2000.0000),
(74, 38, 5, 5.0000, NULL, 1900.0000),
(75, 39, 5, 11.0000, NULL, 1000.0000),
(76, 40, 5, 5.0000, NULL, 1100.0000),
(77, 41, 5, 5.0000, NULL, 850.0000),
(78, 42, 5, 5.0000, NULL, 750.0000),
(79, 43, 5, 5.0000, NULL, 520.0000),
(80, 44, 5, 5.0000, NULL, 450.0000),
(81, 45, 5, 5.0000, NULL, 500.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_wishlist`
--

CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_cart`
--
ALTER TABLE `sma_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_pages`
--
ALTER TABLE `sma_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_id_name` (`product_id`,`name`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_shop_settings`
--
ALTER TABLE `sma_shop_settings`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pages`
--
ALTER TABLE `sma_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
