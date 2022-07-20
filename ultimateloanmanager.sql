-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2018 at 11:01 AM
-- Server version: 5.7.9
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ultimateloanmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
CREATE TABLE IF NOT EXISTS `activations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'zDi3W7SMOveuaAaw60aGXjyot3izVIuW', 1, '2017-08-07 08:51:00', '2017-08-07 08:51:00', '2017-08-07 08:51:00');
-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(65,4) DEFAULT NULL,
  `replacement_value` decimal(65,4) DEFAULT NULL,
  `serial_number` text COLLATE utf8_unicode_ci,
  `bought_from` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_id_index` (`id`),
  KEY `assets_purchase_date_index` (`purchase_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

DROP TABLE IF EXISTS `asset_types`;
CREATE TABLE IF NOT EXISTS `asset_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `type` enum('current','fixed','intangible','investment','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_valuations`
--

DROP TABLE IF EXISTS `asset_valuations`;
CREATE TABLE IF NOT EXISTS `asset_valuations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
CREATE TABLE IF NOT EXISTS `audit_trail` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_trail_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=377 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audit_trail`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `name`, `notes`) VALUES
(1, 'Cabs', 'Cabs Account');

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

DROP TABLE IF EXISTS `borrowers`;
CREATE TABLE IF NOT EXISTS `borrowers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `loan_officers` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` enum('online','admin') COLLATE utf8_unicode_ci DEFAULT 'admin',
  `active` tinyint(4) DEFAULT '1',
  `blacklisted` tinyint(4) DEFAULT '0',
  `branch_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowers_id_index` (`id`),
  KEY `borrowers_unique_number_index` (`unique_number`),
  KEY `borrowers_month_index` (`month`),
  KEY `borrowers_year_index` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrowers`
--


-- --------------------------------------------------------

--
-- Table structure for table `borrower_groups`
--

DROP TABLE IF EXISTS `borrower_groups`;
CREATE TABLE IF NOT EXISTS `borrower_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_borrowers` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrower_groups`
--



-- --------------------------------------------------------

--
-- Table structure for table `borrower_group_members`
--

DROP TABLE IF EXISTS `borrower_group_members`;
CREATE TABLE IF NOT EXISTS `borrower_group_members` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrower_group_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrower_group_members`
--



-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_users` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `default_branch` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `assigned_users`, `notes`, `default_branch`) VALUES
(1, 'Default', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch_users`
--

DROP TABLE IF EXISTS `branch_users`;
CREATE TABLE IF NOT EXISTS `branch_users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branch_users`
--

INSERT INTO `branch_users` (`id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-10-13 14:35:47', '2017-10-13 14:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capital`
--

DROP TABLE IF EXISTS `capital`;
CREATE TABLE IF NOT EXISTS `capital` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `type` enum('withdrawal','deposit') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deposit',
  `loan_id` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `capital_id_index` (`id`),
  KEY `capital_month_index` (`month`),
  KEY `capital_year_index` (`year`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `capital`
--


-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
CREATE TABLE IF NOT EXISTS `charges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product` enum('loan','savings') COLLATE utf8_unicode_ci NOT NULL,
  `charge_type` enum('disbursement','specified_due_date','installment_fee','overdue_installment_fee','loan_rescheduling_fee','overdue_maturity','savings_activation','withdrawal_fee','annual_fee','monthly_fee') COLLATE utf8_unicode_ci NOT NULL,
  `charge_option` enum('fixed','percentage','principal_due','principal_interest','interest_due','total_due','original_principal') COLLATE utf8_unicode_ci NOT NULL,
  `charge_frequency` tinyint(4) NOT NULL DEFAULT '0',
  `charge_frequency_type` enum('days','weeks','months','years') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'days',
  `charge_frequency_amount` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(65,2) DEFAULT NULL,
  `charge_payment_mode` enum('regular','account_transfer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'regular',
  `currency_id` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `penalty` tinyint(4) NOT NULL DEFAULT '0',
  `override` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `charges`
--


-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

DROP TABLE IF EXISTS `chart_of_accounts`;
CREATE TABLE IF NOT EXISTS `chart_of_accounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `gl_code` int(11) DEFAULT NULL,
  `account_type` enum('asset','expense','equity','liability','income') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'asset',
  `allow_manual` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `chart_of_accounts_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `parent_id`, `name`, `gl_code`, `account_type`, `allow_manual`, `active`, `notes`) VALUES
(1, NULL, 'Fees Receivable', 100, 'asset', 0, 1, ''),
(2, NULL, 'Interest Receivable', 12, 'asset', 0, 1, ''),
(3, NULL, 'Penalty Receivable', 123, 'asset', 0, 1, ''),
(4, NULL, 'Loan Portfolio', 123, 'asset', 0, 1, ''),
(5, NULL, 'Bank Account', 156, 'asset', 0, 1, ''),
(6, NULL, 'Loan Overpayments', 34, 'liability', 0, 1, ''),
(7, NULL, 'Fee Income', 35, 'income', 0, 1, ''),
(8, NULL, 'Penalty Income', 24, 'income', 0, 1, ''),
(9, NULL, 'Interest Income', 65, 'income', 0, 1, ''),
(10, NULL, 'Loans Written Off', 457, 'expense', 0, 1, ''),
(11, NULL, 'Petty Cash', 243, 'expense', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `collateral`
--

DROP TABLE IF EXISTS `collateral`;
CREATE TABLE IF NOT EXISTS `collateral` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `collateral_type_id` int(10) UNSIGNED DEFAULT NULL,
  `value` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('returned_to_borrower','repossessed','repossession_initiated','sold','lost','collateral_with_borrower','deposited_into_branch') COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `photo` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collateral_id_index` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collateral_types`
--

DROP TABLE IF EXISTS `collateral_types`;
CREATE TABLE IF NOT EXISTS `collateral_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua And Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas The'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CD', 'Congo The Democratic Republic Of The'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D''Ivoire (Ivory Coast)'),
(54, 'HR', 'Croatia (Hrvatska)'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'DK', 'Denmark'),
(59, 'DJ', 'Djibouti'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'TP', 'East Timor'),
(63, 'EC', 'Ecuador'),
(64, 'EG', 'Egypt'),
(65, 'SV', 'El Salvador'),
(66, 'GQ', 'Equatorial Guinea'),
(67, 'ER', 'Eritrea'),
(68, 'EE', 'Estonia'),
(69, 'ET', 'Ethiopia'),
(70, 'XA', 'External Territories of Australia'),
(71, 'FK', 'Falkland Islands'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji Islands'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'GF', 'French Guiana'),
(77, 'PF', 'French Polynesia'),
(78, 'TF', 'French Southern Territories'),
(79, 'GA', 'Gabon'),
(80, 'GM', 'Gambia The'),
(81, 'GE', 'Georgia'),
(82, 'DE', 'Germany'),
(83, 'GH', 'Ghana'),
(84, 'GI', 'Gibraltar'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'XU', 'Guernsey and Alderney'),
(92, 'GN', 'Guinea'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HT', 'Haiti'),
(96, 'HM', 'Heard and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HK', 'Hong Kong S.A.R.'),
(99, 'HU', 'Hungary'),
(100, 'IS', 'Iceland'),
(101, 'IN', 'India'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'XJ', 'Jersey'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea North'),
(116, 'KR', 'Korea South'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Laos'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau S.A.R.'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'XM', 'Man (Isle of)'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'YT', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia'),
(144, 'MD', 'Moldova'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NL', 'Netherlands The'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestinian Territory Occupied'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua new Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn Island'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russia'),
(182, 'RW', 'Rwanda'),
(183, 'SH', 'Saint Helena'),
(184, 'KN', 'Saint Kitts And Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'PM', 'Saint Pierre and Miquelon'),
(187, 'VC', 'Saint Vincent And The Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'XG', 'Smaller Territories of the UK'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia'),
(204, 'SS', 'South Sudan'),
(205, 'ES', 'Spain'),
(206, 'LK', 'Sri Lanka'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard And Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syria'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad And Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks And Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States Minor Outlying Islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State (Holy See)'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (US)'),
(241, 'WF', 'Wallis And Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'YU', 'Yugoslavia'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rate` text COLLATE utf8_unicode_ci,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('left','right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `user_id`, `rate`, `code`, `name`, `symbol`, `position`) VALUES
(1, NULL, '1.00', 'USD', 'United States dollar', '$', 'left');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('number','textfield','date','decimal','textarea') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'textfield',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_meta`
--

DROP TABLE IF EXISTS `custom_fields_meta`;
CREATE TABLE IF NOT EXISTS `custom_fields_meta` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emails_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emails`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `chart_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_id_index` (`id`),
  KEY `expenses_month_index` (`month`),
  KEY `expenses_year_index` (`year`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

DROP TABLE IF EXISTS `expense_types`;
CREATE TABLE IF NOT EXISTS `expense_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `guarantor`
--

DROP TABLE IF EXISTS `guarantor`;
CREATE TABLE IF NOT EXISTS `guarantor` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `loan_application_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `guarantor_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `saving_amount` decimal(10,2) DEFAULT NULL,
  `accepted_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','declined') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_status` enum('pending','hold','restored') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_restored` tinyint(4) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `country_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `guarantor_id_index` (`id`),
  KEY `guarantor_unique_number_index` (`unique_number`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `guarantor`
--


-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

DROP TABLE IF EXISTS `journal_entries`;
CREATE TABLE IF NOT EXISTS `journal_entries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `transaction_type` enum('repayment','disbursement','accrual','deposit','withdrawal','manual_entry','pay_charge','transfer_fund','expense','payroll','income','fee','penalty','close_write_off','repayment_disbursement','repayment_recovery','interest_accrual','fee_accrual''interest','dividend','guarantee') COLLATE utf8_unicode_ci DEFAULT 'repayment',
  `name` text COLLATE utf8_unicode_ci,
  `gl_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `capital_id` int(11) DEFAULT NULL,
  `income_id` int(11) DEFAULT NULL,
  `payroll_id` int(11) DEFAULT NULL,
  `savings_id` int(11) DEFAULT NULL,
  `loan_repayment_id` int(11) DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `loan_transaction_id` int(11) DEFAULT NULL,
  `transaction_sub_type` enum('overpayment','repayment_interest','repayment_principal','repayment_fees','repayment_penalty') COLLATE utf8_unicode_ci DEFAULT NULL,
  `reversed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journal_entries_id_index` (`id`),
  KEY `journal_entries_month_index` (`month`),
  KEY `journal_entries_year_index` (`year`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `journal_entries`
--

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_product_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_start_date` date DEFAULT NULL,
  `first_payment_date` date DEFAULT NULL,
  `loan_disbursed_by_id` int(11) DEFAULT NULL,
  `principal` decimal(65,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `override_interest` tinyint(4) NOT NULL DEFAULT '0',
  `override_interest_amount` decimal(10,4) DEFAULT '0.0000',
  `loan_duration` int(11) DEFAULT NULL,
  `loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'distribute_fees_evenly',
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `loan_status` enum('open','fully_paid','defaulted','restructured','processing') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `balance` decimal(65,4) DEFAULT NULL,
  `override` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approved','disbursed','declined','withdrawn','written_off','closed','pending_reschedule','rescheduled') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `applied_amount` decimal(65,4) DEFAULT NULL,
  `approved_amount` decimal(65,4) DEFAULT NULL,
  `approved_notes` text COLLATE utf8_unicode_ci,
  `disbursed_notes` text COLLATE utf8_unicode_ci,
  `withdrawn_notes` text COLLATE utf8_unicode_ci,
  `closed_notes` text COLLATE utf8_unicode_ci,
  `rescheduled_notes` text COLLATE utf8_unicode_ci,
  `declined_notes` text COLLATE utf8_unicode_ci,
  `written_off_notes` text COLLATE utf8_unicode_ci,
  `approved_date` date DEFAULT NULL,
  `disbursed_date` date DEFAULT NULL,
  `withdrawn_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `rescheduled_date` date DEFAULT NULL,
  `declined_date` date DEFAULT NULL,
  `written_off_date` date DEFAULT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `disbursed_by_id` int(11) DEFAULT NULL,
  `withdrawn_by_id` int(11) DEFAULT NULL,
  `declined_by_id` int(11) DEFAULT NULL,
  `written_off_by_id` int(11) DEFAULT NULL,
  `rescheduled_by_id` int(11) DEFAULT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `processing_fee` decimal(65,4) DEFAULT NULL,
  `product_check_out_id` int(11) DEFAULT NULL,
  `loan_officer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loans_id_index` (`id`),
  KEY `loans_month_index` (`month`),
  KEY `loans_year_index` (`year`),
  KEY `loans_release_date_index` (`release_date`),
  KEY `loans_maturity_date_index` (`maturity_date`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loans`
--

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

DROP TABLE IF EXISTS `loan_applications`;
CREATE TABLE IF NOT EXISTS `loan_applications` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_product_id` int(11) NOT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `status` enum('approved','pending','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_applications_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_applications`
--


-- --------------------------------------------------------

--
-- Table structure for table `loan_charges`
--

DROP TABLE IF EXISTS `loan_charges`;
CREATE TABLE IF NOT EXISTS `loan_charges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_comments`
--

DROP TABLE IF EXISTS `loan_comments`;
CREATE TABLE IF NOT EXISTS `loan_comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `loan_disbursed_by`
--

DROP TABLE IF EXISTS `loan_disbursed_by`;
CREATE TABLE IF NOT EXISTS `loan_disbursed_by` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_disbursed_by`
--

INSERT INTO `loan_disbursed_by` (`id`, `name`) VALUES
(1, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `loan_fees`
--

DROP TABLE IF EXISTS `loan_fees`;
CREATE TABLE IF NOT EXISTS `loan_fees` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fee_type` enum('fixed','percentage') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_fees`
--


-- --------------------------------------------------------

--
-- Table structure for table `loan_fees_meta`
--

DROP TABLE IF EXISTS `loan_fees_meta`;
CREATE TABLE IF NOT EXISTS `loan_fees_meta` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `loan_fees_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `loan_fees_schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_fees_meta`
--



-- --------------------------------------------------------

--
-- Table structure for table `loan_guarantors`
--

DROP TABLE IF EXISTS `loan_guarantors`;
CREATE TABLE IF NOT EXISTS `loan_guarantors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `guarantor_id` int(11) DEFAULT NULL,
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_application_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_guarantors`
--



-- --------------------------------------------------------

--
-- Table structure for table `loan_overdue_penalties`
--

DROP TABLE IF EXISTS `loan_overdue_penalties`;
CREATE TABLE IF NOT EXISTS `loan_overdue_penalties` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `type` enum('fixed','percentage') COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '10',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_products`
--

DROP TABLE IF EXISTS `loan_products`;
CREATE TABLE IF NOT EXISTS `loan_products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_disbursed_by_id` text COLLATE utf8_unicode_ci,
  `minimum_principal` decimal(65,4) DEFAULT NULL,
  `default_principal` decimal(65,4) DEFAULT NULL,
  `maximum_principal` decimal(65,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `minimum_interest_rate` decimal(10,4) DEFAULT NULL,
  `default_interest_rate` decimal(10,4) DEFAULT NULL,
  `maximum_interest_rate` decimal(10,4) DEFAULT NULL,
  `override_interest` tinyint(4) NOT NULL DEFAULT '0',
  `override_interest_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `default_loan_duration` int(11) DEFAULT NULL,
  `default_loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` text COLLATE utf8_unicode_ci,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci DEFAULT 'distribute_fees_evenly',
  `branch_access` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `advanced_enabled` tinyint(4) DEFAULT '0',
  `enable_late_repayment_penalty` tinyint(4) DEFAULT '0',
  `enable_after_maturity_date_penalty` tinyint(4) DEFAULT '0',
  `after_maturity_date_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `after_maturity_date_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `late_repayment_penalty_amount` decimal(10,4) DEFAULT NULL,
  `after_maturity_date_penalty_amount` decimal(10,4) DEFAULT NULL,
  `late_repayment_penalty_grace_period` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_grace_period` int(11) DEFAULT NULL,
  `late_repayment_penalty_recurring` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_recurring` int(11) DEFAULT NULL,
  `accounting_rule` enum('cash_based','accrual_periodic','accrual_upfront') COLLATE utf8_unicode_ci DEFAULT 'cash_based',
  `chart_fund_source_id` int(11) DEFAULT NULL,
  `chart_loan_portfolio_id` int(11) DEFAULT NULL,
  `chart_receivable_interest_id` int(11) DEFAULT NULL,
  `chart_receivable_fee_id` int(11) DEFAULT NULL,
  `chart_receivable_penalty_id` int(11) DEFAULT NULL,
  `chart_loan_over_payments_id` int(11) DEFAULT NULL,
  `chart_income_interest_id` int(11) DEFAULT NULL,
  `chart_income_fee_id` int(11) DEFAULT NULL,
  `chart_income_penalty_id` int(11) DEFAULT NULL,
  `chart_income_recovery_id` int(11) DEFAULT NULL,
  `chart_loans_written_off_id` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_system_type` enum('system','user') COLLATE utf8_unicode_ci DEFAULT 'system',
  `after_maturity_date_penalties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_products`
--

-- --------------------------------------------------------

--
-- Table structure for table `loan_product_charges`
--

DROP TABLE IF EXISTS `loan_product_charges`;
CREATE TABLE IF NOT EXISTS `loan_product_charges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `loan_product_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayments`
--

DROP TABLE IF EXISTS `loan_repayments`;
CREATE TABLE IF NOT EXISTS `loan_repayments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `repayment_method_id` int(10) UNSIGNED NOT NULL,
  `collection_date` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_repayments_id_index` (`id`),
  KEY `loan_repayments_borrower_id_index` (`borrower_id`),
  KEY `loan_repayments_loan_id_index` (`loan_id`),
  KEY `loan_repayments_year_index` (`year`),
  KEY `loan_repayments_month_index` (`month`),
  KEY `loan_repayments_due_date_index` (`due_date`),
  KEY `loan_repayments_collection_date_index` (`collection_date`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_repayments`
--

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayment_methods`
--

DROP TABLE IF EXISTS `loan_repayment_methods`;
CREATE TABLE IF NOT EXISTS `loan_repayment_methods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_repayment_methods`
--

INSERT INTO `loan_repayment_methods` (`id`, `name`) VALUES
(1, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

DROP TABLE IF EXISTS `loan_schedules`;
CREATE TABLE IF NOT EXISTS `loan_schedules` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `principal` decimal(10,4) DEFAULT NULL,
  `principal_balance` decimal(10,4) DEFAULT NULL,
  `interest` decimal(10,4) DEFAULT NULL,
  `fees` decimal(10,4) DEFAULT NULL,
  `penalty` decimal(10,4) DEFAULT NULL,
  `due` decimal(10,4) DEFAULT NULL,
  `system_generated` tinyint(4) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `missed` tinyint(4) NOT NULL DEFAULT '0',
  `missed_penalty_applied` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `fees_waived` decimal(65,4) DEFAULT NULL,
  `penalty_waived` decimal(65,4) DEFAULT NULL,
  `interest_waived` decimal(65,4) DEFAULT NULL,
  `principal_waived` decimal(65,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_schedules_id_index` (`id`),
  KEY `loan_schedules_borrower_id_index` (`borrower_id`),
  KEY `loan_schedules_loan_id_index` (`loan_id`),
  KEY `loan_schedules_year_index` (`year`),
  KEY `loan_schedules_month_index` (`month`),
  KEY `loan_schedules_due_date_index` (`due_date`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_schedules`
--

-- --------------------------------------------------------

--
-- Table structure for table `loan_status`
--

DROP TABLE IF EXISTS `loan_status`;
CREATE TABLE IF NOT EXISTS `loan_status` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_transactions`
--

DROP TABLE IF EXISTS `loan_transactions`;
CREATE TABLE IF NOT EXISTS `loan_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `modified_by_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `loan_schedule_id` int(11) DEFAULT NULL,
  `transaction_type` enum('repayment','repayment_disbursement','write_off','write_off_recovery','disbursement','interest_accrual','fee_accrual','penalty_accrual','deposit','withdrawal','manual_entry','pay_charge','transfer_fund','interest','income','fee','disbursement_fee','installment_fee','specified_due_date_fee','overdue_maturity','overdue_installment_fee','loan_rescheduling_fee','penalty','waiver') COLLATE utf8_unicode_ci DEFAULT 'repayment',
  `repayment_method_id` int(11) DEFAULT NULL,
  `reversible` tinyint(4) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `debit` decimal(65,4) DEFAULT '0.0000',
  `credit` decimal(65,4) DEFAULT '0.0000',
  `balance` decimal(65,4) DEFAULT NULL,
  `reversed` tinyint(4) NOT NULL DEFAULT '0',
  `reversal_type` enum('system','user','none') COLLATE utf8_unicode_ci DEFAULT 'none',
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_transactions`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `attach_file` text COLLATE utf8_unicode_ci,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_07_02_230147_migration_cartalyst_sentinel', 1),
('2016_07_23_173157_create_messages_table', 1),
('2016_07_23_173226_create_sms_table', 1),
('2016_07_23_173242_create_settings_table', 1),
('2016_11_05_062734_create_permissions_table', 1),
('2017_02_23_000640_create_borrowers_table', 1),
('2017_02_23_002300_create_custom_fields_table', 1),
('2017_02_23_003720_create_custom_fields_meta_table', 1),
('2017_03_05_131103_create_loans_table', 1),
('2017_03_05_132848_create_loans_products_table', 1),
('2017_03_05_145851_create_loan_disbursed_by_table', 1),
('2017_03_05_150107_create_loan_repayment_methods_table', 1),
('2017_03_05_151538_create_loan_status_table', 1),
('2017_03_08_182936_create_loan_schedules_table', 1),
('2017_03_19_080840_create_loan_repayments_table', 1),
('2017_04_02_142753_create_loan_comments_table', 1),
('2017_04_11_091435_create_payroll_templates_table', 1),
('2017_04_11_094729_create_payroll_template_meta_table', 1),
('2017_04_12_004631_create_payroll_table', 1),
('2017_04_12_004829_create_payroll_meta_table', 1),
('2017_04_14_083438_create_expenses_table', 1),
('2017_04_14_083535_create_expense_types_table', 1),
('2017_04_16_084016_create_other_income_table', 1),
('2017_04_16_084118_create_other_income_types_table', 1),
('2017_04_16_094025_create_collateral_types_table', 1),
('2017_04_16_094131_create_collateral_table', 1),
('2017_04_18_083800_create_emails_table', 1),
('2017_04_23_072100_create_loan_fees_table', 1),
('2017_04_23_073118_create_loan_fees_meta_table', 1),
('2017_05_04_103559_create_countries_table', 1),
('2017_07_17_123811_add_login_fields_to_borrowers_table', 1),
('2017_07_17_124138_add_month_year_to_borrowers_table', 1),
('2017_07_17_124357_add_fields_to_borrowers_table', 1),
('2017_07_17_130228_add_v1_1_settings_table', 1),
('2017_07_23_061641_create_loan_applications_table', 1),
('2017_07_23_064420_create_audit_trail_table', 1),
('2017_07_23_120222_add_payment_to_v1_1_settings_table', 1),
('2017_07_24_063824_create_savings_product_table', 1),
('2017_07_24_070639_create_savings_table', 1),
('2017_07_24_071756_create_savings_transactions_table', 1),
('2017_07_24_073802_create_savings_fees_table', 1),
('2017_07_27_071556_create_asset_types_table', 1),
('2017_07_27_071814_create_assets_table', 1),
('2017_07_27_074421_create_asset_valuations_table', 1),
('2017_07_27_174045_create_capital_table', 1),
('2017_08_01_064016_add_status_to_loans_table', 1),
('2017_08_01_081424_create_guarantor_table', 1),
('2017_08_07_083717_update_from_v1_0_to_1_1', 1),
('2017_08_23_205719_add_blacklist_to_borrowers_table', 2),
('2017_09_02_092303_create_borrower_groups', 3),
('2017_09_02_092551_create_branches', 3),
('2017_09_02_094025_add_branches_to_all_tables', 3),
('2017_09_02_154128_create_borrower_group_members_table', 3),
('2017_09_02_171328_update_from_v1_1_to_1_2', 4),
('2017_09_05_075257_add_v12_settings', 5),
('2017_09_05_082513_add_v12_permissions', 5),
('2017_09_20_093729_add_client_background_settings', 6),
('2017_09_20_094221_change_update_url', 6),
('2017_09_23_133042_create_provision_rates_table', 7),
('2017_09_23_133535_insert_data_to_provision_rates_table', 8),
('2017_09_24_091220_create_bank_accounts_table', 9),
('2017_09_24_091340_add_bank_accounts_to_capital_table', 9),
('2017_10_13_113742_create_branch_users_table', 10),
('2017_10_13_121839_add_application_fee_to_loans_table', 10),
('2017_10_13_161720_add_default_branch', 10),
('2017_10_13_161930_create_default_branch_and_assign_user', 11),
('2017_10_13_173431_add_branch_to_schedules', 12),
('2017_10_13_184930_set_default_branch_for_current_loans', 13),
('2017_10_14_062601_add_v_1_3_permissions', 14),
('2017_10_14_063504_update_v_1_3_update_url', 14),
('2017_10_14_074553_update_to_v_1_3', 14),
('2017_11_03_102928_add_type_to_capital_table', 15),
('2017_11_03_105326_create_sms_gateways_table', 16),
('2017_11_03_163022_add_name_to_guarantors_table', 17),
('2017_11_03_164012_add_country_id_to_borrowers_table', 18),
('2017_11_03_164336_add_currencies_table', 18),
('2017_11_03_165413_add_ver_1_4_settings_table', 18),
('2017_11_03_203227_add_loan_guarantors_table', 18),
('2017_11_04_085909_update_to_ver_1_4_table', 19),
('2017_11_05_232841_create_products_table', 20),
('2017_11_05_233251_create_product_categories_table', 20),
('2017_11_06_072921_create_products_check_in_table', 20),
('2017_11_06_073248_create_products_check_out_table', 20),
('2017_11_06_073316_create_products_warehouse_table', 20),
('2017_11_06_082547_create_purchase_orders_table', 20),
('2017_11_06_100343_create_suppliers_table', 20),
('2017_11_06_164523_create_brands_table', 20),
('2017_11_06_210217_create_products_check_out_items_table', 20),
('2017_11_06_210317_create_products_payments_table', 20),
('2017_11_06_210706_create_products_check_in_items_table', 20),
('2017_11_07_035537_create_purchase_order_items_table', 20),
('2017_10_21_203340_create_product_categories_meta_table', 21),
('2017_11_07_090146_add_checkout_to_loan_table_table', 22),
('2017_11_07_091944_add_warehouses_table', 22),
('2017_11_08_151744_add_overdraw_settings', 23),
('2017_11_11_071409_create_chart_of_accounts_table', 23),
('2017_11_11_080928_add_accounting_to_loan_products_table', 23),
('2017_11_11_094902_create_loan_overdue_penalties_table', 23),
('2017_11_11_095510_add_accounting_to_savings_products', 23),
('2017_11_11_100235_add_accounting_to_expenses_table', 23),
('2017_11_11_100255_add_accounting_to_income_table', 23),
('2017_11_11_100318_add_accounting_to_payroll_table', 23),
('2017_11_11_131440_add_v_1_5_permissions', 23),
('2017_11_11_174146_add_accounting_to_settings_table', 23),
('2017_11_11_225159_create_journal_entries_table', 23),
('2017_11_14_082223_add_account_to_expense_and_income_categories', 24),
('2017_11_18_172024_add_current_theme_to_settings_table', 25),
('2017_12_02_095438_add_receipt_tp_payments_table', 26),
('2017_12_03_094335_add_loan_officer_to_loans_table', 27),
('2017_12_03_185018_add_debit_and_credit_to_capital_table', 28),
('2017_12_10_161628_add_index_to_all_tables', 29),
('2017_12_12_144725_create_loan_transactions_table', 30),
('2017_12_16_202252_create_charges_table', 31),
('2017_12_16_214117_create_loan_charges_table', 31),
('2017_12_16_214117_create_savings_charges_table', 31),
('2017_12_16_214236_create_loan_products_charges_table', 31),
('2017_12_27_101540_update_journal_entries_table', 32),
('2018_01_10_104604_add_waive_to_loan_schedules_table', 33),
('2018_01_14_215823_create_savings_products_charge_table', 34),
('2018_01_15_000219_add_status_to_savings_table', 35),
('2018_01_15_083204_add_debit_credit_to_savings_transactions_table', 36),
('2018_01_26_193838_add_transfer_type_to_saving_transactions', 37),
('2018_02_01_145506_add_mpesa_to_settings_table', 38),
('2018_02_01_194418_add_2_0_settings', 39),
('2018_02_01_201034_increase_decimal_length', 40),
('2018_02_02_002812_update_system_to_version_2_0', 41);

-- --------------------------------------------------------

--
-- Table structure for table `other_income`
--

DROP TABLE IF EXISTS `other_income`;
CREATE TABLE IF NOT EXISTS `other_income` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `other_income_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `chart_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `other_income_id_index` (`id`),
  KEY `other_income_year_index` (`year`),
  KEY `other_income_month_index` (`month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `other_income_types`
--

DROP TABLE IF EXISTS `other_income_types`;
CREATE TABLE IF NOT EXISTS `other_income_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `other_income_types`
--

INSERT INTO `other_income_types` (`id`, `name`, `account_id`) VALUES
(1, 'Processing Fee', 7);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payroll_template_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `paid_amount` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `chart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_id_index` (`id`),
  KEY `payroll_user_id_index` (`user_id`),
  KEY `payroll_year_index` (`year`),
  KEY `payroll_month_index` (`month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_meta`
--

DROP TABLE IF EXISTS `payroll_meta`;
CREATE TABLE IF NOT EXISTS `payroll_meta` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payroll_id` int(10) UNSIGNED NOT NULL,
  `payroll_template_meta_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_templates`
--

DROP TABLE IF EXISTS `payroll_templates`;
CREATE TABLE IF NOT EXISTS `payroll_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payroll_templates`
--

INSERT INTO `payroll_templates` (`id`, `name`, `notes`, `picture`) VALUES
(1, 'Default', 'Default Payroll Template', 'default_payroll_template.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_template_meta`
--

DROP TABLE IF EXISTS `payroll_template_meta`;
CREATE TABLE IF NOT EXISTS `payroll_template_meta` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payroll_template_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payroll_template_meta`
--

INSERT INTO `payroll_template_meta` (`id`, `payroll_template_id`, `name`, `position`, `is_default`) VALUES
(1, 1, 'PAYE', 'bottom_right', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `parent_id`, `name`, `slug`, `description`) VALUES
(1, 0, 'Borrowers', 'borrowers', 'Access Borrowers Module'),
(2, 1, 'View borrowers', 'borrowers.view', 'View borrowers'),
(3, 1, 'Update borrowers', 'borrowers.update', 'Update Borrowers'),
(4, 1, 'Delete borrowers', 'borrowers.delete', 'Delete borrowers'),
(5, 1, 'Create borrowers', 'borrowers.create', 'Add new borrower'),
(6, 0, 'Loans', 'loans', 'Access Loans Module'),
(7, 6, 'Create Loans', 'loans.create', 'Create Loans'),
(9, 6, 'Update Loans', 'loans.update', 'Update Loans'),
(10, 6, 'Delete Loans', 'loans.delete', 'Delete Loans'),
(11, 6, 'View Loans', 'loans.view', 'View Loans'),
(12, 6, 'Loan Products', 'loans.products', 'Manage Loan Products'),
(13, 6, 'Loan Fees', 'loans.fees', 'Manage Loan Fees'),
(14, 6, 'Loan Schedule', 'loans.schedule', 'Manage loan schedule, including sending loan schedule emails'),
(15, 0, 'Repayments', 'repayments', 'View Repayments Module'),
(16, 15, 'View Repayments', 'repayments.view', 'View All repayments'),
(17, 15, 'Create Repayments', 'repayments.create', 'Add Repayments'),
(18, 15, 'Delete Repayments', 'repayments.delete', 'Delete Repayments'),
(19, 15, 'Update Repayments', 'repayments.update', 'Update Repayments'),
(20, 0, 'Payroll', 'payroll', 'Access Payroll Module'),
(21, 20, 'View Payroll', 'payroll.view', 'View Payroll'),
(22, 20, 'Update Payroll', 'payroll.update', 'Update Payroll'),
(23, 20, 'Delete Payroll', 'payroll.delete', 'Delete Payroll'),
(24, 20, 'Create Payroll', 'payroll.create', 'Create Payroll'),
(25, 0, 'Expenses', 'expenses', 'Access Expenses Module'),
(26, 25, 'View Expenses', 'expenses.view', 'View Expenses'),
(27, 25, 'Create Expenses', 'expenses.create', 'Create Expenses'),
(28, 25, 'Update Expenses', 'expenses.update', 'Update Expenses'),
(29, 25, 'Delete Expenses', 'expenses.delete', 'Delete Expenses'),
(30, 0, 'Other Income', 'other_income', 'Access Other Income Module'),
(31, 30, 'View Other Income', 'other_income.view', 'View Other income'),
(32, 30, 'Create Other Income', 'other_income.create', 'Create other income'),
(33, 30, 'Update Other Income', 'other_income.update', 'Update Other Incom'),
(34, 30, 'Delete Other Income', 'other_income.delete', 'Delete other income'),
(35, 0, 'Collateral', 'collateral', 'Access Collateral Module'),
(36, 35, 'View collateral', 'collateral.view', 'View Collateral'),
(37, 35, 'Update Collateral', 'collateral.update', 'Update Collateral'),
(38, 35, 'Create Collateral', 'collateral.create', 'Create Collateral'),
(39, 35, 'Delete Collateral', 'collateral.delete', 'Delete Collateral'),
(40, 0, 'Reports', 'reports', 'Access Reports Module'),
(41, 0, 'Communication', 'communication', 'Access Communication Module'),
(42, 41, 'Create Communication', 'communication.create', 'Send Emails & SMS'),
(43, 41, 'Delete Communication', 'communication.delete', 'Delete Communication'),
(44, 0, 'Custom Fields', 'custom_fields', 'Access Custom Fields Module'),
(45, 44, 'View Custom Fields', 'custom_fields.view', 'View Custom fields'),
(46, 44, 'Create Custom Fields', 'custom_fields.create', 'Create Custom Fields'),
(47, 44, 'Custom Fields', 'custom_fields.update', 'Update Custom Fields'),
(48, 44, 'Delete Custom Fields', 'custom_fields.delete', 'Delete Custom Fields'),
(49, 0, 'Users', 'users', 'Access Users Module'),
(50, 49, 'View Users', 'users.view', 'View Users '),
(51, 49, 'Create Users', 'users.create', 'Create users'),
(52, 49, 'Update Users', 'users.update', 'Update Users'),
(53, 49, 'Delete Users', 'users.delete', 'Delete Users'),
(54, 49, 'Manage Roles', 'users.roles', 'Manage user roles'),
(55, 0, 'Settings', 'settings', 'Manage Settings'),
(56, 0, 'Audit Trail', 'audit_trail', 'Access Audit Trail'),
(57, 0, 'Savings', 'savings', 'Access Savings Menu'),
(58, 57, 'Create Savings', 'savings.create', ''),
(59, 57, 'Update Savings', 'savings.update', ''),
(60, 57, 'Delete Savings', 'savings.delete', ''),
(61, 57, 'Create Savings Transaction', 'savings.transactions.create', ''),
(62, 57, 'Update Savings Transaction', 'savings.transactions.update', ''),
(63, 57, 'Delete Savings Transaction', 'savings.transactions.delete', ''),
(64, 57, 'View Savings', 'savings.view', ''),
(65, 57, 'View Savings Transaction', 'savings.transactions.view', ''),
(66, 57, 'Manage Savings Products', 'savings.products', 'Manage Savings Products'),
(67, 57, 'Manage Savings Fees', 'savings.fees', ''),
(68, 6, 'Approve Loans', 'loans.approve', 'Approve Loans'),
(69, 6, 'Disburse Loans', 'loans.disburse', 'Disburse Loans'),
(70, 1, 'Approve Borrowers', 'borrowers.approve', 'Approve Borrowers'),
(71, 6, 'Withdraw Loans', 'loans.withdraw', 'Withdraw Loans'),
(72, 6, 'Write Off Loans', 'loans.writeoff', 'Write off Loans'),
(73, 6, 'Reschedule Loans', 'loans.reschedule', 'Reschedule Loans'),
(74, 0, 'Dashboard', 'dashboard', 'Access Dashboard'),
(75, 74, 'Loans Released Monthly Graph', 'dashboard.loans_released_monthly_graph', 'Access Loans Released Monthly Graph'),
(76, 74, 'Loans Collected Monthly Graph', 'dashboard.loans_collected_monthly_graph', 'Access Loans Collected Monthly Graph'),
(77, 74, 'Registered Borrowers', 'dashboard.registered_borrowers', 'Access Registered Borrowers Statistics'),
(78, 74, 'Total Loans Released', 'dashboard.total_loans_released', 'Access Total Loans Released'),
(79, 74, 'Total Collections', 'dashboard.total_collections', 'Access Total Collections Statistics'),
(80, 74, 'Total Disbursed Loans', 'dashboard.loans_disbursed', 'Access Total Disbursed Loans Statistics'),
(81, 74, 'Total Loans Pending', 'dashboard.loans_pending', ''),
(82, 74, 'Loans Approved', 'dashboard.loans_approved', ''),
(83, 74, 'Loans Declined', 'dashboard.loans_declined', ''),
(84, 74, 'Loans Closed', 'dashboard.loans_closed', ''),
(85, 74, 'Loans Withdrawn', 'dashboard.loans_withdrawn', ''),
(86, 74, 'Loans Written Off', 'dashboard.loans_written_off', ''),
(87, 74, 'Loans Rescheduled', 'dashboard.loans_rescheduled', ''),
(88, 6, 'Create Guarantor', 'loans.guarantor.create', ''),
(89, 6, 'Update Guarantor', 'loans.guarantor.update', ''),
(90, 6, 'Delete Guarantor', 'loans.guarantor.delete', ''),
(91, 6, 'Guarantor Savings', 'loans.guarantor.savings', ''),
(92, 0, 'Capital', 'capital', 'Access Capital'),
(93, 92, 'View  Capital', 'capital.view', ''),
(94, 92, 'Create Capital', 'capital.create', ''),
(95, 92, 'Update Capital', 'capital.update', ''),
(96, 92, 'Delete Capital', 'capital.delete', ''),
(97, 0, 'Assets', 'assets', 'Access Assets Menu'),
(98, 97, 'Create Assets', 'assets.create', ''),
(99, 97, 'View Assets', 'assets.view', ''),
(100, 97, 'Update Assets', 'assets.update', ''),
(101, 97, 'Delete Assets', 'assets.delete', ''),
(102, 1, 'Blacklist Borrower', 'borrowers.blacklist', 'Blacklist borrower'),
(103, 1, 'Manage Borrower Groups', 'borrowers.groups', ''),
(104, 6, 'Use Loan Calculator', 'loans.loan_calculator', ''),
(105, 0, 'Branches', 'branches', 'Access Branches menu'),
(106, 105, 'View Branches', 'branches.view', ''),
(107, 105, 'Create Branches', 'branches.create', ''),
(108, 105, 'Update Branches', 'branches.update', ''),
(109, 105, 'Delete Branches', 'branches.delete', ''),
(110, 105, 'Assign Users', 'branches.assign', ''),
(111, 0, 'Stock', 'stock', 'Access Stock Menu'),
(112, 111, 'View Stock', 'stock.view', ''),
(113, 111, 'Add Stock', 'stock.create', ''),
(114, 111, 'Update Stock', 'stock.update', ''),
(115, 111, 'Delete Stock', 'stock.delete', '');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

DROP TABLE IF EXISTS `persistences`;
CREATE TABLE IF NOT EXISTS `persistences` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(2, 1, 'cXx80mkttAaMYOrIfNlYaZjN2BMoggqM', '2018-02-01 17:21:47', '2018-02-01 17:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `brand_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` text COLLATE utf8_unicode_ci,
  `cost_price` decimal(65,2) DEFAULT NULL,
  `selling_price` decimal(65,2) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `alert_qty` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `picture` text COLLATE utf8_unicode_ci,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `slug` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `slug` text COLLATE utf8_unicode_ci,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_categories_meta`
--

DROP TABLE IF EXISTS `product_categories_meta`;
CREATE TABLE IF NOT EXISTS `product_categories_meta` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories_meta`
--



-- --------------------------------------------------------

--
-- Table structure for table `product_check_ins`
--

DROP TABLE IF EXISTS `product_check_ins`;
CREATE TABLE IF NOT EXISTS `product_check_ins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `unit_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_check_ins_id_index` (`id`),
  KEY `product_check_ins_supplier_id_index` (`supplier_id`),
  KEY `product_check_ins_warehouse_id_index` (`warehouse_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_check_ins`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_check_in_items`
--

DROP TABLE IF EXISTS `product_check_in_items`;
CREATE TABLE IF NOT EXISTS `product_check_in_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_check_in_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_rate` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(65,2) NOT NULL DEFAULT '0.00',
  `unit_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_check_in_items_id_index` (`id`),
  KEY `product_check_in_items_product_check_in_id_index` (`product_check_in_id`),
  KEY `product_check_in_items_product_id_index` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_check_in_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_check_outs`
--

DROP TABLE IF EXISTS `product_check_outs`;
CREATE TABLE IF NOT EXISTS `product_check_outs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `type` enum('cash','loan') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cash',
  `borrower_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_check_outs_id_index` (`id`),
  KEY `product_check_outs_loan_id_index` (`loan_id`),
  KEY `product_check_outs_borrower_id_index` (`borrower_id`),
  KEY `product_check_outs_year_index` (`year`),
  KEY `product_check_outs_month_index` (`month`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_check_outs`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_check_out_items`
--

DROP TABLE IF EXISTS `product_check_out_items`;
CREATE TABLE IF NOT EXISTS `product_check_out_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_check_out_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_rate` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(65,2) NOT NULL DEFAULT '0.00',
  `unit_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_check_out_items_id_index` (`id`),
  KEY `product_check_out_items_product_check_out_id_index` (`product_check_out_id`),
  KEY `product_check_out_items_product_id_index` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_check_out_items`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_payments`
--

DROP TABLE IF EXISTS `product_payments`;
CREATE TABLE IF NOT EXISTS `product_payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `product_check_in_id` int(10) UNSIGNED DEFAULT NULL,
  `product_check_out_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'credit',
  `payment_method_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8_unicode_ci,
  `payment_slip` text COLLATE utf8_unicode_ci,
  `amount` decimal(65,2) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_payments_id_index` (`id`),
  KEY `product_payments_year_index` (`year`),
  KEY `product_payments_month_index` (`month`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_payments`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_warehouses`
--

DROP TABLE IF EXISTS `product_warehouses`;
CREATE TABLE IF NOT EXISTS `product_warehouses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provision_rates`
--

DROP TABLE IF EXISTS `provision_rates`;
CREATE TABLE IF NOT EXISTS `provision_rates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provision_rates`
--

INSERT INTO `provision_rates` (`id`, `name`, `days`, `rate`, `notes`) VALUES
(1, 'Current', 0, 0.00, NULL),
(2, 'Especially Mentioned', 31, 5.00, NULL),
(3, 'Substandard', 61, 10.00, NULL),
(4, 'Doubtful', 91, 50.00, NULL),
(5, 'Loss', 181, 100.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `unit_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `delivery_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

DROP TABLE IF EXISTS `purchase_order_items`;
CREATE TABLE IF NOT EXISTS `purchase_order_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_rate` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(65,2) NOT NULL DEFAULT '0.00',
  `qty_received` decimal(65,2) NOT NULL DEFAULT '0.00',
  `unit_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(65,2) NOT NULL DEFAULT '0.00',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{"borrowers":true,"borrowers.view":true,"borrowers.update":true,"borrowers.delete":true,"borrowers.create":true,"borrowers.approve":true,"borrowers.blacklist":true,"borrowers.groups":true,"loans":true,"loans.create":true,"loans.update":true,"loans.delete":true,"loans.view":true,"loans.products":true,"loans.fees":true,"loans.schedule":true,"loans.approve":true,"loans.disburse":true,"loans.withdraw":true,"loans.writeoff":true,"loans.reschedule":true,"loans.guarantor.create":true,"loans.guarantor.update":true,"loans.guarantor.delete":true,"loans.guarantor.savings":true,"loans.loan_calculator":true,"repayments":true,"repayments.view":true,"repayments.create":true,"repayments.delete":true,"repayments.update":true,"payroll":true,"payroll.view":true,"payroll.update":true,"payroll.delete":true,"payroll.create":true,"expenses":true,"expenses.view":true,"expenses.create":true,"expenses.update":true,"expenses.delete":true,"other_income":true,"other_income.view":true,"other_income.create":true,"other_income.update":true,"other_income.delete":true,"collateral":true,"collateral.view":true,"collateral.update":true,"collateral.create":true,"collateral.delete":true,"reports":true,"communication":true,"communication.create":true,"communication.delete":true,"custom_fields":true,"custom_fields.view":true,"custom_fields.create":true,"custom_fields.update":true,"custom_fields.delete":true,"users":true,"users.view":true,"users.create":true,"users.update":true,"users.delete":true,"users.roles":true,"settings":true,"audit_trail":true,"savings":true,"savings.create":true,"savings.update":true,"savings.delete":true,"savings.transactions.create":true,"savings.transactions.update":true,"savings.transactions.delete":true,"savings.view":true,"savings.transactions.view":true,"savings.products":true,"savings.fees":true,"dashboard":true,"dashboard.loans_released_monthly_graph":true,"dashboard.loans_collected_monthly_graph":true,"dashboard.registered_borrowers":true,"dashboard.total_loans_released":true,"dashboard.total_collections":true,"dashboard.loans_disbursed":true,"dashboard.loans_pending":true,"dashboard.loans_approved":true,"dashboard.loans_declined":true,"dashboard.loans_closed":true,"dashboard.loans_withdrawn":true,"dashboard.loans_written_off":true,"dashboard.loans_rescheduled":true,"capital":true,"capital.view":true,"capital.create":true,"capital.update":true,"capital.delete":true,"assets":true,"assets.create":true,"assets.view":true,"assets.update":true,"assets.delete":true,"branches":true,"branches.view":true,"branches.create":true,"branches.update":true,"branches.delete":true,"branches.assign":true,"stock":true,"stock.view":true,"stock.create":true,"stock.update":true,"stock.delete":true}', NULL, '2017-11-07 03:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
CREATE TABLE IF NOT EXISTS `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-08-07 08:51:00', '2017-08-07 08:51:00');
-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

DROP TABLE IF EXISTS `savings`;
CREATE TABLE IF NOT EXISTS `savings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_product_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `status` enum('active','closed','pending','declined','withdrawn') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `loan_officer_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overdraft_limit` decimal(65,4) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `declined_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `approved_notes` text COLLATE utf8_unicode_ci,
  `declined_notes` text COLLATE utf8_unicode_ci,
  `closed_notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `savings_id_index` (`id`),
  KEY `savings_borrower_id_index` (`borrower_id`),
  KEY `savings_savings_product_id_index` (`savings_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings`
--


-- --------------------------------------------------------

--
-- Table structure for table `savings_charges`
--

DROP TABLE IF EXISTS `savings_charges`;
CREATE TABLE IF NOT EXISTS `savings_charges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `savings_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings_charges`
--


-- --------------------------------------------------------

--
-- Table structure for table `savings_fees`
--

DROP TABLE IF EXISTS `savings_fees`;
CREATE TABLE IF NOT EXISTS `savings_fees` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savings_products` text COLLATE utf8_unicode_ci,
  `amount` decimal(10,2) DEFAULT '0.00',
  `fees_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fees_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_fee_type` enum('full','pro_rata') COLLATE utf8_unicode_ci DEFAULT 'full',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings_products`
--

DROP TABLE IF EXISTS `savings_products`;
CREATE TABLE IF NOT EXISTS `savings_products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_overdraw` tinyint(4) NOT NULL DEFAULT '0',
  `interest_rate` decimal(10,2) DEFAULT NULL,
  `minimum_balance` int(11) DEFAULT '0',
  `interest_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `accounting_rule` enum('none','cash_based') COLLATE utf8_unicode_ci DEFAULT 'none',
  `chart_reference_id` int(11) DEFAULT NULL,
  `chart_overdraft_portfolio_id` int(11) DEFAULT NULL,
  `chart_savings_control_id` int(11) DEFAULT NULL,
  `chart_income_interest_id` int(11) DEFAULT NULL,
  `chart_income_fee_id` int(11) DEFAULT NULL,
  `chart_income_penalty_id` int(11) DEFAULT NULL,
  `chart_payable_interest_id` int(11) DEFAULT NULL,
  `chart_receivable_fee_id` int(11) DEFAULT NULL,
  `chart_receivable_penalty_id` int(11) DEFAULT NULL,
  `chart_expense_interest_id` int(11) DEFAULT NULL,
  `chart_expense_written_off_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings_products`
--


-- --------------------------------------------------------

--
-- Table structure for table `savings_product_charges`
--

DROP TABLE IF EXISTS `savings_product_charges`;
CREATE TABLE IF NOT EXISTS `savings_product_charges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `savings_product_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings_product_charges`
--


-- --------------------------------------------------------

--
-- Table structure for table `savings_transactions`
--

DROP TABLE IF EXISTS `savings_transactions`;
CREATE TABLE IF NOT EXISTS `savings_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `type` enum('deposit','withdrawal','bank_fees','interest','dividend','guarantee','guarantee_restored','fees_payment','transfer_loan','transfer_savings') COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_interest` tinyint(4) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `reversible` tinyint(4) NOT NULL DEFAULT '0',
  `reversed` tinyint(4) NOT NULL DEFAULT '0',
  `reversal_type` enum('system','user','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `reference` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_transactions_id_index` (`id`),
  KEY `savings_transactions_borrower_id_index` (`borrower_id`),
  KEY `savings_transactions_savings_id_index` (`savings_id`),
  KEY `savings_transactions_date_index` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings_transactions`
--

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_setting_key_unique` (`setting_key`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'allow_self_registration', '1'),
(2, 'allow_client_login', '1'),
(3, 'welcome_note', 'Welcome to our company. You can login with your username and password'),
(4, 'allow_client_apply', '1'),
(5, 'enable_online_payment', '1'),
(6, 'paynow_key', 'trt'),
(7, 'paynow_id', 'sf'),
(8, 'paypal_enabled', '1'),
(9, 'paynow_enabled', '1'),
(10, 'client_registration_required_fields', ''),
(11, 'client_auto_activate_account', '1'),
(12, 'client_request_guarantor', '0'),
(13, 'auto_post_savings_interest', '0'),
(14, 'company_name', 'Loan'),
(15, 'company_address', 'http://www.'),
(16, 'company_currency', 'ZAR'),
(17, 'company_website', 'http://www.'),
(18, 'company_country', '246'),
(19, 'system_version', '2.0'),
(20, 'sms_enabled', '1'),
(21, 'active_sms', '1'),
(22, 'portal_address', 'http://www.'),
(23, 'company_email', 'info@webs'),
(24, 'currency_symbol', '$'),
(25, 'currency_position', 'left'),
(26, 'company_logo', 'logo.jpg'),
(27, 'twilio_sid', ''),
(28, 'twilio_token', ''),
(29, 'twilio_phone_number', ''),
(30, 'routesms_host', ''),
(31, 'routesms_username', ''),
(32, 'routesms_password', ''),
(33, 'routesms_port', ''),
(34, 'sms_sender', ''),
(35, 'clickatell_username', ''),
(36, 'clickatell_password', ''),
(37, 'clickatell_api_id', ''),
(38, 'paypal_email', 'tjmugova@we.co'),
(39, 'currency', 'USD'),
(40, 'password_reset_subject', 'Password reset instructions'),
(41, 'password_reset_template', 'Password reset instructions'),
(42, 'payment_received_sms_template', 'Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you'),
(43, 'payment_received_email_template', '<p>Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you</p>'),
(44, 'payment_received_email_subject', 'Payment Received'),
(45, 'payment_email_subject', 'Payment Receipt'),
(46, 'payment_email_template', '<p>Dear {borrowerFirstName}, find attached receipt of your payment of ${paymentAmount} for loan {loanNumber} on {paymentDate}. New loan balance:${loanBalance}. Thank you</p>'),
(47, 'borrower_statement_email_subject', 'Client Statement'),
(48, 'borrower_statement_email_template', '<p>Dear {borrowerFirstName}, find attached statement of your loans with us. Thank you</p>'),
(49, 'loan_statement_email_subject', 'Loan Statement'),
(50, 'loan_statement_email_template', '<p>Dear {borrowerFirstName}, find attached loan statement for loan {loanNumber}. Thank you</p>'),
(51, 'loan_schedule_email_subject', 'Loan Schedule'),
(52, 'loan_schedule_email_template', '<p>Dear {borrowerFirstName}, find attached loan schedule for loan {loanNumber}. Thank you</p>'),
(53, 'cron_last_run', '2018-01-28 21:44:14'),
(54, 'auto_apply_penalty', '1'),
(55, 'auto_payment_receipt_sms', '0'),
(56, 'auto_payment_receipt_email', '1'),
(57, 'auto_repayment_sms_reminder', '0'),
(58, 'auto_repayment_email_reminder', '1'),
(59, 'auto_repayment_days', '4'),
(60, 'auto_overdue_repayment_sms_reminder', '0'),
(61, 'auto_overdue_repayment_email_reminder', '1'),
(62, 'auto_overdue_repayment_days', '2'),
(63, 'auto_overdue_loan_sms_reminder', '0'),
(64, 'auto_overdue_loan_email_reminder', '1'),
(65, 'auto_overdue_loan_days', '2'),
(66, 'loan_overdue_email_subject', 'Loan Overdue'),
(67, 'loan_overdue_email_template', '<p>Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you</p>'),
(68, 'loan_overdue_sms_template', 'Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you'),
(69, 'loan_payment_reminder_subject', 'Upcoming Payment Reminder'),
(70, 'loan_payment_reminder_email_template', '<p>Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(71, 'loan_payment_reminder_sms_template', 'Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(72, 'missed_payment_email_subject', 'Missed Payment'),
(73, 'missed_payment_email_template', '<p>Dear {borrowerFirstName},You missed payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(74, 'missed_payment_sms_template', 'Dear {borrowerFirstName},You missed  payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(75, 'enable_cron', '1'),
(76, 'infobip_username', ''),
(77, 'infobip_password', ''),
(78, 'update_url', 'http://webstudio.co.zw/ulm/update'),
(79, 'client_login_background', ''),
(80, 'stripe_secret_key', ''),
(81, 'stripe_publishable_key', ''),
(82, 'stripe_enabled', '1'),
(90, 'payroll_chart_id', '10'),
(87, 'allow_bank_overdraw', '0'),
(89, 'income_chart_id', ''),
(88, 'expenses_chart_id', ''),
(91, 'active_theme', 'limitless'),
(92, 'mpesa_consumer_key', ''),
(93, 'mpesa_consumer_secret', ''),
(94, 'mpesa_shortcode', '601420'),
(95, 'mpesa_endpoint', 'https://sandbox.safaricom.co.ke'),
(96, 'mpesa_initiator', NULL),
(97, 'mpesa_enabled', '1'),
(98, 'default_online_payment_method', ''),
(99, 'timezone', 'Africa/Blantyre'),
(100, 'auto_download_update', '0'),
(101, 'update_notification', ''),
(102, 'update_last_checked', ''),
(103, 'header_javascript', ''),
(104, 'footer_javascript', '');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
CREATE TABLE IF NOT EXISTS `sms` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

DROP TABLE IF EXISTS `sms_gateways`;
CREATE TABLE IF NOT EXISTS `sms_gateways` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `from_name` text COLLATE utf8_unicode_ci,
  `to_name` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `msg_name` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `user_id`, `name`, `from_name`, `to_name`, `url`, `msg_name`, `notes`) VALUES
(1, NULL, 'Route Sms', NULL, 'to', 'https://api.webstudio.co.zw?username=web', 'msg', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--


-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
CREATE TABLE IF NOT EXISTS `throttle` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `throttle`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `address`, `phone`, `city`, `gender`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'admin@webstudio.co.zw', '$2y$10$Opa9twkep14MtwfyB4yWDur/Prv/h3kYiKmcvEH1CeHgx0jDR1lfO', NULL, '2018-02-01 17:21:47', 'Admin', 'Admin', NULL, NULL, NULL, 'Male', NULL, '2017-08-07 08:51:00', '2018-02-01 17:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehouses`
--



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
