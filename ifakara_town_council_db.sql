-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2016 at 08:36 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ifakara_town_council_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '2016-12-13 07:25:46', '2016-12-13 07:25:46'),
(2, 1, '::1', '2016-12-13 07:31:28', '2016-12-13 07:31:28'),
(3, 1, '::1', '2016-12-13 07:34:52', '2016-12-13 07:34:52'),
(4, 1, '::1', '2016-12-13 07:44:19', '2016-12-13 07:44:19'),
(5, 1, '::1', '2016-12-15 04:03:28', '2016-12-15 04:03:28'),
(6, 1, '::1', '2016-12-15 04:24:33', '2016-12-15 04:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`) VALUES
(1, 'Admin', 'Person', 'admin', 'admin@domain.tld', '$2y$10$2eC4xFowmTXF6HbnADddIe0YVxQk1hv6nuACFEV6xV5z5VvRAkex.', NULL, '$2y$10$IvxaLbLmFzWTX/CjzUIxt.fBpi/smONNFI3GXQ6RAXOw7GlN32256', NULL, '', 1, NULL, '2016-12-15 04:24:32', '2016-12-13 07:24:21', '2016-12-15 04:24:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `permissions`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', NULL, '2016-12-13 07:24:21', '2016-12-13 07:24:21', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '::1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cms_theme_data`
--

INSERT INTO `cms_theme_data` (`id`, `theme`, `data`, `created_at`, `updated_at`) VALUES
(1, 'mikumi', '{"site_title":"Ifakara Town Council","site_tagline_country":"The United Republic of Tanzania","site_tagline_ministry":"President''s Office Regional Administration and Local Government","site_locale":"en","site_footer_copyright":"Copyright \\u00a92016 GWF . All rights reserved.","site_map_url":"","site_footer_facebook":"","site_footer_twitter":"","site_footer_google":"","site_footer_youtube":"","site_footer_instagram":"","site_footer_blogger":"","site_style_font_size":"","site_style_body_color":null,"site_style_top_bar_color":null,"site_style_menu_background_color":"#3498db","site_style_title_color":"#ecf0f1"}', '2016-12-13 07:36:13', '2016-12-14 03:29:41'),
(2, 'selous', '{"site_title":"Government Web Framework","site_tagline_country":"The United Republic of Tanzania","site_tagline_ministry":"President''s Office Regional Administration and Local Government","site_locale":"en","site_footer_copyright":"Copyright \\u00a92016 GWF . All rights reserved."}', '2016-12-13 08:50:57', '2016-12-13 08:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flosch_slideshow_slides`
--

CREATE TABLE `flosch_slideshow_slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slideshow_id` int(10) UNSIGNED DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `unpublished_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flosch_slideshow_slides`
--

INSERT INTO `flosch_slideshow_slides` (`id`, `name`, `description`, `link`, `sort_order`, `created_at`, `updated_at`, `slideshow_id`, `is_published`, `published_at`, `unpublished_at`) VALUES
(1, '0', '<p>Slide N°0</p>', 'http://example.com/', 1, '2016-12-13 07:18:44', '2016-12-15 02:11:29', 1, 0, NULL, NULL),
(2, '1', '<p>Slide N°1</p>', 'http://example.com/', 2, '2016-12-13 07:18:45', '2016-12-15 02:11:08', 1, 0, NULL, NULL),
(3, '2', '<p>Slide N°2</p>', 'http://example.com/', 3, '2016-12-13 07:18:45', '2016-12-15 02:10:49', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flosch_slideshow_slideshows`
--

CREATE TABLE `flosch_slideshow_slideshows` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flosch_slideshow_slideshows`
--

INSERT INTO `flosch_slideshow_slideshows` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Example', '2016-12-13 07:18:44', '2016-12-13 07:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `gwf_announcements_announcements`
--

CREATE TABLE `gwf_announcements_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `published_date` datetime NOT NULL,
  `activation_status` int(11) NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_complains_`
--

CREATE TABLE `gwf_complains_` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attachments` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recorder` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_contactus_contactus`
--

CREATE TABLE `gwf_contactus_contactus` (
  `id` int(11) NOT NULL,
  `physical_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `post_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_d` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_dashboardlinks_`
--

CREATE TABLE `gwf_dashboardlinks_` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `recorded_by` int(11) NOT NULL,
  `activation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_economicactivities_`
--

CREATE TABLE `gwf_economicactivities_` (
  `id` int(11) NOT NULL,
  `activityname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `recorder` int(11) NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `activation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_events_events`
--

CREATE TABLE `gwf_events_events` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `event_length` time NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `activation_status` tinyint(1) NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `audience` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `guest_of_honor` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `recorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_faq_faq`
--

CREATE TABLE `gwf_faq_faq` (
  `id` int(11) NOT NULL,
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_status` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_gallery_galleries`
--

CREATE TABLE `gwf_gallery_galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `activation_status` int(11) NOT NULL,
  `recorder` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_gallery_videos`
--

CREATE TABLE `gwf_gallery_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_status` tinyint(1) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_howdoi_howdoi`
--

CREATE TABLE `gwf_howdoi_howdoi` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_news_news`
--

CREATE TABLE `gwf_news_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `published_date` date NOT NULL,
  `activation_status` tinyint(1) NOT NULL,
  `recorder` int(11) NOT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_profiles_profiles`
--

CREATE TABLE `gwf_profiles_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `salutation` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `bio` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recorder` int(11) NOT NULL,
  `activation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_projectandinvestment_categories`
--

CREATE TABLE `gwf_projectandinvestment_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_projectandinvestment_projectsandinvestments`
--

CREATE TABLE `gwf_projectandinvestment_projectsandinvestments` (
  `id` int(10) UNSIGNED NOT NULL,
  `projectcategory_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `activation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_publication_publicationcategories`
--

CREATE TABLE `gwf_publication_publicationcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_publication_publications`
--

CREATE TABLE `gwf_publication_publications` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `publicationcategory_id` int(11) NOT NULL,
  `activation_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_quicklink_quick_links`
--

CREATE TABLE `gwf_quicklink_quick_links` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activationstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_relatedlink_related_links`
--

CREATE TABLE `gwf_relatedlink_related_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_status` tinyint(1) NOT NULL,
  `created_at` date NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_statistics_statistics`
--

CREATE TABLE `gwf_statistics_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gwf_welcomenote_welcome_notes`
--

CREATE TABLE `gwf_welcomenote_welcome_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `person` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recorder` int(11) NOT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2013_10_01_000001_Db_Deferred_Bindings', 1),
('2013_10_01_000002_Db_System_Files', 1),
('2013_10_01_000003_Db_System_Plugin_Versions', 1),
('2013_10_01_000004_Db_System_Plugin_History', 1),
('2013_10_01_000005_Db_System_Settings', 1),
('2013_10_01_000006_Db_System_Parameters', 1),
('2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
('2013_10_01_000008_Db_System_Mail_Templates', 1),
('2013_10_01_000009_Db_System_Mail_Layouts', 1),
('2014_10_01_000010_Db_Jobs', 1),
('2014_10_01_000011_Db_System_Event_Logs', 1),
('2014_10_01_000012_Db_System_Request_Logs', 1),
('2014_10_01_000013_Db_System_Sessions', 1),
('2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
('2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
('2015_10_01_000016_Db_Cache', 1),
('2015_10_01_000017_Db_System_Revisions', 1),
('2015_10_01_000018_Db_FailedJobs', 1),
('2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
('2016_10_01_000020_Db_System_Timestamp_Fix', 1),
('2013_10_01_000001_Db_Backend_Users', 2),
('2013_10_01_000002_Db_Backend_User_Groups', 2),
('2013_10_01_000003_Db_Backend_Users_Groups', 2),
('2013_10_01_000004_Db_Backend_User_Throttle', 2),
('2014_01_04_000005_Db_Backend_User_Preferences', 2),
('2014_10_01_000006_Db_Backend_Access_Log', 2),
('2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
('2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
('2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
('2014_10_01_000001_Db_Cms_Theme_Data', 3),
('2016_10_01_000002_Db_Cms_Timestamp_Fix', 3);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2016-12-13 07:21:41', '2016-12-13 07:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_html` longtext COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_posts`
--

INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\r\n\r\nYou can edit this content by selecting **Blog** from the administration back-end menu.\r\n\r\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2016-12-13 07:21:41', 1, '2016-12-13 07:21:41', '2016-12-13 07:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_sitemap_definitions`
--

CREATE TABLE `rainlab_sitemap_definitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_attributes`
--

CREATE TABLE `rainlab_translate_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_indexes`
--

CREATE TABLE `rainlab_translate_indexes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_locales`
--

CREATE TABLE `rainlab_translate_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_translate_locales`
--

INSERT INTO `rainlab_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`) VALUES
(1, 'en', 'English', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_messages`
--

CREATE TABLE `rainlab_translate_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_translate_messages`
--

INSERT INTO `rainlab_translate_messages` (`id`, `code`, `message_data`) VALUES
(1, 'latest.news', '{"x":"Latest News"}'),
(2, 'more', '{"x":"More"}'),
(3, 'events', '{"x":"Events"}'),
(4, 'announcements', '{"x":"Announcements"}'),
(5, 'dashboard', '{"x":"Dashboard"}'),
(6, 'quick.statistics', '{"x":"Quick Statistics"}'),
(7, 'more.statistics', '{"x":"More Statistics"}'),
(8, 'project.investment', '{"x":"Project & Investment"}'),
(9, 'view.all', '{"x":"View All"}'),
(10, 'documents', '{"x":"Documents"}'),
(11, 'how.do.i', '{"x":"How Do I"}'),
(12, 'economic.activities', '{"x":"Economic Activities"}'),
(13, 'contact.us', '{"x":"Contact Us"}'),
(14, 'faq', '{"x":"FAQ"}'),
(15, 'staff.mail', '{"x":"Staff Mail"}'),
(16, '', '{"x":null}'),
(17, 'home', '{"x":"Home"}'),
(18, 'about.us', '{"x":"About Us"}'),
(19, 'history', '{"x":"History"}'),
(20, 'mission.and.vision', '{"x":"Mission and Vision"}'),
(21, 'administration', '{"x":"Administration"}'),
(22, 'organization.structure', '{"x":"Organization Structure"}'),
(23, 'units', '{"x":"Units"}'),
(24, 'unit.name', '{"x":"Unit Name"}'),
(25, 'publications', '{"x":"Publications"}'),
(26, 'guidelines', '{"x":"Guidelines"}'),
(27, 'forms', '{"x":"Forms"}'),
(28, 'procedures', '{"x":"Procedures"}'),
(29, 'reports', '{"x":"Reports"}'),
(30, 'acts', '{"x":"Acts"}'),
(31, 'media.center', '{"x":"Media Center"}'),
(32, 'press.release', '{"x":"Press Release"}'),
(33, 'videos', '{"x":"Videos"}'),
(34, 'speeches', '{"x":"Speeches"}'),
(35, 'photo.gallery', '{"x":"Photo Gallery"}'),
(36, 'news', '{"x":"News"}'),
(37, 'quick.links', '{"x":"Quick Links"}'),
(38, 'related.links', '{"x":"Related Links"}'),
(39, 'recent.video', '{"x":"Recent Video"}'),
(40, 'more.videos', '{"x":"More Videos"}'),
(41, 'privacy.policy', '{"x":"Privacy Policy"}'),
(42, 'disclamer', '{"x":"Disclamer"}'),
(43, 'sitemap', '{"x":"Sitemap"}'),
(44, 'the.united.republic.of.tanzania', '{"x":"The United Republic of Tanzania"}'),
(45, 'presidents.office.regional.administration.and.local.government', '{"x":"President''s Office Regional Administration and Local Government"}'),
(46, 'ifakara.town.council', '{"x":"Ifakara Town Council"}'),
(47, 'copyright.2016.gwf.all.rights.reserved', '{"x":"Copyright \\u00a92016 GWF . All rights reserved."}'),
(48, 'welcome.note', '{"x":"Welcome Note"}'),
(49, 'more.announcements', '{"x":"More Announcements"}'),
(50, 'more.events', '{"x":"More Events"}'),
(51, 'dashboards', '{"x":"Dashboards"}'),
(52, 'statistics', '{"x":"Statistics"}'),
(53, 'webmail', '{"x":"Webmail"}'),
(54, 'structure', '{"x":"Structure"}'),
(55, 'districts', '{"x":"Districts"}'),
(56, 'babati', '{"x":"Babati"}'),
(57, 'mbulu', '{"x":"Mbulu"}'),
(58, 'hanang', '{"x":"Hanang"}'),
(59, 'kiteto', '{"x":"Kiteto"}'),
(60, 'simanjiro', '{"x":"Simanjiro"}'),
(61, 'departments', '{"x":"Departments"}'),
(62, 'human.resources', '{"x":"Human Resources"}'),
(63, 'planning.and.management', '{"x":"Planning and Management"}'),
(64, 'finance.and.accounts', '{"x":"Finance and Accounts"}'),
(65, 'internal.audit', '{"x":"Internal Audit"}'),
(66, 'procurement.and.supply', '{"x":"Procurement and Supply"}'),
(67, 'economy.and.production', '{"x":"Economy and Production"}'),
(68, 'infrastructure', '{"x":"Infrastructure"}'),
(69, 'local.government', '{"x":"Local Government"}'),
(70, 'social.welfare', '{"x":"Social Welfare"}'),
(71, 'ict', '{"x":"ICT"}'),
(72, 'health', '{"x":"Health"}'),
(73, 'education', '{"x":"Education"}'),
(74, 'water', '{"x":"Water"}'),
(75, 'investments', '{"x":"Investments"}'),
(76, 'investment.one', '{"x":"Investment One"}'),
(77, 'investment.two', '{"x":"Investment Two"}'),
(78, 'investment.three', '{"x":"Investment Three"}'),
(79, 'investment.four', '{"x":"Investment Four"}'),
(80, 'investment.five', '{"x":"Investment Five"}'),
(81, 'gallery', '{"x":"Gallery"}'),
(82, 'sports.and.games', '{"x":"Sports and Games"}'),
(83, 'press.releases', '{"x":"Press Releases"}'),
(84, 'social.media', '{"x":"Social Media"}'),
(85, 'government.web.framework', '{"x":"Government Web Framework"}');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_user_mail_blockers`
--

CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'exception ''ErrorException'' with message ''file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/f5/fa/f5faaca42824036e774b2e2e5fd622ec): failed to open stream: Permission denied'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php:81\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, ''file_put_conten...'', ''C:\\\\xampp\\\\htdocs...'', 81, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(81): file_put_contents(''C:\\\\xampp\\\\htdocs...'', ''1481643782a:1:{...'', 0)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Filesystem\\Filesystem.php(200): Illuminate\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643782a:1:{...'', false)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(102): October\\Rain\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643782a:1:{...'')\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(140): Illuminate\\Cache\\FileStore->put(''pages427345670'', Array, 10)\n#5 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(206): Illuminate\\Cache\\Repository->put(''pages427345670'', Array, 10)\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(638): Illuminate\\Cache\\Repository->remember(''pages427345670'', 10, Object(Closure))\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(250): October\\Rain\\Halcyon\\Builder->getCached(Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(238): October\\Rain\\Halcyon\\Builder->get()\n#9 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(228): October\\Rain\\Halcyon\\Builder->first()\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(120): October\\Rain\\Halcyon\\Builder->find(''single-news.htm'')\n#11 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(143): Cms\\Classes\\CmsObject::loadCached(Object(Cms\\Classes\\Theme), ''single-news.htm'')\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Theme.php(127): Cms\\Classes\\CmsObject::listInTheme(Object(Cms\\Classes\\Theme), false)\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(232): Cms\\Classes\\Theme->listPages()\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(203): Cms\\Classes\\Router->loadUrlMap()\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(184): Cms\\Classes\\Router->getUrlMap()\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(104): Cms\\Classes\\Router->getRouterObject()\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(158): Cms\\Classes\\Router->findByUrl(''/'')\n#18 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#19 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#20 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#21 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#23 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#29 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#45 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#48 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#51 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#54 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#57 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#59 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#60 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#61 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#62 {main}', NULL, '2016-12-13 12:33:02', '2016-12-13 12:33:02'),
(2, 'error', 'exception ''ErrorException'' with message ''file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/f5/fa/f5faaca42824036e774b2e2e5fd622ec): failed to open stream: Permission denied'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php:81\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, ''file_put_conten...'', ''C:\\\\xampp\\\\htdocs...'', 81, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(81): file_put_contents(''C:\\\\xampp\\\\htdocs...'', ''1481643782a:1:{...'', 0)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Filesystem\\Filesystem.php(200): Illuminate\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643782a:1:{...'', false)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(102): October\\Rain\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643782a:1:{...'')\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(140): Illuminate\\Cache\\FileStore->put(''pages427345670'', Array, 10)\n#5 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(206): Illuminate\\Cache\\Repository->put(''pages427345670'', Array, 10)\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(638): Illuminate\\Cache\\Repository->remember(''pages427345670'', 10, Object(Closure))\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(250): October\\Rain\\Halcyon\\Builder->getCached(Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(238): October\\Rain\\Halcyon\\Builder->get()\n#9 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(228): October\\Rain\\Halcyon\\Builder->first()\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(120): October\\Rain\\Halcyon\\Builder->find(''single-news.htm'')\n#11 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(143): Cms\\Classes\\CmsObject::loadCached(Object(Cms\\Classes\\Theme), ''single-news.htm'')\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Theme.php(127): Cms\\Classes\\CmsObject::listInTheme(Object(Cms\\Classes\\Theme), false)\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(232): Cms\\Classes\\Theme->listPages()\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(203): Cms\\Classes\\Router->loadUrlMap()\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(184): Cms\\Classes\\Router->getUrlMap()\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Router.php(104): Cms\\Classes\\Router->getRouterObject()\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(158): Cms\\Classes\\Router->findByUrl(''/'')\n#18 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#19 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#20 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#21 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#23 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#29 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#45 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#48 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#51 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#54 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#57 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#59 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#60 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#61 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#62 {main}', NULL, '2016-12-13 12:33:02', '2016-12-13 12:33:02'),
(3, 'error', 'exception ''ErrorException'' with message ''file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/b8/c2/b8c2d0ed29f6dd54f9dd781ad7fc4b6e): failed to open stream: Permission denied'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php:81\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, ''file_put_conten...'', ''C:\\\\xampp\\\\htdocs...'', 81, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(81): file_put_contents(''C:\\\\xampp\\\\htdocs...'', ''1481643783N;'', 0)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Filesystem\\Filesystem.php(200): Illuminate\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643783N;'', false)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(102): October\\Rain\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643783N;'')\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(140): Illuminate\\Cache\\FileStore->put(''partials-138774...'', NULL, 10)\n#5 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(206): Illuminate\\Cache\\Repository->put(''partials-138774...'', NULL, 10)\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(638): Illuminate\\Cache\\Repository->remember(''partials-138774...'', 10, Object(Closure))\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(250): October\\Rain\\Halcyon\\Builder->getCached(Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(238): October\\Rain\\Halcyon\\Builder->get()\n#9 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(228): October\\Rain\\Halcyon\\Builder->first()\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(120): October\\Rain\\Halcyon\\Builder->find(''AllNews/default'')\n#11 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(828): Cms\\Classes\\CmsObject::loadCached(Object(Cms\\Classes\\Theme), ''AllNews/default'')\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(1000): Cms\\Classes\\Controller->renderPartial(''AllNews::defaul...'', Array, false)\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\twig\\Extension.php(139): Cms\\Classes\\Controller->renderComponent(''AllNews'', Array)\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\storage\\cms\\twig\\dd\\ddff84fdc78564c0f7be087c1da68fa942296dc786134833cb7a344bc805f0ee.php(129): Cms\\Twig\\Extension->componentFunction(''AllNews'', Array)\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(396): __TwigTemplate_e992ea7073679d621a013772327158c94ca32f513f0dea0328f9c83bd80460fb->doDisplay(Array, Array)\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(364): Twig_Template->displayWithErrorHandling(Array, Array)\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(375): Twig_Template->display(Array)\n#18 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(378): Twig_Template->render(Array)\n#19 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(216): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#20 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#21 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#23 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#25 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#32 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#50 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#52 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#53 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#55 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#56 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#59 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#61 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#62 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#63 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#64 {main}\n\nNext exception ''Twig_Error_Runtime'' with message ''An exception has been thrown during the rendering of a template ("file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/b8/c2/b8c2d0ed29f6dd54f9dd781ad7fc4b6e): failed to open stream: Permission denied") in "C:\\xampp\\htdocs\\ifakara_town_council/themes/mikumi/pages/home.htm" at line 60.'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php:411\nStack trace:\n#0 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(364): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(375): Twig_Template->display(Array)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(378): Twig_Template->render(Array)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(216): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#5 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2016-12-13 12:33:03', '2016-12-13 12:33:03');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(4, 'error', 'exception ''ErrorException'' with message ''file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/f4/db/f4dbe24a921750058a122284d265aa4d): failed to open stream: Permission denied'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php:81\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, ''file_put_conten...'', ''C:\\\\xampp\\\\htdocs...'', 81, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(81): file_put_contents(''C:\\\\xampp\\\\htdocs...'', ''1481643783N;'', 0)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Filesystem\\Filesystem.php(200): Illuminate\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643783N;'', false)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(102): October\\Rain\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643783N;'')\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(140): Illuminate\\Cache\\FileStore->put(''partials1635806...'', NULL, 10)\n#5 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(206): Illuminate\\Cache\\Repository->put(''partials1635806...'', NULL, 10)\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(638): Illuminate\\Cache\\Repository->remember(''partials1635806...'', 10, Object(Closure))\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(250): October\\Rain\\Halcyon\\Builder->getCached(Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(238): October\\Rain\\Halcyon\\Builder->get()\n#9 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(228): October\\Rain\\Halcyon\\Builder->first()\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(120): October\\Rain\\Halcyon\\Builder->find(''Announcement/de...'')\n#11 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(828): Cms\\Classes\\CmsObject::loadCached(Object(Cms\\Classes\\Theme), ''Announcement/de...'')\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(1000): Cms\\Classes\\Controller->renderPartial(''Announcement::d...'', Array, false)\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\twig\\Extension.php(139): Cms\\Classes\\Controller->renderComponent(''Announcement'', Array)\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\storage\\cms\\twig\\dd\\ddff84fdc78564c0f7be087c1da68fa942296dc786134833cb7a344bc805f0ee.php(162): Cms\\Twig\\Extension->componentFunction(''Announcement'', Array)\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(396): __TwigTemplate_e992ea7073679d621a013772327158c94ca32f513f0dea0328f9c83bd80460fb->doDisplay(Array, Array)\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(364): Twig_Template->displayWithErrorHandling(Array, Array)\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(375): Twig_Template->display(Array)\n#18 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(378): Twig_Template->render(Array)\n#19 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(216): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#20 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#21 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#23 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#25 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#32 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#50 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#52 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#53 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#55 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#56 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#59 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#61 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#62 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#63 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#64 {main}\n\nNext exception ''Twig_Error_Runtime'' with message ''An exception has been thrown during the rendering of a template ("file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/f4/db/f4dbe24a921750058a122284d265aa4d): failed to open stream: Permission denied") in "C:\\xampp\\htdocs\\ifakara_town_council/themes/mikumi/pages/home.htm" at line 77.'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php:411\nStack trace:\n#0 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(364): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(375): Twig_Template->display(Array)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(378): Twig_Template->render(Array)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(216): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#5 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2016-12-13 12:33:03', '2016-12-13 12:33:03'),
(5, 'error', 'exception ''ErrorException'' with message ''file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/45/f0/45f016752ed16a5a622cd07c6f52f9eb): failed to open stream: Permission denied'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php:81\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, ''file_put_conten...'', ''C:\\\\xampp\\\\htdocs...'', 81, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(81): file_put_contents(''C:\\\\xampp\\\\htdocs...'', ''1481643784N;'', 0)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Filesystem\\Filesystem.php(200): Illuminate\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643784N;'', false)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(102): October\\Rain\\Filesystem\\Filesystem->put(''C:\\\\xampp\\\\htdocs...'', ''1481643784N;'')\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(140): Illuminate\\Cache\\FileStore->put(''partials-655458...'', NULL, 10)\n#5 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(206): Illuminate\\Cache\\Repository->put(''partials-655458...'', NULL, 10)\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(638): Illuminate\\Cache\\Repository->remember(''partials-655458...'', 10, Object(Closure))\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(250): October\\Rain\\Halcyon\\Builder->getCached(Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(238): October\\Rain\\Halcyon\\Builder->get()\n#9 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\october\\rain\\src\\Halcyon\\Builder.php(228): October\\Rain\\Halcyon\\Builder->first()\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsObject.php(120): October\\Rain\\Halcyon\\Builder->find(''howdoilinks/def...'')\n#11 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(828): Cms\\Classes\\CmsObject::loadCached(Object(Cms\\Classes\\Theme), ''howdoilinks/def...'')\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(1000): Cms\\Classes\\Controller->renderPartial(''howdoilinks::de...'', Array, false)\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\twig\\Extension.php(139): Cms\\Classes\\Controller->renderComponent(''howdoilinks'', Array)\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\storage\\cms\\twig\\dd\\ddff84fdc78564c0f7be087c1da68fa942296dc786134833cb7a344bc805f0ee.php(280): Cms\\Twig\\Extension->componentFunction(''howdoilinks'', Array)\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(396): __TwigTemplate_e992ea7073679d621a013772327158c94ca32f513f0dea0328f9c83bd80460fb->doDisplay(Array, Array)\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(364): Twig_Template->displayWithErrorHandling(Array, Array)\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(375): Twig_Template->display(Array)\n#18 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(378): Twig_Template->render(Array)\n#19 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(216): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#20 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#21 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#23 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#25 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#32 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#50 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#52 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#53 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#55 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#56 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#59 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#61 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#62 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#63 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#64 {main}\n\nNext exception ''Twig_Error_Runtime'' with message ''An exception has been thrown during the rendering of a template ("file_put_contents(C:\\xampp\\htdocs\\ifakara_town_council\\storage\\framework/cache/45/f0/45f016752ed16a5a622cd07c6f52f9eb): failed to open stream: Permission denied") in "C:\\xampp\\htdocs\\ifakara_town_council/themes/mikumi/pages/home.htm" at line 139.'' in C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php:411\nStack trace:\n#0 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(364): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\twig\\twig\\lib\\Twig\\Template.php(375): Twig_Template->display(Array)\n#2 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(378): Twig_Template->render(Array)\n#3 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\Controller.php(216): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\xampp\\htdocs\\ifakara_town_council\\modules\\cms\\classes\\CmsController.php(48): Cms\\Classes\\Controller->run(''/'')\n#5 [internal function]: Cms\\Classes\\CmsController->run(''/'')\n#6 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#8 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), ''run'')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''run'')\n#15 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), ''Cms\\\\Classes\\\\Cms...'', ''run'')\n#16 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 C:\\xampp\\htdocs\\ifakara_town_council\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\ifakara_town_council\\index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2016-12-13 12:33:04', '2016-12-13 12:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '584fd0cd2403e829206766.png', 'egalogo.png', 24659, 'image/png', NULL, NULL, 'logo', '1', 'Backend\\Models\\BrandSetting', 1, 1, '2016-12-13 07:43:25', '2016-12-13 07:43:52'),
(2, '585225cd5b196692873135.jpg', '03.jpg', 904139, 'image/jpeg', NULL, NULL, 'image', '3', 'Flosch\\Slideshow\\Models\\Slide', 1, 2, '2016-12-15 02:10:37', '2016-12-15 02:10:49'),
(3, '585225e65b38c937081521.jpg', '08.jpg', 67760, 'image/jpeg', NULL, NULL, 'image', '2', 'Flosch\\Slideshow\\Models\\Slide', 1, 3, '2016-12-15 02:11:02', '2016-12-15 02:11:08'),
(4, '585225fcb2e6b328483374.jpg', '22019.jpg', 83407, 'image/jpeg', NULL, NULL, 'image', '1', 'Flosch\\Slideshow\\Models\\Slide', 1, 4, '2016-12-15 02:11:24', '2016-12-15 02:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', '<html>\n    <head>\n        <style type="text/css" media="screen">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>', '{{ content|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2016-12-13 07:24:20', '2016-12-13 07:24:20'),
(2, 'System', 'system', '<html>\n    <head>\n        <style type="text/css" media="screen">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2016-12-13 07:24:20', '2016-12-13 07:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1481873052'),
(3, 'cms', 'theme', 'active', '"mikumi"');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'Flosch.Slideshow', 'script', '1.0.1', 'create_slideshows_table.php', '2016-12-13 07:18:39'),
(2, 'Flosch.Slideshow', 'script', '1.0.1', 'create_slides_table.php', '2016-12-13 07:18:44'),
(3, 'Flosch.Slideshow', 'script', '1.0.1', 'seeder.php', '2016-12-13 07:18:46'),
(4, 'Flosch.Slideshow', 'comment', '1.0.1', 'First version of Slideshow', '2016-12-13 07:18:46'),
(5, 'Flosch.Slideshow', 'script', '1.0.2', 'table_update_flosch_slideshow_slides.php', '2016-12-13 07:18:49'),
(6, 'Flosch.Slideshow', 'comment', '1.0.2', 'Added is_published state and publication dates', '2016-12-13 07:18:49'),
(7, 'Flosch.Slideshow', 'comment', '1.0.3', 'Update documentation for Twitter Bootstrap sources', '2016-12-13 07:18:49'),
(8, 'Flosch.Slideshow', 'comment', '1.0.4', 'Update slides published query-scope (correct dates comparison)', '2016-12-13 07:18:50'),
(9, 'Flosch.Slideshow', 'comment', '1.0.5', 'Fix permission settings', '2016-12-13 07:18:50'),
(10, 'Flosch.Slideshow', 'script', '1.0.6', 'Add french translation', '2016-12-13 07:18:50'),
(11, 'Flosch.Slideshow', 'comment', '1.0.6', 'Add persian translation (thanks to @cracki)', '2016-12-13 07:18:51'),
(12, 'Flosch.Slideshow', 'comment', '1.0.7', 'Add german translation (thanks to @danielbruni)', '2016-12-13 07:18:51'),
(13, 'Flosch.Slideshow', 'comment', '1.0.8', 'Correct columns definition (thanks to @Jeime)', '2016-12-13 07:18:52'),
(14, 'Gwf.announcements', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:18:52'),
(15, 'Gwf.announcements', 'script', '1.0.2', 'builder_table_create_gwf_announcements_announcements.php', '2016-12-13 07:18:53'),
(16, 'Gwf.announcements', 'comment', '1.0.2', 'Created table gwf_announcements_announcements', '2016-12-13 07:18:53'),
(17, 'Gwf.announcements', 'script', '1.0.3', 'builder_table_update_gwf_announcements_announcements.php', '2016-12-13 07:18:56'),
(18, 'Gwf.announcements', 'comment', '1.0.3', 'Updated table gwf_announcements_announcements', '2016-12-13 07:18:56'),
(19, 'gwf.Complains', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:18:56'),
(20, 'gwf.Complains', 'script', '1.0.2', 'builder_table_create_gwf_complains_.php', '2016-12-13 07:18:58'),
(21, 'gwf.Complains', 'comment', '1.0.2', 'Created table gwf_complains_', '2016-12-13 07:18:58'),
(22, 'gwf.Complains', 'script', '1.0.3', 'builder_table_update_gwf_complains_.php', '2016-12-13 07:18:59'),
(23, 'gwf.Complains', 'comment', '1.0.3', 'Updated table gwf_complains_', '2016-12-13 07:18:59'),
(24, 'gwf.Complains', 'script', '1.0.4', 'builder_table_update_gwf_complains__2.php', '2016-12-13 07:19:01'),
(25, 'gwf.Complains', 'comment', '1.0.4', 'Updated table gwf_complains_', '2016-12-13 07:19:01'),
(26, 'Gwf.Contactus', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:02'),
(27, 'Gwf.Contactus', 'script', '1.0.2', 'builder_table_create_gwf_contactus_contactus.php', '2016-12-13 07:19:03'),
(28, 'Gwf.Contactus', 'comment', '1.0.2', 'Created table gwf_contactus_contactus', '2016-12-13 07:19:03'),
(29, 'Gwf.Contactus', 'script', '1.0.3', 'builder_table_update_gwf_contactus_contactus.php', '2016-12-13 07:19:09'),
(30, 'Gwf.Contactus', 'comment', '1.0.3', 'Updated table gwf_contactus_contactus', '2016-12-13 07:19:09'),
(31, 'gwf.Dashboardlinks', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:10'),
(32, 'gwf.Dashboardlinks', 'script', '1.0.2', 'builder_table_create_gwf_dashboardlinks_.php', '2016-12-13 07:19:11'),
(33, 'gwf.Dashboardlinks', 'comment', '1.0.2', 'Created table gwf_dashboardlinks_', '2016-12-13 07:19:11'),
(34, 'Gwf.EconomicActivities', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:12'),
(35, 'Gwf.EconomicActivities', 'script', '1.0.2', 'builder_table_create_gwf_economicactivities_.php', '2016-12-13 07:19:15'),
(36, 'Gwf.EconomicActivities', 'comment', '1.0.2', 'Created table gwf_economicactivities_', '2016-12-13 07:19:15'),
(37, 'Gwf.EconomicActivities', 'script', '1.0.3', 'builder_table_update_gwf_economicactivities_.php', '2016-12-13 07:19:18'),
(38, 'Gwf.EconomicActivities', 'comment', '1.0.3', 'Updated table gwf_economicactivities_', '2016-12-13 07:19:19'),
(39, 'Gwf.Events', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:19'),
(40, 'Gwf.Events', 'script', '1.0.2', 'builder_table_create_gwf_events_.php', '2016-12-13 07:19:21'),
(41, 'Gwf.Events', 'comment', '1.0.2', 'Created table gwf_events_', '2016-12-13 07:19:22'),
(42, 'Gwf.Events', 'script', '1.0.3', 'builder_table_update_gwf_events_events.php', '2016-12-13 07:19:26'),
(43, 'Gwf.Events', 'comment', '1.0.3', 'Updated table gwf_events_', '2016-12-13 07:19:26'),
(44, 'Gwf.Events', 'script', '1.0.4', 'builder_table_update_gwf_events_events_2.php', '2016-12-13 07:19:26'),
(45, 'Gwf.Events', 'comment', '1.0.4', 'Updated table gwf_events_events', '2016-12-13 07:19:27'),
(46, 'Gwf.Events', 'script', '1.0.5', 'builder_table_update_gwf_events_events_3.php', '2016-12-13 07:19:29'),
(47, 'Gwf.Events', 'comment', '1.0.5', 'Updated table gwf_events_events', '2016-12-13 07:19:29'),
(48, 'Gwf.Events', 'script', '1.0.6', 'builder_table_update_gwf_events_events_4.php', '2016-12-13 07:19:32'),
(49, 'Gwf.Events', 'comment', '1.0.6', 'Updated table gwf_events_events', '2016-12-13 07:19:32'),
(50, 'Gwf.Events', 'script', '1.0.7', 'builder_table_update_gwf_events_events_5.php', '2016-12-13 07:19:34'),
(51, 'Gwf.Events', 'comment', '1.0.7', 'Updated table gwf_events_events', '2016-12-13 07:19:34'),
(52, 'Gwf.Events', 'script', '1.0.8', 'builder_table_update_gwf_events_events_6.php', '2016-12-13 07:19:37'),
(53, 'Gwf.Events', 'comment', '1.0.8', 'Updated table gwf_events_events', '2016-12-13 07:19:37'),
(54, 'Gwf.Faq', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:37'),
(55, 'Gwf.Faq', 'script', '1.0.2', 'builder_table_create_gwf_faq_.php', '2016-12-13 07:19:38'),
(56, 'Gwf.Faq', 'comment', '1.0.2', 'Created table gwf_faq_', '2016-12-13 07:19:38'),
(57, 'Gwf.Faq', 'script', '1.0.3', 'builder_table_update_gwf_faq_faq.php', '2016-12-13 07:19:43'),
(58, 'Gwf.Faq', 'comment', '1.0.3', 'Updated table gwf_faq_', '2016-12-13 07:19:43'),
(59, 'Gwf.Faq', 'script', '1.0.4', 'builder_table_update_gwf_faq_faq_2.php', '2016-12-13 07:19:45'),
(60, 'Gwf.Faq', 'comment', '1.0.4', 'Updated table gwf_faq_faq', '2016-12-13 07:19:45'),
(61, 'Gwf.Gallery', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:46'),
(62, 'Gwf.Gallery', 'script', '1.0.2', 'builder_table_create_gwf_gallery_galleries.php', '2016-12-13 07:19:47'),
(63, 'Gwf.Gallery', 'comment', '1.0.2', 'Created table gwf_gallery_galleries', '2016-12-13 07:19:47'),
(64, 'Gwf.Gallery', 'script', '1.0.9', 'builder_table_create_gwf_gallery_videos_2.php', '2016-12-13 07:19:49'),
(65, 'Gwf.Gallery', 'comment', '1.0.9', 'Created table gwf_gallery_videos', '2016-12-13 07:19:49'),
(66, 'gwf.Howdoi', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:50'),
(67, 'gwf.Howdoi', 'script', '1.0.2', 'builder_table_create_gwf_howdoi_howdoi.php', '2016-12-13 07:19:51'),
(68, 'gwf.Howdoi', 'comment', '1.0.2', 'Created table gwf_howdoi_howdoi', '2016-12-13 07:19:52'),
(69, 'gwf.Howdoi', 'script', '1.0.3', 'builder_table_update_gwf_howdoi_howdoi.php', '2016-12-13 07:19:55'),
(70, 'gwf.Howdoi', 'comment', '1.0.3', 'Updated table gwf_howdoi_howdoi', '2016-12-13 07:19:55'),
(71, 'gwf.Howdoi', 'script', '1.0.4', 'builder_table_update_gwf_howdoi_howdoi_2.php', '2016-12-13 07:19:58'),
(72, 'gwf.Howdoi', 'comment', '1.0.4', 'Updated table gwf_howdoi_howdoi', '2016-12-13 07:19:58'),
(73, 'Gwf.News', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:19:58'),
(74, 'Gwf.News', 'script', '1.0.7', 'builder_table_create_gwf_news_news.php', '2016-12-13 07:20:01'),
(75, 'Gwf.News', 'comment', '1.0.7', 'Created table gwf_news_news', '2016-12-13 07:20:01'),
(76, 'Gwf.Profiles', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:20:02'),
(77, 'Gwf.Profiles', 'script', '1.0.2', 'builder_table_create_gwf_profiles_profiles.php', '2016-12-13 07:20:03'),
(78, 'Gwf.Profiles', 'comment', '1.0.2', 'Created table gwf_profiles_profiles', '2016-12-13 07:20:03'),
(79, 'Gwf.Profiles', 'script', '1.0.3', 'builder_table_update_gwf_profiles_profiles.php', '2016-12-13 07:20:07'),
(80, 'Gwf.Profiles', 'comment', '1.0.3', 'Updated table gwf_profiles_profiles', '2016-12-13 07:20:07'),
(81, 'Gwf.Profiles', 'script', '1.0.4', 'builder_table_update_gwf_profiles_profiles_2.php', '2016-12-13 07:20:10'),
(82, 'Gwf.Profiles', 'comment', '1.0.4', 'Updated table gwf_profiles_profiles', '2016-12-13 07:20:11'),
(83, 'Gwf.Profiles', 'script', '1.0.5', 'builder_table_update_gwf_profiles_profiles_3.php', '2016-12-13 07:20:14'),
(84, 'Gwf.Profiles', 'comment', '1.0.5', 'Updated table gwf_profiles_profiles', '2016-12-13 07:20:14'),
(85, 'Gwf.Profiles', 'script', '1.0.6', 'builder_table_update_gwf_profiles_profiles_4.php', '2016-12-13 07:20:17'),
(86, 'Gwf.Profiles', 'comment', '1.0.6', 'Updated table gwf_profiles_profiles', '2016-12-13 07:20:17'),
(87, 'Gwf.Profiles', 'script', '1.0.7', 'builder_table_update_gwf_profiles_profiles_5.php', '2016-12-13 07:20:21'),
(88, 'Gwf.Profiles', 'comment', '1.0.7', 'Updated table gwf_profiles_profiles', '2016-12-13 07:20:21'),
(89, 'Gwf.Projectandinvestment', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:20:21'),
(90, 'Gwf.Projectandinvestment', 'script', '1.0.2', 'builder_table_create_gwf_projectandinvestment_projectsandinvestments.php', '2016-12-13 07:20:23'),
(91, 'Gwf.Projectandinvestment', 'comment', '1.0.2', 'Created table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:23'),
(92, 'Gwf.Projectandinvestment', 'script', '1.0.3', 'builder_table_update_gwf_projectandinvestment_projectsandinvestments.php', '2016-12-13 07:20:33'),
(93, 'Gwf.Projectandinvestment', 'comment', '1.0.3', 'Updated table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:33'),
(94, 'Gwf.Projectandinvestment', 'script', '1.0.4', 'builder_table_update_gwf_projectandinvestment_projectsandinvestments_2.php', '2016-12-13 07:20:37'),
(95, 'Gwf.Projectandinvestment', 'comment', '1.0.4', 'Updated table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:39'),
(96, 'Gwf.Projectandinvestment', 'script', '1.0.5', 'builder_table_update_gwf_projectandinvestment_projectsandinvestments_3.php', '2016-12-13 07:20:40'),
(97, 'Gwf.Projectandinvestment', 'comment', '1.0.5', 'Updated table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:41'),
(98, 'Gwf.Projectandinvestment', 'script', '1.0.6', 'builder_table_create_gwf_projectandinvestment_categories.php', '2016-12-13 07:20:42'),
(99, 'Gwf.Projectandinvestment', 'comment', '1.0.6', 'Created table gwf_projectandinvestment_categories', '2016-12-13 07:20:42'),
(100, 'Gwf.Projectandinvestment', 'script', '1.0.7', 'builder_table_update_gwf_projectandinvestment_projectsandinvestments_4.php', '2016-12-13 07:20:43'),
(101, 'Gwf.Projectandinvestment', 'comment', '1.0.7', 'Updated table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:43'),
(102, 'Gwf.Projectandinvestment', 'script', '1.0.8', 'builder_table_update_gwf_projectandinvestment_projectsandinvestments_5.php', '2016-12-13 07:20:45'),
(103, 'Gwf.Projectandinvestment', 'comment', '1.0.8', 'Updated table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:45'),
(104, 'Gwf.Projectandinvestment', 'script', '1.0.9', 'builder_table_update_gwf_projectandinvestment_projectsandinvestments_6.php', '2016-12-13 07:20:47'),
(105, 'Gwf.Projectandinvestment', 'comment', '1.0.9', 'Updated table gwf_projectandinvestment_projectsandinvestments', '2016-12-13 07:20:48'),
(106, 'gwf.Publication', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:20:48'),
(107, 'gwf.Publication', 'script', '1.0.2', 'builder_table_create_gwf_publication_publications.php', '2016-12-13 07:20:50'),
(108, 'gwf.Publication', 'comment', '1.0.2', 'Created table gwf_publication_publications', '2016-12-13 07:20:50'),
(109, 'gwf.Publication', 'script', '1.0.3', 'builder_table_create_gwf_publication_publicationcategories.php', '2016-12-13 07:20:51'),
(110, 'gwf.Publication', 'comment', '1.0.3', 'Created table gwf_publication_publicationcategories', '2016-12-13 07:20:51'),
(111, 'gwf.Publication', 'script', '1.0.4', 'builder_table_update_gwf_publication_publications.php', '2016-12-13 07:20:52'),
(112, 'gwf.Publication', 'comment', '1.0.4', 'Updated table gwf_publication_publications', '2016-12-13 07:20:53'),
(113, 'gwf.Publication', 'script', '1.0.5', 'builder_table_update_gwf_publication_publications_2.php', '2016-12-13 07:20:56'),
(114, 'gwf.Publication', 'comment', '1.0.5', 'Updated table gwf_publication_publications', '2016-12-13 07:20:56'),
(115, 'Gwf.Quicklink', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:20:56'),
(116, 'Gwf.Quicklink', 'script', '1.0.2', 'builder_table_create_gwf_quicklink_quick_links.php', '2016-12-13 07:21:00'),
(117, 'Gwf.Quicklink', 'comment', '1.0.2', 'Created table gwf_quicklink_quick_links', '2016-12-13 07:21:00'),
(118, 'Gwf.Quicklink', 'script', '1.0.3', 'builder_table_update_gwf_quicklink_quick_links.php', '2016-12-13 07:21:06'),
(119, 'Gwf.Quicklink', 'comment', '1.0.3', 'Updated table gwf_quicklink_quick_links', '2016-12-13 07:21:06'),
(120, 'gwf.Relatedlink', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:21:07'),
(121, 'gwf.Relatedlink', 'script', '1.0.2', 'builder_table_create_gwf_relatedlink_related_links.php', '2016-12-13 07:21:08'),
(122, 'gwf.Relatedlink', 'comment', '1.0.2', 'Created table gwf_relatedlink_related_links', '2016-12-13 07:21:08'),
(123, 'gwf.Statistics', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:21:08'),
(124, 'gwf.Statistics', 'script', '1.0.3', 'builder_table_create_gwf_statistics_statistics.php', '2016-12-13 07:21:10'),
(125, 'gwf.Statistics', 'comment', '1.0.3', 'Created table gwf_statistics_statistics', '2016-12-13 07:21:10'),
(126, 'Gwf.Welcomenote', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:21:10'),
(127, 'Gwf.Welcomenote', 'script', '1.0.2', 'builder_table_create_gwf_welcomenote_welcome_notes.php', '2016-12-13 07:21:12'),
(128, 'Gwf.Welcomenote', 'comment', '1.0.2', 'Created table gwf_welcomenote_welcome_notes', '2016-12-13 07:21:13'),
(129, 'Gwf.Welcomenote', 'script', '1.0.3', 'builder_table_update_gwf_welcomenote_welcome_notes.php', '2016-12-13 07:21:17'),
(130, 'Gwf.Welcomenote', 'comment', '1.0.3', 'Updated table gwf_welcomenote_welcome_notes', '2016-12-13 07:21:17'),
(131, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2016-12-13 07:21:17'),
(132, 'OFFLINE.SiteSearch', 'comment', '1.0.1', 'First version of SiteSearch', '2016-12-13 07:21:18'),
(133, 'OFFLINE.SiteSearch', 'comment', '1.0.2', 'Added experimental CMS pages results provider', '2016-12-13 07:21:18'),
(134, 'OFFLINE.SiteSearch', 'comment', '1.0.3', 'Added missing component', '2016-12-13 07:21:19'),
(135, 'OFFLINE.SiteSearch', 'comment', '1.0.4', 'Added support for RadiantWeb.ProBlog', '2016-12-13 07:21:19'),
(136, 'OFFLINE.SiteSearch', 'comment', '1.0.5', 'Moved configuration to the backend', '2016-12-13 07:21:19'),
(137, 'OFFLINE.SiteSearch', 'comment', '1.0.6', 'Fixed hardcoded url in pagination', '2016-12-13 07:21:20'),
(138, 'OFFLINE.SiteSearch', 'comment', '1.0.7', 'Add function for getting last page number (Thanks to vojtasvoboda)', '2016-12-13 07:21:20'),
(139, 'OFFLINE.SiteSearch', 'comment', '1.0.8', 'Add cs_CZ locale (Thanks to vojtasvoboda)', '2016-12-13 07:21:20'),
(140, 'OFFLINE.SiteSearch', 'comment', '1.0.9', 'Added support for ArrizalAmin.Portfolio plugin', '2016-12-13 07:21:21'),
(141, 'OFFLINE.SiteSearch', 'comment', '1.0.10', 'Removed unused component', '2016-12-13 07:21:21'),
(142, 'OFFLINE.SiteSearch', 'script', '1.1.0', 'Fixed bug where RainLab.Pages results were displayed twice', '2016-12-13 07:21:22'),
(143, 'OFFLINE.SiteSearch', 'script', '1.1.0', 'Honor disabled plugins setting', '2016-12-13 07:21:22'),
(144, 'OFFLINE.SiteSearch', 'script', '1.1.0', 'Generate absolute URLs in search results by default', '2016-12-13 07:21:22'),
(145, 'OFFLINE.SiteSearch', 'comment', '1.1.0', 'Added support for translated contents in RainLab.Pages, ArrizalAmin.Portfolio and RadiantWeb.ProBlog', '2016-12-13 07:21:22'),
(146, 'OFFLINE.SiteSearch', 'comment', '1.1.1', 'Added optimized siteSearchInclude component for cms pages search', '2016-12-13 07:21:22'),
(147, 'OFFLINE.SiteSearch', 'comment', '1.1.2', 'Fixed backend permissions', '2016-12-13 07:21:23'),
(148, 'OFFLINE.SiteSearch', 'comment', '1.1.3', 'Added ru_RU locale (Thanks to mokeev1995)', '2016-12-13 07:21:23'),
(149, 'OFFLINE.SiteSearch', 'script', '1.2.1', 'Refactored search providers and results page', '2016-12-13 07:21:24'),
(150, 'OFFLINE.SiteSearch', 'comment', '1.2.1', 'Added support for Feegleweb.Octoshop (Thanks to billyzduke)', '2016-12-13 07:21:24'),
(151, 'OFFLINE.SiteSearch', 'comment', '1.2.2', 'Minor bugfix in Feegleweb.Octoshop settings page translation', '2016-12-13 07:21:24'),
(152, 'OFFLINE.SiteSearch', 'comment', '1.2.3', 'Fixed bug where the search results sometimes broke the page layout', '2016-12-13 07:21:25'),
(153, 'OFFLINE.SiteSearch', 'comment', '1.2.4', 'Fixed bug where unavailable thumbnails lead to an error', '2016-12-13 07:21:25'),
(154, 'OFFLINE.SiteSearch', 'comment', '1.2.5', 'Fixed bug where the provider badge is not displayed for custom search providers', '2016-12-13 07:21:25'),
(155, 'OFFLINE.SiteSearch', 'comment', '1.2.6', 'Added support for Responsiv.Showcase (Thanks to MichiReich)', '2016-12-13 07:21:26'),
(156, 'OFFLINE.SiteSearch', 'comment', '1.2.7', 'Fixed bug where custom url settings were ignored in search results for some providers', '2016-12-13 07:21:26'),
(157, 'OFFLINE.SiteSearch', 'comment', '1.2.8', 'Added support for viewBag properties in RainLab.Pages', '2016-12-13 07:21:26'),
(158, 'OFFLINE.SiteSearch', 'comment', '1.2.9', 'Added support for static page component hosts', '2016-12-13 07:21:27'),
(159, 'OFFLINE.SiteSearch', 'comment', '1.2.10', 'Added support for multiple variables in Rainlab.Blog urls (Thanks to graker)', '2016-12-13 07:21:27'),
(160, 'OFFLINE.SiteSearch', 'comment', '1.2.11', 'Optimized handling of multibyte strings', '2016-12-13 07:21:28'),
(161, 'OFFLINE.SiteSearch', 'comment', '1.2.12', 'Added support for Jiri.Jkshop', '2016-12-13 07:21:28'),
(162, 'OFFLINE.SiteSearch', 'comment', '1.2.13', 'Minor bugfixes for marked queries in search results and Rainlab.Blog provider (Thanks to graker)', '2016-12-13 07:21:28'),
(163, 'OFFLINE.SiteSearch', 'comment', '1.2.14', 'Fixed bug in Jiri.JKShop provider', '2016-12-13 07:21:29'),
(164, 'OFFLINE.SiteSearch', 'comment', '1.2.15', 'Added a new meta property for search results (thanks to cracki)', '2016-12-13 07:21:29'),
(165, 'OFFLINE.SiteSearch', 'comment', '1.2.16', 'Added Persian (Farsi) translations (thanks to cracki)', '2016-12-13 07:21:30'),
(166, 'OFFLINE.SiteSearch', 'comment', '1.2.17', 'Added support for Indikator.News (thanks to gergo85)', '2016-12-13 07:21:30'),
(167, 'OFFLINE.SiteSearch', 'comment', '1.2.18', 'Fixed bug where titles of static pages where not searched (thanks to beenen445)', '2016-12-13 07:21:31'),
(168, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2016-12-13 07:21:35'),
(169, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2016-12-13 07:21:41'),
(170, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2016-12-13 07:21:42'),
(171, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:21:42'),
(172, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2016-12-13 07:21:42'),
(173, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2016-12-13 07:21:43'),
(174, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2016-12-13 07:21:43'),
(175, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2016-12-13 07:21:43'),
(176, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2016-12-13 07:21:44'),
(177, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2016-12-13 07:21:44'),
(178, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2016-12-13 07:21:45'),
(179, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2016-12-13 07:21:45'),
(180, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2016-12-13 07:21:45'),
(181, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate "idParam" component property in favour of "slug" property.', '2016-12-13 07:21:46'),
(182, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2016-12-13 07:21:46'),
(183, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2016-12-13 07:21:47'),
(184, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2016-12-13 07:21:47'),
(185, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2016-12-13 07:21:47'),
(186, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2016-12-13 07:21:48'),
(187, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2016-12-13 07:21:48'),
(188, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2016-12-13 07:21:49'),
(189, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2016-12-13 07:21:49'),
(190, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2016-12-13 07:21:49'),
(191, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2016-12-13 07:21:50'),
(192, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2016-12-13 07:21:50'),
(193, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2016-12-13 07:21:51'),
(194, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2016-12-13 07:21:51'),
(195, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2016-12-13 07:21:51'),
(196, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2016-12-13 07:21:52'),
(197, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2016-12-13 07:21:52'),
(198, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2016-12-13 07:21:53'),
(199, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2016-12-13 07:21:53'),
(200, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2016-12-13 07:21:54'),
(201, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2016-12-13 07:21:54'),
(202, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2016-12-13 07:21:55'),
(203, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2016-12-13 07:21:55'),
(204, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2016-12-13 07:21:56'),
(205, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2016-12-13 07:21:56'),
(206, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:21:57'),
(207, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2016-12-13 07:21:57'),
(208, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2016-12-13 07:21:58'),
(209, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2016-12-13 07:21:59'),
(210, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2016-12-13 07:22:00'),
(211, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2016-12-13 07:22:00'),
(212, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2016-12-13 07:22:00'),
(213, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2016-12-13 07:22:01'),
(214, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2016-12-13 07:22:01'),
(215, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2016-12-13 07:22:01'),
(216, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2016-12-13 07:22:02'),
(217, 'RainLab.GoogleAnalytics', 'comment', '1.0.1', 'Initialize plugin', '2016-12-13 07:22:02'),
(218, 'RainLab.GoogleAnalytics', 'comment', '1.0.2', 'Fixed a minor bug in the Top Pages widget', '2016-12-13 07:22:02'),
(219, 'RainLab.GoogleAnalytics', 'comment', '1.0.3', 'Minor improvements to the code', '2016-12-13 07:22:03'),
(220, 'RainLab.GoogleAnalytics', 'comment', '1.0.4', 'Fixes a bug where the certificate upload fails', '2016-12-13 07:22:03'),
(221, 'RainLab.GoogleAnalytics', 'comment', '1.0.5', 'Minor fix to support the updated Google Analytics library', '2016-12-13 07:22:04'),
(222, 'RainLab.GoogleAnalytics', 'comment', '1.0.6', 'Fixes dashboard widget using latest Google Analytics library', '2016-12-13 07:22:04'),
(223, 'RainLab.GoogleAnalytics', 'comment', '1.0.7', 'Removes Client ID from settings because the workflow no longer needs it', '2016-12-13 07:22:05'),
(224, 'RainLab.GoogleAnalytics', 'comment', '1.1.0', '!!! Updated to the latest Google API library', '2016-12-13 07:22:05'),
(225, 'RainLab.GoogleAnalytics', 'comment', '1.2.0', 'Update Guzzle library to version 6.0', '2016-12-13 07:22:06'),
(226, 'RainLab.GoogleAnalytics', 'comment', '1.2.1', 'Update the plugin compatibility with RC8 Google API client', '2016-12-13 07:22:06'),
(227, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2016-12-13 07:22:06'),
(228, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2016-12-13 07:22:07'),
(229, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2016-12-13 07:22:07'),
(230, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2016-12-13 07:22:08'),
(231, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2016-12-13 07:22:08'),
(232, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2016-12-13 07:22:09'),
(233, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2016-12-13 07:22:09'),
(234, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2016-12-13 07:22:10'),
(235, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2016-12-13 07:22:10'),
(236, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2016-12-13 07:22:11'),
(237, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2016-12-13 07:22:11'),
(238, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2016-12-13 07:22:12'),
(239, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2016-12-13 07:22:12'),
(240, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2016-12-13 07:22:13'),
(241, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2016-12-13 07:22:13'),
(242, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2016-12-13 07:22:13'),
(243, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2016-12-13 07:22:14'),
(244, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2016-12-13 07:22:14'),
(245, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2016-12-13 07:22:15'),
(246, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2016-12-13 07:22:15'),
(247, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2016-12-13 07:22:15'),
(248, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2016-12-13 07:22:16'),
(249, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2016-12-13 07:22:16'),
(250, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2016-12-13 07:22:17'),
(251, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2016-12-13 07:22:17'),
(252, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2016-12-13 07:22:17'),
(253, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2016-12-13 07:22:18'),
(254, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2016-12-13 07:22:18'),
(255, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2016-12-13 07:22:19'),
(256, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2016-12-13 07:22:19'),
(257, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2016-12-13 07:22:19'),
(258, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2016-12-13 07:22:20'),
(259, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2016-12-13 07:22:20'),
(260, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn''t save the contents to file.', '2016-12-13 07:22:20'),
(261, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2016-12-13 07:22:21'),
(262, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2016-12-13 07:22:21'),
(263, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2016-12-13 07:22:21'),
(264, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2016-12-13 07:22:22'),
(265, 'RainLab.Sitemap', 'comment', '1.0.1', 'First version of Sitemap', '2016-12-13 07:22:22'),
(266, 'RainLab.Sitemap', 'script', '1.0.2', 'create_definitions_table.php', '2016-12-13 07:22:26'),
(267, 'RainLab.Sitemap', 'comment', '1.0.2', 'Create definitions table', '2016-12-13 07:22:26'),
(268, 'RainLab.Sitemap', 'comment', '1.0.3', 'Minor improvements to the code.', '2016-12-13 07:22:27'),
(269, 'RainLab.Sitemap', 'comment', '1.0.4', 'Fixes issue where correct headers not being sent.', '2016-12-13 07:22:27'),
(270, 'RainLab.Sitemap', 'comment', '1.0.5', 'Minor back-end styling fix.', '2016-12-13 07:22:28'),
(271, 'RainLab.Sitemap', 'comment', '1.0.6', 'Minor fix to internal API.', '2016-12-13 07:22:28'),
(272, 'RainLab.Sitemap', 'comment', '1.0.7', 'Added access premissions.', '2016-12-13 07:22:28'),
(273, 'RainLab.Sitemap', 'comment', '1.0.8', 'Minor styling updates.', '2016-12-13 07:22:29'),
(274, 'RainLab.Translate', 'script', '1.0.1', 'create_messages_table.php', '2016-12-13 07:22:31'),
(275, 'RainLab.Translate', 'script', '1.0.1', 'create_attributes_table.php', '2016-12-13 07:22:35'),
(276, 'RainLab.Translate', 'script', '1.0.1', 'create_locales_table.php', '2016-12-13 07:22:38'),
(277, 'RainLab.Translate', 'script', '1.0.1', 'seed_all_tables.php', '2016-12-13 07:22:39'),
(278, 'RainLab.Translate', 'comment', '1.0.1', 'First version of Translate', '2016-12-13 07:22:39'),
(279, 'RainLab.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2016-12-13 07:22:40'),
(280, 'RainLab.Translate', 'comment', '1.0.3', 'Minor updates for latest October release.', '2016-12-13 07:22:40'),
(281, 'RainLab.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2016-12-13 07:22:41'),
(282, 'RainLab.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2016-12-13 07:22:41'),
(283, 'RainLab.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2016-12-13 07:22:41'),
(284, 'RainLab.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2016-12-13 07:22:42'),
(285, 'RainLab.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2016-12-13 07:22:42'),
(286, 'RainLab.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2016-12-13 07:22:43'),
(287, 'RainLab.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2016-12-13 07:22:43'),
(288, 'RainLab.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2016-12-13 07:22:44'),
(289, 'RainLab.Translate', 'comment', '1.1.0', 'Introduce compatibility with RainLab.Pages plugin.', '2016-12-13 07:22:44'),
(290, 'RainLab.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2016-12-13 07:22:45'),
(291, 'RainLab.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2016-12-13 07:22:45'),
(292, 'RainLab.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2016-12-13 07:22:46'),
(293, 'RainLab.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2016-12-13 07:22:47'),
(294, 'RainLab.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2016-12-13 07:22:47'),
(295, 'RainLab.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2016-12-13 07:22:48'),
(296, 'RainLab.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2016-12-13 07:22:49'),
(297, 'RainLab.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2016-12-13 07:22:49'),
(298, 'RainLab.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2016-12-13 07:22:49'),
(299, 'RainLab.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2016-12-13 07:22:50'),
(300, 'RainLab.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2016-12-13 07:22:50'),
(301, 'RainLab.Translate', 'script', '1.2.4', 'create_indexes_table.php', '2016-12-13 07:23:01'),
(302, 'RainLab.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2016-12-13 07:23:02'),
(303, 'RainLab.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2016-12-13 07:23:02'),
(304, 'RainLab.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2016-12-13 07:23:03'),
(305, 'RainLab.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2016-12-13 07:23:04'),
(306, 'RainLab.User', 'script', '1.0.1', 'create_users_table.php', '2016-12-13 07:23:14'),
(307, 'RainLab.User', 'script', '1.0.1', 'create_throttle_table.php', '2016-12-13 07:23:23'),
(308, 'RainLab.User', 'comment', '1.0.1', 'Initialize plugin.', '2016-12-13 07:23:23'),
(309, 'RainLab.User', 'comment', '1.0.2', 'Seed tables.', '2016-12-13 07:23:24'),
(310, 'RainLab.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings.', '2016-12-13 07:23:24'),
(311, 'RainLab.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager.', '2016-12-13 07:23:25'),
(312, 'RainLab.User', 'comment', '1.0.5', 'Added contact details for users.', '2016-12-13 07:23:25'),
(313, 'RainLab.User', 'script', '1.0.6', 'create_mail_blockers_table.php', '2016-12-13 07:23:29'),
(314, 'RainLab.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates.', '2016-12-13 07:23:30'),
(315, 'RainLab.User', 'comment', '1.0.7', 'Add back-end Settings page.', '2016-12-13 07:23:30'),
(316, 'RainLab.User', 'comment', '1.0.8', 'Updated the Settings page.', '2016-12-13 07:23:30'),
(317, 'RainLab.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2016-12-13 07:23:31'),
(318, 'RainLab.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2016-12-13 07:23:31'),
(319, 'RainLab.User', 'script', '1.0.11', 'users_add_login_column.php', '2016-12-13 07:23:35'),
(320, 'RainLab.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2016-12-13 07:23:36'),
(321, 'RainLab.User', 'script', '1.0.12', 'users_rename_login_to_username.php', '2016-12-13 07:23:36'),
(322, 'RainLab.User', 'comment', '1.0.12', 'Create a dedicated setting for choosing the login mode.', '2016-12-13 07:23:36'),
(323, 'RainLab.User', 'comment', '1.0.13', 'Minor fix to the Account sign in logic.', '2016-12-13 07:23:37'),
(324, 'RainLab.User', 'comment', '1.0.14', 'Minor improvements to the code.', '2016-12-13 07:23:37'),
(325, 'RainLab.User', 'script', '1.0.15', 'users_add_surname.php', '2016-12-13 07:23:39'),
(326, 'RainLab.User', 'comment', '1.0.15', 'Adds last name column to users table (surname).', '2016-12-13 07:23:39'),
(327, 'RainLab.User', 'comment', '1.0.16', 'Require permissions for settings page too.', '2016-12-13 07:23:39'),
(328, 'RainLab.User', 'comment', '1.1.0', '!!! Profile fields and Locations have been removed.', '2016-12-13 07:23:40'),
(329, 'RainLab.User', 'script', '1.1.1', 'create_user_groups_table.php', '2016-12-13 07:23:45'),
(330, 'RainLab.User', 'script', '1.1.1', 'seed_user_groups_table.php', '2016-12-13 07:23:45'),
(331, 'RainLab.User', 'comment', '1.1.1', 'Users can now be added to groups.', '2016-12-13 07:23:46'),
(332, 'RainLab.User', 'comment', '1.1.2', 'A raw URL can now be passed as the redirect property in the Account component.', '2016-12-13 07:23:46'),
(333, 'RainLab.User', 'comment', '1.1.3', 'Adds a super user flag to the users table, reserved for future use.', '2016-12-13 07:23:47'),
(334, 'RainLab.User', 'comment', '1.1.4', 'User list can be filtered by the group they belong to.', '2016-12-13 07:23:47'),
(335, 'RainLab.User', 'comment', '1.1.5', 'Adds a new permission to hide the User settings menu item.', '2016-12-13 07:23:47'),
(336, 'RainLab.User', 'script', '1.2.0', 'users_add_deleted_at.php', '2016-12-13 07:23:49'),
(337, 'RainLab.User', 'comment', '1.2.0', 'Users can now deactivate their own accounts.', '2016-12-13 07:23:49'),
(338, 'RainLab.User', 'comment', '1.2.1', 'New feature for checking if a user is recently active/online.', '2016-12-13 07:23:49'),
(339, 'RainLab.User', 'comment', '1.2.2', 'Add bulk action button to user list.', '2016-12-13 07:23:50'),
(340, 'RainLab.User', 'comment', '1.2.3', 'Included some descriptive paragraphs in the Reset Password component markup.', '2016-12-13 07:23:50'),
(341, 'RainLab.User', 'comment', '1.2.4', 'Added a checkbox for blocking all mail sent to the user.', '2016-12-13 07:23:50'),
(342, 'RainLab.User', 'script', '1.2.5', 'update_timestamp_nullable.php', '2016-12-13 07:23:51'),
(343, 'RainLab.User', 'comment', '1.2.5', 'Database maintenance. Updated all timestamp columns to be nullable.', '2016-12-13 07:23:51'),
(344, 'RainLab.User', 'script', '1.2.6', 'users_add_last_seen.php', '2016-12-13 07:23:54'),
(345, 'RainLab.User', 'comment', '1.2.6', 'Add a dedicated last seen column for users.', '2016-12-13 07:23:55'),
(346, 'RainLab.User', 'comment', '1.2.7', 'Minor fix to user timestamp attributes.', '2016-12-13 07:23:55'),
(347, 'RainLab.User', 'comment', '1.2.8', 'Add date range filter to users list. Introduced a logout event.', '2016-12-13 07:23:56'),
(348, 'RainLab.User', 'comment', '1.2.9', 'Add invitation mail for new accounts created in the back-end.', '2016-12-13 07:23:56'),
(349, 'RainLab.User', 'script', '1.3.0', 'users_add_guest_flag.php', '2016-12-13 07:24:00'),
(350, 'RainLab.User', 'script', '1.3.0', 'users_add_superuser_flag.php', '2016-12-13 07:24:03'),
(351, 'RainLab.User', 'comment', '1.3.0', 'Introduced guest user accounts.', '2016-12-13 07:24:03'),
(352, 'RainLab.User', 'comment', '1.3.1', 'User notification variables can now be extended.', '2016-12-13 07:24:04'),
(353, 'RainLab.User', 'comment', '1.3.2', 'Minor fix to the Auth::register method.', '2016-12-13 07:24:04'),
(354, 'RainLab.User', 'comment', '1.3.3', 'Allow prevention of concurrent user sessions via the user settings.', '2016-12-13 07:24:04'),
(355, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.1', 'First version', '2016-12-13 07:24:05'),
(356, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.2', 'New skin (Thanks Flynsarmy)', '2016-12-13 07:24:05'),
(357, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.3', 'Add setting to automatically apply to cms (Thanks Flynsarmy)', '2016-12-13 07:24:06'),
(358, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.4', 'Added file browser (Upload care), Added setting field for public key', '2016-12-13 07:24:06'),
(359, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.5', 'Error fixed by content and added skin.js file', '2016-12-13 07:24:06'),
(360, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.6', 'Added filebrowser (see documentation), Added new setting option for content entries, code cleanup', '2016-12-13 07:24:07'),
(361, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.7', 'Deleted Uploadcare plugin, changed settings page (skin, editor width and height, toolbar), added save hotkey', '2016-12-13 07:24:07'),
(362, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.8', 'Bug fixed, added editor language support', '2016-12-13 07:24:08'),
(363, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.9', 'Added Youtube plugin, Added ProEvents, ProBlog and Rainlab Static Pages to the settings page, CKeditor updated, code cleanup', '2016-12-13 07:24:09'),
(364, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.10', 'Code cleanup, added thank you message, security fix elfinder', '2016-12-13 07:24:10'),
(365, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.11', 'Update for RC', '2016-12-13 07:24:11'),
(366, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.12', 'Update for RC(2)', '2016-12-13 07:24:12'),
(367, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.13', 'Added component for Editable plugin. See documentation', '2016-12-13 07:24:12'),
(368, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.14', 'Elfinder is replaced for OctoberCMS Media Manger. (Only images for now)', '2016-12-13 07:24:13'),
(369, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.15', 'Multilanguage support (Backend). Added dutch language', '2016-12-13 07:24:13'),
(370, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.16', 'Editor bug fix', '2016-12-13 07:24:14'),
(371, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.17', 'Render bug fix', '2016-12-13 07:24:14'),
(372, 'ShahiemSeymor.Ckeditor', 'comment', '1.0.18', 'Problem with Rainlab Markdown editor  is now solved.', '2016-12-13 07:24:15'),
(373, 'Bedard.AnalyticsExtension', 'comment', '1.0.1', 'First version of Bedard.AnalyticsExtention', '2016-12-13 07:24:16'),
(374, 'Bedard.AnalyticsExtension', 'comment', '1.0.2', 'Minor fix to prevent errors in PHP 5.4 and below', '2016-12-13 07:24:17'),
(375, 'Bedard.AnalyticsExtension', 'comment', '1.0.3', 'Minor change for release candidate.', '2016-12-13 07:24:18'),
(376, 'Bedard.AnalyticsExtension', 'comment', '1.0.4', 'Add Russian translation', '2016-12-13 07:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'Flosch.Slideshow', '1.0.8', '2016-12-13 07:18:52', 0, 0),
(2, 'Gwf.announcements', '1.0.3', '2016-12-13 07:18:56', 0, 0),
(3, 'gwf.Complains', '1.0.4', '2016-12-13 07:19:02', 0, 0),
(4, 'Gwf.Contactus', '1.0.3', '2016-12-13 07:19:10', 0, 0),
(5, 'gwf.Dashboardlinks', '1.0.2', '2016-12-13 07:19:12', 0, 0),
(6, 'Gwf.EconomicActivities', '1.0.3', '2016-12-13 07:19:19', 0, 0),
(7, 'Gwf.Events', '1.0.8', '2016-12-13 07:19:37', 0, 0),
(8, 'Gwf.Faq', '1.0.4', '2016-12-13 07:19:46', 0, 0),
(9, 'Gwf.Gallery', '1.0.9', '2016-12-13 07:19:50', 0, 0),
(10, 'gwf.Howdoi', '1.0.4', '2016-12-13 07:19:58', 0, 0),
(11, 'Gwf.News', '1.0.7', '2016-12-13 07:20:01', 0, 0),
(12, 'Gwf.Profiles', '1.0.7', '2016-12-13 07:20:21', 0, 0),
(13, 'Gwf.Projectandinvestment', '1.0.9', '2016-12-13 07:20:48', 0, 0),
(14, 'gwf.Publication', '1.0.5', '2016-12-13 07:20:56', 0, 0),
(15, 'Gwf.Quicklink', '1.0.3', '2016-12-13 07:21:06', 0, 0),
(16, 'gwf.Relatedlink', '1.0.2', '2016-12-13 07:21:08', 0, 0),
(17, 'gwf.Statistics', '1.0.3', '2016-12-13 07:21:10', 0, 0),
(18, 'Gwf.Welcomenote', '1.0.3', '2016-12-13 07:21:17', 0, 0),
(19, 'October.Demo', '1.0.1', '2016-12-13 07:21:17', 0, 0),
(20, 'OFFLINE.SiteSearch', '1.2.18', '2016-12-13 07:21:31', 0, 0),
(21, 'RainLab.Blog', '1.2.14', '2016-12-13 07:21:57', 0, 0),
(22, 'RainLab.Builder', '1.0.11', '2016-12-13 07:22:02', 0, 0),
(23, 'RainLab.GoogleAnalytics', '1.2.1', '2016-12-13 07:22:06', 0, 0),
(24, 'RainLab.Pages', '1.2.12', '2016-12-13 07:22:22', 0, 0),
(25, 'RainLab.Sitemap', '1.0.8', '2016-12-13 07:22:29', 0, 0),
(26, 'RainLab.Translate', '1.2.7', '2016-12-13 07:23:04', 0, 0),
(27, 'RainLab.User', '1.3.3', '2016-12-13 07:24:05', 0, 0),
(28, 'ShahiemSeymor.Ckeditor', '1.0.18', '2016-12-13 07:24:15', 0, 0),
(29, 'Bedard.AnalyticsExtension', '1.0.4', '2016-12-13 07:24:19', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'backend_brand_settings', '{"app_name":"Gwf","app_tagline":"Ifakara Town Councel","primary_color":"#34495e","secondary_color":"#e67e22","accent_color":"#3498db","menu_mode":"collapse","custom_css":".mainmenu-collapsed > div ul.mainmenu-nav li a .nav-label {\\r\\n    position: relative;\\r\\n    bottom: 4px;\\r\\n    width: 160px;\\r\\n    left: 267%;\\r\\n    text-align: left;\\r\\n    float: left;\\r\\n    left: 100%;\\r\\n    margin-left: 0px;\\r\\n}\\r\\n.mainmenu-collapsed > div ul.mainmenu-nav li.active:first-child {\\r\\n    margin-left: 0;\\r\\n    margin-top: 40px;\\r\\n}\\r\\n\\r\\n.mainmenu-collapsed > div ul li a i {\\r\\n    font-size: 20px;\\r\\n}\\r\\n.mainmenu-collapsed > div ul.mainmenu-nav li { \\r\\n    width: 100%;\\r\\n    margin: 0px 0 0;\\r\\n    border-bottom: 1px solid rgba(238, 238, 238, 0.11);\\r\\n}\\r\\n.mainmenu-collapsed > div ul.mainmenu-nav li a {\\r\\n    height: 30px;\\r\\n}\\r\\n\\r\\n.mainmenu-collapsed > div ul.mainmenu-nav li a .nav-icon {\\r\\n    margin-top: -10.5px;\\r\\n               }\\r\\n               .mainmenu-collapsed > div ul {\\r\\n padding: 5px 0 15px 0px;\\r\\n}"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Guest', 'guest', 'Default group for guest users.', '2016-12-13 07:23:45', '2016-12-13 07:23:45'),
(2, 'Registered', 'registered', 'Default group for registered users.', '2016-12-13 07:23:45', '2016-12-13 07:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_throttle`
--

CREATE TABLE `user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`);

--
-- Indexes for table `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Indexes for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Indexes for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Indexes for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flosch_slideshow_slides`
--
ALTER TABLE `flosch_slideshow_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flosch_slideshow_slides_slideshow_id_foreign` (`slideshow_id`);

--
-- Indexes for table `flosch_slideshow_slideshows`
--
ALTER TABLE `flosch_slideshow_slideshows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_announcements_announcements`
--
ALTER TABLE `gwf_announcements_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_complains_`
--
ALTER TABLE `gwf_complains_`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_contactus_contactus`
--
ALTER TABLE `gwf_contactus_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_dashboardlinks_`
--
ALTER TABLE `gwf_dashboardlinks_`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_economicactivities_`
--
ALTER TABLE `gwf_economicactivities_`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_events_events`
--
ALTER TABLE `gwf_events_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_faq_faq`
--
ALTER TABLE `gwf_faq_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_gallery_galleries`
--
ALTER TABLE `gwf_gallery_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_gallery_videos`
--
ALTER TABLE `gwf_gallery_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_howdoi_howdoi`
--
ALTER TABLE `gwf_howdoi_howdoi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_news_news`
--
ALTER TABLE `gwf_news_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_profiles_profiles`
--
ALTER TABLE `gwf_profiles_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_projectandinvestment_categories`
--
ALTER TABLE `gwf_projectandinvestment_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_projectandinvestment_projectsandinvestments`
--
ALTER TABLE `gwf_projectandinvestment_projectsandinvestments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_publication_publicationcategories`
--
ALTER TABLE `gwf_publication_publicationcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_publication_publications`
--
ALTER TABLE `gwf_publication_publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_quicklink_quick_links`
--
ALTER TABLE `gwf_quicklink_quick_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_relatedlink_related_links`
--
ALTER TABLE `gwf_relatedlink_related_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_statistics_statistics`
--
ALTER TABLE `gwf_statistics_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gwf_welcomenote_welcome_notes`
--
ALTER TABLE `gwf_welcomenote_welcome_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Indexes for table `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Indexes for table `rainlab_sitemap_definitions`
--
ALTER TABLE `rainlab_sitemap_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_sitemap_definitions_theme_index` (`theme`);

--
-- Indexes for table `rainlab_translate_attributes`
--
ALTER TABLE `rainlab_translate_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_attributes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_attributes_model_type_index` (`model_type`);

--
-- Indexes for table `rainlab_translate_indexes`
--
ALTER TABLE `rainlab_translate_indexes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_indexes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  ADD KEY `rainlab_translate_indexes_item_index` (`item`);

--
-- Indexes for table `rainlab_translate_locales`
--
ALTER TABLE `rainlab_translate_locales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_locales_code_index` (`code`),
  ADD KEY `rainlab_translate_locales_name_index` (`name`);

--
-- Indexes for table `rainlab_translate_messages`
--
ALTER TABLE `rainlab_translate_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_messages_code_index` (`code`);

--
-- Indexes for table `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_user_mail_blockers_email_index` (`email`),
  ADD KEY `rainlab_user_mail_blockers_template_index` (`template`),
  ADD KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Indexes for table `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Indexes for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Indexes for table `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Indexes for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Indexes for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Indexes for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_login_unique` (`username`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`),
  ADD KEY `users_login_index` (`username`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_groups_code_index` (`code`);

--
-- Indexes for table `user_throttle`
--
ALTER TABLE `user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_throttle_user_id_index` (`user_id`),
  ADD KEY `user_throttle_ip_address_index` (`ip_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `flosch_slideshow_slides`
--
ALTER TABLE `flosch_slideshow_slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `flosch_slideshow_slideshows`
--
ALTER TABLE `flosch_slideshow_slideshows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gwf_announcements_announcements`
--
ALTER TABLE `gwf_announcements_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_complains_`
--
ALTER TABLE `gwf_complains_`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_contactus_contactus`
--
ALTER TABLE `gwf_contactus_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_dashboardlinks_`
--
ALTER TABLE `gwf_dashboardlinks_`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_economicactivities_`
--
ALTER TABLE `gwf_economicactivities_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_events_events`
--
ALTER TABLE `gwf_events_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_faq_faq`
--
ALTER TABLE `gwf_faq_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_gallery_galleries`
--
ALTER TABLE `gwf_gallery_galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_gallery_videos`
--
ALTER TABLE `gwf_gallery_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_howdoi_howdoi`
--
ALTER TABLE `gwf_howdoi_howdoi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_news_news`
--
ALTER TABLE `gwf_news_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_profiles_profiles`
--
ALTER TABLE `gwf_profiles_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_projectandinvestment_categories`
--
ALTER TABLE `gwf_projectandinvestment_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_projectandinvestment_projectsandinvestments`
--
ALTER TABLE `gwf_projectandinvestment_projectsandinvestments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_publication_publicationcategories`
--
ALTER TABLE `gwf_publication_publicationcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_publication_publications`
--
ALTER TABLE `gwf_publication_publications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_quicklink_quick_links`
--
ALTER TABLE `gwf_quicklink_quick_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_relatedlink_related_links`
--
ALTER TABLE `gwf_relatedlink_related_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_statistics_statistics`
--
ALTER TABLE `gwf_statistics_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gwf_welcomenote_welcome_notes`
--
ALTER TABLE `gwf_welcomenote_welcome_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_sitemap_definitions`
--
ALTER TABLE `rainlab_sitemap_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_translate_attributes`
--
ALTER TABLE `rainlab_translate_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_translate_indexes`
--
ALTER TABLE `rainlab_translate_indexes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_translate_locales`
--
ALTER TABLE `rainlab_translate_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_translate_messages`
--
ALTER TABLE `rainlab_translate_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;
--
-- AUTO_INCREMENT for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_throttle`
--
ALTER TABLE `user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `flosch_slideshow_slides`
--
ALTER TABLE `flosch_slideshow_slides`
  ADD CONSTRAINT `flosch_slideshow_slides_slideshow_id_foreign` FOREIGN KEY (`slideshow_id`) REFERENCES `flosch_slideshow_slideshows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
