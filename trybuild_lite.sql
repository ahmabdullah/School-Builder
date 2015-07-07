-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2014 at 03:03 AM
-- Server version: 5.5.40-MariaDB
-- PHP Version: 5.4.23

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;




-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `sites_id` int(11) NOT NULL,
  `pages_name` varchar(255) NOT NULL,
  `pages_timestamp` int(11) NOT NULL,
  `pages_title` varchar(255) NOT NULL,
  `pages_meta_keywords` text NOT NULL,
  `pages_meta_description` text NOT NULL,
  `pages_header_includes` text NOT NULL,
  PRIMARY KEY (`pages_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=371 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pages_id`, `sites_id`, `pages_name`, `pages_timestamp`, `pages_title`, `pages_meta_keywords`, `pages_meta_description`, `pages_header_includes`) VALUES
(5, 1, 'index', 1415074040, '', '', '', ''),
(6, 1, 'about', 1415074041, '', '', '', ''),
(7, 1, 'pricing', 1415074041, '', '', '', ''),
(8, 2, 'index', 1415074101, '', '', '', ''),
(9, 3, 'index', 1415074156, '', '', '', ''),
(10, 4, 'index', 1415074209, '', '', '', ''),
(11, 6, 'index', 1415074308, '', '', '', ''),
(12, 7, 'index', 1415074371, '', '', '', ''),
(13, 8, 'index', 1415074448, '', '', '', ''),
(14, 9, 'index', 1415074470, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `sites_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `sites_name` varchar(255) NOT NULL,
  `sites_created_on` varchar(100) NOT NULL,
  `sites_lastupdate_on` varchar(100) NOT NULL,
  `ftp_server` varchar(255) NOT NULL,
  `ftp_user` varchar(255) NOT NULL,
  `ftp_password` varchar(255) NOT NULL,
  `ftp_path` varchar(255) NOT NULL DEFAULT '/',
  `ftp_port` int(8) NOT NULL DEFAULT '21',
  `ftp_ok` int(1) NOT NULL,
  `ftp_published` int(1) NOT NULL DEFAULT '0',
  `remote_url` varchar(255) NOT NULL,
  `sites_trashed` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sites_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`sites_id`, `users_id`, `sites_name`, `sites_created_on`, `sites_lastupdate_on`, `ftp_server`, `ftp_user`, `ftp_password`, `ftp_path`, `ftp_port`, `ftp_ok`, `ftp_published`, `remote_url`, `sites_trashed`) VALUES
(1, 1, 'My New Site', '1415073471', '1415074040', '', '', '', '/', 21, 0, 0, '', 0),
(2, 1, 'My New Site', '1415074047', '1415074101', '', '', '', '/', 21, 0, 0, '', 0),
(3, 1, 'My New Site', '1415074108', '1415074156', '', '', '', '/', 21, 0, 0, '', 0),
(4, 1, 'My New Site', '1415074165', '1415074209', '', '', '', '/', 21, 0, 0, '', 0),
(5, 1, 'My New Site', '1415074217', '', '', '', '', '/', 21, 0, 0, '', 1),
(6, 28, 'My New Site', '1415074260', '1415074308', '', '', '', '/', 21, 0, 0, '', 0),
(7, 28, 'My New Site', '1415074314', '1415074371', '', '', '', '/', 21, 0, 0, '', 0),
(8, 29, 'My New Site', '1415074391', '1415074448', '', '', '', '/', 21, 0, 0, '', 0),
(9, 29, 'My New Site', '1415074455', '1415074470', '', '', '', '/', 21, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '2e2584d015dd0cf71e6aeb479e88f67d3a38a23a', '', 'admin@admin.com', '', '089b9d05e7e759d3128e0e285610da9b828ce75a', 1414321490, 'U6zJFEc7cNzrTB1zaAx.3O', 1268889823, 1414465278, 1, 'Mr', 'Admin', 'ADMIN', '0'),
(28, '118.174.180.210', 'janedoe@gmail.com', '26d71ed5f16e74f6973f21e0018092a7a5b8e055', NULL, 'janedoe@gmail.com', NULL, NULL, NULL, NULL, 1414464413, 1414464860, 1, 'Jane', 'Doe', NULL, NULL),
(29, '118.174.180.210', 'johndoe@gmail.com', '274081e1ea9c8a8214dc625c39cafcc5c99bc2f5', NULL, 'johndoe@gmail.com', NULL, NULL, NULL, NULL, 1414464484, 1414464958, 1, 'John', 'Doe', NULL, NULL),
(30, '118.174.180.210', 'markjohnson@gmail.com', '93fd0dc6842a4fbacb3a83eb3619db651a1b4cc6', NULL, 'markjohnson@gmail.com', NULL, NULL, NULL, NULL, 1414464515, 1414465200, 1, 'Mark', 'Johnson', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(39, 28, 2),
(40, 29, 2),
(41, 30, 1),
(42, 30, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
