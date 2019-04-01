-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 01, 2019 lúc 02:15 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chuyendeweb_v2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airports`
--

CREATE TABLE `airports` (
  `airport_id` int(11) NOT NULL,
  `airport_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `airport_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `airport_city_id` tinyint(4) NOT NULL,
  `airport_province_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`, `airport_code`, `airport_city_id`, `airport_province_id`) VALUES
(1, 'Sân Bay Nội Bài', 'VVNB/HAN', 2, 1),
(2, 'Sân Bay Tân Sơn Nhất', 'VVTS/SGN', 1, 2),
(3, 'Sân Bay Liên Khương', 'VVDL/DLI', 6, 4),
(4, 'Sân Bay Quốc Tế Đà Năng', 'VVDN/DAD', 5, 3),
(5, 'Sân bay Phù Cát – Bình Định', 'VVPC/UIH', 0, 6),
(6, 'Sân bay Tuy Hòa – Phú Yên', 'VVTH/TBB', 0, 5),
(7, 'Sân bay Quốc tế Cần Thơ', 'VVCT/VCA', 0, 7),
(8, 'Sân Bay Quốc Vĩnh', 'QC/TDC', 0, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airways`
--

CREATE TABLE `airways` (
  `airways_id` int(11) NOT NULL,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `airway_country_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airways`
--

INSERT INTO `airways` (`airways_id`, `airways_name`, `airway_country_id`) VALUES
(1, 'Vietjet air', 1),
(2, 'Vietnam Airlines', 1),
(3, 'JetStar', 1),
(4, 'Japan Airlines', 3),
(5, 'All Nippon Airways', 7),
(6, 'Cathay Pacific', 5),
(7, 'Lufthansa', 2),
(8, 'Hainan Airlines', 4),
(9, 'Thai Airways', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `country_id` int(4) NOT NULL,
  `country_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`) VALUES
(1, 'Việt Nam'),
(2, 'Đức'),
(3, 'Nhật Bản'),
(4, 'Trung Quốc'),
(5, 'Hồng Công'),
(6, 'Thái Lan'),
(7, 'Mỹ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `airways_id` int(11) NOT NULL,
  `flight_time_from` datetime NOT NULL,
  `flight_time_to` datetime NOT NULL,
  `flight_city_from_id` tinyint(4) NOT NULL,
  `flight_city_to_id` tinyint(4) NOT NULL,
  `flight_price` double NOT NULL,
  `flight_parent_id` tinyint(4) NOT NULL,
  `flight_seat` tinyint(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flights`
--

INSERT INTO `flights` (`flight_id`, `airways_id`, `flight_time_from`, `flight_time_to`, `flight_city_from_id`, `flight_city_to_id`, `flight_price`, `flight_parent_id`, `flight_seat`, `updated_at`, `created_at`) VALUES
(1, 2, '2019-05-14 00:00:00', '2019-05-15 00:00:00', 1, 3, 2100000, 0, 1, '2019-03-15 14:09:23', '2019-03-14 09:31:59'),
(2, 8, '2019-05-14 00:00:00', '2019-05-18 00:00:00', 1, 4, 6300000, 0, NULL, '2019-03-14 13:30:56', '2019-03-14 13:30:56'),
(3, 8, '2019-05-14 00:00:00', '2019-05-18 00:00:00', 1, 4, 6300000, 2, NULL, '2019-03-14 13:31:05', '2019-03-14 13:31:05'),
(4, 2, '2019-05-14 00:00:00', '2019-05-15 00:00:00', 1, 2, 525000, 0, 8, '2019-03-15 14:04:55', '2019-03-14 13:48:47'),
(5, 3, '2019-05-15 00:00:00', '2019-05-15 00:00:00', 2, 1, 1050000, 0, NULL, '2019-03-14 13:49:34', '2019-03-14 13:49:34'),
(6, 3, '2019-05-14 00:00:00', '2019-05-14 00:00:00', 1, 2, 2100000, 0, NULL, '2019-03-14 16:30:22', '2019-03-14 16:30:22'),
(7, 1, '2019-05-14 00:00:00', '2019-05-14 00:00:00', 1, 2, 2100000, 0, NULL, '2019-03-14 16:31:14', '2019-03-14 16:31:14'),
(8, 1, '2019-05-14 00:00:00', '2019-05-14 00:00:00', 1, 2, 1050000, 0, NULL, '2019-03-14 16:32:44', '2019-03-14 16:32:44'),
(9, 2, '2019-05-20 18:30:00', '2019-05-20 22:00:00', 1, 2, 2100000, 0, NULL, '2019-03-20 20:44:13', '2019-03-20 20:44:13'),
(10, 3, '2019-03-28 07:51:00', '2019-03-30 07:51:00', 1, 3, 3000000, 1, NULL, '2019-03-28 07:51:18', '2019-03-28 07:51:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights_booking`
--

CREATE TABLE `flights_booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `fb_flight_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `fb_total_person` tinyint(4) NOT NULL,
  `Payment_Method` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(3) DEFAULT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccv_code` int(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flights_booking`
--

INSERT INTO `flights_booking` (`booking_id`, `user_id`, `fb_flight_id`, `total_price`, `fb_total_person`, `Payment_Method`, `card_number`, `card_name`, `ccv_code`, `updated_at`, `created_at`) VALUES
(8, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL),
(9, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL),
(10, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL),
(11, 6, 1, 100000, 2, '213', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_cities`
--

CREATE TABLE `list_cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_country_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_cities`
--

INSERT INTO `list_cities` (`city_id`, `city_name`, `city_code`, `city_country_id`) VALUES
(1, 'TP. Hồ Chí Minh', 'SNG', 1),
(2, 'Hà Nội', 'HAN', 1),
(3, 'Singapore', 'SIN', 0),
(4, 'PuSan', 'PUS', 0),
(5, 'Đà Nẵng', 'DAD', 1),
(6, 'Đà Lạt', 'DAL', 1),
(7, ' New York', 'NY', 7),
(8, 'Los Angeles', 'LA', 7),
(9, 'Tokyo', 'TKO', 3),
(10, 'OSaKa', 'OSA', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(11) NOT NULL,
  `passenger_title` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_first_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_last_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_user_id` tinyint(4) NOT NULL,
  `passenger_fl_id` tinyint(4) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `passenger_title`, `passenger_first_name`, `passenger_last_name`, `passenger_user_id`, `passenger_fl_id`, `updated_at`, `created_at`) VALUES
(10, 'mr', 'Châu', 'Kiệt', 9, 5, NULL, NULL),
(11, 'mr', 'Châu', 'Kiệt', 9, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `provinces`
--

CREATE TABLE `provinces` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `provinces`
--

INSERT INTO `provinces` (`province_id`, `province_name`) VALUES
(1, 'Hà Nội'),
(2, 'Thành phố Hồ Chí Minh'),
(3, 'Đà Nẵng'),
(4, 'Lâm Đồng'),
(5, 'Phú Yên'),
(6, 'Bình Định'),
(7, 'Cần Thơ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transit`
--

CREATE TABLE `transit` (
  `transit_id` int(11) NOT NULL,
  `transit_city_id` tinyint(4) NOT NULL,
  `transit_time` datetime NOT NULL,
  `flight_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_gender` int(2) DEFAULT NULL,
  `user_bird` date DEFAULT NULL,
  `user_adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int(2) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_phone`, `user_gender`, `user_bird`, `user_adress`, `attempt`, `last_access`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
(10, 'Nguyệt Trần', 'trannguyet123@gmail.com', NULL, '$2y$10$V3K0kuRmWULE5H6/StstXe24eM.fPHDbzsTfbaDF4Id1xHuq6L07e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-28 00:25:43', '2019-03-28 00:25:43', 0),
(11, 'Châu Kiệt', 'chaukiet98@gmail.com', NULL, '$2y$10$GaNnMhZfysR4NhU1PwIdqOXL4T9bXjK6jVA5tOwx3bmB6LlSJ45aO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-28 00:44:30', '2019-03-28 00:44:30', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airport_id`);

--
-- Chỉ mục cho bảng `airways`
--
ALTER TABLE `airways`
  ADD PRIMARY KEY (`airways_id`),
  ADD UNIQUE KEY `airways_id` (`airways_id`),
  ADD KEY `airways_id_2` (`airways_id`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Chỉ mục cho bảng `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD UNIQUE KEY `flight_id` (`flight_id`),
  ADD KEY `flight_id_2` (`flight_id`),
  ADD KEY `airways_id` (`airways_id`),
  ADD KEY `flight_city_to_id` (`flight_city_to_id`),
  ADD KEY `flight_city_from_id` (`flight_city_from_id`);

--
-- Chỉ mục cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Chỉ mục cho bảng `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Chỉ mục cho bảng `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Chỉ mục cho bảng `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`province_id`);

--
-- Chỉ mục cho bảng `transit`
--
ALTER TABLE `transit`
  ADD PRIMARY KEY (`transit_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `airports`
--
ALTER TABLE `airports`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `airways`
--
ALTER TABLE `airways`
  MODIFY `airways_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `provinces`
--
ALTER TABLE `provinces`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `transit`
--
ALTER TABLE `transit`
  MODIFY `transit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`airways_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
