-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 26, 2025 at 08:39 AM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u975447690_shashi`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_role_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `activity` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`_id`, `created_at`, `user_id`, `user_role_id`, `vendor_id`, `activity`) VALUES
(1, '2025-05-08 12:51:36', 1, 1, NULL, '{\"message\":\"Site configuration settings stored \\/ updated.\",\"data\":\"[]\"}'),
(2, '2025-05-08 13:25:33', 1, 1, NULL, '{\"message\":\"Site configuration settings stored \\/ updated.\",\"data\":\"[]\"}'),
(3, '2025-05-08 13:27:40', NULL, NULL, NULL, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(4, '2025-05-08 13:27:40', 2, 2, 1, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(5, '2025-05-08 13:38:14', 2, 2, 1, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(6, '2025-05-08 13:38:17', NULL, NULL, NULL, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(7, '2025-05-08 13:38:18', 2, 2, 1, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(8, '2025-05-08 13:38:18', 2, 2, 1, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(9, '2025-05-08 13:38:19', 2, 2, 1, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}'),
(10, '2025-05-09 07:52:28', 1, 1, NULL, '{\"message\":\"Site configuration settings stored \\/ updated.\",\"data\":\"[]\"}'),
(11, '2025-05-09 07:52:40', 1, 1, NULL, '{\"message\":\"Site configuration settings stored \\/ updated.\",\"data\":\"[]\"}'),
(12, '2025-05-09 07:53:12', 1, 1, NULL, '{\"message\":\"Site configuration settings stored \\/ updated.\",\"data\":\"[]\"}'),
(13, '2025-05-09 08:09:06', 2, 2, 1, '{\"message\":\"vendor settings updated\",\"data\":\"[]\"}');

-- --------------------------------------------------------

--
-- Table structure for table `bot_flows`
--

CREATE TABLE `bot_flows` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(150) NOT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `start_trigger` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bot_flows`
--

INSERT INTO `bot_flows` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `title`, `vendors__id`, `__data`, `start_trigger`) VALUES
(1, '19d790ad-d041-4890-aae2-b393b6ed7dc9', 1, '2025-05-09 08:06:15', '2025-05-09 08:03:38', 'WA Automation - CNM Academy 9/May/2025', 1, '[]', 'hi, hello, i want to buy, buy, know more');

-- --------------------------------------------------------

--
-- Table structure for table `bot_replies`
--

CREATE TABLE `bot_replies` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `reply_text` text NOT NULL,
  `trigger_type` varchar(45) DEFAULT NULL COMMENT 'contains,is',
  `reply_trigger` varchar(255) DEFAULT NULL,
  `priority_index` tinyint(3) UNSIGNED DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `bot_flows__id` int(10) UNSIGNED DEFAULT NULL,
  `bot_replies__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `whatsapp_templates__id` int(10) UNSIGNED DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `users__id` int(10) UNSIGNED DEFAULT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `template_language` varchar(45) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_groups`
--

CREATE TABLE `campaign_groups` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `campaigns__id` int(10) UNSIGNED NOT NULL,
  `contact_groups__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL,
  `data_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`_id`, `created_at`, `updated_at`, `name`, `value`, `data_type`) VALUES
(1, '2025-05-06 04:17:22', '2025-05-06 04:17:22', 'cron_setup_done_at', '2025-05-06 04:15:49', 1),
(2, '2025-05-06 04:17:54', '2025-05-06 04:17:54', 'broadcast_connection_driver', 'pusher', 1),
(3, '2025-05-06 04:17:54', '2025-05-06 04:17:54', 'pusher_app_id', 'eyJpdiI6IjV3bERxRkJNK01pRUxSWGFWb05acFE9PSIsInZhbHVlIjoiSDBZd0p6cStVQ0tOTE1HaVRqZk1wUT09IiwibWFjIjoiZGYzOWY3NzQwMzk1OWZjNzBjZGFmNjU3MTZjNDc0ZjUyMWJjN2I4ZWQyYmZjNDMzODY5NGE5NGIxZDNhYmY0NyIsInRhZyI6IiJ9', 1),
(4, '2025-05-06 04:17:54', '2025-05-06 04:17:54', 'pusher_app_key', 'eyJpdiI6Ikk3aHhOMnc1MmxPZURnNVEyTDFqb0E9PSIsInZhbHVlIjoienVsNU5lT0svMHhRTDh1NWw1Q2RMWjBjT252akhrT3B6WmpYODdzbkY2ST0iLCJtYWMiOiI1ZjkxNDIyODRiMjI1NzRmNmRhOWEzMjhlNTlkNTVjOTFiNDA0Mzk1ZGJmNTE1YTFlN2QxZWQwMTNkYmJkMGU1IiwidGFnIjoiIn0=', 1),
(5, '2025-05-06 04:17:54', '2025-05-06 04:17:54', 'pusher_app_secret', 'eyJpdiI6IjUyb3ZOWXZlWXFXUWdBWGJFaXlXMXc9PSIsInZhbHVlIjoiWG96NXhXbVNXKytKU2wzUTlYQStyTm1VQmZoWU5iWjhocWZiOWlkZ2RGdz0iLCJtYWMiOiI5MGY3NDA5ZTVjYTEzMGRmNGFhNzBmZGI1MjMwOGM1YThmZTlkMzc3NjY1YmIxOWFlNzI0MWQyZjgyMTZmYTNlIiwidGFnIjoiIn0=', 1),
(6, '2025-05-06 04:17:54', '2025-05-06 04:17:54', 'pusher_app_cluster', 'eyJpdiI6IlYvYlNWcWI3OHRGaG0vY3pEbmYrdmc9PSIsInZhbHVlIjoiUHUrQ0RSYkw0VFVaOFY1N21xbFN3dz09IiwibWFjIjoiYjI4ZDZkZmVkYzFlMGI1ZDRhODlkNjA4MGEwMTc2OTkyYTZiMGRmNDhlMzU0ZDQ3ZWQwMTc0OTY2MmMwZmQwNCIsInRhZyI6IiJ9', 1),
(7, '2025-05-06 04:20:15', '2025-05-06 04:20:15', 'logo_name', '68198dff2ed2e---bbbe4403-b808-47d5-acff-1b04eef0459f.png', 1),
(8, '2025-05-06 04:20:22', '2025-05-06 04:20:22', 'small_logo_name', '68198e068282d---bbbe4403-b808-47d5-acff-1b04eef0459f.png', 1),
(9, '2025-05-06 04:20:29', '2025-05-06 04:20:29', 'favicon_name', '68198e0d4c66b---bbbe4403-b808-47d5-acff-1b04eef0459f.png', 1),
(10, '2025-05-06 04:20:36', '2025-05-06 04:20:36', 'dark_theme_logo_name', '68198e1472012---bbbe4403-b808-47d5-acff-1b04eef0459f.png', 1),
(11, '2025-05-06 04:20:41', '2025-05-06 04:20:41', 'dark_theme_small_logo_name', '68198e19ea1f9---bbbe4403-b808-47d5-acff-1b04eef0459f.png', 1),
(12, '2025-05-06 04:20:47', '2025-05-06 04:20:47', 'dark_theme_favicon_name', '68198e1fb4231---bbbe4403-b808-47d5-acff-1b04eef0459f.png', 1),
(13, '2025-05-06 04:20:47', '2025-05-06 04:20:47', 'name', 'CNM Academy', 1),
(14, '2025-05-06 04:20:47', '2025-05-06 04:20:47', 'description', '', 1),
(15, '2025-05-06 04:20:47', '2025-05-06 04:20:47', 'contact_email', 'kangrahulchul@gmail.com', 1),
(16, '2025-05-06 04:20:47', '2025-05-06 04:20:47', 'default_language', 'en', 1),
(17, '2025-05-06 04:20:47', '2025-05-06 04:20:47', 'timezone', 'Asia/Kolkata', 1),
(18, '2025-05-06 04:23:09', '2025-05-06 04:23:09', 'contact_details', 'Address: VPO Bhaleta, Tehsil Nurpur District Kangra - 176201 (Himachal Pradesh)\r\nCall: 918219059432', 1),
(19, '2025-05-06 04:23:38', '2025-05-06 04:23:38', 'currency', 'INR', 1),
(20, '2025-05-06 04:23:38', '2025-05-06 04:23:38', 'currency_symbol', '&#8377;', 1),
(21, '2025-05-06 04:23:38', '2025-05-06 04:23:38', 'currency_value', 'INR', 1),
(22, '2025-05-06 12:50:22', '2025-05-06 12:50:22', 'subscription_plans', '{\"paid\":{\"plan_3\":{\"id\":\"plan_3\",\"enabled\":\"on\",\"popular\":false,\"title\":\"Diamond\",\"trial_days\":0,\"features\":{\"contacts\":{\"description\":\"Contacts\",\"limit\":\"-1\"},\"campaigns\":{\"limit_duration\":\"monthly\",\"limit_duration_title\":\"Per Month\",\"description\":\"Campaigns\",\"limit\":\"-1\"},\"bot_replies\":{\"description\":\"Bot Replies\",\"limit\":\"-1\"},\"bot_flows\":{\"description\":\"Bot Flows\",\"limit\":\"-1\"},\"contact_custom_fields\":{\"description\":\"Contact Custom Fields\",\"limit\":\"-1\"},\"system_users\":{\"description\":\"Team Members\\/Agents\",\"limit\":\"-1\"},\"ai_chat_bot\":{\"type\":\"switch\",\"description\":\"AI Chat Bot\",\"limit\":\"1\"},\"api_access\":{\"type\":\"switch\",\"description\":\"API and Webhook Access\",\"limit\":\"1\"}},\"charges\":{\"monthly\":{\"title\":\"monthly\",\"enabled\":\"on\",\"price_id\":null,\"charge\":997},\"yearly\":{\"title\":\"yearly\",\"enabled\":\"on\",\"price_id\":null,\"charge\":9997}}},\"plan_1\":{\"id\":\"plan_1\",\"enabled\":\"on\",\"popular\":true,\"title\":\"Gold\",\"trial_days\":0,\"features\":{\"contacts\":{\"description\":\"Contacts\",\"limit\":\"10000\"},\"campaigns\":{\"limit_duration\":\"monthly\",\"limit_duration_title\":\"Per Month\",\"description\":\"Campaigns\",\"limit\":\"3\"},\"bot_replies\":{\"description\":\"Bot Replies\",\"limit\":\"5\"},\"bot_flows\":{\"description\":\"Bot Flows\",\"limit\":\"2\"},\"contact_custom_fields\":{\"description\":\"Contact Custom Fields\",\"limit\":\"5\"},\"system_users\":{\"description\":\"Team Members\\/Agents\",\"limit\":\"2\"},\"ai_chat_bot\":{\"type\":\"switch\",\"description\":\"AI Chat Bot\",\"limit\":\"1\"},\"api_access\":{\"type\":\"switch\",\"description\":\"API and Webhook Access\",\"limit\":\"1\"}},\"charges\":{\"monthly\":{\"title\":\"monthly\",\"enabled\":\"on\",\"price_id\":null,\"charge\":497},\"yearly\":{\"title\":\"yearly\",\"enabled\":\"on\",\"price_id\":null,\"charge\":3997}}},\"plan_2\":{\"id\":\"plan_2\",\"enabled\":0,\"popular\":false,\"title\":\"@997\",\"trial_days\":0,\"features\":{\"contacts\":{\"description\":\"Contacts\",\"limit\":\"5000\"},\"campaigns\":{\"limit_duration\":\"monthly\",\"limit_duration_title\":\"Per Month\",\"description\":\"Campaigns\",\"limit\":\"-1\"},\"bot_replies\":{\"description\":\"Bot Replies\",\"limit\":\"-1\"},\"bot_flows\":{\"description\":\"Bot Flows\",\"limit\":\"-1\"},\"contact_custom_fields\":{\"description\":\"Contact Custom Fields\",\"limit\":\"-1\"},\"system_users\":{\"description\":\"Team Members\\/Agents\",\"limit\":\"-1\"},\"ai_chat_bot\":{\"type\":\"switch\",\"description\":\"AI Chat Bot\",\"limit\":\"1\"},\"api_access\":{\"type\":\"switch\",\"description\":\"API and Webhook Access\",\"limit\":\"1\"}},\"charges\":{\"monthly\":{\"title\":\"monthly\",\"enabled\":\"on\",\"price_id\":null,\"charge\":997},\"yearly\":{\"title\":\"yearly\",\"enabled\":\"on\",\"price_id\":null,\"charge\":2197}}}},\"free\":{\"id\":\"free\",\"enabled\":\"on\",\"title\":\"Free\",\"trial_days\":0,\"features\":{\"contacts\":{\"description\":\"Contacts\",\"limit\":\"100\"},\"campaigns\":{\"limit_duration\":\"monthly\",\"limit_duration_title\":\"Per Month\",\"description\":\"Campaigns\",\"limit\":\"1\"},\"bot_replies\":{\"description\":\"Bot Replies\",\"limit\":\"5\"},\"bot_flows\":{\"description\":\"Bot Flows\",\"limit\":\"1\"},\"contact_custom_fields\":{\"description\":\"Contact Custom Fields\",\"limit\":\"2\"},\"system_users\":{\"description\":\"Team Members\\/Agents\",\"limit\":\"1\"},\"ai_chat_bot\":{\"type\":\"switch\",\"description\":\"AI Chat Bot\",\"limit\":\"1\"},\"api_access\":{\"type\":\"switch\",\"description\":\"API and Webhook Access\",\"limit\":\"1\"}}}}', 4),
(23, '2025-05-07 04:08:52', '2025-05-07 04:08:52', 'enable_razorpay', '1', 2),
(24, '2025-05-07 04:08:52', '2025-05-07 04:08:52', 'razorpay_testing_publishable_key', '', 1),
(25, '2025-05-07 04:08:52', '2025-05-07 04:08:52', 'razorpay_testing_secret_key', '', 1),
(37, '2025-05-08 12:51:36', '2025-05-08 12:51:36', 'enable_embedded_signup', '0', 2),
(38, '2025-05-08 12:51:36', '2025-05-08 12:51:36', 'embedded_signup_app_id', 'eyJpdiI6Ik1BaGxhZXc0bkJqZnJuZGlKaXh6VEE9PSIsInZhbHVlIjoiUXJ6S0U2SVFpLzJSYTMzb2RxQWNBNWJvUE1WYWdOeE9WVThBM2s2UG84ND0iLCJtYWMiOiI0ZGRkMDllYWMwODA5ZTdkNjg1YzU4ODliYjNiYjNhMDQ1ODhmNWZiNmZhZTM5MDNmNmU4ZjU2NzE4MmY4ZjZjIiwidGFnIjoiIn0=', 1),
(39, '2025-05-08 12:51:36', '2025-05-08 12:51:36', 'embedded_signup_app_secret', 'eyJpdiI6ImNHaVNKSUZHTC9XN2E0aU1mVTZDNlE9PSIsInZhbHVlIjoiQnNDcWNnOHQ1c2xGKzNKMStCOGd2S1dKY3dyN1F6QVY1SS9QNWhHZEY1b0V5WTJ1MitWelBCY3IydEhaM2JkZSIsIm1hYyI6IjdhZTg2OGE2NWZjNDY1NWRjNWFmZjRiYzM3MmJiNDQ0Yjc0ODFiN2NhYTMzNjljNmU3NTIwZjAyMWE1YTUzNTciLCJ0YWciOiIifQ==', 1),
(40, '2025-05-09 07:52:28', '2025-05-09 07:52:28', 'current_home_page_view', 'outer-home-2', 1),
(41, '2025-05-09 07:52:28', '2025-05-09 07:52:28', 'other_home_page_url', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `countries__id` smallint(5) UNSIGNED DEFAULT NULL,
  `whatsapp_opt_out` tinyint(3) UNSIGNED DEFAULT NULL,
  `phone_verified_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `wa_id` varchar(45) DEFAULT NULL COMMENT 'Its phone number with country code without + or 0 prefix',
  `language_code` varchar(45) DEFAULT NULL,
  `disable_ai_bot` tinyint(3) UNSIGNED DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `assigned_users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `first_name`, `last_name`, `countries__id`, `whatsapp_opt_out`, `phone_verified_at`, `email`, `email_verified_at`, `vendors__id`, `wa_id`, `language_code`, `disable_ai_bot`, `__data`, `assigned_users__id`) VALUES
(1, '98b60a0c-56ad-4edd-b113-02301d65ecac', NULL, '2025-05-08 13:57:50', '2025-05-08 13:57:50', 'Rajnish', NULL, 99, NULL, NULL, NULL, NULL, 1, '8219059432', NULL, 1, NULL, NULL),
(2, '0a25deef-a8a5-4517-ae74-b8b5645904cf', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nurul hoda', '', 99, NULL, NULL, '', NULL, 1, '8603362688', '', 1, NULL, NULL),
(3, '8745f372-6779-4e74-857e-e5351cd7130c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Monro Prajapati', '', 99, NULL, NULL, '', NULL, 1, '8169511697', '', 1, NULL, NULL),
(4, '68a59c34-8d3f-4a2c-bc3c-8954a3961e38', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Anurag', '', 99, NULL, NULL, '', NULL, 1, '8092184264', '', 1, NULL, NULL),
(5, '7593da50-b64f-4e20-b34b-e26e1e238378', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pravin Kamthe', '', 99, NULL, NULL, '', NULL, 1, '9466541806', '', 1, NULL, NULL),
(6, '0df5bf39-b4f0-436c-aa83-d9c7c8c22ee2', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ranu sahu', '', 99, NULL, NULL, '', NULL, 1, '9301731674', '', 1, NULL, NULL),
(7, '32096333-3621-4809-9311-d8df75bcebe0', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Shamsherali baig', '', 99, NULL, NULL, '', NULL, 1, '9550449143', '', 1, NULL, NULL),
(8, '9cfbfdab-9110-4367-830d-b28a15e0f631', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sahil Khatwa', '', 99, NULL, NULL, '', NULL, 1, '6377801044', '', 1, NULL, NULL),
(9, '4e9549e8-6f4f-4c11-9c98-3af8083def23', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'mohd ayyan', '', 99, NULL, NULL, '', NULL, 1, '9849344919', '', 1, NULL, NULL),
(10, '2bbc3eb7-7e82-4773-a951-88b1b28d5a4d', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Shantanu Trivedi', '', 99, NULL, NULL, '', NULL, 1, '9968794858', '', 1, NULL, NULL),
(11, 'cbaf71b7-1e71-49e9-9486-0b1cdf79f2f2', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Akshaykumar Rokade', '', 99, NULL, NULL, '', NULL, 1, '8975331881', '', 1, NULL, NULL),
(12, '0fd30a3b-7795-4167-8960-e77062eb754a', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Amit kumar panda', '', 99, NULL, NULL, '', NULL, 1, '8249489866', '', 1, NULL, NULL),
(13, 'f2654b63-c806-42fb-b33c-7f37ee43ca4b', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'RAHUL AMIN SHEIKH', '', 99, NULL, NULL, '', NULL, 1, '8256094824', '', 1, NULL, NULL),
(14, '3a0f685c-c403-44e2-8871-b8a849d2831e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Kapil Kumar', '', 99, NULL, NULL, '', NULL, 1, '9811843736', '', 1, NULL, NULL),
(15, '917083be-9cda-492d-ab1e-66d812a2d244', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Karm Mehta', '', 99, NULL, NULL, '', NULL, 1, '9909738884', '', 1, NULL, NULL),
(16, 'a496639a-8428-4b5c-b1b6-92e9418369a8', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Himanshu gupta', '', 99, NULL, NULL, '', NULL, 1, '8233453901', '', 1, NULL, NULL),
(17, 'fbe14a39-b235-4ea7-983c-ca8b2223e95e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Veeravalli Naga Manohar', '', 99, NULL, NULL, '', NULL, 1, '7032406186', '', 1, NULL, NULL),
(18, 'fee5a4df-7a53-478c-89c2-55af51bc410a', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Chirag Dhawan', '', 99, NULL, NULL, '', NULL, 1, '8901084969', '', 1, NULL, NULL),
(19, 'ed4e696d-6bb5-4c43-a912-ecbba4b0eaf7', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Suchit Pradhan', '', 99, NULL, NULL, '', NULL, 1, '8197679197', '', 1, NULL, NULL),
(20, '22071e4a-37f5-4e82-af12-f590fa8f0cf4', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Abhishek Tambe', '', 99, NULL, NULL, '', NULL, 1, '9022125747', '', 1, NULL, NULL),
(21, '61608fec-745e-405c-bd41-174db7cc8e0f', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ankesh Jain', '', 99, NULL, NULL, '', NULL, 1, '9229213564', '', 1, NULL, NULL),
(22, '2f0efea2-7842-4109-aa88-82b0687f666f', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vinod kumar', '', 99, NULL, NULL, '', NULL, 1, '8588886004', '', 1, NULL, NULL),
(23, '6fd0140a-c392-4b01-bb2a-5ec1f15e1f56', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Riyaz shaikh', '', 99, NULL, NULL, '', NULL, 1, '9021536752', '', 1, NULL, NULL),
(24, '188c7ef4-4b2b-4d8c-8afa-3a2f04953bc6', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Wasim Akhtar', '', 99, NULL, NULL, '', NULL, 1, '8757017018', '', 1, NULL, NULL),
(25, 'b7a9f9b3-96fb-4729-920a-c8609f6fe7db', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Abhijeet Srivastava', '', 99, NULL, NULL, '', NULL, 1, '9625816145', '', 1, NULL, NULL),
(26, '4d93dfc4-d70a-41c3-ae38-da8a1cb5f916', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Amt Oraon', '', 99, NULL, NULL, '', NULL, 1, '7479409627', '', 1, NULL, NULL),
(27, '3f6287d0-bf5d-47b3-9d3d-25096195899c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Amit phadke', '', 99, NULL, NULL, '', NULL, 1, '9960864422', '', 1, NULL, NULL),
(28, '760d9492-1e0a-4367-8ee4-a6b5b42f8aab', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Gautam', '', 99, NULL, NULL, '', NULL, 1, '9478307852', '', 1, NULL, NULL),
(29, '2dc7d6fc-84e3-4ec1-b59f-298a415a422b', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'ritesh negi', '', 99, NULL, NULL, '', NULL, 1, '9520103306', '', 1, NULL, NULL),
(30, '4e85ad78-8f3d-4d8b-bfd2-804813445d27', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sunil Sharma', '', 99, NULL, NULL, '', NULL, 1, '8850039121', '', 1, NULL, NULL),
(31, '4928f6e1-9659-4c4e-b7ff-cce500426963', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Jatin Madaan', '', 99, NULL, NULL, '', NULL, 1, '8387868880', '', 1, NULL, NULL),
(32, 'df6c0a9a-ba6c-4774-91d2-906c8a64097e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Yusuf Sufyan', '', 99, NULL, NULL, '', NULL, 1, '9999556303', '', 1, NULL, NULL),
(33, '14038aff-a52c-49c2-8a27-403716b44197', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Manjit Roy', '', 99, NULL, NULL, '', NULL, 1, '9089554359', '', 1, NULL, NULL),
(34, '1d81e008-6547-4bdc-bbb3-08815174f0d5', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vikash Soni', '', 99, NULL, NULL, '', NULL, 1, '8896772074', '', 1, NULL, NULL),
(35, '2185a787-d236-4c62-adb8-4b7af34ceff0', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Bantul', '', 99, NULL, NULL, '', NULL, 1, '8900027669', '', 1, NULL, NULL),
(36, '7e28dc09-6547-40b6-a4a7-5ae3097cec44', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Bhavani Shankar Samsani', '', 99, NULL, NULL, '', NULL, 1, '7676694303', '', 1, NULL, NULL),
(37, '0ec53c45-39f6-4872-940d-69ab49b6b266', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pokar mukesh', '', 99, NULL, NULL, '', NULL, 1, '9173299261', '', 1, NULL, NULL),
(38, '4d0a565a-c3d9-402f-897b-be9d5962ec1e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pothu Vinod Kumar', '', 99, NULL, NULL, '', NULL, 1, '8686993558', '', 1, NULL, NULL),
(39, '23335ded-626f-42c7-9513-fdbf1aec7918', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Navneet Tanna', '', 99, NULL, NULL, '', NULL, 1, '9898311933', '', 1, NULL, NULL),
(40, '31f75728-cb7b-4ba9-a7dd-7a6870f14d24', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Rahul Raj', '', 99, NULL, NULL, '', NULL, 1, '8777496918', '', 1, NULL, NULL),
(41, '8a0793d2-b40e-41db-a784-57b199919856', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Manaranjan Barman', '', 99, NULL, NULL, '', NULL, 1, '8444017158', '', 1, NULL, NULL),
(42, '1896b9c9-156a-485a-a4a2-c8d006a69c38', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Karaman Bhagad', '', 99, NULL, NULL, '', NULL, 1, '7698986520', '', 1, NULL, NULL),
(43, 'f67aaa07-041f-4ea2-905f-062440b03eac', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vipin', '', 99, NULL, NULL, '', NULL, 1, '9891206263', '', 1, NULL, NULL),
(44, '408a50ac-b3b0-4af7-97d5-59a2eda96213', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sheneej pk', '', 99, NULL, NULL, '', NULL, 1, '7012628817', '', 1, NULL, NULL),
(45, 'e5562e86-3c2e-4c28-bbe2-3a0347c90643', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sourabh Mehra', '', 99, NULL, NULL, '', NULL, 1, '7976293284', '', 1, NULL, NULL),
(46, '2a3bde68-8fc7-4da6-b0dd-4b891f5c14c6', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Shamsher Singh', '', 99, NULL, NULL, '', NULL, 1, '9815382559', '', 1, NULL, NULL),
(47, '3ffc19d9-accd-4695-b845-51be912a4aa0', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'srinivas B', '', 99, NULL, NULL, '', NULL, 1, '85558502226', '', 1, NULL, NULL),
(48, '2ea77d7e-962d-4dfa-ae9d-d3d7d93dbe8a', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Surendra saran', '', 99, NULL, NULL, '', NULL, 1, '9929669697', '', 1, NULL, NULL),
(49, 'd538aa5b-0b89-4aa1-9f3c-76eaa388d4be', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Neeraj Phogat', '', 99, NULL, NULL, '', NULL, 1, '9053490574', '', 1, NULL, NULL),
(50, '463e323f-a910-41be-a62c-6eb302c7e76f', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Gopal Krushna Nayak', '', 99, NULL, NULL, '', NULL, 1, '7200717977', '', 1, NULL, NULL),
(51, '974772a6-e935-4553-b0eb-c323b293a8f3', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nilesh Wankhede', '', 99, NULL, NULL, '', NULL, 1, '9595354649', '', 1, NULL, NULL),
(52, 'cf77fde4-a0ea-4e14-93aa-b52d44c92ed7', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'John Gonsalves', '', 99, NULL, NULL, '', NULL, 1, '9833642863', '', 1, NULL, NULL),
(53, '837b5227-69a2-48a0-a959-ebf2698619ba', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ankit', '', 99, NULL, NULL, '', NULL, 1, '8449104128', '', 1, NULL, NULL),
(54, 'e2079e80-f1b7-40a3-8f01-73bd854490e5', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'PRAMOD VAIDYA', '', 99, NULL, NULL, '', NULL, 1, '9689843944', '', 1, NULL, NULL),
(55, 'c427699e-2587-4702-be8f-4c2e92349d5e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Mahesh Soppari', '', 99, NULL, NULL, '', NULL, 1, '8501012671', '', 1, NULL, NULL),
(56, 'e913cb62-eee8-47c6-9c29-1b130a32bb7e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vikrant Lokhande', '', 99, NULL, NULL, '', NULL, 1, '9902316300', '', 1, NULL, NULL),
(57, '99c242a2-6923-4b23-a4c6-b55082167e7c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ram Soni', '', 99, NULL, NULL, '', NULL, 1, '9545674638', '', 1, NULL, NULL),
(58, 'b2e79a9c-2756-4696-a235-1899d5a49b21', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Aditya Agrawal', '', 99, NULL, NULL, '', NULL, 1, '8979912776', '', 1, NULL, NULL),
(59, 'fd1f7bb3-6975-4d15-b6fa-aa2f887d7278', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sunil chaudhari', '', 99, NULL, NULL, '', NULL, 1, '9373436152', '', 1, NULL, NULL),
(60, 'd7c7e4fe-e3bb-4f47-bb1e-01359d241eaa', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'SHIRISH MISHRA', '', 99, NULL, NULL, '', NULL, 1, '9889100200', '', 1, NULL, NULL),
(61, '479c2eb9-4497-4761-ab74-4039c999e460', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'jaccknorway@gmail.com', '', 99, NULL, NULL, '', NULL, 1, '9557337151', '', 1, NULL, NULL),
(62, '33adeec3-1e7a-44d7-a10c-a01358d05cb7', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Jatin Arora', '', 99, NULL, NULL, '', NULL, 1, '7339850477', '', 1, NULL, NULL),
(63, '49a710d2-078b-4f09-81c5-67da8566cede', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Manishaa Pandya', '', 99, NULL, NULL, '', NULL, 1, '9328337598', '', 1, NULL, NULL),
(64, 'fa401185-c07a-4df9-8df7-17f1221f3f40', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Srinivas Pottabathini', '', 99, NULL, NULL, '', NULL, 1, '9885052435', '', 1, NULL, NULL),
(65, '2a750362-a856-47fa-b1f2-757c4c67bfb3', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Debojit Ghosh', '', 99, NULL, NULL, '', NULL, 1, '7059577617', '', 1, NULL, NULL),
(66, '8912b3f0-1a53-426f-9ba4-842929f69958', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sujeet kumar singh', '', 99, NULL, NULL, '', NULL, 1, '7007280951', '', 1, NULL, NULL),
(67, '3f382773-fd9a-4e24-b4dd-10868220a791', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Virendra', '', 99, NULL, NULL, '', NULL, 1, '9161136263', '', 1, NULL, NULL),
(68, '25193e42-9d2e-4581-9f3c-3bed0b30b32d', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Gaurav Rattan', '', 99, NULL, NULL, '', NULL, 1, '9911760060', '', 1, NULL, NULL),
(69, '662d7345-3bf2-45e2-b538-041cccb770f3', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vaibhav Chavan', '', 99, NULL, NULL, '', NULL, 1, '7248952518', '', 1, NULL, NULL),
(70, '29ecd7c9-c3c6-4cc5-bc84-78165063fdec', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'vinay  kumar', '', 99, NULL, NULL, '', NULL, 1, '9855360380', '', 1, NULL, NULL),
(71, '06de0ec8-9fd9-4b1b-81e3-e8b4d341ffd7', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vivek Sharma', '', 99, NULL, NULL, '', NULL, 1, '8962363334', '', 1, NULL, NULL),
(72, '9a664be3-afb0-452f-bdad-113ecce0b064', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'SUNANDA RAY', '', 99, NULL, NULL, '', NULL, 1, '8759560473', '', 1, NULL, NULL),
(73, 'c5b429c5-ed14-4ce4-82bf-fccd80a9ea96', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Hitesh Khatri', '', 99, NULL, NULL, '', NULL, 1, '9911444601', '', 1, NULL, NULL),
(74, '6d205dae-24e5-4296-81ed-381886a05982', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Jaydeep Parmar', '', 99, NULL, NULL, '', NULL, 1, '9726333377', '', 1, NULL, NULL),
(75, '595fdd6e-2768-47d3-af9c-410919c5ce71', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Yomesh vaghela', '', 99, NULL, NULL, '', NULL, 1, '7778917309', '', 1, NULL, NULL),
(76, 'fed2dbad-6fa6-4757-8292-6e286533f517', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Avinash Pandey', '', 99, NULL, NULL, '', NULL, 1, '9327382503', '', 1, NULL, NULL),
(77, '8a1b7f90-c580-4dd9-91b4-42a1bb4a107e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'SANYOG MAURYA', '', 99, NULL, NULL, '', NULL, 1, '6394650092', '', 1, NULL, NULL),
(78, 'cbe7ff5f-86e4-41e8-864a-1da7c92b7203', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sagar kerhalkar', '', 99, NULL, NULL, '', NULL, 1, '8105977226', '', 1, NULL, NULL),
(79, 'ecf68cba-c492-4b4b-a7b7-e7cc5bca1e77', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Anuroop Raju', '', 99, NULL, NULL, '', NULL, 1, '8309184949', '', 1, NULL, NULL),
(80, '94251101-75d6-4b7f-a5c8-dba138a9777c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sachiin prriyadarshi', '', 99, NULL, NULL, '', NULL, 1, '9117555530', '', 1, NULL, NULL),
(81, '4c9079a6-9358-408d-891a-b33a1e23dd11', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Surya Kant Tripathy', '', 99, NULL, NULL, '', NULL, 1, '9010634643', '', 1, NULL, NULL),
(82, '7e46764d-075f-41dc-a47a-ba968bfbef13', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vishnu Sharma', '', 99, NULL, NULL, '', NULL, 1, '-8952873459', '', 1, NULL, NULL),
(83, 'f86e1311-a620-4ff3-8bf9-79ff9be0c9e2', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Abhishek Upadhyay', '', 99, NULL, NULL, '', NULL, 1, '9977778889', '', 1, NULL, NULL),
(84, '05e9cfba-716d-42e9-badb-5f3aae93131e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Rahul B', '', 99, NULL, NULL, '', NULL, 1, '8586818818', '', 1, NULL, NULL),
(85, '048b289f-8b28-4bf4-88ac-4cd4e6ea7385', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pothi Raja', '', 99, NULL, NULL, '', NULL, 1, '6374798731', '', 1, NULL, NULL),
(86, 'a9013a6c-c18d-4555-a96b-8170ff2dc42c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Dhruv Yadav', '', 99, NULL, NULL, '', NULL, 1, '9870221330', '', 1, NULL, NULL),
(87, 'a3fa7a36-54be-4dec-a824-4ecb10d434bf', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vicky Roshan', '', 99, NULL, NULL, '', NULL, 1, '9801424115', '', 1, NULL, NULL),
(88, '7bde2183-e3b2-4899-a962-cd90bb042207', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Himanshu', '', 99, NULL, NULL, '', NULL, 1, '8920895088', '', 1, NULL, NULL),
(89, '0b46eb25-f840-4696-83b1-6acd0fdcbc26', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Rahul Kumar Maheshwari', '', 99, NULL, NULL, '', NULL, 1, '9968916023', '', 1, NULL, NULL),
(90, 'f1765716-8784-4ce9-ae19-93752d9b7b1d', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sanjeev Dixit', '', 99, NULL, NULL, '', NULL, 1, '9870278340', '', 1, NULL, NULL),
(91, 'e7393b78-59f5-473c-9cc3-35bc27fbfee7', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'ahammed anas', '', 99, NULL, NULL, '', NULL, 1, '7022072263', '', 1, NULL, NULL),
(92, '459ce3ff-9778-4583-8de0-c3596d911806', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Hardik Patel', '', 99, NULL, NULL, '', NULL, 1, '8866406531', '', 1, NULL, NULL),
(93, '2924e804-cc02-40a6-8bc2-e40a2b0a4b7c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nizam', '', 99, NULL, NULL, '', NULL, 1, '9959299044', '', 1, NULL, NULL),
(94, '31777f08-21b4-42de-b437-3b278a7838a4', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vivek Kumar', '', 99, NULL, NULL, '', NULL, 1, '8700914394', '', 1, NULL, NULL),
(95, '3f841927-4842-4ba9-967e-0abedface5cb', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Deepanshu singh', '', 99, NULL, NULL, '', NULL, 1, '6394282882', '', 1, NULL, NULL),
(96, '1c568204-fca4-4ebc-8810-17785caf041f', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Abhishek Kumar Verma', '', 99, NULL, NULL, '', NULL, 1, '7004275225', '', 1, NULL, NULL),
(97, '4f9fc1a1-8b97-4ad1-a756-1926585aac0a', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Deepak', '', 99, NULL, NULL, '', NULL, 1, '7827998200', '', 1, NULL, NULL),
(98, '0d5a8ecd-2eea-4c96-a75a-2edfb35886a7', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Chandan gupta', '', 99, NULL, NULL, '', NULL, 1, '9711842128', '', 1, NULL, NULL),
(99, '97e77759-edc5-452d-9701-b69fa9d01f50', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Antim Pandey', '', 99, NULL, NULL, '', NULL, 1, '8668054351', '', 1, NULL, NULL),
(100, '75fd75fd-db99-4c16-b529-a12a794de89a', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Bhushan Badgujar', '', 99, NULL, NULL, '', NULL, 1, '9067477680', '', 1, NULL, NULL),
(101, '7bc2b490-ebde-4335-af41-9ba17fce611a', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'shoeb Ahmed Ansari', '', 99, NULL, NULL, '', NULL, 1, '9373057775', '', 1, NULL, NULL),
(102, '5e4fbe61-bf67-4e81-b046-7b92e37da7e0', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Rahul Murmu', '', 99, NULL, NULL, '', NULL, 1, '6294160315', '', 1, NULL, NULL),
(103, '992426a4-88c6-4e06-83ca-d8899de75261', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Roshan Kirtilal Jain', '', 99, NULL, NULL, '', NULL, 1, '7020535751', '', 1, NULL, NULL),
(104, 'f2ae4d1c-6475-4e29-96e0-87d15b4a20fa', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Mandeep singh', '', 99, NULL, NULL, '', NULL, 1, '9999988036', '', 1, NULL, NULL),
(105, 'b3db8f0c-8dae-4010-8ac2-9df531d1b90c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'M kounain', '', 99, NULL, NULL, '', NULL, 1, '8867466552', '', 1, NULL, NULL),
(106, '7011328a-6ebf-4ba1-b017-83b8684a6473', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ayush Mane', '', 99, NULL, NULL, '', NULL, 1, '9399992711', '', 1, NULL, NULL),
(107, '47488098-b0b6-46f8-88a7-03f0d31ad0de', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sanjay Maurya', '', 99, NULL, NULL, '', NULL, 1, '8288909086', '', 1, NULL, NULL),
(108, '8625ee04-6ec8-46e0-bb48-77b1aa80236b', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ashu kumar', '', 99, NULL, NULL, '', NULL, 1, '6202762124', '', 1, NULL, NULL),
(109, '02fe7459-36c9-4d04-9a32-7405ddf0dee2', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Balan Sunderraj', '', 99, NULL, NULL, '', NULL, 1, '9004685128', '', 1, NULL, NULL),
(110, 'e5b238c6-3add-4dd5-a9ad-d05ee03ddfc0', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Badal Rajgor', '', 99, NULL, NULL, '', NULL, 1, '9173604042', '', 1, NULL, NULL),
(111, '72f2f56b-f89e-4883-bd61-bc15e44ca339', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Bibhu Prasad', '', 99, NULL, NULL, '', NULL, 1, '7848839920', '', 1, NULL, NULL),
(112, '23e951fd-084d-466d-8a7d-738904d11683', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Prateek Rajpoot', '', 99, NULL, NULL, '', NULL, 1, '9479505260', '', 1, NULL, NULL),
(113, '2cee2104-6a65-40a5-877b-781db79fdf86', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Chanchal Mohan', '', 99, NULL, NULL, '', NULL, 1, '9955496358', '', 1, NULL, NULL),
(114, '34f95288-b84a-45ee-a003-b430fca83897', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Umar Ali', '', 99, NULL, NULL, '', NULL, 1, '7006937775', '', 1, NULL, NULL),
(115, '4acb6091-b98a-43af-b1af-d75bb4823f74', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Anshuman Mohanty', '', 99, NULL, NULL, '', NULL, 1, '8249591984', '', 1, NULL, NULL),
(116, '22f1435b-6788-4125-a9b3-e6bd49fe0c58', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Udit Khalpada', '', 99, NULL, NULL, '', NULL, 1, '9328249965', '', 1, NULL, NULL),
(117, 'b9239a18-e58f-4a11-9d39-b0339889baba', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'JayeshPanchal', '', 99, NULL, NULL, '', NULL, 1, '9904063040', '', 1, NULL, NULL),
(118, 'e491c5ad-8f40-4e8d-a9ac-a3d053dd20ef', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Arun', '', 99, NULL, NULL, '', NULL, 1, '8950999816', '', 1, NULL, NULL),
(119, '8d76faf7-ffff-4aba-aa48-dc1535143ff8', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Harshit Jain', '', 99, NULL, NULL, '', NULL, 1, '9549595958', '', 1, NULL, NULL),
(120, '5e3e8b83-07b8-4853-bde2-156439e76973', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Shiva Baghel', '', 99, NULL, NULL, '', NULL, 1, '7587245495', '', 1, NULL, NULL),
(121, '8cca5a2d-91c4-4952-9c96-19d00d7e03bf', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vishal Patil', '', 99, NULL, NULL, '', NULL, 1, '9922233988', '', 1, NULL, NULL),
(122, 'efe4f07f-bd38-4099-a655-424176c7492c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Arnab Dad', '', 99, NULL, NULL, '', NULL, 1, '9088767676', '', 1, NULL, NULL),
(123, 'd435973d-d0ec-47b4-b1fd-d64ad18e7003', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Surendra Singh', '', 99, NULL, NULL, '', NULL, 1, '7697010046', '', 1, NULL, NULL),
(124, '67e47b27-7749-4439-95da-cd1f2c224e59', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Kazi sajjat hossain', '', 99, NULL, NULL, '', NULL, 1, '7074454825', '', 1, NULL, NULL),
(125, '07e0d093-3d5d-4909-924d-c38f695145a2', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'mayur sanjay wankhede', '', 99, NULL, NULL, '', NULL, 1, '7588615584', '', 1, NULL, NULL),
(126, 'aefdb0ab-062c-4c85-b2eb-e4bb067b6ea5', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Vibha Dwivedi', '', 99, NULL, NULL, '', NULL, 1, '6390887741', '', 1, NULL, NULL),
(127, '1c85e472-a599-4bc2-b96b-7a4153f89e1d', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nethaji P', '', 99, NULL, NULL, '', NULL, 1, '9148574081', '', 1, NULL, NULL),
(128, 'd7c4f3f7-c59a-4910-960d-4cf01384cab9', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nimiesh Atul Chavan', '', 99, NULL, NULL, '', NULL, 1, '8286500192', '', 1, NULL, NULL),
(129, '953a6ac2-25e0-4a03-988e-6f1964c39919', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pritom Roy', '', 99, NULL, NULL, '', NULL, 1, '7044540029', '', 1, NULL, NULL),
(130, '540ae50c-cb03-4add-9974-f5e2b9366133', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Krrish', '', 99, NULL, NULL, '', NULL, 1, '9034407338', '', 1, NULL, NULL),
(131, '110de917-d8ed-4006-8a66-6deacb2ba6af', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Shreyansh jain', '', 99, NULL, NULL, '', NULL, 1, '8971472994', '', 1, NULL, NULL),
(132, 'f4eca9ae-308a-471a-a75d-359005e4d049', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Bhishma', '', 99, NULL, NULL, '', NULL, 1, '9827121326', '', 1, NULL, NULL),
(133, '1747f3d3-0984-4df2-b484-58b53189ec9e', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'AKHIL KOSHTI', '', 99, NULL, NULL, '', NULL, 1, '7043119341', '', 1, NULL, NULL),
(134, 'bbe6e30e-9573-4fa2-954f-a58f58d014ba', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Maniesh Gupta', '', 99, NULL, NULL, '', NULL, 1, '7263955153', '', 1, NULL, NULL),
(135, '57c85d32-8389-4a18-bb4a-b861ae28ee28', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pathan Jamsheed Khan', '', 99, NULL, NULL, '', NULL, 1, '9804717717', '', 1, NULL, NULL),
(136, '4359c42f-086e-47bc-b0b5-394db6824e4c', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Harshit Kumawat', '', 99, NULL, NULL, '', NULL, 1, '8085171838', '', 1, NULL, NULL),
(137, '31a3ac7e-8e66-4475-946d-4845a2729e06', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Saurav Katariya', '', 99, NULL, NULL, '', NULL, 1, '8238277156', '', 1, NULL, NULL),
(138, '595599cb-38cd-4789-af15-e2f6324e68ec', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Niyas Ahamed', '', 99, NULL, NULL, '', NULL, 1, '7708384624', '', 1, NULL, NULL),
(139, '6aacdc01-8335-482d-aca1-dc8ba63b5c02', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Arpit', '', 99, NULL, NULL, '', NULL, 1, '9900970035', '', 1, NULL, NULL),
(140, 'a8414f16-b622-4b0d-8479-1e0f73285655', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'GURBAJ SINGH', '', 99, NULL, NULL, '', NULL, 1, '8295006469', '', 1, NULL, NULL),
(141, '462eb0ce-d1e7-4e6a-9e54-a668004decb6', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Anuj Tomar', '', 99, NULL, NULL, '', NULL, 1, '9012355500', '', 1, NULL, NULL),
(142, '71643275-082a-45e2-9152-911a3f0848d8', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Arjun', '', 99, NULL, NULL, '', NULL, 1, '9597555749', '', 1, NULL, NULL),
(143, 'd45eb758-3520-40f2-8550-06a9374872e5', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nikhil More', '', 99, NULL, NULL, '', NULL, 1, '7720037715', '', 1, NULL, NULL),
(144, '588985b9-e272-46d4-ad2c-8fd16061ec32', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'ROHIT KUMAR', '', 99, NULL, NULL, '', NULL, 1, '7209851265', '', 1, NULL, NULL),
(145, 'bc12fdfc-8f73-4430-ae49-2bce8ddc76c2', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Ravikiran vishnuji nitnaware', '', 99, NULL, NULL, '', NULL, 1, '8600438825', '', 1, NULL, NULL),
(146, 'be4fa634-6b9c-410d-a659-da4c27cf6e13', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Pradeep Kumar Singha', '', 99, NULL, NULL, '', NULL, 1, '8402877631', '', 1, NULL, NULL),
(147, 'c1c4ca16-f0a5-41ba-b1a7-4d0555118be6', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Nitesh Agrawal', '', 99, NULL, NULL, '', NULL, 1, '8779730176', '', 1, NULL, NULL),
(148, '0bf09ae4-45c2-427d-9487-9a8b917fb1e6', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Devidutt Gahwai', '', 99, NULL, NULL, '', NULL, 1, '9174572000', '', 1, NULL, NULL),
(149, '58d96cf4-493b-411e-b6fc-46710d0b037f', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Sammik Mitra', '', 99, NULL, NULL, '', NULL, 1, '9324533841', '', 1, NULL, NULL),
(150, '7bd7db8a-98d1-4dbf-ba3a-337e03e83426', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Shadab Syed', '', 99, NULL, NULL, '', NULL, 1, '9284446352', '', 1, NULL, NULL),
(151, '27737b1a-303e-40d6-9043-86551606c89b', NULL, '2025-05-08 14:01:29', '2025-05-08 14:01:29', 'Mr. Dharmeshkumar Gulabbhai Patel', '', 99, NULL, NULL, '', NULL, 1, '9033804318', '', 1, NULL, NULL),
(152, 'aaa8119f-5935-437c-a9be-c728a9545d8e', NULL, '2025-05-09 08:07:54', '2025-05-09 08:07:54', 'Lakhjeet', NULL, 99, NULL, NULL, NULL, NULL, 1, '7973223724', NULL, 1, NULL, NULL),
(153, '778dc090-d7ef-4baa-b2a7-11f952ee5839', NULL, '2025-05-09 12:45:53', '2025-05-09 12:45:53', 'Rj Test', NULL, 99, NULL, NULL, NULL, NULL, 1, '8628974630', NULL, 1, NULL, NULL),
(154, '99a69389-1df1-416e-87bf-1d720b40d729', NULL, '2025-05-23 09:46:10', '2025-05-23 09:46:10', 'Omkar', 'Gawade', 99, 1, NULL, 'omkar.g.work@gmail.com', NULL, 4, '9137664133', NULL, 1, NULL, NULL),
(155, '1a6bc4c2-4337-4add-b6cb-8b8b8ab2695b', NULL, '2025-05-23 09:47:18', '2025-05-23 09:47:18', 'NItesh', 'Agrawal', 99, NULL, NULL, 'nitehstud0205@gmail.com', NULL, 4, '9220274729', 'english', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_custom_fields`
--

CREATE TABLE `contact_custom_fields` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `input_name` varchar(255) NOT NULL,
  `input_type` varchar(15) DEFAULT NULL COMMENT 'Text,number,email etc',
  `vendors__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_custom_field_values`
--

CREATE TABLE `contact_custom_field_values` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `contacts__id` int(10) UNSIGNED NOT NULL,
  `contact_custom_fields__id` int(10) UNSIGNED NOT NULL,
  `field_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_groups`
--

CREATE TABLE `contact_groups` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_groups`
--

INSERT INTO `contact_groups` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `title`, `description`, `vendors__id`) VALUES
(1, '77aa9445-d2e8-4ce3-bb29-fb4831c9c6cb', 1, '2025-05-08 13:55:39', '2025-05-08 13:55:39', 'DFY Paid 2025', 'DFY Paid 163 members', 1),
(2, '5f90341f-28eb-4b05-bcf8-231736bf68a8', 1, '2025-05-09 12:45:21', '2025-05-09 12:45:21', 'Test', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_labels`
--

CREATE TABLE `contact_labels` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `labels__id` int(10) UNSIGNED NOT NULL,
  `contacts__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `_id` smallint(5) UNSIGNED NOT NULL,
  `iso_code` char(2) DEFAULT NULL,
  `name_capitalized` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `iso3_code` char(3) DEFAULT NULL,
  `iso_num_code` smallint(6) DEFAULT NULL,
  `phone_code` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`_id`, `iso_code`, `name_capitalized`, `name`, `iso3_code`, `iso_num_code`, `phone_code`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 243),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_contacts`
--

CREATE TABLE `group_contacts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `contact_groups__id` int(10) UNSIGNED NOT NULL,
  `contacts__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_contacts`
--

INSERT INTO `group_contacts` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `contact_groups__id`, `contacts__id`) VALUES
(1, '30a03c3e-e4c9-4253-9d90-708ea0df2695', NULL, '2025-05-08 13:57:50', '2025-05-08 13:57:50', 1, 1),
(2, '4889aeb3-13ed-4737-8874-d4e1f0cdf2c1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 2),
(3, 'dc9c13f0-1b19-4507-827b-2a93e7deee0f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 3),
(4, '3b2196ce-bf98-49a9-b897-8b7bb008332b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 4),
(5, '574db96b-a6d7-4927-bde4-b40a55ffe177', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 5),
(6, 'b1395a1c-94aa-4c63-af48-497f527f56a5', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 6),
(7, '9984ef6a-b3ac-452f-9f9a-d64fce5bfe64', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 7),
(8, 'a8dbaf08-8aec-43c7-b9bf-cd2b86e075a6', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 8),
(9, '8932016d-fecd-4a0c-9575-589da8069f0d', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 4),
(10, '994d33fe-1ef2-4a36-aeda-570eb2ffbe29', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 9),
(11, '96a10296-f275-4cc8-b2a3-f8323ab05f5f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 10),
(12, '12d7af22-b91a-495d-a728-8613646805ef', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 11),
(13, 'dba0cf1f-cc26-431d-a3b3-0d794a4fe6ab', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 12),
(14, 'c2c027d6-2970-401a-8671-2b243cd9d88d', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 13),
(15, '7fa96e0f-9183-4707-8fea-2567fbee235e', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 14),
(16, '0730d2f8-5d07-4f1f-acae-4b476408cac4', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 15),
(17, '867a1683-0215-4a49-bde6-8283569befe7', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 16),
(18, '52da1a28-aadf-4a80-9f73-a4daa63500f1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 17),
(19, '06ac0268-98c7-4937-bd29-19428469e58a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 18),
(20, '5274cbc1-83ad-4686-be3f-36fe57ccbc79', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 19),
(21, '901ff1e1-adf3-4cf2-befd-c326b80ed46b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 20),
(22, '47076b56-eb29-444d-9e94-c59246af908c', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 21),
(23, 'aed7d78d-47b8-44e5-b043-d64c1de45739', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 22),
(24, '15740c30-7de3-4d9a-b1bb-40779b5e046f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 23),
(25, '9e49fe22-ce72-4030-87c0-c8d569f83c5e', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 24),
(26, '971ae360-10e5-49a5-9aef-e107c8760081', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 25),
(27, '0c546851-c7a8-4370-8321-5fb2bd7e07e1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 26),
(28, '97b738fc-1def-4948-ba69-7b407a63c31c', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 27),
(29, 'd608360e-b7b8-4141-a38b-d9831a253373', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 28),
(30, '944d5707-fa19-48de-a202-e5958db05121', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 29),
(31, 'edfd0ff8-fed2-43da-899a-cc5f3f1a0a97', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 30),
(32, 'c0a7c8e9-6294-42c3-84d5-b967d079ef61', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 30),
(33, 'f8d54555-72fd-48f4-935b-f1b444df9584', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 31),
(34, 'ca6cb750-fc0a-470c-ba53-b7f547b887f4', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 32),
(35, '3d263ced-e0a3-4f32-991a-d86e81d7ef36', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 33),
(36, 'fd7ee765-7e6f-4e4b-a91a-219cd37bd672', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 34),
(37, 'e59502e8-615f-4a63-a8cf-1b6a92ea5503', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 35),
(38, '0e5aff14-a81a-400c-b5cd-4d4846f90455', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 36),
(39, '1d72e92d-e8ea-4267-8833-3dceb6002412', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 37),
(40, 'c9d16fec-0b55-4ddf-b8d8-976fd0083b6f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 38),
(41, '45da982e-0bad-48bf-ad53-ef4784ee45e1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 39),
(42, '3606897f-f87a-40fe-b5ae-50a8a6717306', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 40),
(43, 'b788d22b-d3bc-46e6-bdc2-d504cf679523', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 41),
(44, '76aa55f1-4803-4415-a8b6-92d2201654d7', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 42),
(45, '9a190c12-812b-4f01-86d4-b7bf2a1e32eb', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 43),
(46, '2e710e86-a6b2-434e-b934-6150f1bdf16f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 44),
(47, 'bdf437ad-8d8e-43ee-9914-b3412fe97079', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 45),
(48, '0b1e6103-48c8-43cd-ba97-3ca30ad370ac', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 46),
(49, '837ceb3b-6ea0-4c70-aa40-6decdc6a3a45', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 37),
(50, '7867011f-ba28-4185-96f0-24dfe76aa084', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 47),
(51, 'c3da2300-45ba-49c8-9672-0dd87c2a44b9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 48),
(52, '591f8cda-1e3c-4659-b36c-835667ee277b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 48),
(53, 'bbddb876-03db-4b0a-b837-750d2014b86f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 41),
(54, '760d7208-e0ff-4a6f-81ac-ad7d8f198036', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 49),
(55, '0b7dd9ef-cb03-4698-bf36-0fd5916ba2e9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 50),
(56, 'eaab447e-ed6b-4b16-80f2-c007218a5631', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 51),
(57, '6741a57e-cf94-4de4-a0ed-437b88284704', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 52),
(58, '6513b8a9-f99d-49d8-ac09-04960bb978db', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 53),
(59, '38e96e70-0218-4351-b325-666d1353fba9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 54),
(60, 'f9f3e1ef-a73b-4473-aebf-fc948674c725', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 55),
(61, '2505ea07-0818-4e53-9aa3-8ee57182b1f3', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 56),
(62, '2fe91ea9-ffb3-406b-aee4-a3b4581eb23a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 57),
(63, 'd2cdd285-338b-468a-ab01-768dfb02749d', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 52),
(64, 'e784c47a-183e-471d-8164-f3cc1a23b54c', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 58),
(65, '74766ac5-5c08-458d-9cef-030afbecc8c1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 59),
(66, '1d765eaf-083d-4461-82ed-5a13852ac9b6', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 60),
(67, 'ad477b45-fe74-43cf-89cd-6a91844c64dd', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 61),
(68, 'e5621a62-d221-4bb8-b041-a95bd99aaf9a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 60),
(69, '30be7a86-a53b-4a59-a3b3-731d0117d0e8', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 62),
(70, '0e4903c6-2fac-4ec5-8d25-ef06295e3171', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 63),
(71, '192a0f20-1b9d-4edd-ba37-fb2f83126a59', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 64),
(72, 'c9bb652b-bdd0-49b6-b7c5-0c54488fdd81', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 65),
(73, 'c2b5bd56-14e7-4a75-ba38-a200ee3d95ab', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 66),
(74, '73f2b051-5643-4f9f-8984-dbfc504ef570', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 67),
(75, '6bb6ba29-2991-4e21-9c9a-c6efd42fbe12', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 68),
(76, '00bdcf38-dbe2-4064-872c-b36c76927b11', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 69),
(77, 'fdf8bb8b-d986-41d4-ae4d-0811a1a32d6f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 70),
(78, '1d128f82-bc41-4e00-87ab-a554b5d8a76b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 71),
(79, '70b29898-2617-406c-898c-6793665d0225', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 72),
(80, 'a95d001b-5474-4c8b-bf4b-3a8fdf1d938d', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 73),
(81, '34c42769-0ee5-4ea4-b836-9069f3188a00', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 74),
(82, '3ef3aa59-a2a3-45fe-84f8-fd7694f519e4', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 75),
(83, '4dfd5860-ce3f-42b8-bc6b-3feec791d47a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 76),
(84, '4637b4ce-7299-4438-bc99-6c0abab4d9bd', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 77),
(85, '013a72f5-e11f-402c-a11a-2f9a5b588769', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 78),
(86, '3e9c7aaf-cb86-4432-afe2-14bbaa9b3efa', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 74),
(87, '22985994-7b6b-4544-9e8c-1bffb4dab979', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 79),
(88, 'b41c4b19-cc5e-4e5e-983c-942eb96ead7a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 80),
(89, 'a7ca6a89-e23d-49ac-94cd-b3a84d82a97e', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 81),
(90, '9e59f7b8-b551-4f56-b1d6-5c897dd83dfb', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 82),
(91, '54824cb8-fec6-436f-ae04-c05a9af3316e', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 83),
(92, 'd2990d38-0f1e-49ab-8ada-447fa9fb4332', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 84),
(93, 'e6010458-8137-4af4-9b13-174c306c0425', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 85),
(94, '390062ae-5b21-4422-a3b3-036e20964c29', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 86),
(95, '27974363-6948-49c6-922b-15e3bbe8d370', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 87),
(96, 'af89ab29-f331-4fe5-b507-5d2620b1ffe3', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 88),
(97, '417ce571-6645-4d3c-819c-f74e35cac53d', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 89),
(98, '40bb0b22-cdd4-4b9f-a878-0e69f8f051aa', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 90),
(99, '14f33b43-0ce2-426a-b4d2-8ad1a141dc14', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 84),
(100, '57e611f2-4bbd-4104-b03f-294419fc1eff', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 91),
(101, '7b88e510-98cb-4e48-891f-7059fbb79306', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 92),
(102, '09fb1b97-6f26-4b02-a85a-7bbe3cee7022', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 93),
(103, '5470d312-9237-4547-9fa5-fc541bf89a57', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 94),
(104, '7f413cc3-8913-4ccc-b188-c99ac0183577', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 95),
(105, 'e2de0a59-7778-4a57-8d46-d840652ae4c4', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 96),
(106, 'b663bfc0-7e3c-480d-bab1-f32967770bb6', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 97),
(107, 'ccd41cb3-6dc9-40fb-b05b-c361b7690743', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 98),
(108, '0f570431-9372-43e2-b4a5-46caa1942ce2', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 94),
(109, '4ef3a3a2-ac17-43cf-877a-90419f114a20', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 99),
(110, '405e081c-935b-409a-961e-e6d8354be6f1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 100),
(111, 'a7231f6f-9ae6-4619-a091-a4ea4532bb6c', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 101),
(112, 'b2b4d250-39a5-4653-8a78-53a1942f32e0', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 102),
(113, '0c63459e-eefe-4010-95ff-b5b2160dff07', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 103),
(114, '22975c38-02ad-44b7-8da2-e0687966b4f9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 104),
(115, '35bd1ad3-1d12-4c71-bbcc-9559c2913149', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 105),
(116, '88dc66e6-c547-4aba-8554-f627bee1e036', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 106),
(117, '5ef34307-9180-42ea-ab18-ebb10b2f25f9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 107),
(118, '215439c5-610f-404b-83cc-81a1b14e8af6', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 108),
(119, 'b0046b66-adfe-4e97-99ac-d46c90cbb6b0', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 109),
(120, '5383e06a-b44a-4082-81ca-6fe308756a9b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 110),
(121, 'cf3a5fab-34ec-454e-a25f-3edca5312be9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 111),
(122, '7700fd15-cb3c-4ff8-8a45-605aac42194b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 112),
(123, '048fe3ba-f23d-43b6-9a33-d8244b7f25f9', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 113),
(124, 'b709f893-e330-424e-a40a-e052287aaa11', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 114),
(125, 'fd23eaa2-d029-432a-a39d-9c15f3ab9a84', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 115),
(126, '74da92b3-0bcf-4de3-b0c9-e2f4433046a5', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 116),
(127, '42a1dd20-f065-48b0-bcc1-d831cbae5db5', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 117),
(128, 'c12d7f9a-afb6-4e4d-93a0-797a8456e283', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 118),
(129, '24cbc63c-d4c8-487d-a5ba-bcfba67f73bc', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 119),
(130, '6abac8c9-029b-4605-ad8a-460e8f7d5205', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 120),
(131, '248b12ff-60f3-4d6d-b400-86aa83045332', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 121),
(132, 'c896b0c9-f7c3-4653-bf0f-99c44e7afc29', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 122),
(133, '8e76cf70-9319-4bd8-94be-6abac081ad54', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 123),
(134, '4d1b9a4b-8b20-46de-8d8f-7733fdd9554a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 124),
(135, '4ddf1515-2c1b-48d7-a81c-0c14517ccded', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 125),
(136, '33a927c5-6636-4c2a-97a8-516d3a15179b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 126),
(137, 'c2b3efa1-c585-4603-854b-c84a4084311e', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 58),
(138, '4364e06a-c243-428f-8b34-d0e5ef269b39', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 127),
(139, 'ba65f636-38a6-4b92-86d6-7503afb43029', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 128),
(140, 'ead56878-e844-4d48-8197-8ee6ea5036b1', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 129),
(141, 'a5e64907-34f7-4ce6-a9f4-4edaf35af91f', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 130),
(142, 'a3cecbc5-5a9f-4bd2-9228-128fb9859316', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 131),
(143, '664518c2-e5de-44b0-bc03-8a8ce6c1658c', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 132),
(144, '16bb299d-13e1-435c-9f85-a210b5b38126', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 133),
(145, 'd1825a5d-3aaf-41f4-b849-458af9249ea2', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 134),
(146, '43dba5f2-e98a-452c-b725-a32e10758669', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 135),
(147, 'c7fdece6-aa3b-4a7b-9800-dc2cd55df566', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 136),
(148, '4c23a29b-cd38-4aee-9886-40a8aae368dc', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 137),
(149, 'f62da0fd-2da1-4ee5-96fb-0b3ada605d2e', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 138),
(150, '1f846063-5a24-46ac-bc87-a1a4f0f9368b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 139),
(151, '9f72141b-0855-49ec-93f1-be9a653c030a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 140),
(152, 'eaefebd7-b29f-4f7f-929a-0eb2a1932a4b', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 141),
(153, '95e11c5e-2522-4a22-b85b-26507daa866a', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 142),
(154, '8416226b-9165-4772-8371-faaa159a6f68', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 143),
(155, '52c44612-554e-4723-941c-5d2778691fc7', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 144),
(156, '3043daf9-b261-46ec-92ef-0fc1d6446317', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 140),
(157, 'dfe5f7bf-95a2-4f14-8aec-fad1467048f7', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 145),
(158, 'a62dc820-ebf2-4d99-b29c-e4d549ff99e0', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 146),
(159, 'bb4518ad-3895-4d35-bee1-cb61d4ae8d70', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 147),
(160, 'd0280b28-70a1-438c-9730-6cfca1467519', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 148),
(161, '21b03f8c-61a0-48c3-bfb1-ede5165f5648', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 149),
(162, '22574824-d22b-41a1-9b05-acf8eb51c265', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 150),
(163, 'e9bbc1b5-ef18-4996-abce-b01136780214', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 145),
(164, 'ebdaba6b-0c15-4793-92a1-94112559baf6', NULL, '2025-05-08 14:01:30', '2025-05-08 14:01:30', 1, 151),
(165, 'eeff861e-c2ea-4652-aae1-0a0f5971d176', NULL, '2025-05-09 12:45:53', '2025-05-09 12:45:53', 2, 153);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text_color` varchar(10) DEFAULT NULL,
  `bg_color` varchar(10) DEFAULT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempts` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`_id`, `created_at`, `updated_at`, `email`, `role`, `user_id`, `ip_address`) VALUES
(1, '2025-05-08 09:51:19', '2025-05-08 09:51:19', 'rajnishsinghpathania@gmail.com', 1, 1, '2401:4900:5af1:4ce8:8cfd:1ff:fe6a:42eb'),
(2, '2025-05-08 12:09:08', '2025-05-08 12:09:08', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:11a6:db19:ab24:807'),
(3, '2025-05-08 13:27:03', '2025-05-08 13:27:03', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:11a6:db19:ab24:807'),
(4, '2025-05-09 07:12:32', '2025-05-09 07:12:32', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:5da5:bfc2:8705:4f76'),
(5, '2025-05-09 07:48:09', '2025-05-09 07:48:09', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:5da5:bfc2:8705:4f76'),
(6, '2025-05-09 08:12:19', '2025-05-09 08:12:19', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:5da5:bfc2:8705:4f76'),
(7, '2025-05-09 11:47:33', '2025-05-09 11:47:33', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:80ff:b319:c92a:dbe5'),
(8, '2025-05-10 01:53:17', '2025-05-10 01:53:17', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:fc51:5260:3fb0:81f5'),
(9, '2025-05-10 02:04:38', '2025-05-10 02:04:38', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:fc51:5260:3fb0:81f5'),
(10, '2025-05-10 08:36:40', '2025-05-10 08:36:40', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:fc51:5260:3fb0:81f5'),
(11, '2025-05-10 08:37:30', '2025-05-10 08:37:30', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:fc51:5260:3fb0:81f5'),
(12, '2025-05-11 13:47:47', '2025-05-11 13:47:47', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:8c1e:d109:2717:8be9'),
(13, '2025-05-11 13:51:37', '2025-05-11 13:51:37', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:8c1e:d109:2717:8be9'),
(14, '2025-05-11 14:54:02', '2025-05-11 14:54:02', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:8c1e:d109:2717:8be9'),
(15, '2025-05-12 03:21:13', '2025-05-12 03:21:13', 'dipscomputers@gmail.com', 2, 3, '117.223.26.107'),
(16, '2025-05-14 05:16:22', '2025-05-14 05:16:22', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:106e:9122:3812:a970:50a8:1088'),
(17, '2025-05-14 07:57:53', '2025-05-14 07:57:53', 'cnmacademytest@gmail.com', 2, 4, '2409:40d7:106e:9122:3812:a970:50a8:1088'),
(18, '2025-05-14 08:07:51', '2025-05-14 08:07:51', 'cnmacademytest@gmail.com', 2, 4, '117.208.69.135'),
(19, '2025-05-14 12:31:23', '2025-05-14 12:31:23', 'cnmacademytest@gmail.com', 2, 4, '223.181.48.141'),
(20, '2025-05-14 14:32:24', '2025-05-14 14:32:24', 'cnmacademytest@gmail.com', 2, 4, '223.181.48.141'),
(21, '2025-05-14 15:16:18', '2025-05-14 15:16:18', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:106e:9122:e03b:6513:b89a:7d30'),
(22, '2025-05-14 18:05:38', '2025-05-14 18:05:38', 'cnmacademytest@gmail.com', 2, 4, '223.181.48.141'),
(23, '2025-05-16 15:22:34', '2025-05-16 15:22:34', 'kangrahulchul@gmail.com', 2, 2, '2409:40d1:102c:a0c3:558f:34ae:9a95:fabe'),
(24, '2025-05-17 10:25:41', '2025-05-17 10:25:41', 'cnmacademytest@gmail.com', 2, 4, '42.108.28.232'),
(25, '2025-05-19 10:11:37', '2025-05-19 10:11:37', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:42:eaed:81ee:95:de08:773d'),
(26, '2025-05-19 15:07:50', '2025-05-19 15:07:50', 'kangrahulchul@gmail.com', 2, 2, '152.56.69.211'),
(27, '2025-05-19 15:12:03', '2025-05-19 15:12:03', 'agrawalnitesh0205@gmail.com', 2, 5, '103.178.145.25'),
(28, '2025-05-19 15:12:25', '2025-05-19 15:12:25', 'hoodethonse@gmail.com', 2, 6, '101.0.63.24'),
(29, '2025-05-19 15:16:14', '2025-05-19 15:16:14', 'imakhhil@gmail.com', 2, 7, '2401:4900:aaf9:dbe5:d946:7616:aa4f:f9e6'),
(30, '2025-05-19 15:48:23', '2025-05-19 15:48:23', 'digitalram202@gmail.com', 2, 8, '2001:4490:4ca5:15:7826:2b4:27cd:a2a9'),
(31, '2025-05-19 16:54:47', '2025-05-19 16:54:47', 'hoodethonse@gmail.com', 2, 6, '2402:e280:2146:3da:bb73:8df2:8410:e24d'),
(32, '2025-05-20 04:10:49', '2025-05-20 04:10:49', 'digitalram202@gmail.com', 2, 8, '2001:4490:4ca5:1d62:b833:7054:6f50:a098'),
(33, '2025-05-20 12:34:42', '2025-05-20 12:34:42', 'kangrahulchul@gmail.com', 2, 2, '117.235.221.177'),
(34, '2025-05-20 19:14:25', '2025-05-20 19:14:25', 'cnmacademytest@gmail.com', 2, 4, '223.181.52.98'),
(35, '2025-05-21 04:35:05', '2025-05-21 04:35:05', 'imakhhil@gmail.com', 2, 7, '2401:4900:53fa:4f8b:98bc:df8c:d86b:27b2'),
(36, '2025-05-22 08:27:32', '2025-05-22 08:27:32', 'cnmacademytest@gmail.com', 2, 4, '223.181.50.25'),
(37, '2025-05-23 09:43:10', '2025-05-23 09:43:10', 'agrawalnitesh0205@gmail.com', 2, 5, '103.57.253.45'),
(38, '2025-05-23 13:16:18', '2025-05-23 13:16:18', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:47:138c:6851:b3d6:c61a:53e8'),
(39, '2025-05-23 13:16:53', '2025-05-23 13:16:53', 'kangrahulchul@gmail.com', 2, 2, '2409:40d7:47:138c:6851:b3d6:c61a:53e8'),
(40, '2025-05-23 13:45:39', '2025-05-23 13:45:39', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d1:10:2c09:8000::'),
(41, '2025-05-26 06:29:47', '2025-05-26 06:29:47', 'cnmacademytest@gmail.com', 2, 4, '223.185.33.100'),
(42, '2025-05-26 08:17:28', '2025-05-26 08:17:28', 'rajnishsinghpathania@gmail.com', 1, 1, '2409:40d7:105e:586c:25f8:97b5:f9e7:39df');

-- --------------------------------------------------------

--
-- Table structure for table `manual_subscriptions`
--

CREATE TABLE `manual_subscriptions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `plan_id` varchar(100) DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `charges` decimal(13,4) DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `charges_frequency` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `manual_subscriptions`
--

INSERT INTO `manual_subscriptions` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `plan_id`, `ends_at`, `remarks`, `vendors__id`, `charges`, `__data`, `charges_frequency`) VALUES
(1, '85325901-9255-4ae8-87ef-04afbcf1d9d1', 'cancelled', '2025-05-08 13:45:03', '2025-05-08 13:44:19', 'plan_2', '2026-05-08 00:00:00', 'CNM Original Account', 1, 199.0000, '[]', 'yearly'),
(2, '788a23a0-0199-4388-bbf0-12c3db4b2479', 'active', '2025-05-08 13:45:03', '2025-05-08 13:45:03', 'plan_3', '2026-05-08 00:00:00', 'CNM Plan', 1, 2197.0000, NULL, 'yearly'),
(3, '14affa52-fa2e-40ca-a9e7-8a641f66b916', 'initiated', '2025-05-14 08:57:38', '2025-05-14 08:57:38', 'plan_3', '2026-05-14 08:57:35', '', 3, 9997.0000, '{\"prepared_plan_details\":{\"plan_id\":\"plan_3\",\"plan_features\":{\"contacts\":{\"description\":\"Contacts\",\"limit\":\"-1\"},\"campaigns\":{\"limit_duration\":\"monthly\",\"limit_duration_title\":\"Per Month\",\"description\":\"Campaigns\",\"limit\":\"-1\"},\"bot_replies\":{\"description\":\"Bot Replies\",\"limit\":\"-1\"},\"bot_flows\":{\"description\":\"Bot Flows\",\"limit\":\"-1\"},\"contact_custom_fields\":{\"description\":\"Contact Custom Fields\",\"limit\":\"-1\"},\"system_users\":{\"description\":\"Team Members\\/Agents\",\"limit\":\"-1\"},\"ai_chat_bot\":{\"type\":\"switch\",\"description\":\"AI Chat Bot\",\"limit\":\"1\"},\"api_access\":{\"type\":\"switch\",\"description\":\"API and Webhook Access\",\"limit\":\"1\"}},\"plan_charges\":9997,\"plan_frequency\":\"yearly\",\"prorated_remaining_balance_days\":0,\"prorated_remaining_balance_amount\":0,\"existing_plan_days_adjusted\":0},\"manual_txn_details\":{\"selected_payment_method\":\"razorpay\"}}', 'yearly');

-- --------------------------------------------------------

--
-- Table structure for table `message_labels`
--

CREATE TABLE `message_labels` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `labels__id` int(10) UNSIGNED NOT NULL,
  `whatsapp_message_logs__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `show_in_menu` tinyint(3) UNSIGNED DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `vendors__id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `title`, `show_in_menu`, `content`, `type`, `vendors__id`, `slug`, `image_name`) VALUES
(1, '58769a19-2e70-4580-a1b8-62ce984277f2', '2025-05-08 12:33:47', '2025-05-08 12:33:47', 1, 'Terms of Service', 1, 'These Terms govern your use of our WhatsApp API subscription service provided by CNM Academy.\r\n\r\n1. ✅ Acceptance of Terms\r\nBy subscribing, you agree to these Terms and our Privacy Policy.\r\n\r\n2. 🔧 Service Overview\r\nWe provide WhatsApp API access on a subscription basis for businesses to manage communications and customer engagement.\r\n\r\n3. 💳 Subscriptions & Payment\r\nBilled monthly or annually, based on your chosen plan\r\n\r\nService starts upon successful payment confirmation\r\n\r\nYou\'re responsible for keeping billing info up-to-date\r\n\r\n4. 🚫 User Responsibilities\r\nNo use of our service for spam, illegal, or abusive content\r\n\r\nYou are liable for messages sent via your account credentials\r\n\r\n5. ❌ Account Suspension\r\nAccounts may be suspended or terminated for:\r\n\r\nViolations of these terms\r\n\r\nEngagement in prohibited or unlawful behavior\r\n\r\n6. ⚠️ Limitation of Liability\r\nCNM Academy is not liable for:\r\n\r\nIndirect or incidental damages\r\n\r\nInterruptions beyond our control (e.g., internet issues, platform outages)\r\n\r\n7. 🔄 Cancellation & Refund Policy\r\nCancel any time via email/phone; service ends after current billing cycle\r\n\r\nNo refunds on monthly plans\r\n\r\nPro-rated refunds on annual plans within 15 days of purchase\r\n\r\nRefunds for duplicate/failed payments after verification\r\n\r\n📬 Contact\r\n📧 kangrahulchul@gmail.com\r\n📞 +91 82190 59432\r\n\r\nBy using our service, you acknowledge and agree to abide by these terms.', 1, NULL, 'terms', NULL),
(2, 'c7590ba2-8272-4113-8bbf-e9add0418bb8', '2025-05-08 12:34:22', '2025-05-08 12:34:22', 1, 'Privacy Policy', 1, 'At CNM Academy, your privacy is a top priority. This Privacy Policy outlines how we collect, use, protect, and share your data when you subscribe to and use our WhatsApp API services.\r\n\r\n1. 📥 Information We Collect\r\nWe collect the following types of information:\r\n\r\nPersonal Data: Name, email address, phone number, billing address\r\n\r\nBusiness Details: Company name and usage behavior\r\n\r\nPayment Info: Handled securely via third-party gateways (we do not store card information)\r\n\r\nUsage Data: Logs, API message history, and usage patterns\r\n\r\n2. 🎯 How We Use Your Data\r\nTo activate and maintain your WhatsApp API subscription\r\n\r\nFor billing, invoices, and account management\r\n\r\nTo provide technical/customer support\r\n\r\nTo send service updates and promotional content (opt-out anytime)\r\n\r\nTo comply with legal obligations and security protocols\r\n\r\n3. 🔄 Data Sharing & Disclosure\r\nWe do not sell or rent your personal data. Limited data may be shared with:\r\n\r\nSecure third-party payment processors\r\n\r\nLegal authorities when legally required\r\n\r\nService providers under strict confidentiality\r\n\r\n4. 🔒 Security Measures\r\nWe use encryption, secure access control, and third-party compliance standards to safeguard your data. However, no system is 100% immune from risk.\r\n\r\n5. 🧾 Your Rights\r\nYou may:\r\n\r\nRequest access or updates to your personal data\r\n\r\nAsk for your data to be deleted\r\n\r\nWithdraw marketing communication consent at any time\r\n\r\n6. 🍪 Cookies\r\nOur website may use cookies to improve your browsing experience. You can manage cookie settings in your browser.\r\n\r\n📬 Contact\r\nIf you have questions regarding your privacy or data use, contact us at:\r\n📧 kangrahulchul@gmail.com | 📞 +91 82190 59432', 1, NULL, 'privacy', NULL),
(3, 'c4ffa6be-86dc-4db8-b41a-20e25eb29316', '2025-05-08 12:34:52', '2025-05-08 12:34:52', 1, 'Shipping & Delivery', 1, 'At CNM Academy, we provide digital services—specifically WhatsApp API subscription services—which do not require physical shipping. However, we follow a prompt digital delivery process to ensure our customers get access to their services as quickly and efficiently as possible.\r\n\r\n🚀 Service Activation & Delivery\r\nService Type: WhatsApp API Subscription (Digital Product)\r\n\r\nActivation Time: Within 24 hours of successful payment confirmation\r\n\r\nDelivery Method: Credentials or API access details are delivered via registered email and/or WhatsApp\r\n\r\nBilling Cycle: Monthly or Annual (depending on subscription plan selected)\r\n\r\n🧾 Subscription Details\r\nServices begin immediately upon successful payment.\r\n\r\nYou will receive an email or message confirming activation.\r\n\r\nPlease ensure your contact and billing details are accurate at all times.\r\n\r\n💳 Failed or Duplicate Payments\r\nIf you are charged multiple times or face any payment issues, please contact us immediately.\r\n\r\nRefunds for duplicate payments are processed upon verification.\r\n\r\n⚠️ Service Disruption\r\nIf our service is unavailable for more than 48 consecutive hours due to an internal issue, you may be eligible for a credit or partial refund.', 1, NULL, 'shipping', NULL),
(4, 'cfe1cbe7-6b99-4dad-9342-8b92189752c0', '2025-05-08 12:35:29', '2025-05-08 12:35:29', 1, 'Contact Us', 1, 'We’re here to help you with any queries, cancellations, technical support, or feedback related to our WhatsApp API subscription services.\r\n\r\n📌 Company Information\r\nCNM Academy\r\n📍 Address: VPO Bhaleta, Tehsil Nurpur, District Kangra – 176201\r\n🗺️ State: Himachal Pradesh, India\r\n📧 Email: kangrahulchul@gmail.com\r\n📞 Phone/WhatsApp: +91 82190 59432\r\n\r\n💼 Business Hours\r\nMonday to Saturday: 9:00 AM – 6:00 PM\r\n\r\nSunday: Closed\r\n\r\n📋 Support & Cancellations\r\nFor any of the following, reach out using the contact details above:\r\n\r\nSubscription queries or issues\r\n\r\nService-related support\r\n\r\nCancellation or refund requests\r\n\r\nGeneral information or partnership inquiries\r\n\r\nWe value your trust and aim to provide transparent, secure, and effective service at every step.', 1, NULL, 'contact', NULL),
(5, 'e6c16fbe-4d9c-4a1e-9cab-1bae41f1e26f', '2025-05-08 12:36:54', '2025-05-08 12:36:54', 1, 'About us', 1, 'Welcome to CNM Academy, your trusted partner in smart business communication.\r\n\r\nWe specialize in providing WhatsApp API subscription services designed to streamline customer engagement and boost operational efficiency for businesses of all sizes. Whether you\'re running a startup, agency, or eCommerce brand, our tools help you automate, scale, and simplify your messaging workflows.\r\n\r\n📌 Who We Are\r\nBased in Himachal Pradesh, India, CNM Academy is driven by a team of digital innovators focused on delivering powerful, reliable, and easy-to-use automation solutions. Our services are tailored to help Indian and global businesses build deeper customer connections through one of the world’s most popular messaging platforms — WhatsApp.\r\n\r\n🚀 Our Mission\r\nTo empower businesses with tools that make communication faster, smarter, and more meaningful — without technical complexity.\r\n\r\n🔒 Our Commitment\r\n\r\nTransparent subscription policies\r\n\r\nStrong data privacy & security protocols\r\n\r\nQuick activation and responsive customer support\r\n\r\n👨‍💼 Founder’s Note\r\nWe believe technology should serve you, not overwhelm you. Our goal is to simplify WhatsApp automation so you can focus on what matters most — growing your business.\r\n\r\n📞 Reach us anytime at:\r\nEmail: kangrahulchul@gmail.com\r\nPhone/WhatsApp: +91 82190 59432', 1, NULL, 'about', NULL),
(6, '46a2d206-862a-4c6d-b262-37ccdb7aa466', '2025-05-08 12:37:18', '2025-05-08 12:37:18', 1, 'Refund & Cancellation Policy', 1, 'We aim to keep our subscription process transparent and customer-friendly. Please review our refund and cancellation policy carefully before making a purchase.\r\n\r\n📅 Subscription Cancellation\r\nYou may cancel your subscription anytime by contacting us via phone or email.\r\n\r\nCancellation takes effect at the end of the current billing cycle.\r\n\r\nAccess to the WhatsApp API service will continue until the cycle ends.\r\n\r\n💸 Refund Policy\r\nMonthly Plans: No refunds for partial months or unused time.\r\n\r\nAnnual Plans:\r\n\r\nRefunds available only if requested within 15 days of purchase.\r\n\r\nA pro-rated refund will be issued for the unused period.\r\n\r\nDuplicate/Failed Transactions:\r\n\r\nFully refundable upon verification\r\n\r\nPlease contact us immediately with proof of payment\r\n\r\n⚠️ Service Disruption\r\nIf we are unable to provide the service due to an internal failure for more than 48 consecutive hours, you may be eligible for:\r\n\r\nA service credit, or\r\n\r\nA partial refund, at our discretion\r\n\r\n📬 Contact for Cancellations/Refunds\r\nEmail: kangrahulchul@gmail.com\r\n\r\nPhone/WhatsApp: +91 82190 59432\r\n\r\nWe value your trust and are committed to resolving any concerns promptly and fairly.', 1, NULL, 'refund', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(19) UNSIGNED NOT NULL,
  `vendor_model__id` bigint(19) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(19) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) DEFAULT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_id` bigint(19) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `contacts__id` int(10) UNSIGNED NOT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `vendor_users__id` int(10) UNSIGNED DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `assigned_users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `amount` decimal(13,4) DEFAULT NULL,
  `reference_id` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `vendors__id` int(10) UNSIGNED DEFAULT NULL,
  `subscriptions_id` bigint(19) UNSIGNED DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `manual_subscriptions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL COMMENT 'Make unique with country phone code',
  `timezone` varchar(45) DEFAULT NULL,
  `registered_via` varchar(15) DEFAULT NULL COMMENT 'Social account',
  `ban_reason` varchar(255) DEFAULT NULL,
  `countries__id` smallint(5) UNSIGNED DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `user_roles__id` tinyint(3) UNSIGNED NOT NULL,
  `vendors__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`_id`, `_uid`, `created_at`, `updated_at`, `username`, `email`, `password`, `status`, `remember_token`, `first_name`, `last_name`, `mobile_number`, `timezone`, `registered_via`, `ban_reason`, `countries__id`, `two_factor_secret`, `two_factor_recovery_codes`, `email_verified_at`, `user_roles__id`, `vendors__id`) VALUES
(1, '50ee1967-7341-4c3a-b071-f2ea0722b179', '2025-05-08 08:54:36', '2025-05-09 07:49:06', 'superadmin', 'rajnishsinghpathania@gmail.com', '$2y$10$CfMMhMl/x9TUY8TEJSUWQeDpeLBZ0ZeJQJQW8Q1R3.Vft4YA66Nbi', 1, 'ikhNqPvbKJROH1w0H06qhTNQvKHdG4xfdkjYi9C412kaq98NWIOTIqGCUKmk', 'CNM', 'Academy', '9999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(2, '7e330be1-2672-4607-a9c9-35ee7f6fe2ee', '2025-05-08 13:26:49', '2025-05-08 13:26:49', 'cnmacademy', 'kangrahulchul@gmail.com', '$2y$10$k7nIj9XBXKLk2OJHOABZ4e6E/SSwO47QyEaNcypQM00W9dXTYiH8u', 1, '54d74401-55a0-4465-82ec-d596f33abbac', 'Rajnish', 'Pathania', '8219059432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(3, '07bd7688-bbd1-47ba-9206-c3c34acfd17e', '2025-05-12 03:21:07', '2025-05-12 03:21:07', 'dipscomputers', 'dipscomputers@gmail.com', '$2y$10$FWXsMwXwS9bk2GmDNPYJAefStotg.FkTKHbdgdV1QucwYjSteLpOu', 1, '84c9f7d6-ec83-4d77-9b75-73b0f19e50fb', 'DIPAK', 'KHANDARE', '9049102035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2),
(4, '9fc4139e-290d-440e-8fd4-f7f7d7c6bea2', '2025-05-14 05:18:15', '2025-05-14 05:18:15', 'cnmdemo', 'cnmacademytest@gmail.com', '$2y$10$UN2unKVtgaKizqjD9xb6MOxIE9ssIx9JJkKxOUcGSnUULt0OVw8Se', 1, 'b2e14577-c567-4566-82a4-a0192792895d', 'CNM', 'Demo', '7986804558', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3),
(5, 'a520db12-d6c6-45be-b504-141103941055', '2025-05-19 15:11:33', '2025-05-23 09:41:49', 'niteshstud', 'agrawalnitesh0205@gmail.com', '$2y$10$.KUN.J1Ge02AitInxkQ4NeAo5MNh707JESmHUfipcehRFBXxsGxlu', 1, '3BhN2Xydlo523vh4JpHsmPCpUu1taSKePvDxZSHd3guciM6PhDnuP7osRef7', 'nitesh ', 'agrawal ', '8779730176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4),
(6, 'b7846574-5131-4b12-bf2d-ef72f6b1fe6b', '2025-05-19 15:12:03', '2025-05-19 15:12:03', 'softools', 'hoodethonse@gmail.com', '$2y$10$HfFhHYC6Y4Nkou4riafbLuk5pVd4sDln7mtZPmfHuuRoQeNocALtG', 1, '463c2c42-5e58-4c22-9030-ce4bf9d61183', 'Shoptools', 'shop', '917019881960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 5),
(7, 'ded90cee-4afb-4d9c-bffc-68e55c3c2458', '2025-05-19 15:16:05', '2025-05-19 15:16:05', 'iamakhhil', 'imakhhil@gmail.com', '$2y$10$kYg1jML7SU3bP7K94K/VpuGf0FIsmBPNzIkn.Cz50O2qFMGLwFzi6', 1, '404084b2-d954-4502-96bd-c8a89466ae8b', 'Akhil', 'koshti', '7043119341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6),
(8, '756020c6-c1e3-4651-9196-29faecaf35cc', '2025-05-19 15:48:06', '2025-05-19 15:48:06', 'telugudigitalhub', 'digitalram202@gmail.com', '$2y$10$UXX9MAkykK6REPBdlIEKcOsmxlEdOK9RbtAynhSjkArSSICFSZHD2', 1, 'vbt5gE9q6DHhgmHewUbJT4YMMKm5hj3Lj1o5PdsGMNL43AuJnipIgSPzpBnc', 'RAM PRASAD', 'KATTEKOLA', '9603505202', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `_id` tinyint(3) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`_id`, `_uid`, `status`, `created_at`, `updated_at`, `title`) VALUES
(1, '15f21c9f-88bb-4fec-bad4-03eb9d9065f8', 1, '2025-05-08 08:54:36', '2025-05-08 08:54:36', 'Super Admin'),
(2, '287133c4-2afc-4f65-ab3c-28b0df8a099a', 1, '2025-05-08 08:54:36', '2025-05-08 08:54:36', 'Vendor Admin'),
(3, '30ee1967-4nfc-4f65-87bb-g2ea0722b178', 1, '2025-05-08 08:54:36', '2025-05-08 08:54:36', 'Vendor User');

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key_name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL,
  `data_type` tinyint(4) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Restaurent',
  `stripe_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `logo_image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `ban_reason`, `type`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `title`, `logo_image`, `slug`, `domain`, `favicon`) VALUES
(1, 'ed7dd7f4-1f61-43c6-96c2-50de0c8826b4', 1, '2025-05-08 13:26:49', '2025-05-08 13:26:49', NULL, 1, NULL, NULL, NULL, NULL, 'CNM Academy - WA Automation', NULL, 'cnmacademy', NULL, NULL),
(2, '66cac7cd-477a-43d6-94d3-21afc2eb392b', 1, '2025-05-12 03:21:07', '2025-05-12 03:21:07', NULL, 1, NULL, NULL, NULL, NULL, 'DIPs Computers', NULL, 'dipscomputers', NULL, NULL),
(3, 'effd8ae4-ec5b-42f6-a1de-5edea0a6dc96', 1, '2025-05-14 05:18:14', '2025-05-14 05:18:14', NULL, 1, NULL, NULL, NULL, NULL, 'CNM Demo', NULL, 'cnmdemo', NULL, NULL),
(4, '1805e749-2eac-49cb-b5de-1701b2a229ae', 1, '2025-05-19 15:11:33', '2025-05-19 15:11:33', NULL, 1, NULL, NULL, NULL, NULL, 'niteshdigiprods', NULL, 'niteshstud', NULL, NULL),
(5, 'af0a5249-a615-44a2-a5d1-2fb45a50abb2', 1, '2025-05-19 15:12:03', '2025-05-19 15:12:03', NULL, 1, NULL, NULL, NULL, NULL, 'Softools Shop', NULL, 'softools', NULL, NULL),
(6, 'aa87c0cd-7239-4490-bafa-d3f77c8dbdb2', 1, '2025-05-19 15:16:05', '2025-05-19 15:16:05', NULL, 1, NULL, NULL, NULL, NULL, 'Akhil Koshti', NULL, 'iamakhhil', NULL, NULL),
(7, '1c21dc47-4c45-4c0d-b23a-f8f389050b9c', 1, '2025-05-19 15:48:06', '2025-05-19 15:48:06', NULL, 1, NULL, NULL, NULL, NULL, 'TELUGU DIGITAL HUB', NULL, 'telugudigitalhub', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_settings`
--

CREATE TABLE `vendor_settings` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` longtext DEFAULT NULL,
  `data_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_settings`
--

INSERT INTO `vendor_settings` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `vendors__id`, `name`, `value`, `data_type`) VALUES
(1, '0d0b92e6-0dd0-4f34-9cc6-c5f3f5fb23e7', NULL, '2025-05-08 13:27:40', '2025-05-08 13:27:40', 1, 'webhook_verified_at', '2025-05-08 13:38:17', 1),
(2, 'ec6097a2-3d8f-4fca-bad8-1046bc981245', NULL, '2025-05-08 13:27:40', '2025-05-08 13:27:40', 1, 'facebook_app_id', 'eyJpdiI6Ik1OdlBMR2dsT0c2RkMrbU50TzdkT1E9PSIsInZhbHVlIjoiNEQ0dmJHTkE2VCs1Y1czYVBHcVY0OVJhVjZxaWNFNlBQZW1CT1VpVXRSTT0iLCJtYWMiOiI3NWE4Zjc3ZDU4MmViOTIwZTU2YmYxYTU5ZmJkNGU5MWQzOWQwMjNmMzQ5ZThiNDg4NzE1MjIxMGIzYTMwMWFkIiwidGFnIjoiIn0=', 1),
(3, '8fa445b2-f590-4091-9898-619a836f17d3', NULL, '2025-05-08 13:27:40', '2025-05-08 13:27:40', 1, 'facebook_app_secret', 'eyJpdiI6ImtEQmZKZ3lwOUh4Tkpya0ZCTUszSVE9PSIsInZhbHVlIjoiTDYzanZYZ0dURWt5djhWVGRNTEtUZGExQVRjZzA2TWhFR0pkempvRk0xM2U1L3M2NWJDZW1IRzg5NlBZUHhneSIsIm1hYyI6ImJmYjZjYjExOWIyMzUxNGYwYjIxNGQzZGY4ZGZiZTVmMzQzZWQwZmI5YTM3NTY0YjEzY2NhMmRiNjRhOTg2NzYiLCJ0YWciOiIifQ==', 1),
(4, '3529649d-1e92-4894-ae7e-6ebffaec92b1', NULL, '2025-05-08 13:38:14', '2025-05-08 13:38:14', 1, 'whatsapp_token_info_data', '{\"app_id\":\"1329303264805146\",\"type\":\"SYSTEM_USER\",\"application\":\"WA - Cloud CNM Academy\",\"data_access_expires_at\":0,\"expires_at\":1751895424,\"is_valid\":true,\"issued_at\":1746711424,\"scopes\":[\"whatsapp_business_management\",\"whatsapp_business_messaging\",\"whatsapp_business_manage_events\",\"public_profile\"],\"granular_scopes\":[{\"scope\":\"whatsapp_business_management\"},{\"scope\":\"whatsapp_business_messaging\"},{\"scope\":\"whatsapp_business_manage_events\"}],\"user_id\":\"122096070056872754\"}', 4),
(5, '938b9a68-5f33-4f06-9b15-62f20dd6d8ec', NULL, '2025-05-08 13:38:18', '2025-05-08 13:38:18', 1, 'whatsapp_phone_numbers', '[{\"verified_name\":\"CNM Academy\",\"code_verification_status\":\"VERIFIED\",\"display_phone_number\":\"+91 89884 71619\",\"quality_rating\":\"UNKNOWN\",\"platform_type\":\"NOT_APPLICABLE\",\"throughput\":{\"level\":\"NOT_APPLICABLE\"},\"webhook_configuration\":{\"application\":\"https:\\/\\/cnmacademy.in\\/whatsapp-webhook\\/ed7dd7f4-1f61-43c6-96c2-50de0c8826b4\"},\"id\":\"686111177910412\"}]', 4),
(6, '484b840d-adab-42b0-ac63-1acfe478e5d0', NULL, '2025-05-08 13:38:18', '2025-05-08 13:38:18', 1, 'current_phone_number_number', 'eyJpdiI6IkpTRUhlb1BSZUdCanpmem9FU2toeFE9PSIsInZhbHVlIjoiRmZZVjV0NkhaUnZ4eFUwTE5aOWVSREcvZkNFOXBoU1hFZnpzN2RoQmJsQT0iLCJtYWMiOiI2MjExZjEzMTkwMjVlOGU2MTlmZWYzYmE2YTE2OGEyNmRjNDIwZDM0OThlNTcyODJhMjhkYzdhYzY3NmI4NTRlIiwidGFnIjoiIn0=', 1),
(7, '96768f1d-8ecb-4a12-b9a9-e8e44503c92f', NULL, '2025-05-08 13:38:18', '2025-05-08 13:38:18', 1, 'current_phone_number_id', 'eyJpdiI6InZMdmFvYmVlWVRQYU9FYlQzT2l3N3c9PSIsInZhbHVlIjoicXRtU0NVNG52ZmNDTys0RHZyUncrNDdnbllPRDRWWDAwVndHV2sybWdoST0iLCJtYWMiOiIzZGYzZDdlNmFjMGEwMWU2MDc5NDZmOGU3MjJiOGFjMjY0Y2Y4NmMzZjEwNTMzZTZkYWVmZjU2NmNmYjJlZjNkIiwidGFnIjoiIn0=', 1),
(8, '54322088-05ad-4225-9a86-f1af026633a4', NULL, '2025-05-08 13:38:18', '2025-05-08 13:38:18', 1, 'whatsapp_access_token', 'eyJpdiI6IlFJVkpRc2thOTRKZ3hoTTVEaXJiQlE9PSIsInZhbHVlIjoicnE0aTFLb3ZRNm93VlFXeUpCOHBRWk14c2JpOTVtTnpKUENsMUxldUpQS3ZMMmtCeDhEdTFwalZpVTZTKys1RnpZRXhwd3l2UDBkcUdUL2hKTnh4WmF0b1ZibktxQlBxVnZHanZESFUvUUZ3N09pVEVPYllGbk1sSXorRnFLbE04d0FrOFNOY01qU0dNSnNYR09tUUdQQzJ0cDdRNlg2dkZqTmtDRmprdDZDUG1NQjBiOWRWUTBYMW1ZTWJKdHFsUlkzQVpCbGVNT0ZFWjcvTVd6UG8relNFcC9ZZkRLd1NvQk9weWFoZWFvSE12VGp6YTlIR055U1VidS9xazJteUMrd3d0Zjcyd0p1aVlONThiSnVvSmJ4eWxnaFdNdWs1Zy81Mk1CcUZKUFN0K3FXVUUxSGdpZlVnVEFsYjVIWVZ3WWNIUmVoc1pCK3R0VFBycm95T09nPT0iLCJtYWMiOiJjMTY3N2Q4Yjk4MjE2NjQ5MWZmZTBhOGU0MzNmZTVlNDBhNGI0OWJjZDc1MzM0NjJhODNmZmFlZTZjZTZhYzg4IiwidGFnIjoiIn0=', 1),
(9, 'e9c7b81a-8d96-4adf-9954-dd8830d80709', NULL, '2025-05-08 13:38:18', '2025-05-08 13:38:18', 1, 'whatsapp_business_account_id', 'eyJpdiI6ImVNQ1AxRWpMc1BTRVl3a0gzZ09RM3c9PSIsInZhbHVlIjoibzUzcFpERkZUVUFFUENsYThod0dUVGpuQ0NXVG00dm92VmZmclVUa282Zz0iLCJtYWMiOiI3YjJlMzQ2NjE0ODE2ZDAzMzk3YjY2MDczNzZjZjU2YjAyY2UzMjU3NWQ0ZjljMTE5MDQyYThmOTdkNDIyYzQ0IiwidGFnIjoiIn0=', 1),
(11, '51eab90e-3794-4f94-9f9a-992f2dee8c72', NULL, '2025-05-08 13:38:19', '2025-05-08 13:38:19', 1, 'whatsapp_health_status_data', '{\"695951959648414\":{\"whatsapp_business_account_id\":\"695951959648414\",\"health_status_updated_at\":\"2025-05-08T13:38:19.254243Z\",\"health_status_updated_at_formatted\":\"Thursday 8th May 2025 1:38:19 pm\",\"health_data\":{\"health_status\":{\"can_send_message\":\"BLOCKED\",\"entities\":[{\"entity_type\":\"WABA\",\"id\":\"695951959648414\",\"can_send_message\":\"BLOCKED\",\"errors\":[{\"error_code\":141006,\"error_description\":\"There is an error with the payment method. This will block business initiated conversations.\",\"possible_solution\":\"There was an error with your payment method. Please add a new payment method to the account.\"}]},{\"entity_type\":\"BUSINESS\",\"id\":\"3544091285808366\",\"can_send_message\":\"AVAILABLE\"},{\"entity_type\":\"APP\",\"id\":\"1329303264805146\",\"can_send_message\":\"AVAILABLE\"}]},\"id\":\"695951959648414\"}}}', 4),
(12, '2062eff6-d176-4ce8-a1fc-d6a396febe58', NULL, '2025-05-08 13:38:19', '2025-05-08 13:38:19', 1, 'is_disabled_message_sound_notification', '0', 2),
(13, '1a2a9c0b-aee3-475a-9864-b4eca78b2d37', NULL, '2025-05-09 08:09:06', '2025-05-09 08:09:06', 1, 'test_recipient_contact', 'aaa8119f-5935-437c-a9be-c728a9545d8e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_users`
--

CREATE TABLE `vendor_users` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_message_logs`
--

CREATE TABLE `whatsapp_message_logs` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contacts__id` int(10) UNSIGNED DEFAULT NULL,
  `campaigns__id` int(10) UNSIGNED DEFAULT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `contact_wa_id` varchar(45) DEFAULT NULL,
  `wamid` varchar(255) DEFAULT NULL,
  `wab_phone_number_id` varchar(45) DEFAULT NULL,
  `is_incoming_message` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Incoming,outgoing',
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `messaged_at` datetime DEFAULT NULL,
  `is_forwarded` tinyint(1) DEFAULT NULL,
  `replied_to_whatsapp_message_logs__uid` char(36) DEFAULT NULL,
  `messaged_by_users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `whatsapp_message_logs`
--

INSERT INTO `whatsapp_message_logs` (`_id`, `_uid`, `status`, `updated_at`, `created_at`, `message`, `contacts__id`, `campaigns__id`, `vendors__id`, `contact_wa_id`, `wamid`, `wab_phone_number_id`, `is_incoming_message`, `__data`, `messaged_at`, `is_forwarded`, `replied_to_whatsapp_message_logs__uid`, `messaged_by_users__id`) VALUES
(1, '1e11ebdc-03eb-4976-8e30-e2efc2a90eb5', 'initialize', '2025-05-09 08:08:07', '2025-05-09 08:08:07', 'hi', 152, NULL, 1, '7973223724', NULL, '686111177910412', 0, '[]', '2025-05-09 08:08:07', NULL, NULL, NULL),
(2, '5b8cd7c0-daf1-4f6a-b31a-f20d4ac0c8c8', 'initialize', '2025-05-09 08:08:26', '2025-05-09 08:08:26', 'hi', 152, NULL, 1, '7973223724', NULL, '686111177910412', 0, '[]', '2025-05-09 08:08:26', NULL, NULL, NULL),
(3, '698ceb64-9fee-47d4-a8ee-0c85cb7ac4d9', 'initialize', '2025-05-09 12:48:03', '2025-05-09 12:48:03', 'hhi', 153, NULL, 1, '8628974630', NULL, '686111177910412', 0, '[]', '2025-05-09 12:48:03', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_message_queue`
--

CREATE TABLE `whatsapp_message_queue` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `vendors__id` int(10) UNSIGNED NOT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `phone_with_country_code` varchar(45) NOT NULL,
  `campaigns__id` int(10) UNSIGNED NOT NULL,
  `contacts__id` int(10) UNSIGNED DEFAULT NULL,
  `retries` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_templates`
--

CREATE TABLE `whatsapp_templates` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `template_name` varchar(512) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `template_id` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `__data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`__data`)),
  `vendors__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `whatsapp_templates`
--

INSERT INTO `whatsapp_templates` (`_id`, `_uid`, `status`, `template_name`, `updated_at`, `created_at`, `template_id`, `category`, `language`, `__data`, `vendors__id`) VALUES
(1, '4f05767e-ab10-4d92-8b08-d37532aabcad', 'APPROVED', 'hello_world', '2025-05-08 13:38:18', '2025-05-08 13:38:18', '9421879184601084', 'UTILITY', 'en_US', '{\"template\":{\"name\":\"hello_world\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Hello World\"},{\"type\":\"BODY\",\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\"},{\"type\":\"FOOTER\",\"text\":\"WhatsApp Business Platform sample message\"}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"id\":\"9421879184601084\"}}', 1),
(2, '7b4d93a6-f8e7-46c6-800f-79f5629e1de3', 'APPROVED', 'watest', '2025-05-10 02:04:53', '2025-05-10 02:04:53', '1849323152556716', 'MARKETING', 'en', '{\"template\":{\"name\":\"watest\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"IMAGE\",\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/491875340_1849323155890049_5926555401638207740_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=WCdRnTNHuMgQ7kNvwFPQGX8&_nc_oc=Adl6CBZ-x8PKIFstzDNvAq7E8VuzNQ-iZz-7dO7ri-hdL_YTqtM_r6zSYbfGVivyDxtbX9wDPdG9ToWaAeX9wk-s&_nc_zt=3&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&_nc_gid=f1WMbkrDIPw142MtWSK_8Q&oh=01_Q5Aa1QGIi5HNTDVI-Ocv0GqUHCE03IvHYpX5dphmTcSq_xwoRQ&oe=684638A9\"]}},{\"type\":\"BODY\",\"text\":\"\\ud83d\\udc4b *Hey! Welcome to CNM Academy\\u2019s WhatsApp Automation Community*\\n\\nThis group is for \\ud83d\\udc47\\n\\u2705 Paid members using our *WhatsApp Official API Dashboard*\\n\\u2705 Accessing setup guidance, training, updates & support\\n\\u2705 Getting help with campaigns, flows, and automation\\n\\n\\ud83d\\ude80 Let\\u2019s build your automation system together and scale your business!\\n\\n\\ud83d\\udc49 *Join the Group Now:*\\n\\ud83d\\udd17 https:\\/\\/chat.whatsapp.com\\/EHesSbWrpzDFH76vgp1qpJ\\n\\n\\ud83d\\udccc *Note: This group is for active users only. Kindly join only if you\'ve paid or registered.*\\n\\nSee you inside!\\n\\u2013 Team CNM Academy\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"1849323152556716\"}}', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `bot_flows`
--
ALTER TABLE `bot_flows`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD KEY `fk_bot_flows_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `bot_replies`
--
ALTER TABLE `bot_replies`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_bot_replies_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_bot_replies_bot_flows1_idx` (`bot_flows__id`),
  ADD KEY `fk_bot_replies_bot_replies1_idx` (`bot_replies__id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_campaigns_whatsapp_templates1_idx` (`whatsapp_templates__id`),
  ADD KEY `fk_campaigns_users1_idx` (`users__id`),
  ADD KEY `fk_campaigns_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `campaign_groups`
--
ALTER TABLE `campaign_groups`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_campaign_groups_campaigns1_idx` (`campaigns__id`),
  ADD KEY `fk_campaign_groups_contact_groups1_idx` (`contact_groups__id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_contacts_countries1_idx` (`countries__id`),
  ADD KEY `fk_contacts_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_contacts_users1_idx` (`assigned_users__id`);

--
-- Indexes for table `contact_custom_fields`
--
ALTER TABLE `contact_custom_fields`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_contact_custom_fields_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `contact_custom_field_values`
--
ALTER TABLE `contact_custom_field_values`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_contact_custom_field_values_contacts1_idx` (`contacts__id`),
  ADD KEY `fk_contact_custom_field_values_contact_custom_fields1_idx` (`contact_custom_fields__id`);

--
-- Indexes for table `contact_groups`
--
ALTER TABLE `contact_groups`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_groups_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `contact_labels`
--
ALTER TABLE `contact_labels`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_contact_labels_labels1_idx` (`labels__id`),
  ADD KEY `fk_contact_labels_contacts1_idx` (`contacts__id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `group_contacts`
--
ALTER TABLE `group_contacts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_group_contacts_contact_groups1_idx` (`contact_groups__id`),
  ADD KEY `fk_group_contacts_contacts1_idx` (`contacts__id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_labels_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `manual_subscriptions`
--
ALTER TABLE `manual_subscriptions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_manual_subscriptions_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `message_labels`
--
ALTER TABLE `message_labels`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_message_labels_labels1_idx` (`labels__id`),
  ADD KEY `fk_message_labels_whatsapp_message_logs1_idx` (`whatsapp_message_logs__id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_pages_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`vendor_model__id`,`stripe_status`),
  ADD KEY `stripe_status` (`stripe_status`),
  ADD KEY `vendor_model__id` (`vendor_model__id`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stripe_plan_UNIQUE` (`stripe_price`,`subscription_id`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`),
  ADD KEY `fk_subscription_items_subscriptions1_idx` (`subscription_id`),
  ADD KEY `stripe_id` (`stripe_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_tickets_contacts1_idx` (`contacts__id`),
  ADD KEY `fk_tickets_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_tickets_vendor_users1_idx` (`vendor_users__id`),
  ADD KEY `fk_tickets_users1_idx` (`assigned_users__id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `reference_id_UNIQUE` (`reference_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_transactions_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_transactions_subscriptions1_idx` (`subscriptions_id`),
  ADD KEY `fk_transactions_manual_subscriptions1_idx` (`manual_subscriptions__id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_users_countries1_idx` (`countries__id`),
  ADD KEY `fk_users_user_roles1_idx` (`user_roles__id`),
  ADD KEY `fk_users_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `name` (`key_name`),
  ADD KEY `fk_user_settings_users1_idx` (`users__id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `stripe_id` (`stripe_id`);

--
-- Indexes for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_vendor_settings_vendors1_idx` (`vendors__id`);

--
-- Indexes for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_vendor_users_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_vendor_users_users1_idx` (`users__id`);

--
-- Indexes for table `whatsapp_message_logs`
--
ALTER TABLE `whatsapp_message_logs`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_whatsapp_message_status_logs_contacts1_idx` (`contacts__id`),
  ADD KEY `fk_whatsapp_message_status_logs_campaigns1_idx` (`campaigns__id`),
  ADD KEY `fk_whatsapp_message_status_logs_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_whatsapp_message_logs_users1_idx` (`messaged_by_users__id`);

--
-- Indexes for table `whatsapp_message_queue`
--
ALTER TABLE `whatsapp_message_queue`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_whatsapp_message_queue_vendors1_idx` (`vendors__id`),
  ADD KEY `fk_whatsapp_message_queue_campaigns1_idx` (`campaigns__id`),
  ADD KEY `fk_whatsapp_message_queue_contacts1_idx` (`contacts__id`);

--
-- Indexes for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_whatsapp_templates_vendors1_idx` (`vendors__id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bot_flows`
--
ALTER TABLE `bot_flows`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bot_replies`
--
ALTER TABLE `bot_replies`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_groups`
--
ALTER TABLE `campaign_groups`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `contact_custom_fields`
--
ALTER TABLE `contact_custom_fields`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_custom_field_values`
--
ALTER TABLE `contact_custom_field_values`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_groups`
--
ALTER TABLE `contact_groups`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_labels`
--
ALTER TABLE `contact_labels`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_contacts`
--
ALTER TABLE `group_contacts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `manual_subscriptions`
--
ALTER TABLE `manual_subscriptions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message_labels`
--
ALTER TABLE `message_labels`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(19) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(19) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_users`
--
ALTER TABLE `vendor_users`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_message_logs`
--
ALTER TABLE `whatsapp_message_logs`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `whatsapp_message_queue`
--
ALTER TABLE `whatsapp_message_queue`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bot_flows`
--
ALTER TABLE `bot_flows`
  ADD CONSTRAINT `fk_bot_flows_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bot_replies`
--
ALTER TABLE `bot_replies`
  ADD CONSTRAINT `fk_bot_replies_bot_flows1` FOREIGN KEY (`bot_flows__id`) REFERENCES `bot_flows` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bot_replies_bot_replies1` FOREIGN KEY (`bot_replies__id`) REFERENCES `bot_replies` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bot_replies_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `fk_campaigns_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_campaigns_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_campaigns_whatsapp_templates1` FOREIGN KEY (`whatsapp_templates__id`) REFERENCES `whatsapp_templates` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `campaign_groups`
--
ALTER TABLE `campaign_groups`
  ADD CONSTRAINT `fk_campaign_groups_campaigns1` FOREIGN KEY (`campaigns__id`) REFERENCES `campaigns` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_campaign_groups_contact_groups1` FOREIGN KEY (`contact_groups__id`) REFERENCES `contact_groups` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_contacts_countries1` FOREIGN KEY (`countries__id`) REFERENCES `countries` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contacts_users1` FOREIGN KEY (`assigned_users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contacts_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contact_custom_fields`
--
ALTER TABLE `contact_custom_fields`
  ADD CONSTRAINT `fk_contact_custom_fields_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contact_custom_field_values`
--
ALTER TABLE `contact_custom_field_values`
  ADD CONSTRAINT `fk_contact_custom_field_values_contact_custom_fields1` FOREIGN KEY (`contact_custom_fields__id`) REFERENCES `contact_custom_fields` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contact_custom_field_values_contacts1` FOREIGN KEY (`contacts__id`) REFERENCES `contacts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contact_groups`
--
ALTER TABLE `contact_groups`
  ADD CONSTRAINT `fk_groups_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contact_labels`
--
ALTER TABLE `contact_labels`
  ADD CONSTRAINT `fk_contact_labels_contacts1` FOREIGN KEY (`contacts__id`) REFERENCES `contacts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contact_labels_labels1` FOREIGN KEY (`labels__id`) REFERENCES `labels` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `group_contacts`
--
ALTER TABLE `group_contacts`
  ADD CONSTRAINT `fk_group_contacts_contact_groups1` FOREIGN KEY (`contact_groups__id`) REFERENCES `contact_groups` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_group_contacts_contacts1` FOREIGN KEY (`contacts__id`) REFERENCES `contacts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `labels`
--
ALTER TABLE `labels`
  ADD CONSTRAINT `fk_labels_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `manual_subscriptions`
--
ALTER TABLE `manual_subscriptions`
  ADD CONSTRAINT `fk_manual_subscriptions_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `message_labels`
--
ALTER TABLE `message_labels`
  ADD CONSTRAINT `fk_message_labels_labels1` FOREIGN KEY (`labels__id`) REFERENCES `labels` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_message_labels_whatsapp_message_logs1` FOREIGN KEY (`whatsapp_message_logs__id`) REFERENCES `whatsapp_message_logs` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD CONSTRAINT `fk_subscription_items_subscriptions1` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_contacts1` FOREIGN KEY (`contacts__id`) REFERENCES `contacts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_users1` FOREIGN KEY (`assigned_users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_vendor_users1` FOREIGN KEY (`vendor_users__id`) REFERENCES `vendor_users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_manual_subscriptions1` FOREIGN KEY (`manual_subscriptions__id`) REFERENCES `manual_subscriptions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_subscriptions1` FOREIGN KEY (`subscriptions_id`) REFERENCES `subscriptions` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_countries1` FOREIGN KEY (`countries__id`) REFERENCES `countries` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_user_roles1` FOREIGN KEY (`user_roles__id`) REFERENCES `user_roles` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `fk_user_settings_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  ADD CONSTRAINT `fk_vendor_settings_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD CONSTRAINT `fk_vendor_users_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendor_users_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `whatsapp_message_logs`
--
ALTER TABLE `whatsapp_message_logs`
  ADD CONSTRAINT `fk_whatsapp_message_logs_users1` FOREIGN KEY (`messaged_by_users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_whatsapp_message_status_logs_campaigns1` FOREIGN KEY (`campaigns__id`) REFERENCES `campaigns` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_whatsapp_message_status_logs_contacts1` FOREIGN KEY (`contacts__id`) REFERENCES `contacts` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_whatsapp_message_status_logs_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `whatsapp_message_queue`
--
ALTER TABLE `whatsapp_message_queue`
  ADD CONSTRAINT `fk_whatsapp_message_queue_campaigns1` FOREIGN KEY (`campaigns__id`) REFERENCES `campaigns` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_whatsapp_message_queue_contacts1` FOREIGN KEY (`contacts__id`) REFERENCES `contacts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_whatsapp_message_queue_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  ADD CONSTRAINT `fk_whatsapp_templates_vendors1` FOREIGN KEY (`vendors__id`) REFERENCES `vendors` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
