-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 05 Novembre 2013 à 16:21
-- Version du serveur: 5.1.66
-- Version de PHP: 5.3.21

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `sf2`
--

-- --------------------------------------------------------

--
-- Structure de la table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
CREATE TABLE IF NOT EXISTS `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
CREATE TABLE IF NOT EXISTS `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
CREATE TABLE IF NOT EXISTS `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
CREATE TABLE IF NOT EXISTS `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
CREATE TABLE IF NOT EXISTS `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cms_attribute`
--

DROP TABLE IF EXISTS `cms_attribute`;
CREATE TABLE IF NOT EXISTS `cms_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `ref` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `cms_attribute`
--

INSERT INTO `cms_attribute` (`id`, `title`, `ref`) VALUES
(1, 'Text line', 'textline'),
(2, 'Picture', 'picture'),
(3, 'Text', 'textarea'),
(4, 'Html editor', 'editor'),
(5, 'Link', 'link');

-- --------------------------------------------------------

--
-- Structure de la table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
CREATE TABLE IF NOT EXISTS `cms_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `cms_block`
--

INSERT INTO `cms_block` (`id`, `user_id`, `is_repeatable`, `title`, `ref`, `create_date`, `update_date`) VALUES
(5, 1, 0, 'Header de la page', 'header', '2013-10-24 17:54:35', '2013-10-30 15:33:49'),
(7, 1, 1, 'Carousel header', 'carousel_header', '2013-10-31 15:27:24', '2013-10-31 14:27:27'),
(8, 1, 0, 'Contenu', 'content', '2013-11-04 10:50:38', '2013-11-04 09:50:38');

-- --------------------------------------------------------

--
-- Structure de la table `cms_block_attribute`
--

DROP TABLE IF EXISTS `cms_block_attribute`;
CREATE TABLE IF NOT EXISTS `cms_block_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `title` varchar(150) DEFAULT NULL,
  `ref` varchar(150) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`,`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `cms_block_attribute`
--

INSERT INTO `cms_block_attribute` (`id`, `block_id`, `attribute_id`, `sort`, `title`, `ref`, `create_date`, `update_date`) VALUES
(12, 5, 1, 10, 'h1', 'h1', '2013-10-24 17:54:41', '2013-10-30 15:37:16'),
(13, 5, 1, 20, 'h2', 'h2', '2013-10-24 18:05:33', '2013-10-30 15:37:16'),
(15, 7, 2, 10, 'Picture', 'carousel_header_picture', '2013-10-31 15:28:11', '2013-10-31 14:32:55'),
(16, 7, 1, 20, 'Text line', 'carousel_header_h1', '2013-10-31 15:28:11', '2013-10-31 14:32:55'),
(17, 7, 3, 30, 'Text', 'carousel_header_text', '2013-10-31 15:28:11', '2013-10-31 14:32:55'),
(20, 7, 5, 40, NULL, 'carousel_header_link', '2013-10-31 19:35:00', '2013-10-31 18:35:00'),
(21, 8, 4, 10, NULL, 'content_editor', '2013-11-04 10:50:43', '2013-11-04 09:50:43');

-- --------------------------------------------------------

--
-- Structure de la table `cms_host`
--

DROP TABLE IF EXISTS `cms_host`;
CREATE TABLE IF NOT EXISTS `cms_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `cms_host`
--

INSERT INTO `cms_host` (`id`, `title`, `url`, `create_date`) VALUES
(3, 'Site majes', 'local.majesteel', '2013-10-16 13:25:13');

-- --------------------------------------------------------

--
-- Structure de la table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE IF NOT EXISTS `cms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `cms_menu`
--

INSERT INTO `cms_menu` (`id`, `title`, `ref`) VALUES
(1, 'Main menu', 'main'),
(2, 'Footer menu', 'footer');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id_parent` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `target_url` enum('_blank','_self') DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_inmenu` tinyint(4) NOT NULL DEFAULT '1',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_folder` tinyint(4) NOT NULL DEFAULT '0',
  `enable_comments` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_id_parent` (`page_id_parent`),
  KEY `user_id` (`user_id`),
  KEY `host_id` (`host_id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `cms_page`
--

INSERT INTO `cms_page` (`id`, `page_id_parent`, `user_id`, `host_id`, `menu_id`, `template_id`, `link_url`, `target_url`, `sort`, `is_inmenu`, `is_active`, `is_folder`, `enable_comments`, `create_date`, `update_date`) VALUES
(1, NULL, 1, 3, 1, 4, NULL, NULL, 0, 1, 1, 0, 0, '2013-10-31 15:25:42', '2013-11-04 15:45:36'),
(2, NULL, 1, 3, 1, 5, NULL, NULL, 0, 1, 1, 1, 0, '2013-10-31 18:06:13', '2013-11-04 15:45:36'),
(5, NULL, 1, 3, 1, 5, NULL, NULL, 0, 1, 1, 0, 0, '2013-10-31 18:16:11', '2013-11-04 15:45:36'),
(6, NULL, 1, 3, 1, 5, NULL, NULL, 0, 1, 1, 0, 0, '2013-10-31 18:17:10', '2013-11-04 15:45:36'),
(7, 2, 1, 3, 1, 5, NULL, NULL, 0, 1, 1, 0, 0, '2013-10-31 18:24:33', '2013-11-04 15:45:36'),
(8, 2, 1, 3, 1, 5, NULL, NULL, 0, 1, 1, 0, 0, '2013-10-31 18:25:03', '2013-11-04 15:45:36'),
(9, NULL, 1, 3, 2, 5, NULL, NULL, 0, 1, 1, 0, 0, '2013-11-04 16:52:56', '2013-11-04 16:22:13'),
(10, 9, 1, 3, 2, 4, NULL, NULL, 0, 1, 1, 0, 0, '2013-11-04 17:30:13', '2013-11-04 16:30:13');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_lang`
--

DROP TABLE IF EXISTS `cms_page_lang`;
CREATE TABLE IF NOT EXISTS `cms_page_lang` (
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `url_root` varchar(255) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`page_id`,`locale`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cms_page_lang`
--

INSERT INTO `cms_page_lang` (`page_id`, `locale`, `user_id`, `url`, `url_root`, `title`, `meta_title`, `meta_description`, `meta_keywords`, `create_date`, `update_date`) VALUES
(1, 'fr', 1, 'accueil', '', 'Accueil', 'Maje''Steel', 'Maje''Steel est la nouvelle solution CMS du marché. Plus souple, plus efficace et surtout plus intuitive que tout ce qui existe déjà;', NULL, '2013-10-31 15:25:42', '2013-10-31 14:25:42'),
(2, 'fr', 1, 'presentation', '', 'Présentation', 'Présentation', NULL, NULL, '2013-10-31 18:06:13', '2013-10-31 17:06:13'),
(5, 'fr', 1, 'documentation', '', 'Documentation', 'Documentation', NULL, NULL, '2013-10-31 18:16:11', '2013-10-31 17:16:11'),
(6, 'fr', 1, 'references', '', 'Références', 'Références', NULL, NULL, '2013-10-31 18:17:10', '2013-10-31 17:17:11'),
(7, 'en', 1, 'majesteel', '', 'Maje''Steel', 'Maje''Steel en détails', NULL, NULL, '2013-11-04 10:48:43', '2013-10-31 17:24:33'),
(7, 'fr', 1, 'majesteel', '', 'Maje''Steel', 'Maje''Steel en détails', NULL, NULL, '2013-10-31 18:24:33', '2013-10-31 17:24:33'),
(8, 'fr', 1, 'notre-equipe', '', 'Notre équipe', 'Notre équipe', NULL, NULL, '2013-10-31 18:25:03', '2013-10-31 17:25:03'),
(9, 'fr', 1, 'cgv', '', 'Conditions générales de vente', NULL, NULL, NULL, '2013-11-04 16:52:56', '2013-11-04 15:52:56'),
(10, 'fr', 1, 'test', '', 'Test', NULL, NULL, NULL, '2013-11-04 17:30:13', '2013-11-04 16:30:13');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_template_block`
--

DROP TABLE IF EXISTS `cms_page_template_block`;
CREATE TABLE IF NOT EXISTS `cms_page_template_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '1',
  `page_id` int(11) NOT NULL,
  `template_block_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `cms_page_template_block`
--

INSERT INTO `cms_page_template_block` (`id`, `version`, `page_id`, `template_block_id`, `user_id`, `locale`, `content`, `create_date`, `update_date`) VALUES
(1, 6, 1, 12, 1, 'fr', '{"attributes":{"20131031153756":{"title":"Image carousel 1","id":"20131031153756","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":17,"path":"media\\/cms\\/2013-10-31\\/17\\/c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"},"carousel_header_link":{"ref":"link","value":"\\/fr\\/presentation\\/majesteel","label":"En savoir plus","title":"","target":"_self","page_id":7}}},"20131031155531":{"title":"carousel image 2","id":"20131031155531","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":19,"path":"media\\/cms\\/2013-10-31\\/19\\/ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Majes"},"carousel_header_text":{"ref":"textarea","value":"Majes est \\u00e0 l''origine de ce CMS \\u00e9volu\\u00e9 ... Nous sommes parti d''une r\\u00e9flexion de plus de 6 ans avec l''ensemble de nos clients pour mettre en place ce syst\\u00e8me de gestion de contenu qui devrait faciliter grandement le travail."},"carousel_header_link":{"ref":"link","value":"http:\\/\\/majes.fr","label":"En savoir plus","title":"Majes, agence digitale","target":"_blank"}}}}}', '2013-10-31 15:37:56', '2013-11-05 15:15:02'),
(3, 1, 2, 14, 1, 'fr', '{"attributes":{"20131031181045":{"title":"","id":"20131031181045","content":{"h1":{"ref":"textline","value":"Maje''Steel en d\\u00e9tails"},"h2":{"ref":"textline","value":""}}}}}', '2013-10-31 18:10:45', '2013-10-31 17:10:45'),
(4, 2, 7, 14, 1, 'fr', '{"attributes":{"20131104104758":{"title":"","id":"20131104104758","content":{"h1":{"ref":"textline","value":"Header 1"},"h2":{"ref":"textline","value":"Header h2"}}}}}', '2013-11-04 10:47:58', '2013-11-04 09:48:30'),
(5, 2, 7, 14, 1, 'en', '{"attributes":{"20131104104758":{"title":"","id":"20131104104758","content":{"h1":{"ref":"textline","value":"Header 1"},"h2":{"ref":"textline","value":"Header h2"}}}}}', '2013-11-04 10:48:43', '2013-11-04 09:48:30'),
(6, 1, 10, 12, 1, 'fr', '{"attributes":{"20131104173244":{"title":"Image 1","id":"20131104173244","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":20,"path":null},"carousel_header_h1":{"ref":"textline","value":"dede"},"carousel_header_text":{"ref":"textarea","value":"dede"},"carousel_header_link":{"ref":"link","value":"","label":"","title":"","target":"_self"}}}}}', '2013-11-04 17:32:44', '2013-11-04 16:32:44');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_template_block_version`
--

DROP TABLE IF EXISTS `cms_page_template_block_version`;
CREATE TABLE IF NOT EXISTS `cms_page_template_block_version` (
  `page_template_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `content` longtext NOT NULL,
  `status` enum('','draft','published') NOT NULL DEFAULT 'draft',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`page_template_block_id`,`version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `cms_page_template_block_version`
--

INSERT INTO `cms_page_template_block_version` (`page_template_block_id`, `version`, `user_id`, `locale`, `content`, `status`, `create_date`, `update_date`) VALUES
(1, 2, 1, '', '{"attributes":{"20131031153756":{"title":"Image carousel 1","id":"20131031153756","content":{"carousel_header_picture":{"title":"","width":"","height":"","author":"","ref":"picture","media_id":17,"path":"media\\/cms\\/2013-10-31\\/17\\/c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"}}},"20131031155531":{"title":"carousel image 2","id":"20131031155531","content":{"carousel_header_picture":{"title":"","width":"","height":"","author":"","ref":"picture","media_id":19,"path":"media\\/cms\\/2013-10-31\\/19\\/ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Titre"},"carousel_header_text":{"ref":"textarea","value":"Texte"}}}}}', 'published', '2013-10-31 15:55:31', '2013-10-31 14:55:35'),
(1, 3, 1, '', '{"attributes":{"20131031153756":{"title":"Image carousel 1","id":"20131031153756","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":17,"path":"media\\/cms\\/2013-10-31\\/17\\/c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"},"carousel_header_link":{"ref":"link","value":"\\/fr\\/presentation\\/majesteel","label":"En savoir plus","title":"","target":"_self","page_id":7}}},"20131031155531":{"title":"carousel image 2","id":"20131031155531","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":19,"path":"media\\/cms\\/2013-10-31\\/19\\/ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Titre"},"carousel_header_text":{"ref":"textarea","value":"Texte"},"carousel_header_link":{"ref":"link","value":"","label":"","title":"","target":"_self"}}}}}', 'published', '2013-10-31 19:45:47', '2013-10-31 18:55:16'),
(1, 4, 1, '', '{"attributes":{"20131031153756":{"title":"Image carousel 1","id":"20131031153756","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":17,"path":"media\\/cms\\/2013-10-31\\/17\\/c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"},"carousel_header_link":{"ref":"link","value":"\\/fr\\/presentation\\/majesteel","label":"En savoir plus","title":"","target":"_self","page_id":7}}},"20131031155531":{"title":"carousel image 2","id":"20131031155531","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":19,"path":"media\\/cms\\/2013-10-31\\/19\\/ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Majes"},"carousel_header_text":{"ref":"textarea","value":"Majes est \\u00e0 l''origine de ce CMS \\u00e9volu\\u00e9 ... Nous sommes parti d''une r\\u00e9flexion de plus de 6 ans avec l''ensemble de nos clients pour mettre en place ce syst\\u00e8me de gestion de contenu qui devrait faciliter grandement le travail."},"carousel_header_link":{"ref":"link","value":"http:\\/\\/majes.fr","label":"En savoir plus","title":"Majes, agence digitale","target":"_blank"}}}}}', 'published', '2013-10-31 19:58:24', '2013-10-31 18:59:51'),
(1, 5, 1, '', '{"attributes":{"20131031153756":{"title":"Image carousel 11","id":"20131031153756","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":17,"path":"media\\/cms\\/2013-10-31\\/17\\/c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"},"carousel_header_link":{"ref":"link","value":"\\/fr\\/presentation\\/majesteel","label":"En savoir plus","title":"","target":"_self","page_id":7}}},"20131031155531":{"title":"carousel image 2","id":"20131031155531","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":19,"path":"media\\/cms\\/2013-10-31\\/19\\/ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Majes"},"carousel_header_text":{"ref":"textarea","value":"Majes est \\u00e0 l''origine de ce CMS \\u00e9volu\\u00e9 ... Nous sommes parti d''une r\\u00e9flexion de plus de 6 ans avec l''ensemble de nos clients pour mettre en place ce syst\\u00e8me de gestion de contenu qui devrait faciliter grandement le travail."},"carousel_header_link":{"ref":"link","value":"http:\\/\\/majes.fr","label":"En savoir plus","title":"Majes, agence digitale","target":"_blank"}}}}}', 'published', '2013-11-05 16:11:52', '2013-11-05 15:11:56'),
(1, 6, 1, '', '{"attributes":{"20131031153756":{"title":"Image carousel 1","id":"20131031153756","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":17,"path":"media\\/cms\\/2013-10-31\\/17\\/c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"},"carousel_header_link":{"ref":"link","value":"\\/fr\\/presentation\\/majesteel","label":"En savoir plus","title":"","target":"_self","page_id":7}}},"20131031155531":{"title":"carousel image 2","id":"20131031155531","content":{"carousel_header_picture":{"ref":"picture","title":"","width":"","height":"","author":"","media_id":19,"path":"media\\/cms\\/2013-10-31\\/19\\/ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg"},"carousel_header_h1":{"ref":"textline","value":"Majes"},"carousel_header_text":{"ref":"textarea","value":"Majes est \\u00e0 l''origine de ce CMS \\u00e9volu\\u00e9 ... Nous sommes parti d''une r\\u00e9flexion de plus de 6 ans avec l''ensemble de nos clients pour mettre en place ce syst\\u00e8me de gestion de contenu qui devrait faciliter grandement le travail."},"carousel_header_link":{"ref":"link","value":"http:\\/\\/majes.fr","label":"En savoir plus","title":"Majes, agence digitale","target":"_blank"}}}}}', 'published', '2013-11-05 16:14:58', '2013-11-05 15:15:02'),
(4, 2, 1, '', '{"attributes":{"20131104104758":{"title":"","id":"20131104104758","content":{"h1":{"ref":"textline","value":"Header 1"},"h2":{"ref":"textline","value":"Header h2"}}}}}', 'published', '2013-11-04 10:48:10', '2013-11-04 09:48:30');

-- --------------------------------------------------------

--
-- Structure de la table `cms_route`
--

DROP TABLE IF EXISTS `cms_route`;
CREATE TABLE IF NOT EXISTS `cms_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `host` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `cms_route`
--

INSERT INTO `cms_route` (`id`, `page_id`, `locale`, `host`, `url`, `redirect_url`) VALUES
(1, 1, 'fr', 'local.majesteel', '/fr/accueil', NULL),
(2, 2, 'fr', 'local.majesteel', '/fr/presentation', NULL),
(3, 5, 'fr', 'local.majesteel', '/fr/documentation', NULL),
(4, 6, 'fr', 'local.majesteel', '/fr/references', NULL),
(5, 7, 'fr', 'local.majesteel', '/fr/presentation/majesteel', NULL),
(6, 8, 'fr', 'local.majesteel', '/fr/presentation/notre-equipe', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_template`
--

DROP TABLE IF EXISTS `cms_template`;
CREATE TABLE IF NOT EXISTS `cms_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `cms_template`
--

INSERT INTO `cms_template` (`id`, `user_id`, `title`, `ref`, `create_date`, `update_date`) VALUES
(4, 1, 'Accueil', 'home', '2013-10-31 15:33:11', '2013-10-31 14:33:11'),
(5, 1, 'Page de contenu classique', 'content', '2013-10-31 18:05:36', '2013-10-31 17:05:36');

-- --------------------------------------------------------

--
-- Structure de la table `cms_template_block`
--

DROP TABLE IF EXISTS `cms_template_block`;
CREATE TABLE IF NOT EXISTS `cms_template_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `is_mobile` tinyint(4) NOT NULL DEFAULT '1',
  `is_tablet` tinyint(4) NOT NULL DEFAULT '1',
  `is_desktop` tinyint(4) NOT NULL DEFAULT '1',
  `ref` varchar(100) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `cms_template_block`
--

INSERT INTO `cms_template_block` (`id`, `template_id`, `block_id`, `is_mobile`, `is_tablet`, `is_desktop`, `ref`, `sort`, `create_date`, `update_date`) VALUES
(12, 4, 7, 0, 1, 1, 'home_carousel_header', 10, '2013-10-31 15:33:17', '2013-10-31 14:34:24'),
(14, 5, 5, 1, 1, 1, 'content_header', 10, '2013-10-31 18:05:49', '2013-10-31 17:05:49'),
(15, 5, 8, 1, 1, 1, 'content_content', 20, '2013-11-04 10:50:59', '2013-11-04 09:50:59');

-- --------------------------------------------------------

--
-- Structure de la table `core_language`
--

DROP TABLE IF EXISTS `core_language`;
CREATE TABLE IF NOT EXISTS `core_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `locale` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `core_language`
--

INSERT INTO `core_language` (`id`, `is_active`, `locale`, `name`) VALUES
(1, 1, 'fr', 'Française'),
(2, 1, 'en', 'Anglais');

-- --------------------------------------------------------

--
-- Structure de la table `core_language_token`
--

DROP TABLE IF EXISTS `core_language_token`;
CREATE TABLE IF NOT EXISTS `core_language_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DB334CE55F37A13B` (`token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `core_language_token`
--

INSERT INTO `core_language_token` (`id`, `token`) VALUES
(3, 'Dashboard'),
(4, 'Firstname'),
(2, 'Hello'),
(5, 'Is inmenu'),
(1, 'You are connected');

-- --------------------------------------------------------

--
-- Structure de la table `core_language_translation`
--

DROP TABLE IF EXISTS `core_language_translation`;
CREATE TABLE IF NOT EXISTS `core_language_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogue` varchar(200) NOT NULL,
  `translation` text NOT NULL,
  `locale` varchar(200) DEFAULT NULL,
  `language_token_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `core_language_translation`
--

INSERT INTO `core_language_translation` (`id`, `catalogue`, `translation`, `locale`, `language_token_id`) VALUES
(1, 'messages', 'Vous êtes connecté - DB', 'fr', 1),
(3, 'messages', 'Bonjour', 'fr', 2),
(4, 'messages', 'Tableau de bord', 'fr', 3),
(5, 'messages', 'Prénom', 'fr', 4),
(6, 'messages', 'Est dans le menu', 'fr', 5);

-- --------------------------------------------------------

--
-- Structure de la table `core_log`
--

DROP TABLE IF EXISTS `core_log`;
CREATE TABLE IF NOT EXISTS `core_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `route` varchar(200) NOT NULL,
  `params` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `core_log`
--

INSERT INTO `core_log` (`id`, `user_id`, `locale`, `name`, `route`, `params`, `create_date`) VALUES
(1, 1, 'fr', 'SystemListener', '_admin_user_activity', '{"page":"1","new":"1","type":"week","id":"1","_locale":"fr"}', '2013-11-05 15:14:35'),
(2, 1, 'fr', 'SystemListener', '_cms_content', '{"id":null,"menu_id":null,"lang":null,"page_parent_id":null,"_locale":"fr"}', '2013-11-05 15:14:40'),
(3, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2013-11-05 15:14:51'),
(4, 1, 'fr', 'SystemListener', '_cms_pageblock_form', '{"id":"20131031153756","page_template_block_id":"1","page_id":"1","template_block_id":"12","lang":"fr","_locale":"fr"}', '2013-11-05 15:14:54'),
(5, 1, 'fr', 'SystemListener', '_cms_pageblock_edit', '{"lang":"fr","id":"20131031153756","page_id":"1","template_block_id":"12","page_template_block_id":"1","title":"Image carousel 1","attributes":{"carousel_header_picture":{"id":"15","ref":"picture","title":"","width":"","height":"","author":"","media_id":"17"},"carousel_header_h1":{"id":"16","ref":"textline","value":"Maje''Steel"},"carousel_header_text":{"id":"17","ref":"textarea","value":"Nouvelle solution performante de gestion de contenu. Simple et efficace, pour les d\\u00e9veloppeurs comme pour les administrateurs"},"carousel_header_link":{"id":"20","ref":"link","value":"\\/fr\\/presentation\\/majesteel","label":"En savoir plus","title":"","target":"_self"}},"_locale":"fr"}', '2013-11-05 15:14:58'),
(6, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2013-11-05 15:14:58'),
(7, 1, 'fr', 'SystemListener', '_cms_publish', '{"_locale":"fr","id":"1","lang":"fr"}', '2013-11-05 15:15:02'),
(8, 1, 'fr', 'Cms', '_cms_publish', '{"page_id":"1"}', '2013-11-05 15:15:02'),
(9, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2013-11-05 15:15:02'),
(10, 1, 'fr', 'SystemListener', '_admin_user_activity', '{"page":"1","new":"1","type":"week","id":"1","_locale":"fr"}', '2013-11-05 15:15:53'),
(11, 1, 'fr', 'SystemListener', '_admin_user_edit', '{"id":"1","_locale":"fr"}', '2013-11-05 15:19:17'),
(12, 1, 'fr', 'SystemListener', '_admin_user_edit', '{"id":"1","_locale":"fr"}', '2013-11-05 15:19:40'),
(13, 1, 'fr', 'SystemListener', '_admin_user_edit', '{"id":"1","_locale":"fr"}', '2013-11-05 15:19:51'),
(14, 1, 'fr', 'SystemListener', '_admin_user_activity', '{"page":"2","new":"0","type":"week","id":"1","_locale":"fr"}', '2013-11-05 15:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'picture',
  `bundle` varchar(100) NOT NULL DEFAULT 'default',
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) DEFAULT NULL,
  `embedded` text,
  `is_protected` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`),
  KEY `bundle` (`bundle`),
  KEY `is_protected` (`is_protected`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `media`
--

INSERT INTO `media` (`id`, `user_id`, `type`, `bundle`, `title`, `author`, `path`, `embedded`, `is_protected`, `create_date`, `update_date`) VALUES
(2, 1, 'picture', 'media', 'Golf - equipe 2 - 2012', 'Guillaume', 'b28ba94c339d4be3b7dc6e61a5d7cd2ed86db266.jpeg', NULL, 0, '2013-10-08 16:20:43', '2013-10-08 14:39:17'),
(3, 1, 'picture', 'default', 'Raphael en vacs', 'Guillaume', '9809e23514a2a356051aed7ac2a3b38b0c7645c7.jpeg', NULL, 0, '2013-10-08 16:48:16', '2013-10-08 15:48:10'),
(4, 1, 'picture', 'default', 'Willy - Jeune', 'Guillaume', '500399e688646ceed7fb01e9ecbbf021c441c076.jpeg', NULL, 0, '2013-10-08 16:48:53', '2013-10-08 14:50:14'),
(5, 1, 'picture', 'default', 'Little mini coop', 'Guillaume', '24edc8d7900c59735b8de732e70096853ee52006.jpeg', NULL, 0, '2013-10-10 11:40:40', '2013-10-10 09:40:40'),
(6, 1, 'video', 'media', 'Vidéo Mauritannie', 'Guillaume', 'ae31a25a21964bd027c2b58aae7fb36be5cf7d94.flv', NULL, 0, '2013-10-10 11:46:47', '2013-10-10 09:46:47'),
(7, 1, 'document', 'default', 'Fichier PDF', 'Gui', 'bf767abba37a429ac9b43cb38d2698349afe40a0.pdf', NULL, 0, '2013-10-10 13:10:17', '2013-10-10 11:10:17'),
(8, 1, 'picture', 'user', 'Avatar - Guillaume', 'Guillaume de Beauvoir', 'bc7b0b731786af4a95e628a7df291b37cbebd507.jpeg', NULL, 0, '2013-10-10 16:36:59', '2013-10-10 15:56:28'),
(9, 5, 'picture', 'user', 'Avatar - Paul', 'Paul Chabert', '30c894f4b0642ab0bdf73dc67ee32bb66ed7a528.jpeg', NULL, 0, '2013-10-10 16:46:22', '2013-10-10 15:56:25'),
(10, 1, 'picture', 'user', 'paul', 'Guillaume', 'c9ee5f97f9d46cb5800a297ba2c9960fee5c3a69.jpeg', NULL, 0, '2013-10-17 15:45:51', '2013-10-17 13:45:51'),
(11, 1, 'picture', 'cms', 'Titre de l''image', 'Auteur', 'b6057b57fe7e9b3591344f53b8d0deb5cdc8a94c.jpeg', NULL, 0, '2013-10-25 09:58:48', '2013-10-25 08:48:28'),
(14, 1, 'picture', 'cms', 'Equipe 2 - 2013', 'Capt''ain', 'fdbbee3b7191d1590b6b52b9a9af33cf8d50512d.jpeg', NULL, 0, '2013-10-25 16:04:32', '2013-10-25 14:04:32'),
(15, 1, 'picture', 'cms', 'Equipe 2 - 2013', 'Capt''ain', '690bc042ffb71b4de8eb2fb79b650d690e625dad.jpeg', NULL, 0, '2013-10-25 16:13:29', '2013-10-28 16:02:39'),
(16, 1, 'picture', 'cms', 'Compass Mag', 'Guillaume de Beauvoir', '319f8dee719377819f102fd22cee2bf9dbd45ea7.png', NULL, 0, '2013-10-30 16:12:50', '2013-10-30 15:12:50'),
(17, 1, 'picture', 'cms', '', '', 'c6479304d1957eb3b9006d36833a99d3ae8af64e.jpeg', NULL, 0, '2013-10-31 15:37:56', '2013-10-31 14:37:56'),
(18, 1, 'picture', 'cms', '', '', '4af035c032ca0bddeb1c9a9d819fe450150e71f0.jpeg', NULL, 0, '2013-10-31 15:55:31', '2013-10-31 14:55:31'),
(19, 1, 'picture', 'cms', '', '', 'ea52bab1e85401e9e7e02bfde3358a2f82d3a637.jpeg', NULL, 0, '2013-10-31 15:55:31', '2013-10-31 14:55:31'),
(20, 1, 'picture', 'cms', '', '', NULL, NULL, 0, '2013-11-04 17:32:44', '2013-11-04 16:32:44');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `bundle` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `name`, `role`, `bundle`) VALUES
(1, 'Admin - is mandatory in order to have acces to admin panel', 'ROLE_ADMIN', ''),
(2, 'Admin user - has permissions to manage users', 'ROLE_ADMIN_USER', ''),
(3, 'Super admin - has all permissions', 'ROLE_SUPERADMIN', ''),
(5, 'Basic rights for content management', 'ROLE_CMS', 'cms'),
(8, 'Allow admin user to create and manage templating', 'ROLE_CMS_TEMPLATE', 'cms'),
(9, 'Allow admin user to see all media', 'ROLE_MEDIA_LIST', 'media'),
(10, 'Allow admin user to edit or add a media', 'ROLE_MEDIA_EDIT', 'media'),
(11, 'Allow admin user to delete a media', 'ROLE_MEDIA_REMOVE', 'media');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `locale` varchar(200) NOT NULL,
  `lastconnected_date` datetime DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `media_id`, `username`, `email`, `salt`, `password`, `is_active`, `firstname`, `lastname`, `locale`, `lastconnected_date`, `update_date`, `create_date`) VALUES
(1, 8, 'admin@majes.fr', 'admin@majes.fr', '', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'Guillaume', 'de Beauvoir', 'en', '2013-10-29 16:07:39', '2013-10-29 15:07:39', '2013-10-01 16:17:00'),
(2, NULL, 'wm@majes.fr', 'wm@majes.fr', '', '990c37a323daf1549bdd24197927625080ee16b8', 1, 'Willy', 'Mouriesse', 'en', '2013-10-08 22:06:47', '2013-10-08 20:06:47', '2013-10-04 17:52:24'),
(5, 9, 'pc@majes.fr', 'pc@majes.fr', '1c3ec4b3b98a2f832a50996e8f62a89b', '75cd08e34609eb4f6b0b9358f82552bd94eac0b2', 1, 'Paul', 'Chabert', 'fr', '2013-10-08 22:30:22', '2013-10-10 14:46:22', '2013-10-08 22:27:08');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 9),
(2, 10),
(2, 11);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Contraintes pour la table `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
