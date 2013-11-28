-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 20 Novembre 2013 à 13:37
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

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
  `target_url` varchar(6) DEFAULT '_self',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_inmenu` tinyint(4) NOT NULL DEFAULT '1',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_folder` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT '',
  `enable_comments` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_id_parent` (`page_id_parent`),
  KEY `user_id` (`user_id`),
  KEY `host_id` (`host_id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Structure de la table `cms_page_lang`
--

DROP TABLE IF EXISTS `cms_page_lang`;
CREATE TABLE IF NOT EXISTS `cms_page_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `url_root` varchar(255) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `tags` varchar(150) NOT NULL DEFAULT 'Page',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `id` (`id`),
  KEY `page_id` (`page_id`,`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

ALTER TABLE  `cms_page_lang` ADD  `search_description` TEXT NOT NULL DEFAULT  '' AFTER  `title`;

--
-- Structure de la table `cms_page_role`
--

DROP TABLE IF EXISTS `cms_page_role`;
CREATE TABLE IF NOT EXISTS `cms_page_role` (
  `page_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`page_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE  `role` ADD  `tags` TEXT NOT NULL DEFAULT  '' AFTER  `internal`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

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
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`page_template_block_id`,`version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Structure de la table `cms_route`
--

DROP TABLE IF EXISTS `cms_route`;
CREATE TABLE IF NOT EXISTS `cms_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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
  `is_repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `ref` varchar(100) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2408 ;

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'picture',
  `folder` varchar(100) NOT NULL DEFAULT 'default',
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
  KEY `bundle` (`folder`),
  KEY `is_protected` (`is_protected`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `bundle` varchar(50) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `name`, `role`, `bundle`, `internal`, `tags`) VALUES
(1, 'Admin - is mandatory in order to have acces to admin panel', 'ROLE_ADMIN', '', 0, 'Role'),
(2, 'Admin user - has permissions to manage users', 'ROLE_ADMIN_USER', '', 0, 'Role'),
(3, 'Super admin - has all permissions', 'ROLE_SUPERADMIN', '', 0, 'Role'),
(9, 'Allow admin user to see all media', 'ROLE_MEDIA_LIST', 'media', 0, 'Role'),
(10, 'Allow admin user to edit or add a media', 'ROLE_MEDIA_EDIT', 'media', 0, 'Role'),
(11, 'Allow admin user to delete a media', 'ROLE_MEDIA_REMOVE', 'media', 0, 'Role'),
(13, 'Allowed users to add and edit content within the content management system', 'ROLE_CMS_CONTENT', 'cms', 0, 'Role'),
(14, 'Allowed users to publish pages within the content management system', 'ROLE_CMS_PUBLISH', 'cms', 0, 'Role'),
(15, 'Allowed users to edit blocks and templates within the content management system', 'ROLE_CMS_DESIGNER', 'cms', 0, 'Role');

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
  `wysiwyg` tinyint(4) NOT NULL DEFAULT '1',
  `lastconnected_date` datetime DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

ALTER TABLE  `user` ADD  `tags` TEXT NOT NULL DEFAULT  '' AFTER  `wysiwyg`;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `media_id`, `username`, `email`, `salt`, `password`, `is_active`, `firstname`, `lastname`, `locale`, `wysiwyg`, `tags`) VALUES
(1, null, 'admin', 'admin@majes.fr', '', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'Admin', 'Admin', 'en', 1, 'User');

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
(1, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
