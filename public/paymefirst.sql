-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2023 at 05:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paymefirst`
--

-- --------------------------------------------------------

--
-- Table structure for table `amin_infos`
--

CREATE TABLE `amin_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `official_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amin_infos`
--

INSERT INTO `amin_infos` (`id`, `official_email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'info@paymefirst.com', '1312124544', '2022-12-06 06:47:19', '2022-12-06 06:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `name`, `phone`, `email`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(2, 'jhon', '1234546879', 'email@email.com', 'contact', 'hi my nasme is jhon i want to contact for some specification', '2022-12-07 05:46:15', '2022-12-07 05:46:15'),
(3, 'bruce', '11111', 'john@gmail.com', 'check', 'test', '2022-12-08 07:54:26', '2022-12-08 07:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_breakdowns`
--

CREATE TABLE `financial_breakdowns` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_breakdowns`
--

INSERT INTO `financial_breakdowns` (`id`, `user_id`, `name`, `color`, `value`, `created_at`, `updated_at`) VALUES
(1, 9, 'gift', '#ff0090', '20', '2022-12-07', '2022-12-07 07:27:01'),
(2, 9, 'rent', '#ff0000', '30', '2022-12-07', '2022-12-07 07:29:11'),
(3, 9, 'rent', '#ff0000', '1', '2022-12-07', '2022-12-07 07:30:23'),
(4, 9, 'rent', '#daff00', '500', '2022-12-07', '2022-12-07 07:32:50'),
(5, 9, 'food', '#00f5ff', '200', '2022-12-07', '2022-12-07 08:10:46'),
(6, 9, 'food', '#0051ab', '200', '2022-12-07', '2022-12-07 08:17:46'),
(7, 9, 'rent', '#72adff', '21', '2022-12-07', '2022-12-07 09:24:26'),
(8, 9, 'shopping', '#014400', '180', '2022-12-07', '2022-12-07 09:28:13'),
(9, 9, 'car maintainance', '#4b914c', '20', '2022-12-07', '2022-12-07 10:32:17'),
(10, 9, 'gift', '#fff800', '20', '2022-12-08', '2022-12-08 06:49:44'),
(11, 9, 'gift', '#ff00c5', '7', '2022-12-08', '2022-12-08 06:58:08'),
(12, 9, 'donation', '#00a3ff', '23', '2022-12-08', '2022-12-08 07:55:20'),
(13, 9, 'shopping', '#fff86e', '20', '2022-12-09', '2022-12-09 13:31:57'),
(14, 9, 'shopping', '#8e00ff', '23', '2022-12-09', '2022-12-09 13:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `goal_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_save` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ending_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_deduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnd` int DEFAULT '0',
  `amount_per_deduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_histories`
--

CREATE TABLE `goal_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `goal_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_save` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ending_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_deduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_per_deduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goal_histories`
--

INSERT INTO `goal_histories` (`id`, `user_id`, `goal_name`, `amount_save`, `plan`, `starting_date`, `ending_date`, `number_deduction`, `cnd`, `amount_per_deduction`, `created_at`, `updated_at`) VALUES
(1, 29, NULL, '150', 'Weekly', '2023-1-07', '2023-1-21', '3', '1', '50', '2023-01-26 19:00:00', '2023-01-27 06:58:06'),
(2, 27, 'test', '9072', 'Weekly', '2023-01-27', '2023-02-10', '3', '1', '3024', '2023-01-26 19:00:00', '2023-01-27 07:52:42'),
(3, 29, 'test goal', '150', 'Weekly', '2023-1-07', '2023-1-21', '3', '1', '50', '2023-01-26 19:00:00', '2023-01-27 12:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `guides`
--

CREATE TABLE `guides` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guides`
--

INSERT INTO `guides` (`id`, `question`, `description`, `created_at`, `updated_at`) VALUES
(2, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2022-12-05 07:52:09', '2022-12-05 07:52:09'),
(3, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-12-05 07:52:20', '2022-12-05 07:52:20'),
(4, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-12-05 07:52:31', '2022-12-05 07:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2022_11_03_095742_create_reset_code_passwords_table', 3),
(11, '2022_11_18_133646_create_user_card_details_table', 4),
(12, '2022_12_05_103251_create_guides_table', 5),
(13, '2022_12_06_111543_create_financial_breakdowns_table', 6),
(14, '2022_12_06_112838_create_amin_infos_table', 7),
(15, '2022_12_06_115501_create_contact_infos_table', 8),
(16, '2022_12_06_120712_create_terms_and_conditions_table', 9),
(17, '2019_05_03_000001_create_customer_columns', 10),
(18, '2019_05_03_000002_create_subscriptions_table', 10),
(19, '2019_05_03_000003_create_subscription_items_table', 10),
(20, '2023_01_18_181425_create_paymeny_table', 10),
(21, '2023_01_18_181649_create_payment_table', 11),
(22, '2023_01_24_122422_create_goals_table', 12),
(23, '2023_01_24_144701_create_temporary_wallets_table', 13),
(24, '2023_01_24_153615_create_wallets_table', 13),
(25, '2023_01_24_183852_create_tranasactions_table', 14),
(26, '2023_01_27_114257_create_goal_histories_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0558512e1227ea21df36b7361762e6a66f3a67b538652684acbfd57748038b7d82a812a1710d04c2', 9, 1, 'app_api', '[]', 0, '2022-12-01 17:50:38', '2022-12-01 17:50:38', '2023-12-01 17:50:38'),
('08545d473dbd8c1961fa34a1ce2df676b9e7cf109d8704ab636ab22e8721bab232191ac70573c94c', 1, 1, 'app_api', '[]', 0, '2022-11-18 12:41:47', '2022-11-18 12:41:48', '2023-11-18 17:41:47'),
('0eaa0b01391b71554d1f0f496e6dd48a1ee919530ea52ed2b711900a8e3e528cc00205f86e41fc52', 26, 1, 'app_api', '[]', 0, '2023-01-26 10:29:07', '2023-01-26 10:29:07', '2024-01-26 15:29:07'),
('0ed9c768ab9466685899e1e44c54c08c88bb437d0e84de250afb843da509d1ca52fed9d593a72621', 1, 1, 'app_api', '[]', 0, '2023-01-24 10:08:30', '2023-01-24 10:08:30', '2024-01-24 15:08:30'),
('0fbbcb85af02dbf14bbf26894ea2f5e1192cdb0f784a6553aa1d1a1de4b9f55ff0dcb814f6cb355b', 9, 1, 'app_api', '[]', 0, '2022-12-01 17:46:41', '2022-12-01 17:46:41', '2023-12-01 17:46:41'),
('11c2c7914782886a29cbad29f7605d53cdaaa91e4c1546ef3c7ca066ef0b0d2721c57defa6d3fd43', 1, 1, 'app_api', '[]', 0, '2022-11-16 05:47:25', '2022-11-16 05:47:25', '2023-11-16 10:47:25'),
('1332acfbb471bf50a5da4768c9ac5cd56efc478b2858e7efaf9fbefe10b3f812cdcfc2776a3466a9', 19, 1, 'app_api', '[]', 0, '2022-12-09 13:59:43', '2022-12-09 13:59:43', '2023-12-09 13:59:43'),
('134ddb4bf2299aaadd250d75cba7237ac91c7b77802d82c02591b2c4d4e92e2e88c990cbf7477f54', 8, 1, 'app_api', '[]', 0, '2023-01-18 12:36:45', '2023-01-18 12:36:45', '2024-01-18 17:36:45'),
('15b6281b86e2ee525ad5740d935fc8329774cdbda58813ed08dc0fed504380f4dcb479a565bdd9fe', 23, 1, 'app_api', '[]', 0, '2023-01-23 08:51:58', '2023-01-23 08:51:58', '2024-01-23 13:51:58'),
('15cf36f108dcfdcb8bd747aa1fcf4afca83d946b339a5704274a7eb8f96873d2ff83ca76dcc38889', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:02:48', '2023-01-26 13:02:49', '2024-01-26 18:02:48'),
('164ad9b0e2ecd87bd9334799071e04ca5f3346c929da7b1fba1f0e2c8cc96d1801fed7f2cd8e08db', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:00:46', '2022-12-07 10:00:46', '2023-12-07 15:00:46'),
('16a037c4dfd3a6491ef878d30d141d7c17f49e4bbe0b2924b168a3ff1647dc36310ebe0a538053c6', 9, 1, 'app_api', '[]', 0, '2022-12-05 15:55:16', '2022-12-05 15:55:16', '2023-12-05 15:55:16'),
('16b11a2c871e1c0ff0ce67b6d79d2bf51408e21bbc602f23bb6b859a2649e9d547b954abbc3ec8ce', 9, 1, 'app_api', '[]', 0, '2022-12-12 17:36:55', '2022-12-12 17:36:56', '2023-12-12 17:36:55'),
('18540e6961afd4e31b6a3d8a00b1b3fe6fa2672ea6114a535ff38d275f9ca488d2f7651506cac104', 9, 1, 'app_api', '[]', 0, '2022-12-07 05:55:16', '2022-12-07 05:55:17', '2023-12-07 10:55:16'),
('18f3cd8186a2ee8e42d6e0cfadd9c4c26c32672b515f6b9e3a726eccc0b9aaab4e6459e0675c5c13', 24, 1, 'app_api', '[]', 0, '2023-01-25 11:33:48', '2023-01-25 11:33:48', '2024-01-25 16:33:48'),
('19d55e360b1804ed230409d22d4da77ed7856bba0df72b68ade39c82f1c248cf5031869513422a6d', 1, 1, 'app_api', '[]', 0, '2023-01-31 06:25:08', '2023-01-31 06:25:08', '2024-01-31 11:25:08'),
('1d51d277e3b00fe49331c3ac88f1b42ea02eb42598c23dbaf4f57560aa319e451a0f5d3789001360', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:05:11', '2023-01-24 12:05:11', '2024-01-24 17:05:11'),
('1dde250fbe599fbc906e879dbfc0143f214a13954389d2015df1161cd66f882dcd2a440d407bc5d6', 9, 1, 'app_api', '[]', 0, '2022-12-01 13:12:51', '2022-12-01 13:12:51', '2023-12-01 13:12:51'),
('1e932c8e07c177c63f74412fb5c8c6dce59e0af6ee80652a43a76c68567d90923277c0d51c20cc83', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:03:58', '2023-01-26 13:03:58', '2024-01-26 18:03:58'),
('24e213ae865cdfb7b988ba2755b164ba48000f6b1110b575ad3c32f374a71231abf008a946902886', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:57:47', '2023-01-24 11:57:47', '2024-01-24 16:57:47'),
('24e9eb6c034867ae64784782509c4560d6d117b8a4d09a5448b9c1462f27e8c5fb7517411b820f42', 1, 1, 'app_api', '[]', 0, '2022-11-16 05:47:53', '2022-11-16 05:47:53', '2023-11-16 10:47:53'),
('24fd5a7d67faad5acdd993c05c6abafb2d8a8fac053525e09d852018f401850a181c8aec5bd7d965', 1, 1, 'app_api', '[]', 1, '2022-11-16 06:15:47', '2022-11-16 06:19:26', '2023-11-16 11:15:47'),
('25478f92a9d9a63de43a9aff842c62d1238ffadb1554c694f1c0005b14b19585c47ca71a4ba7d30a', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:21:20', '2022-11-16 06:21:20', '2023-11-16 11:21:20'),
('258328dcac143b26269413b5bbca1491e54c6c320581538d10e37b88c7123bf96f4ec4b51d543196', 1, 1, 'app_api', '[]', 0, '2023-01-25 06:36:58', '2023-01-25 06:36:58', '2024-01-25 11:36:58'),
('2794bf49cfdaab06bf1e20e44acf730923d9c439a7ffeed6755834414ab5c5e7ec5770cb7573ed54', 9, 1, 'app_api', '[]', 0, '2022-12-09 06:52:23', '2022-12-09 06:52:23', '2023-12-09 06:52:23'),
('2802295e77cda06980e4dfd6151a7799a9aecb4910d3e3d9000179e5c474fe80a6079c558305b0b6', 22, 1, 'app_api', '[]', 0, '2023-01-23 08:45:03', '2023-01-23 08:45:03', '2024-01-23 13:45:03'),
('2b99b48bc6f700b305d60874c0f33e45f41f18de891b653716b0c3b40eb6c9500c1c8b37441f2b7b', 3, 1, 'app_api', '[]', 0, '2022-11-17 05:32:00', '2022-11-17 05:32:00', '2023-11-17 10:32:00'),
('2e6527391329d07c1843edf7691ceb38f9f90d4fabe0f8ea725160f7900ea910368bfc09615d389a', 18, 1, 'app_api', '[]', 0, '2022-12-07 05:24:04', '2022-12-07 05:24:05', '2023-12-07 10:24:04'),
('2ef30e6769c070cc20850356884acd3f25e9a0131c6aa5fde7c86398002f649fa1e487c535cdf7e5', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:33:55', '2022-12-07 10:33:55', '2023-12-07 15:33:55'),
('2f052e8d7412772825db54e00c9b14a80a40b4473e2c50c7ce186476b5b8443c685369c6fe0ca4cf', 15, 1, 'app_api', '[]', 0, '2022-12-01 17:27:38', '2022-12-01 17:27:38', '2023-12-01 17:27:38'),
('2f7b07a108f287e34183e72cf5f1c7386b9d5e64fc8528831b0f75349624c4bf199a9907fc6b0d74', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:20:14', '2023-01-24 12:20:14', '2024-01-24 17:20:14'),
('31bd693da69d6cf0cbbceb023908e4bf94b8ea97e84ae98d476d4180c866daf4279d8540bf9082dc', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:15:00', '2022-12-12 17:15:00', '2023-12-12 17:15:00'),
('3503fc955f0e29bd595e4e095fed8c9dd4ade551420ad36c56003b6ea869ffbb6eb5b83f294fd965', 22, 1, 'app_api', '[]', 0, '2023-01-23 08:43:35', '2023-01-23 08:43:35', '2024-01-23 13:43:35'),
('36f80133de1e6eb0a00fbc8675f0a15a3a0ed907069dbe55eeadea20bda5fce210f594f86b06d8f0', 1, 1, 'app_api', '[]', 0, '2023-01-25 05:58:56', '2023-01-25 05:58:56', '2024-01-25 10:58:56'),
('3a8ef33a2d3b03749d6b523b019360c90a05ef9a6da15cef1c2222e56b0a92a57d059c9cae01f87a', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:20:09', '2022-12-12 17:20:09', '2023-12-12 17:20:09'),
('3cd2c55afada1448d2ca0a8c0f046e486c18ce70a8a2fd0ff4e9ed6e275699ac4ae3acb87f74b88c', 9, 1, 'app_api', '[]', 0, '2023-01-18 16:04:42', '2023-01-18 16:04:42', '2024-01-18 16:04:42'),
('3d27b29fe76a55b7f006b677ddbdfcda98b1d887f21560c99424b22facadffc4ef42e755dd64ecad', 9, 1, 'app_api', '[]', 0, '2022-12-05 17:04:41', '2022-12-05 17:04:41', '2023-12-05 17:04:41'),
('3d962557fee3804be4d1f005a1f7aefdf633859f66e9ad1ce6798f7ba393010f9f48f931d35ae877', 6, 1, 'app_api', '[]', 0, '2022-11-17 05:37:43', '2022-11-17 05:37:43', '2023-11-17 10:37:43'),
('3e2aa6c548542bb888bf2773f40c408bb20278afca891bbd904a38512809b2347fe9f2dfbbd070fa', 9, 1, 'app_api', '[]', 0, '2022-12-07 16:49:54', '2022-12-07 16:49:54', '2023-12-07 16:49:54'),
('40544dec33d381358ee3222d90e9a389187638c4e4159246ee647f7375545bbf8c45adf1d9c2851a', 9, 1, 'app_api', '[]', 0, '2022-12-07 16:53:21', '2022-12-07 16:53:21', '2023-12-07 16:53:21'),
('426b78f38d6b8b1638173942a317bfdb59aea81457ce98da8fff161c7172b4f7625151bd6a43b72b', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:35:01', '2023-01-24 13:35:01', '2024-01-24 18:35:01'),
('42c831d9c7d6b8afea7b0d351928cb694685d15acefa29146730cba48853b9304a084b24951cec69', 8, 1, 'app_api', '[]', 0, '2023-01-18 11:50:29', '2023-01-18 11:50:29', '2024-01-18 16:50:29'),
('444e9319aeb5212e1a9b80710fbc41aaf3c6adf132fd3b212b3c6df15cf5f848596e8d1e6e2b03c3', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:12:09', '2023-01-24 13:12:10', '2024-01-24 18:12:09'),
('445b37c631b60104265c7a7119b394003738cb98c66b1e314ccb72d23265f020c952fab93875780d', 1, 1, 'app_api', '[]', 1, '2022-11-21 15:56:28', '2022-11-21 16:24:44', '2023-11-21 15:56:28'),
('465979a61d9a290a338d84c6519a8e7ed0b5f1a317610b303a7f05bfcbf708fb016d9eb97bddc4fa', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:14:11', '2023-01-26 13:14:11', '2024-01-26 18:14:11'),
('49c473ac9cdc7ebe8c30293e45636cb4deb94dd69f98563303d27f457fb80d94b3286e2e398d6605', 1, 1, 'app_api', '[]', 0, '2022-11-21 06:02:19', '2022-11-21 06:02:19', '2023-11-21 11:02:19'),
('4a2eff55005fef82da4e29cd4dd633c280cf228fb0b40660ca118cbc1a38f7f83e0b8b40b7688fba', 1, 1, 'app_api', '[]', 0, '2022-11-21 15:09:42', '2022-11-21 15:09:42', '2023-11-21 15:09:42'),
('4aa1a265c446fcc9904572c123119ebac90972f2b9571cc26e73519acac126d70237db164f7c6180', 19, 1, 'app_api', '[]', 0, '2022-12-09 13:54:43', '2022-12-09 13:54:43', '2023-12-09 13:54:43'),
('4b061dbf9a0706cc5ad87203ea2268067fef04de863ec1bae065218341ed86d8116cbcef022c20b0', 8, 1, 'app_api', '[]', 0, '2023-01-23 08:35:33', '2023-01-23 08:35:33', '2024-01-23 13:35:33'),
('4c00fd2cc274d3e9c5d42436740f338b314bb172afa81301f6ff97159cec92b9d4d73a8b8b94a133', 29, 1, 'app_api', '[]', 0, '2023-01-27 06:27:35', '2023-01-27 06:27:35', '2024-01-27 11:27:35'),
('4cb756d5777741ce7460301e092ab46b57c6c75de09ccd388ef01b28137820597628ace53e4bf9a1', 9, 1, 'app_api', '[]', 0, '2022-12-08 12:41:30', '2022-12-08 12:41:30', '2023-12-08 12:41:30'),
('4e4793fea3d2be198aa4e638ef5c30261d008fd75c24d8afba783c1a9af4e004157636854910bd7c', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:07:57', '2022-12-01 16:07:57', '2023-12-01 16:07:57'),
('4e58c07f04479ce720c5dd22ef0f32483ec6299bc64e88a7443f5da01d78b3ab91498b891c25b96b', 24, 1, 'app_api', '[]', 0, '2023-01-25 13:04:55', '2023-01-25 13:04:55', '2024-01-25 18:04:55'),
('5031c322f2e6e0354986ad09d659fd61394ee2386e11bcbf894d3ced4eb237264236a6aabf855b12', 14, 1, 'app_api', '[]', 0, '2022-12-01 17:26:32', '2022-12-01 17:26:33', '2023-12-01 17:26:32'),
('5ab8f98ddc6079c8e7ff6d986f9326d2d1d02a81d5609dbcbd1f824e464508d5397e03d1137519e3', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:27:18', '2022-12-12 17:27:18', '2023-12-12 17:27:18'),
('5d63a770f8327962969bf4565c4bbd31103d2ee5614c18011619c77a86d1bd07c72eedee0850a180', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:25:01', '2022-11-16 06:25:01', '2023-11-16 11:25:01'),
('5e3556a1a494057a781bd2ffa76cad7ad9aa2a29a4e8961dfcf8f41ccaa9780fd7a0b4cf0ef4c36c', 9, 1, 'app_api', '[]', 0, '2022-12-14 16:50:06', '2022-12-14 16:50:07', '2023-12-14 16:50:06'),
('5fd7bb122b50a7e03586d78b6fe446175cf202380af58d5163ebf9e6a5a52870fa67146fc9952802', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:19:33', '2023-01-24 12:19:33', '2024-01-24 17:19:33'),
('60cfd2af5759329fe4350fea31add1aba6df522755716827597776fea622ed1cc125a238bba0d98f', 9, 1, 'app_api', '[]', 0, '2022-12-05 16:55:29', '2022-12-05 16:55:29', '2023-12-05 16:55:29'),
('63db4901d25f8e465290496e2d50627020dfa279ebfe2c5f672f2ceb45e644a6c66e346329f228ac', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:41:10', '2023-01-24 12:41:10', '2024-01-24 17:41:10'),
('6420b2aa3f2c8e6fc645a4a750babeb273c9feca6fa0f27f7bc728259ead43d081995b37177fd38d', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:10:06', '2023-01-26 13:10:06', '2024-01-26 18:10:06'),
('647229ce4ad8bd5ee4a976fd73928af2802c26f263c19654cc15f67643a3131c08a13e51861753af', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:38:00', '2023-01-24 12:38:00', '2024-01-24 17:38:00'),
('6730fbeb20cef34c53f52aa144480c2a0dd3509a2e47471cb93f3fec48a3e863bf8bbe7142017de1', 23, 1, 'app_api', '[]', 0, '2023-01-23 08:52:25', '2023-01-23 08:52:25', '2024-01-23 13:52:25'),
('67f72f0e0cfdf7a2056200ef710a73b762cabe71d23b5dbd6e6a79c594680dd1ed1828d643e4f589', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:15:23', '2023-01-26 13:15:23', '2024-01-26 18:15:23'),
('68307a650b687c8450e4b2306fde0a3622d3394db06a0e6eb267d934cac126c8d0846573d648a297', 8, 1, 'app_api', '[]', 0, '2022-11-22 10:55:07', '2022-11-22 10:55:07', '2023-11-22 10:55:07'),
('6962d1408ec0136c117ead0407282025bff2667a5dd66d4d5f959cd26f44ca7d39b15dd97820b378', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:18:06', '2023-01-24 12:18:06', '2024-01-24 17:18:06'),
('6af4841a37a964bae4a1e7c53abd2ef85e58a823b88ebb404837e26181f9bef62973a38b9f6273df', 1, 1, 'app_api', '[]', 0, '2023-01-24 13:24:04', '2023-01-24 13:24:04', '2024-01-24 18:24:04'),
('6c3c3d25698fd156bb9b361d43d031a7523678a1c3a6e35fd909e3406a866334ad959625fbbc4449', 9, 1, 'app_api', '[]', 0, '2022-12-05 15:41:36', '2022-12-05 15:41:36', '2023-12-05 15:41:36'),
('6d8c95ca740cbbb711acb172c8ca38b4b0e4cf78b65b296251fff2e47da3fbcaf7acee5a06ceb5fa', 1, 1, 'app_api', '[]', 0, '2023-01-27 05:50:56', '2023-01-27 05:50:57', '2024-01-27 10:50:56'),
('70efb60883c0d06ed93dc500ed37f697199f5d680af78f7c4f37fd2ba2f856f3b77ee6befad21e39', 8, 1, 'app_api', '[]', 0, '2023-01-18 12:39:04', '2023-01-18 12:39:04', '2024-01-18 17:39:04'),
('7374791f7c965d97d8a6525b0115d57994514dbaacd6b75da9f02eaa38d09b292d2f8cef47fa06ac', 24, 1, 'app_api', '[]', 0, '2023-01-26 10:17:06', '2023-01-26 10:17:06', '2024-01-26 15:17:06'),
('73a2250283165e22b62e11d9dc467cdfd689f1f9a3caaa004cda0e3163045fcdfca32ebecdb7260b', 9, 1, 'app_api', '[]', 0, '2023-01-18 14:46:41', '2023-01-18 14:46:42', '2024-01-18 14:46:41'),
('73b640fa60b2ff063009473198468d221a4e18e98c1b8588a79a6708932aca9f0954b46e639d707a', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:15:49', '2023-01-24 13:15:49', '2024-01-24 18:15:49'),
('74b6074595a5f3f00608562455fa943cf5d83ff906d8b64e60b1e0575bbdcacdf5f775463f047a61', 8, 1, 'app_api', '[]', 0, '2023-01-23 07:03:22', '2023-01-23 07:03:22', '2024-01-23 12:03:22'),
('74f62025a53c9a5269a87da51082563cc68ec64618369d6514e87671e985c38fac882c55e1a79ed4', 9, 1, 'app_api', '[]', 0, '2022-12-08 09:24:23', '2022-12-08 09:24:23', '2023-12-08 09:24:23'),
('7613724fb4aceeaf3580d9442a0f4819ddcbd3e8f79afcba17ea9f0c2065e83da13486e55e3caa57', 24, 1, 'app_api', '[]', 0, '2023-01-24 09:30:52', '2023-01-24 09:30:52', '2024-01-24 14:30:52'),
('7c680d3b36ebc72f64fb409fa92d8e9375a8366252c91eba14ea43f73451a840e0afa5775ab0d3a8', 1, 1, 'app_api', '[]', 0, '2023-01-24 08:01:44', '2023-01-24 08:01:44', '2024-01-24 13:01:44'),
('7cd043170f3a08f7b504f706580accee8328d2aa7723598530a69d4fb2b37adde11c3d4e3380341b', 9, 1, 'app_api', '[]', 0, '2022-12-12 15:13:12', '2022-12-12 15:13:12', '2023-12-12 15:13:12'),
('7d3b9b9b4bda41a0e3115f5858bc0cfe753d9b3c292a8db247efc17fc04d315d341628d94c46a40e', 8, 1, 'app_api', '[]', 0, '2023-01-19 11:22:31', '2023-01-19 11:22:31', '2024-01-19 16:22:31'),
('7de08231ab21982647ab10f4a9d34380afaa0a7b5bc5d8069f3bfb5d793ce0dc40a69ac616979789', 24, 1, 'app_api', '[]', 0, '2023-01-24 14:03:22', '2023-01-24 14:03:22', '2024-01-24 19:03:22'),
('7ec7d1aca12c7db9eda5e7e2540bb79957c66676a564637b1ebfe315e923d27cc0534615ce58783f', 24, 1, 'app_api', '[]', 0, '2023-01-24 06:48:18', '2023-01-24 06:48:18', '2024-01-24 11:48:18'),
('7f0193fb8754e458950df423ba3ecfa5c515637f61ed72740ed00554c77717fdb67aac69028fd025', 20, 1, 'app_api', '[]', 0, '2022-12-12 17:19:09', '2022-12-12 17:19:09', '2023-12-12 17:19:09'),
('8184781bccce8d94374b56c9d4fd9d3aad7a9059f90eab4ded75e96fcace045f7955af1aa56c0b91', 1, 1, 'app_api', '[]', 0, '2023-01-24 07:48:48', '2023-01-24 07:48:48', '2024-01-24 12:48:48'),
('81e54a0719f07047c6a3a63c8cac55a64d5d39da24e8f2460d892609a4ffcfc143d0213f102034c9', 9, 1, 'app_api', '[]', 0, '2022-12-22 17:33:41', '2022-12-22 17:33:41', '2023-12-22 17:33:41'),
('89242a8e072894f29ad91daac0433822a2dbaf5aabdc918472d7fabf17ecddef6a9d8e6ac93ab5e2', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:11:10', '2023-01-24 12:11:10', '2024-01-24 17:11:10'),
('8970b3a9a443f64bbaa171f6b183436d94abe91cd7b96c22e1b58cc0a759b77c417fb298422ab416', 21, 1, 'app_api', '[]', 0, '2023-01-23 08:39:05', '2023-01-23 08:39:05', '2024-01-23 13:39:05'),
('92df391d436b4ab968c95dafd4096523aecf025d503dbba25c188063e2765cbebc76805efe129d24', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:31:25', '2022-12-01 16:31:25', '2023-12-01 16:31:25'),
('961916af7f1f451cb4b51cb5c4847710bd4f395b62dfecc076fe2bffc97c9246922f1c20de22c8dd', 1, 1, 'app_api', '[]', 0, '2023-01-24 14:00:39', '2023-01-24 14:00:39', '2024-01-24 19:00:39'),
('968133135d0b0654c9d96ab3f82d995b5b8eca0f37989131418b24033493e021cb78724699f00284', 1, 1, 'app_api', '[]', 0, '2022-11-16 05:45:44', '2022-11-16 05:45:44', '2023-11-16 10:45:44'),
('9712479bbf028eb05f535aa0be668810203d397840e10ef77739a640b07f27d8c78ca235ba387866', 27, 1, 'app_api', '[]', 0, '2023-01-26 11:02:52', '2023-01-26 11:02:52', '2024-01-26 16:02:52'),
('97d06eb9a73d7326fa70d6ed6a65af9cdca08f816af3e31b92e3dc4d9006f5239cb236c78c46ed54', 13, 1, 'app_api', '[]', 0, '2022-12-01 17:12:49', '2022-12-01 17:12:49', '2023-12-01 17:12:49'),
('984bcea4a05627591f9ca6245609117d849a9f9c13ae21f8194891849d5182167672d97635f984d7', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:17:25', '2023-01-24 13:17:26', '2024-01-24 18:17:25'),
('9ad4ede7d1965561f913d285cfa75ea0edf44773d38101b2d280564c2ae2fa7ebb488bee953f297b', 9, 1, 'app_api', '[]', 0, '2022-12-08 12:40:16', '2022-12-08 12:40:16', '2023-12-08 12:40:16'),
('9af686810d39f06738feded9c16a87886e1c48e5926bd4224550f82e4e245df0e1cb71969542637b', 9, 1, 'app_api', '[]', 0, '2022-12-12 15:12:14', '2022-12-12 15:12:14', '2023-12-12 15:12:14'),
('9f732cf638f6019199df6eba89bcb6b38216a141dff35b8f97429339172312e2272a338aae5b2e60', 9, 1, 'app_api', '[]', 0, '2022-12-12 12:41:38', '2022-12-12 12:41:38', '2023-12-12 12:41:38'),
('a124bb60b9853cff233534759c2bc2a1f8a1004bb8f745076447aebb6967e51c6412f8439c2bc28c', 8, 1, 'app_api', '[]', 0, '2022-11-22 10:56:54', '2022-11-22 10:56:54', '2023-11-22 10:56:54'),
('a4a37bf68d594d8b36064f5da4cbfd06d02ef860c234db3362b5f83989cd48c43dd0962b16dd3fe1', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:29:02', '2022-12-07 10:29:02', '2023-12-07 15:29:02'),
('a73e79f4989cdb9aa13f5e112f3e3c66b83f84cfb420865c5f0194da4f419e6b3ddb9625c16beebc', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:02:59', '2023-01-24 12:02:59', '2024-01-24 17:02:59'),
('abd5b9d9fc1500c2e989125c02ca46bea19b7ec10a1a7d65d84a64c21d6da3cc33cd38d3084b7a53', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:33:42', '2022-12-01 16:33:42', '2023-12-01 16:33:42'),
('aea77ece42ca494e3011c6954c573c9f1987a25d23bb658d6e8072cecac225637bb0bf56147d58b6', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:26:14', '2023-01-24 12:26:14', '2024-01-24 17:26:14'),
('b9b27f6021c662f8d9bd4717765c071ea569feef6e464ffc687a87c2afcb9a0ad6ccc9328195fab6', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:50:57', '2022-12-07 10:50:57', '2023-12-07 15:50:57'),
('bc64ac2effe4b81c67d14512e5830d314a8d0a47faf09a6129c1d5a1f61352414bbfa4b807d19136', 27, 1, 'app_api', '[]', 0, '2023-01-26 12:51:46', '2023-01-26 12:51:46', '2024-01-26 17:51:46'),
('c2140d76757d151eda60f90da03cfa50b71b78f5151208192092069538355a07842f30038a6ebb4d', 1, 1, 'app_api', '[]', 0, '2022-11-21 06:07:31', '2022-11-21 06:07:31', '2023-11-21 11:07:31'),
('c93258aa569b6c48ef977c86ef102d5a96ba0373625d0d703b4c056f8959b95e938c412511f7f914', 19, 1, 'app_api', '[]', 0, '2022-12-09 13:52:54', '2022-12-09 13:52:54', '2023-12-09 13:52:54'),
('cbb37b03feceba2db7ab0389d7aec41d59a047e5eebea4b7d2ec00e7b35b317d94d5b2d0a530b1fe', 18, 1, 'app_api', '[]', 0, '2022-12-05 17:05:22', '2022-12-05 17:05:23', '2023-12-05 17:05:22'),
('cc09ca8045b7d942688d3936190d35751dc37540e13b39fd1dbb37378b3ffae11d49a8f2f8c7808e', 12, 1, 'app_api', '[]', 0, '2022-12-01 17:09:48', '2022-12-01 17:09:48', '2023-12-01 17:09:48'),
('cd675c73b0fec79be05fb6ba1b3234459a3691a2e7dcd255f7e3847e5baedf21890f97fcc01c9c11', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:05:39', '2022-11-16 06:05:39', '2023-11-16 11:05:39'),
('cd925ed766fa5f0f2e869d7c58217150a08e857eeea0e572887b2e19ba8687abec78ebcd0f2bf00d', 9, 1, 'app_api', '[]', 0, '2022-12-05 18:19:59', '2022-12-05 18:19:59', '2023-12-05 18:19:59'),
('d01883857a7d9b3880b7b311cdbd122908a88a3c15544a16e7a0baa620c1425cf92214621aceb7b1', 8, 1, 'app_api', '[]', 0, '2023-01-23 07:38:29', '2023-01-23 07:38:29', '2024-01-23 12:38:29'),
('d030581e8d0daae3290231bf4174fdfd8b484409ab24fbeab29bfb5ba82e20bcbd0a77403b47e915', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:16:18', '2023-01-24 12:16:18', '2024-01-24 17:16:18'),
('d0a53c855e6e63ca83f215a2e536650f699e2b03f53284dc89ea0ad7e577fee2d9a0dc6a508c65b9', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:00:39', '2023-01-24 11:00:39', '2024-01-24 16:00:39'),
('d2712b9e834cc596e4e0e080e53926f3ebb0742a160c213b127a0e5fb513de290058224fd71c2a99', 21, 1, 'app_api', '[]', 0, '2023-01-18 12:19:02', '2023-01-18 12:19:02', '2024-01-18 17:19:02'),
('d31796cb93bedfe69ab5e71528f1eeb0ae75d341b4470d74442dd5ab25428a26b6afe5092e4e4a29', 7, 1, 'app_api', '[]', 0, '2022-11-21 15:21:22', '2022-11-21 15:21:22', '2023-11-21 15:21:22'),
('d401aaad8ddb1458d548cb62b5baf4ce09c49850747b0f38ca10bb5de0ef9284517b58a06bc38321', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:25:37', '2022-12-12 17:25:37', '2023-12-12 17:25:37'),
('d5de69f2dce4eeafe4cb01b7187e60961f25aa284d62056fe6905f80ac2c1b5c46ac88865bbd538a', 28, 1, 'app_api', '[]', 0, '2023-01-26 11:07:11', '2023-01-26 11:07:12', '2024-01-26 16:07:11'),
('d8f839d8b9927b218d181a05657c164500401c2b695c716d28d77d6279b45c9525354c084e84acc5', 17, 1, 'app_api', '[]', 0, '2022-12-01 17:29:24', '2022-12-01 17:29:25', '2023-12-01 17:29:24'),
('da70bd272911735958ee8cbef976b546012af4dbbe00133700e5240a6f33389637f1e1f33dbd4ebf', 27, 1, 'app_api', '[]', 0, '2023-01-27 05:45:45', '2023-01-27 05:45:45', '2024-01-27 10:45:45'),
('dbf2e753623117d341f08641c09707a1491009fd7ce8b3fe59e97a22fb0fa35db1160baeb4ffec0c', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:56:28', '2023-01-24 11:56:28', '2024-01-24 16:56:28'),
('dca63e7bac8b2d48499d322f2d3c8fdcb97745a1656a65343912680a28ecbca9bf31073b0f1cf07e', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:12:04', '2023-01-24 11:12:04', '2024-01-24 16:12:04'),
('dee249cb951728cb946d42abfb6af60d4b49f1db49854a32b8170624c57d91fdce5b07311a215c17', 9, 1, 'app_api', '[]', 0, '2022-12-05 18:07:35', '2022-12-05 18:07:35', '2023-12-05 18:07:35'),
('dfea07902a0b9e721cc95289a4530787f0e58cef1f5be7bbb1ea85e5d87dbd8ff4327e7957b1a2ac', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:04:09', '2022-11-16 06:04:09', '2023-11-16 11:04:09'),
('dff052116c4ae3ba38bc4c7d6929a6bf71648b90658cd1fa3da3ee64a0477d095f228836cdf4fa14', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:48:23', '2023-01-24 12:48:23', '2024-01-24 17:48:23'),
('e06045bad5669a1d9a772843fb24a02c47fa95bf079f3593c5b10a79a4a95c0043aaa6da7b496a8e', 1, 1, 'app_api', '[]', 0, '2023-01-25 08:34:43', '2023-01-25 08:34:43', '2024-01-25 13:34:43'),
('e30d30ed9d53a12964d3f2cc43f6849066eb3b397088a53d0519f783c394c05552021031be30eb9d', 1, 1, 'app_api', '[]', 0, '2023-01-26 06:01:17', '2023-01-26 06:01:18', '2024-01-26 11:01:17'),
('e390be0e826459f819bfc970f79ba0c27c8e241f773689f3fababd4e824a0b187512648b99018530', 9, 1, 'app_api', '[]', 0, '2022-12-08 12:38:52', '2022-12-08 12:38:52', '2023-12-08 12:38:52'),
('e580db225f38fcb2872660e2270f58f56c72b7fdb04875a31400b002a15e13ad4a1062b379b6e8b4', 8, 1, 'app_api', '[]', 0, '2023-01-18 12:38:14', '2023-01-18 12:38:14', '2024-01-18 17:38:14'),
('e61d9c5f1e24a7b956304b5dc684c3915889eb8bfe087713a521e640578d9ca7be441224b6b8ffdf', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:24:20', '2023-01-24 11:24:20', '2024-01-24 16:24:20'),
('eb1fbd79deef9288cbdabab5127b26ff89142fa205794d01dfc30b0f0c0c5eb5bdbc39c3be802b5f', 27, 1, 'app_api', '[]', 0, '2023-01-26 12:18:55', '2023-01-26 12:18:55', '2024-01-26 17:18:55'),
('eb48a114c063658a404732a7354f2961097ed849c22741fdd2e286484662a13108c5bca0e0932608', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:36:37', '2022-12-01 16:36:37', '2023-12-01 16:36:37'),
('ee362185117c34ce73d45531d5262fa7184a328e9c1ed2bbda29ec4107205074fde43b6777bd0b07', 1, 1, 'app_api', '[]', 0, '2023-01-25 08:35:05', '2023-01-25 08:35:05', '2024-01-25 13:35:05'),
('f2f64f42d0a9c2c9aef3e50fb9a52ddbd1071c1300c45ace3075181fb27d5a30913b55469a47d69b', 21, 1, 'app_api', '[]', 0, '2023-01-23 08:45:38', '2023-01-23 08:45:38', '2024-01-23 13:45:38'),
('f3315b88d8cc6553800c27a81cff977dcbe40a6b415d8d67bb974cf6a6c83b5703377ab35506edf0', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:05:54', '2023-01-24 12:05:54', '2024-01-24 17:05:54'),
('f39f7d415e364c119684f02b24cc8bade96f9fa914c8f8e0ac52661c9fe86e2ba9ec890b90dcc81f', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:23:42', '2023-01-24 12:23:42', '2024-01-24 17:23:42'),
('f44fd4af26b74860f256c746d05ade8ac643792f91c91ef6d3a8e76af6fd751fa18de83659e82a46', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:33:34', '2022-12-07 10:33:34', '2023-12-07 15:33:34'),
('fbaeddf093169d309f3c8323f427255a0f180a8d7ee16a50a6f8559b487148519478307d15d13509', 2, 1, 'app_api', '[]', 0, '2022-11-17 05:27:41', '2022-11-17 05:27:41', '2023-11-17 10:27:41'),
('fce881056eda29d18d3a5f64d0e22e23309c3886e2ecabe6c347bea815e12b588de4644acb8bf567', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:12:38', '2022-12-12 17:12:38', '2023-12-12 17:12:38'),
('ffce417119ad875946ff464c52696e66a1cac50b09ec2da29bc414eba3de01b47d3f646032d57571', 16, 1, 'app_api', '[]', 0, '2022-12-01 17:28:12', '2022-12-01 17:28:12', '2023-12-01 17:28:12'),
('fff071f2870648cd68819498161fe4f85b7cfbde088063c4744e8bdf61da3927fb14f06d3d9d0a65', 24, 1, 'app_api', '[]', 0, '2023-01-26 10:55:58', '2023-01-26 10:55:59', '2024-01-26 15:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'JWMXAbqjiXZndZxziXSY8FlaH6TbfZReZJZSf8vy', NULL, 'http://localhost', 1, 0, 0, '2022-11-16 05:32:07', '2022-11-16 05:32:07'),
(2, NULL, 'Laravel Password Grant Client', 'Kr7ZsK4iqDy47YBlsbIkGiYWrt9I2kT9N2yICjSJ', 'users', 'http://localhost', 0, 1, 0, '2022-11-16 05:32:07', '2022-11-16 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-16 05:32:07', '2022-11-16 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `penalty` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `customer_id`, `amount`, `penalty`, `currency`, `created_at`, `updated_at`) VALUES
(72, 'cus_NF3lkF8s82thE1', 1240.6, NULL, 'usd', '2023-01-26', '2023-01-26'),
(73, 'cus_NF3lkF8s82thE1', 2481.2, NULL, 'usd', '2023-01-18', '2023-01-26'),
(74, 'cus_NF3lkF8s82thE1', 3721.8, NULL, 'usd', '2023-01-18', '2023-01-26'),
(75, 'cus_NF3lkF8s82thE1', 4962.4, NULL, 'usd', '2023-01-18', '2023-01-26'),
(76, 'cus_NF3lkF8s82thE1', 6203, NULL, 'usd', '2023-01-18', '2023-01-26'),
(77, 'cus_NF3lkF8s82thE1', 7443.6, NULL, 'usd', '2023-01-18', '2023-01-26'),
(78, 'cus_NF3lkF8s82thE1', 8684.2, NULL, 'usd', '2023-01-18', '2023-01-26'),
(79, 'cus_NF3lkF8s82thE1', 9924.8, NULL, 'usd', '2023-01-18', '2023-01-26'),
(80, 'cus_NF3lkF8s82thE1', 11165.4, NULL, 'usd', '2023-01-18', '2023-01-26'),
(81, 'cus_NF3lkF8s82thE1', 12406, NULL, 'usd', '2023-01-26', '2023-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_code_passwords`
--

INSERT INTO `reset_code_passwords` (`email`, `code`, `created_at`, `updated_at`) VALUES
('joshwa@gmail.com', '9046', '2022-11-16 12:51:07', '2022-11-16 12:51:07'),
('user@gmail.com', '9753', '2022-11-21 15:51:04', '2022-11-21 15:51:04'),
('syedbaber115@gmail.com', '9184', '2022-12-01 14:19:08', '2022-12-01 14:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_wallets`
--

CREATE TABLE `temporary_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temporary_wallets`
--

INSERT INTO `temporary_wallets` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(23, '27', '0', '2023-01-26 11:02:48', '2023-01-27 07:52:42'),
(25, '29', '0', '2023-01-27 11:02:48', '2023-01-27 12:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `id` bigint UNSIGNED NOT NULL,
  `effective_date` date DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_conditions`
--

INSERT INTO `terms_and_conditions` (`id`, `effective_date`, `description`, `created_at`, `updated_at`) VALUES
(1, '2022-12-07', '<p></p><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; text-align: left; float: right; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><p></p><div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; text-align: left; float: left; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"text-align: left; margin: 0px 0px 15px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><br></div></div>', '2022-12-06 07:31:15', '2022-12-06 07:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `tranasactions`
--

CREATE TABLE `tranasactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tranasactions`
--

INSERT INTO `tranasactions` (`id`, `user_id`, `amount`, `date`, `reason`, `type`, `status`, `created_at`, `updated_at`) VALUES
(3, '24', 2000, 'Jan 25, 2023', 'shopping', 'Debit', 'Pending', '2023-01-25 10:18:59', '2023-01-25 10:18:59'),
(4, '24', 2000, 'Jan 25, 2023', 'shopping', 'Debit', 'Pending', '2023-01-25 10:19:30', '2023-01-25 10:19:30'),
(5, '24', 100, 'Jan 25, 2023', 'car maintainance', 'Debit', 'Pending', '2023-01-25 10:27:46', '2023-01-25 10:27:46'),
(6, '24', 256, 'Jan 25, 2023', 'rent', 'Debit', 'Pending', '2023-01-25 11:01:05', '2023-01-25 11:01:05'),
(7, '24', 2561, 'Jan 25, 2023', 'food', 'Debit', 'Approved', '2023-01-25 11:03:58', '2023-01-25 12:11:38'),
(8, '24', 2, 'Jan 25, 2023', 'shopping', 'Debit', 'Pending', '2023-01-25 11:06:19', '2023-01-25 11:06:19'),
(13, '1', 10, '10-15-2023', 'need', 'dabit', 'Approved', '2023-01-25 12:01:52', '2023-01-25 12:20:10'),
(14, '1', 20, '10-15-2023', 'need', 'dabit', 'Approved', '2023-01-25 12:02:44', '2023-01-25 12:24:03'),
(15, '27', 100, 'Jan 26, 2023', 'shopping', 'Debit', 'Pending', '2023-01-26 13:17:17', '2023-01-26 13:17:17'),
(16, '27', 100, 'Jan 26, 2023', 'shopping', 'Debit', 'Pending', '2023-01-26 13:18:58', '2023-01-26 13:18:58'),
(17, '27', 100, 'Jan 26, 2023', 'food', 'Debit', 'Pending', '2023-01-26 13:44:53', '2023-01-26 13:44:53'),
(18, '27', 50, 'Jan 26, 2023', 'food', 'Debit', 'Pending', '2023-01-26 13:58:37', '2023-01-26 13:58:37'),
(19, '27', 10, 'Jan 26, 2023', 'food', 'Debit', 'Pending', '2023-01-26 13:59:19', '2023-01-26 13:59:19'),
(20, '27', 10, 'Jan 26, 2023', 'food', 'Debit', 'Pending', '2023-01-26 13:59:37', '2023-01-26 13:59:37'),
(21, '27', 10, 'Jan 27, 2023', 'food', 'Debit', 'Pending', '2023-01-26 14:00:22', '2023-01-26 14:00:22'),
(22, '1', 20, '10-15-2023', 'need', 'dabit', 'Pending', '2023-01-26 14:02:10', '2023-01-26 14:02:10'),
(23, '1', 20, '10-15-2023', 'need', 'dabit', 'Pending', '2023-01-26 14:02:36', '2023-01-26 14:02:36'),
(24, '1', 20, '10-15-2023', 'need', 'dabit', 'Pending', '2023-01-26 14:02:46', '2023-01-26 14:02:46'),
(25, '1', 20, '10-15-2023', 'need', 'dabit', 'Pending', '2023-01-26 14:02:58', '2023-01-26 14:02:58'),
(26, '27', 20, 'Jan 27, 2023', 'food', 'Debit', 'Pending', '2023-01-26 14:03:09', '2023-01-26 14:03:09'),
(27, '27', 60, 'Jan 27, 2023', 'rent', 'Debit', 'Approved', '2023-01-26 14:04:10', '2023-01-27 08:02:41'),
(32, '27', 9012, 'Jan-27-2023', 'Goal Complete', 'Credit', 'Credit', '2023-01-27 11:53:30', '2023-01-27 11:53:30'),
(33, '29', 150, 'Jan-27-2023', 'Goal Complete', 'Credit', 'Credit', '2023-01-27 12:25:24', '2023-01-27 12:25:24'),
(34, '29', 150, 'Jan-27-2023', 'Goal Complete', 'Credit', 'Credit', '2023-01-27 12:25:24', '2023-01-27 12:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_goal` tinyint(1) DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `current_plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'basic',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `country`, `email`, `photo`, `email_code`, `is_goal`, `email_verified_at`, `password`, `role`, `current_plan`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'joshwa', NULL, NULL, NULL, 'joshwa@gmail.com', NULL, '', 0, '2022-11-17 05:38:01', '$2a$12$MGyNmT/kFSdaNlkxm00uIenIq9JeRoaC2dJ0g8nE30gU7vZIkBbVC', 'user', 'premium', NULL, '2022-11-16 05:45:43', '2023-01-31 06:26:20', 'cus_NEGpyczt3HZfny', NULL, NULL, NULL),
(6, 'Jhon Wick', NULL, NULL, NULL, 'jhonwick@gmail.com', NULL, '', 0, '2022-11-17 05:38:01', '$2y$10$Sh1YQgqFKs7jBbOeGgi/5.f9Psy2gADyqiqKrUFgSdbUkbq0yw7/G', 'user', 'basic', NULL, '2022-11-17 05:37:39', '2022-11-17 05:38:01', NULL, NULL, NULL, NULL),
(7, 'Deni', NULL, NULL, NULL, 'user@gmail.com', NULL, NULL, 0, '2022-11-21 15:30:16', '12345678', 'user', 'basic', NULL, '2022-11-21 15:21:21', '2022-11-21 15:59:26', NULL, NULL, NULL, NULL),
(8, 'ashley', 'asin', '934575454', 'US', 'asin@gmail.com', NULL, NULL, 0, '2022-11-22 15:56:48', '$2y$10$RzCXrR903SkMSA9KGiLQNeh6whbqiQ6yzcuDO.AfPHtdC/zAvlWIC', 'user', 'basic', NULL, '2022-11-22 10:55:06', '2023-01-18 13:23:37', NULL, NULL, NULL, NULL),
(9, 'john', 'smith', '+923112048588', 'USA', 'syedbaber115@gmail.com', 'https://www.amazing-grothendieck.23-83-37-162.plesk.page/uploads/user/profiles/672ceeadad52c5ba11a7a9343b4d33afPayMefirst.jpg', '9918', 1, '2022-12-01 15:56:17', '$2y$10$J/CllIFYT.2f.oaVUOw7p.cAmjXEpFsP1D5xIgCBwfmkUHcArd6US', 'user', 'premium', NULL, '2022-12-01 13:12:48', '2023-01-18 15:31:28', NULL, NULL, NULL, NULL),
(12, 'yasir', 'saeed', '+2345456789', 'Pakistan', 'yasirsssss@gmail.com', NULL, '9564', 0, '2022-11-21 15:30:16', '$2y$10$MAm2LgEu8reoXWTPXa12.OzhtxPQkQE6dsUIbpSVZ4em6wSrovhau', 'user', 'basic', NULL, '2022-12-01 17:09:47', '2022-12-01 17:09:47', NULL, NULL, NULL, NULL),
(13, 'yasir', 'saeed', '+23454567899', 'Pakistan', 'yasirssssss@gmail.com', NULL, '9272', 0, '2022-11-21 15:30:16', '$2y$10$th.mz2ANfkGQ.ZNpzAS3xeOZBMB.M6.TUlPw9swfjJr90dItOQXxq', 'user', 'basic', NULL, '2022-12-01 17:12:48', '2022-12-01 17:12:48', NULL, NULL, NULL, NULL),
(14, 'Baber', 'bab', '+923112048585', 'Pakistan', 'Syedbaber2@Gmail.com', NULL, '9876', 1, '2022-11-21 15:30:16', '$2y$10$efuHXQy0EK0EKEUfeu7Deu6v38ZshxmkpVuahvF1jMbk4ff2kQmYi', 'user', 'basic', NULL, '2022-12-01 17:26:31', '2022-12-01 17:26:31', NULL, NULL, NULL, NULL),
(15, 'Baber', 'bab', '+923112048582', 'Pakistan', 'Syedbaber22@Gmail.com', NULL, '9909', 1, '2022-11-21 15:30:16', '$2y$10$rWZCzD2tjpePhlxD/VAzXu9NqEwPJQfwc9/Do2J3iRccoSz.MskqO', 'user', 'basic', NULL, '2022-12-01 17:27:36', '2022-12-01 17:27:36', NULL, NULL, NULL, NULL),
(16, 'Baber', 'bab', '+923112048581', 'Pakistan', 'Syedbaber52@Gmail.com', NULL, '9322', 1, '2022-11-21 15:30:16', '$2y$10$SiBOOlLc6sPQGOD6bAeQJusWobgOIJw0xZO8ngohEDYu7429ZIRcW', 'user', 'basic', NULL, '2022-12-01 17:28:10', '2022-12-01 17:28:10', NULL, NULL, NULL, NULL),
(17, 'Baber', 'bab', '+923112048580', 'Pakistan', 'Syedbaber53@Gmail.com', NULL, '9803', 1, '2022-11-21 15:30:16', '$2y$10$WkHBfOx3y7w7AzVEK072teMRifaGOaQ/ptTdVgKUPU700/T/kbRxK', 'user', 'basic', NULL, '2022-12-01 17:29:23', '2022-12-01 17:29:23', NULL, NULL, NULL, NULL),
(18, 'Pay Me First', 'Admin', NULL, NULL, 'admin@gmail.com', NULL, '9803', 1, '2022-12-01 19:59:51', '$2a$12$MGyNmT/kFSdaNlkxm00uIenIq9JeRoaC2dJ0g8nE30gU7vZIkBbVC', 'admin', 'basic', NULL, '2022-12-02 06:59:29', '2022-12-02 06:59:29', NULL, NULL, NULL, NULL),
(19, 'austin', 'spencar', '+111111111', 'USA', 'austin.spencer@gmail.com', 'https://www.amazing-grothendieck.23-83-37-162.plesk.page/uploads/user/profiles/25a66a530d650309dddf76458fae93eaPayMefirst.jpg', '9803', 1, '2022-12-09 18:54:36', '$2y$10$CkJWGMkqeCRlF/pydny5I.EaP3armjotZVHud2Dkbg5YQvlZoNvJi', 'user', 'premium', NULL, '2022-12-09 13:52:52', '2022-12-12 17:41:46', NULL, NULL, NULL, NULL),
(20, 'paul', 'walker', '+921111111', 'pakistan', 'paulwalker@gmail.com', NULL, '9340', 0, '2022-11-21 15:30:16', '$2y$10$bsYRQg4kdjcV3/rvD/IO0.nocApPCkcDb7ddPHv5DwK9W5ZXmlOui', 'user', 'basic', NULL, '2022-12-12 17:19:07', '2022-12-12 17:19:07', NULL, NULL, NULL, NULL),
(21, 'hello', 'world', '03138506039', 'us', 'hello@gmail.com', 'http://paymefirst.test/uploads/user/profiles/36c7deb5fcc9df411efe5d650977ecf0PayMefirst.jpg', '9846', 0, '2022-11-21 15:30:16', '$2y$10$K1Q2NUzGhntDDCE6AQ/ZBetrtihqclSYSFIgTI.zYy1N3/YwUCej.', 'user', 'basic', NULL, '2023-01-18 12:18:56', '2023-01-23 09:04:14', 'cus_NDsNiZQjGwRxED', 'Visa', '4242', NULL),
(22, 'hello 1', 'world 1', '03323422026', 'us', 'hello123@gmail.com', 'http://paymefirst.test/uploads/user/profiles/02604efcc8db375d6bf6fa8a5a8f2a77PayMefirst.jpg', '9833', 0, '2022-11-21 15:30:16', '$2y$10$XVwbn2Yxt9AHdEFpSsO9t.JwJpOkb2jMxJNIzL0YtGrMKREAC8O4m', 'user', 'basic', NULL, '2023-01-23 08:43:29', '2023-01-23 08:43:29', NULL, NULL, NULL, NULL),
(23, 'hello 3', 'world 4', '03323422029', 'us', 'hello123345@gmail.com', 'http://paymefirst.test/uploads/user/profiles/9a069f10418cd79eaccdfa8c479d0dc7PayMefirst.jpg', '9578', 0, '2023-01-23 08:51:55', '$2y$10$S3z7zq5ZJZfQkBsOEitaCOVmPZbFhpxoAJ6OJ4p.GF8qKoqyq9kA2', 'user', 'basic', NULL, '2023-01-23 08:51:55', '2023-01-23 08:51:55', NULL, NULL, NULL, NULL),
(24, 'usr', 'john', '+9213235345234', 'Pakistan', 'user1@gmail.com', 'http://2c57-113-203-241-21.in.ngrok.io/uploads/user/profiles/fadc59c766bb387ab2f5c82d2e6b952aPayMefirst.png', '9839', 0, '2023-01-24 06:48:10', '$2y$10$JYtwgzPTEegOLIFSDrZOsexJ39iheW94AwA23TMEcaHd53/0khYzy', 'user', 'basic', NULL, '2023-01-24 06:48:10', '2023-01-24 13:19:24', 'cus_NEDahOdVND5pOS', 'MasterCard', '5454', NULL),
(27, 'Test', 'user1', '+920300000000', 'Pakistan', 'testuser1@gmail.com', 'http://9922-113-203-241-24.eu.ngrok.io/uploads/user/profiles/1a3c027040ddb61ae6f6f607fefd1153PayMefirst.png', '9465', 0, '2023-01-26 11:02:48', '$2y$10$Bcg6zCkLwyjr8bMcGif5NOZOyNkB5tP5Skxe8iFBI6jYc7ajO6eOS', 'user', 'basic', NULL, '2023-01-26 11:02:48', '2023-01-27 07:52:42', 'cus_NEcLgNoiThT6Jm', 'MasterCard', '5454', NULL),
(29, 'saad', 'Awan', '03042157462', 'pakistan', 'saad@user.com', 'http://paymefirst.test/uploads/user/profiles/f76709f44083a3404d2b04699fe45304PayMefirst.jpg', '9443', 0, '2023-01-27 06:27:27', '$2y$10$nd77O3uvSGapAQchPS0ScuS/bq64v.04nnqXWvpIKiXNGh.zc2rXC', 'user', 'basic', NULL, '2023-01-27 06:27:27', '2023-01-27 12:25:24', 'cus_NEGpyczt3HZfny', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_card_details`
--

CREATE TABLE `user_card_details` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_month` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_year` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvv` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_card_details`
--

INSERT INTO `user_card_details` (`id`, `user_id`, `card_name`, `card_number`, `exp_month`, `exp_year`, `cvv`, `created_at`, `updated_at`) VALUES
(1, 1, 'joshwa', '4242424242424242', '02', '26', '333', '2022-11-18 13:16:12', '2022-11-18 13:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `pending_amount`, `amount`, `withdraw`, `created_at`, `updated_at`) VALUES
(7, '1', '0', '0', '0', '2023-01-26 10:28:59', '2023-01-26 10:43:32'),
(8, '27', '400', '9012', '60', '2023-01-26 11:02:48', '2023-01-27 08:02:41'),
(10, '29', '0', '150', '0', '2023-01-27 06:27:27', '2023-01-27 06:40:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amin_infos`
--
ALTER TABLE `amin_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `financial_breakdowns`
--
ALTER TABLE `financial_breakdowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_histories`
--
ALTER TABLE `goal_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guides`
--
ALTER TABLE `guides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  ADD KEY `reset_code_passwords_email_index` (`email`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `temporary_wallets`
--
ALTER TABLE `temporary_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tranasactions`
--
ALTER TABLE `tranasactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_card_details`
--
ALTER TABLE `user_card_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amin_infos`
--
ALTER TABLE `amin_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_breakdowns`
--
ALTER TABLE `financial_breakdowns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `goal_histories`
--
ALTER TABLE `goal_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guides`
--
ALTER TABLE `guides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temporary_wallets`
--
ALTER TABLE `temporary_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tranasactions`
--
ALTER TABLE `tranasactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_card_details`
--
ALTER TABLE `user_card_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
