-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 10:27 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `lms_admin`
--

CREATE TABLE `lms_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_admin`
--

INSERT INTO `lms_admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `lms_author`
--

CREATE TABLE `lms_author` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `author_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `author_created_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `author_updated_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_author`
--

INSERT INTO `lms_author` (`author_id`, `author_name`, `author_status`, `author_created_on`, `author_updated_on`) VALUES
(1, 'Alan Forbes', 'Enable', '2021-11-11 15:45:14', '2021-12-02 11:32:09'),
(2, 'Tom Butler', 'Enable', '2021-11-12 12:48:40', ''),
(3, 'Lynn Beighley', 'Enable', '2021-11-12 12:49:00', ''),
(4, 'Vikram Vaswani', 'Enable', '2021-11-12 12:49:18', ''),
(5, 'Daginn Reiersol', 'Enable', '2021-11-12 12:49:38', ''),
(6, 'Joel Murach', 'Enable', '2021-11-12 12:49:54', ''),
(7, 'Robin Nixon', 'Enable', '2021-11-12 12:50:09', ''),
(8, 'Kevin Tatroe', 'Enable', '2021-11-12 12:50:24', ''),
(9, 'Laura Thompson', 'Enable', '2021-11-12 12:50:42', ''),
(10, 'Brett Shimson', 'Enable', '2021-11-12 12:50:55', '2021-12-01 11:40:04'),
(11, 'Sanjib Sinha', 'Enable', '2021-11-12 12:51:16', ''),
(12, 'Brian Messenlehner', 'Enable', '2021-11-12 12:51:42', '2021-12-02 11:32:57'),
(13, 'Dayle Rees', 'Enable', '2021-11-12 12:52:02', ''),
(14, 'Carlos Buenosvinos', 'Enable', '2021-11-12 12:52:20', '2022-03-05 12:10:24'),
(15, 'Bruce Berke', 'Enable', '2021-11-12 12:52:35', '2021-12-02 11:33:10'),
(16, 'Laura Thomson', 'Enable', '2021-11-17 10:39:36', ''),
(18, 'David Herman', 'Enable', '2021-11-30 14:36:35', '2021-12-01 11:39:05'),
(19, 'Mark Myers', 'Enable', '2021-12-08 18:45:15', ''),
(20, 'Hamidullah Shiam', 'Enable', '2022-03-05 12:10:50', '2022-03-05 12:11:00'),
(21, 'fghdfghdfghhjh', 'Disable', '2022-05-30 22:43:37', '2022-05-30 22:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `lms_book`
--

CREATE TABLE `lms_book` (
  `book_id` int(11) NOT NULL,
  `book_category_id` int(11) NOT NULL DEFAULT 1,
  `book_author_id` int(11) NOT NULL,
  `book_location_rack_iid` int(11) NOT NULL DEFAULT 1,
  `book_name` text COLLATE utf8_unicode_ci NOT NULL,
  `book_isbn_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `book_no_of_copy` int(5) NOT NULL,
  `book_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `book_added_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `book_updated_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_book`
--

INSERT INTO `lms_book` (`book_id`, `book_category_id`, `book_author_id`, `book_location_rack_iid`, `book_name`, `book_isbn_number`, `book_no_of_copy`, `book_status`, `book_added_on`, `book_updated_on`) VALUES
(1, 1, 2, 1, 'The Joy of PHP Programming', '978152279214', 5, 'Enable', '2021-11-11 17:32:33', '2021-11-11 18:19:21'),
(2, 1, 2, 1, 'PHP and MySQL Novice to Ninja', '852369852123', 5, 'Enable', '2021-11-12 12:56:23', ''),
(3, 1, 2, 1, 'Head First PHP and MySQL', '7539518526963', 5, 'Enable', '2021-11-12 12:57:04', ''),
(5, 1, 2, 1, 'PHP In Action Objects Design Agility', '85225885258', 5, 'Enable', '2021-11-12 12:58:34', ''),
(6, 1, 2, 1, 'Murachs PHP and MySQL', '8585858596632', 5, 'Enable', '2021-11-12 13:00:15', ''),
(7, 1, 2, 1, 'Learning PHP MySQL JavaScript and CSS Creating Dynamic Websites', '753852963258', 5, 'Enable', '2021-11-12 13:01:10', '2021-11-12 13:02:16'),
(8, 1, 2, 1, 'Programming PHP Creating Dynamic Web Pages', '969335785842', 5, 'Enable', '2021-11-12 13:01:57', ''),
(9, 1, 2, 1, 'PHP Programming and MySQL Database for Web Development', '963369852258', 5, 'Enable', '2021-11-12 13:02:48', '2021-11-17 10:58:27'),
(10, 1, 2, 1, 'PHP MySQL The Missing Manual', '85478569856', 5, 'Enable', '2021-11-12 13:03:51', '2021-11-14 17:07:04'),
(11, 5, 1, 11, 'Beginning Laravel A beginners guide', '6786777777', 56, 'Enable', '2021-11-12 13:04:39', '2022-06-02 14:41:29'),
(12, 1, 2, 1, 'Building Web Apps with WordPress', '96325741258', 5, 'Enable', '2021-11-12 13:05:18', ''),
(14, 1, 2, 1, 'Domain Driven Design in PHP', '852258963475', 5, 'Enable', '2021-11-12 13:06:35', '2021-12-11 10:36:01'),
(15, 1, 2, 1, 'Learn PHP The Complete Beginners Guide to Learn PHP Programming', '744785963520', 5, 'Enable', '2021-11-12 13:07:27', '2021-12-09 18:37:14'),
(16, 1, 2, 1, 'PHP and MySQL Web Development', '753951852123', 1, 'Enable', '2021-11-17 10:43:19', '2021-11-17 11:03:05'),
(17, 1, 2, 1, 'A Smarter Way to Learn JavaScript', '852369753951', 1, 'Enable', '2021-12-08 18:48:11', '2021-12-11 10:35:02'),
(19, 1, 2, 1, 'The Complete Reference of C#', '78965412363985', 20, 'Enable', '2022-03-05 12:33:03', '2022-03-05 12:33:24'),
(20, 3, 1, 1, 'asdfsdaf', '34535324', 1000, 'Enable', '2022-05-30 22:35:06', '2022-06-02 14:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `lms_category`
--

CREATE TABLE `lms_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `category_created_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `category_updated_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_category`
--

INSERT INTO `lms_category` (`category_id`, `category_name`, `category_status`, `category_created_on`, `category_updated_on`) VALUES
(1, 'Programming', 'Enable', '2021-11-10 19:02:37', '2021-11-27 11:56:18'),
(2, 'Database', 'Enable', '2021-11-17 10:36:53', '2021-12-28 14:04:51'),
(3, 'Web Design', 'Enable', '2021-11-26 16:14:18', '2021-11-27 12:28:03'),
(4, 'Web Development', 'Enable', '2021-11-26 16:15:38', '2021-11-27 12:28:11'),
(5, 'Story ', 'Enable', '2021-12-28 14:05:04', '2021-12-28 14:06:19'),
(6, 'Networking', 'Enable', '2022-03-05 12:07:51', '2022-03-05 12:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `lms_issue_book`
--

CREATE TABLE `lms_issue_book` (
  `issue_book_id` int(11) NOT NULL,
  `book_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date_time` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `expected_return_date` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `return_date_time` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `book_fines` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `book_issue_status` enum('Issue','Return','Not Return') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_issue_book`
--

INSERT INTO `lms_issue_book` (`issue_book_id`, `book_id`, `user_id`, `issue_date_time`, `expected_return_date`, `return_date_time`, `book_fines`, `book_issue_status`) VALUES
(17, '744785963520', 'U52357788', '2022-04-30 03:45:51', '2022-05-09 03:45:51', '2022-06-02 16:14:18', '1200', 'Return'),
(18, '753852963258', 'U59564819', '2022-05-30 03:56:58', '2022-06-09 03:56:58', '2022-06-02 16:14:18', '', 'Return'),
(19, '753852963258', 'U59564819', '2022-05-30 03:57:56', '2022-06-09 03:57:56', '2022-06-02 16:14:18', '', 'Return'),
(21, '978152279214', 'U37570190', '2022-05-30 03:58:22', '2022-06-09 03:58:22', '2022-06-02 16:14:18', '', 'Return'),
(22, '978152279214', 'U37570190', '2022-05-30 04:00:13', '2022-06-09 04:00:13', '2022-06-02 16:14:18', '', 'Return'),
(23, '978152279214', 'U37570190', '2022-05-30 04:00:36', '2022-06-09 04:00:36', '2022-06-02 16:14:18', '', 'Return'),
(24, '978152279214', 'U37570190', '2022-05-30 04:03:17', '2022-06-09 04:03:17', '2022-06-02 16:14:18', '', 'Return'),
(25, '978152279214', 'U37570190', '2022-05-30 04:05:11', '2022-06-09 04:05:11', '2022-06-02 16:14:18', '', 'Return'),
(26, '978152279214', 'U37570190', '2022-05-30 04:06:06', '2022-06-09 04:06:06', '2022-06-02 16:14:18', '', 'Return'),
(27, '852369852123', 'U24567871', '2022-05-30 04:56:16', '2022-06-09 04:56:16', '2022-06-02 16:14:18', '', 'Return'),
(28, '852369852123', 'U24567871', '2022-05-30 04:56:44', '2022-06-09 04:56:44', '2022-06-02 16:14:18', '', 'Return'),
(32, '8585858596632', 'U41043999', '2022-06-02 11:36:14', '2022-06-12 11:36:14', '2022-06-02 16:14:18', '', 'Return'),
(33, '852369852123', 'U24567871', '2022-06-02 01:47:58', '2022-06-07 01:47:58', '', '', 'Issue'),
(34, '96325741258', 'U24567871', '2022-06-02 01:48:49', '2022-06-07 01:48:49', '2022-06-02 16:24:33', '', 'Return'),
(35, '852369852123', 'U52357788', '2022-06-02 01:52:09', '2022-06-07 01:52:09', '2022-06-02 16:24:00', '', 'Return'),
(36, '852369852123', 'U59564819', '2022-06-02 01:53:08', '2022-06-07 01:53:08', '2022-06-02 16:23:44', '', 'Return'),
(37, '978152279214', 'U37570190', '2022-06-02 02:03:27', '2022-06-07 02:03:27', '', '', 'Issue'),
(38, '978152279214', 'U37570190', '2022-06-02 02:03:36', '2022-06-07 02:03:36', '', '', 'Issue'),
(39, '978152279214', 'U37570190', '2022-06-02 02:06:29', '2022-06-07 02:06:29', '', '', 'Issue'),
(40, '978152279214', 'U37570190', '2022-06-02 02:07:02', '2022-06-07 02:07:02', '2022-06-02 16:44:08', '', 'Return'),
(41, '852369852123', 'U37570190', '2022-06-02 02:28:04', '2022-06-07 02:28:04', '', '', 'Issue'),
(42, '978152279214', 'U66858741', '2022-06-02 02:29:55', '2022-06-07 02:29:55', '', '', 'Issue'),
(43, '978152279214', 'U52357788', '2022-06-02 02:30:25', '2022-06-07 02:30:25', '2022-06-02 17:03:21', '', 'Return'),
(44, '978152279214', 'U66858741', '2022-06-02 02:33:46', '2022-06-07 02:33:46', '', '', 'Issue');

-- --------------------------------------------------------

--
-- Table structure for table `lms_location_rack`
--

CREATE TABLE `lms_location_rack` (
  `location_rack_id` int(11) NOT NULL,
  `location_rack_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `location_rack_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `location_rack_created_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location_rack_updated_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_location_rack`
--

INSERT INTO `lms_location_rack` (`location_rack_id`, `location_rack_name`, `location_rack_status`, `location_rack_created_on`, `location_rack_updated_on`) VALUES
(1, 'A1', 'Enable', '2021-11-11 16:16:27', '2021-12-07 10:02:00'),
(2, 'A2', 'Enable', '2021-11-12 12:53:49', '2022-03-05 12:22:44'),
(3, 'A3', 'Enable', '2021-11-12 12:53:57', ''),
(4, 'A40', 'Enable', '2021-11-12 12:54:06', '2022-05-30 22:43:23'),
(5, 'A5', 'Enable', '2021-11-12 12:54:14', '2022-05-30 22:43:12'),
(6, 'A6', 'Enable', '2021-11-12 12:54:22', ''),
(7, 'A7', 'Enable', '2021-11-12 12:54:30', ''),
(8, 'A8', 'Enable', '2021-11-12 12:54:38', '2022-03-05 12:23:20'),
(9, 'A9', 'Enable', '2021-11-12 12:54:52', ''),
(10, 'A10', 'Enable', '2021-11-12 12:55:02', '2021-12-04 13:03:28'),
(11, 'A11', 'Enable', '2021-12-03 18:20:16', '2021-12-04 12:45:09'),
(12, 'A56', 'Enable', '2022-03-05 12:23:02', '2022-03-05 12:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `lms_setting`
--

CREATE TABLE `lms_setting` (
  `setting_id` int(11) NOT NULL,
  `library_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `library_address` text COLLATE utf8_unicode_ci NOT NULL,
  `library_contact_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `library_email_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `library_total_book_issue_day` int(5) NOT NULL,
  `library_one_day_fine` decimal(4,2) NOT NULL,
  `library_issue_total_book_per_user` int(3) NOT NULL,
  `library_currency` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `library_timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_setting`
--

INSERT INTO `lms_setting` (`setting_id`, `library_name`, `library_address`, `library_contact_number`, `library_email_address`, `library_total_book_issue_day`, `library_one_day_fine`, `library_issue_total_book_per_user`, `library_currency`, `library_timezone`) VALUES
(1, 'AKSOS Library', 'Kote-Sange, Kabul, Afghanistan', '0777968227', 'aksos.kabul.afghanistan@gmail.com', 5, '50.00', 4, 'AFN', 'Asia/Kabul');

-- --------------------------------------------------------

--
-- Table structure for table `lms_user`
--

CREATE TABLE `lms_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` text COLLATE utf8_unicode_ci NOT NULL,
  `user_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_profile` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_verificaton_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_verification_status` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
  `user_unique_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `user_created_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_updated_on` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lms_user`
--

INSERT INTO `lms_user` (`user_id`, `user_name`, `user_address`, `user_contact_no`, `user_profile`, `user_email_address`, `user_password`, `user_verificaton_code`, `user_verification_status`, `user_unique_id`, `user_status`, `user_created_on`, `user_updated_on`) VALUES
(4, 'Aaron Lawler', '1616 Broadway Avenue Chattanooga, TN 37421', '8569856321', '1636905360-32007.jpg', 'aaronlawler@live.com', 'password', 'add84abb895484d12344316eccb78a62', 'Yes', 'U37570190', 'Enable', '2021-11-12 16:39:20', '2021-11-17 10:49:20'),
(5, 'Kathleen Forrest', '4545 Limer Street Greensboro, GA 30642', '85214796930', '1637041684-15131.jpg', 'kathleen@hotmail.com', 'password', '7013df5205011ffcb99ea57902c17369', 'Yes', 'U24567871', 'Enable', '2021-11-16 11:18:04', ''),
(6, 'Carol Maney', '2703 Deer Haven Drive Greenville, SC 29607', '8521479630', '1637126571-21753.jpg', 'web-tutorial1@programmer.net', 'password', 'a6c2623984d590239244f8695df3a30b', 'Yes', 'U52357788', 'Enable', '2021-11-17 10:52:51', ''),
(10, 'Kevin Peterson', '1889 Single Street Waltham, MA 02154', '8523698520', '1639658464-10192.jpg', 'web-tutorial@programmer.net', 'password123', '337ea20da40326d134fe5eca3fb03464', 'Yes', 'U59564819', 'Enable', '2021-12-14 12:56:29', '2021-12-20 15:21:45'),
(13, 'asadullah', 'qwerqw', '3245234', '1650711883-403525958.jpg', 'ajalali@auaf.edu.af', 'asadullah', '9c19ade6681e493729ba498e2d3d40a2', 'No', 'U41043999', 'Enable', '2022-04-23 15:34:43', ''),
(14, 'adadsf', 'sdfasdfsdf', '2345234', '1650711948-260113054.jpg', 'asadullah.jalali2013@gmail.com', 'asdas', '27991c8775795a188d1d5623c7b1b114', 'No', 'U66858741', 'Enable', '2022-04-23 15:35:48', ''),
(15, 'Gulab Khan', 'kabul, afghanistan', '0789563214', '1654175148-143902548.jpg', 'asad@gmail.com', 'password', 'c3410217ac3b4f03e1de98b4721bb2b3', 'No', 'U28357077', 'Enable', '2022-06-02 17:35:48', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lms_admin`
--
ALTER TABLE `lms_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `lms_author`
--
ALTER TABLE `lms_author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `lms_book`
--
ALTER TABLE `lms_book`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_isbn_number` (`book_isbn_number`),
  ADD KEY `category_relation` (`book_category_id`),
  ADD KEY `rack_relation` (`book_location_rack_iid`),
  ADD KEY `author_relation` (`book_author_id`);

--
-- Indexes for table `lms_category`
--
ALTER TABLE `lms_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `lms_issue_book`
--
ALTER TABLE `lms_issue_book`
  ADD PRIMARY KEY (`issue_book_id`),
  ADD KEY `book_relation` (`book_id`),
  ADD KEY `user_relation` (`user_id`);

--
-- Indexes for table `lms_location_rack`
--
ALTER TABLE `lms_location_rack`
  ADD PRIMARY KEY (`location_rack_id`);

--
-- Indexes for table `lms_setting`
--
ALTER TABLE `lms_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `lms_user`
--
ALTER TABLE `lms_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_unique_id` (`user_unique_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lms_admin`
--
ALTER TABLE `lms_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lms_author`
--
ALTER TABLE `lms_author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `lms_book`
--
ALTER TABLE `lms_book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lms_category`
--
ALTER TABLE `lms_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lms_issue_book`
--
ALTER TABLE `lms_issue_book`
  MODIFY `issue_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `lms_location_rack`
--
ALTER TABLE `lms_location_rack`
  MODIFY `location_rack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lms_setting`
--
ALTER TABLE `lms_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lms_user`
--
ALTER TABLE `lms_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lms_book`
--
ALTER TABLE `lms_book`
  ADD CONSTRAINT `author_relation` FOREIGN KEY (`book_author_id`) REFERENCES `lms_author` (`author_id`),
  ADD CONSTRAINT `category_relation` FOREIGN KEY (`book_category_id`) REFERENCES `lms_category` (`category_id`),
  ADD CONSTRAINT `rack_relation` FOREIGN KEY (`book_location_rack_iid`) REFERENCES `lms_location_rack` (`location_rack_id`);

--
-- Constraints for table `lms_issue_book`
--
ALTER TABLE `lms_issue_book`
  ADD CONSTRAINT `book_relation` FOREIGN KEY (`book_id`) REFERENCES `lms_book` (`book_isbn_number`),
  ADD CONSTRAINT `user_relation` FOREIGN KEY (`user_id`) REFERENCES `lms_user` (`user_unique_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
