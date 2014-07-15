-- phpMyAdmin SQL Dump
-- version 4.2.3
-- http://www.phpmyadmin.net
--
-- Généré le :  Mar 15 Juillet 2014 à 11:58
-- Version du serveur :  5.5.38
-- Version de PHP :  5.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `teelempty`
--

-- --------------------------------------------------------

--
-- Structure de la table `cms_attribute`
--

CREATE TABLE IF NOT EXISTS `cms_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `ref` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Vider la table avant d'insérer `cms_attribute`
--

TRUNCATE TABLE `cms_attribute`;
--
-- Contenu de la table `cms_attribute`
--

INSERT INTO `cms_attribute` VALUES
(1, 'Text line', 'textline'),
(2, 'Picture', 'picture'),
(3, 'Text', 'textarea'),
(4, 'Html editor', 'editor'),
(5, 'Link', 'link'),
(6, 'File', 'file'),
(7, 'Video', 'video'),
(8, 'Checkbox', 'checkbox');

-- --------------------------------------------------------

--
-- Structure de la table `cms_block`
--

CREATE TABLE IF NOT EXISTS `cms_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_repeatable` tinyint(1) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`), KEY `IDX_AD680C0EA76ED395` (`user_id`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_block`
--

TRUNCATE TABLE `cms_block`;
--
-- Contenu de la table `cms_block`
--

INSERT INTO `cms_block` VALUES
(1, 1, 1, 'Paragraph', 'paragraph', '2014-01-02 10:20:10', '2014-01-02 11:00:40');

-- --------------------------------------------------------

--
-- Structure de la table `cms_block_attribute`
--

CREATE TABLE IF NOT EXISTS `cms_block_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `ref` varchar(150) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_6A6984E1E9ED820C` (`block_id`),  KEY `IDX_6A6984E1B6E62EFA` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_block_attribute`
--

TRUNCATE TABLE `cms_block_attribute`;
--
-- Contenu de la table `cms_block_attribute`
--

INSERT INTO `cms_block_attribute` VALUES
(1, 1, 1, 10, 'Title', 'title', '2014-01-02 10:20:19', '2014-01-02 11:02:24'),
(2, 1, 4, 20, 'Content', 'paragraph', '2014-01-02 10:20:19', '2014-01-02 11:02:28');

-- --------------------------------------------------------

--
-- Structure de la table `cms_menu`
--
CREATE TABLE IF NOT EXISTS `cms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

TRUNCATE TABLE `cms_menu`;
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

CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id_parent` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `target_url` varchar(6) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_inmenu` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_folder` tinyint(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `page_id_parent` (`page_id_parent`),  KEY `user_id` (`user_id`),  KEY `host_id` (`host_id`),  KEY `template_id` (`template_id`),  KEY `IDX_D39C1B5DCCD7E912` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_page`
--

TRUNCATE TABLE `cms_page`;
--
-- Contenu de la table `cms_page`
--

INSERT INTO `cms_page` VALUES
(1, NULL, 1, 1, 1, 1, NULL, '', 0, 1, 1, 0, '', 0, '2014-01-02 10:23:33', '2014-01-02 10:58:58');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_lang`
--

CREATE TABLE IF NOT EXISTS `cms_page_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `url_root` varchar(255) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `search_description` text,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `tags` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `user_id` (`user_id`),  KEY `id` (`id`),  KEY `IDX_75ABF8D5C4663E4` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_page_lang`
--

TRUNCATE TABLE `cms_page_lang`;
--
-- Contenu de la table `cms_page_lang`
--

INSERT INTO `cms_page_lang` VALUES
(1, 1, 'fr', 1, '/', '', 'Accueil en français', 'Teel framework - Page accueil', 'Teel framework - Page accueil', NULL, NULL, 'Page', 1, '2014-01-02 10:23:33', '2014-01-02 10:59:03'),
(2, 1, 'en', 1, '/', '', 'Home in English', 'Teel framework - Homepage', 'Teel framework - Homepage', NULL, NULL, 'Page', 1, '2014-01-02 10:45:50', '2014-01-02 10:59:12');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_role`
--

CREATE TABLE IF NOT EXISTS `cms_page_role` (
  `page_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`page_id`,`role_id`),  KEY `IDX_13CBF6DDC4663E4` (`page_id`),  KEY `IDX_13CBF6DDD60322AC` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_template_block`
--

CREATE TABLE IF NOT EXISTS `cms_page_template_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `template_block_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `id` (`id`),  KEY `IDX_925C55F7B6BBB27F` (`template_block_id`),  KEY `IDX_925C55F7C4663E4` (`page_id`),  KEY `IDX_925C55F7A76ED395` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_page_template_block`
--

TRUNCATE TABLE `cms_page_template_block`;
--
-- Contenu de la table `cms_page_template_block`
--

INSERT INTO `cms_page_template_block` VALUES
(1, 1, 1, 1, 1, 'fr', '{"attributes":{"20140102104143":{"title":"Titre paragraphe 1","id":"20140102104143","content":{"title":{"ref":"textline","value":"Titre paragraphe 1"},"paragraph":{"ref":"editor","value":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>"}}}}}', '2014-01-02 10:41:43', '2014-01-02 10:59:36'),
(2, 2, 1, 1, 1, 'en', '{"attributes":{"20140102104143":{"title":"Paragraph1 title","id":"20140102104143","content":{"title":{"ref":"textline","value":"Paragraph1 title"},"paragraph":{"ref":"editor","value":"<p>[EN] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.[\\/EN]<\\/p>"}}}}}', '2014-01-02 10:45:50', '2014-01-02 10:59:38');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_template_block_version`
--

CREATE TABLE IF NOT EXISTS `cms_page_template_block_version` (
  `page_template_block_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`page_template_block_id`,`version`),  KEY `IDX_9F9D550139BF2BC8` (`page_template_block_id`),  KEY `IDX_9F9D5501A76ED395` (`user_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `cms_page_template_block_version`
--

TRUNCATE TABLE `cms_page_template_block_version`;
--
-- Contenu de la table `cms_page_template_block_version`
--

INSERT INTO `cms_page_template_block_version` VALUES
(2, 2, 1, 'en', '{"attributes":{"20140102104143":{"title":"Paragraph1 title","id":"20140102104143","content":{"title":{"ref":"textline","value":"Paragraph1 title"},"paragraph":{"ref":"editor","value":"<p>[EN] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.[\\/EN]<\\/p>"}}}}}', 'published', '2014-01-02 10:46:37', '2014-01-02 10:59:57');

-- --------------------------------------------------------

--
-- Structure de la table `cms_route`
--

CREATE TABLE IF NOT EXISTS `cms_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_2CB7BB55C4663E4` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_route`
--

TRUNCATE TABLE `cms_route`;
--
-- Contenu de la table `cms_route`
--

INSERT INTO `cms_route` VALUES
(1, 1, 'fr', 'Accueil en français', 'teel.dev', '/fr', ''),
(2, 1, 'en', 'Home in English', 'teel.dev', '/en', '');

-- --------------------------------------------------------

--
-- Structure de la table `cms_template`
--

CREATE TABLE IF NOT EXISTS `cms_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_FD8ED37EA76ED395` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_template`
--

TRUNCATE TABLE `cms_template`;
--
-- Contenu de la table `cms_template`
--

INSERT INTO `cms_template` VALUES
(1, 1, 'Home', 'home', '2014-01-02 10:21:25', '2014-01-02 11:00:22');

-- --------------------------------------------------------

--
-- Structure de la table `cms_template_block`
--

CREATE TABLE IF NOT EXISTS `cms_template_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `is_tablet` tinyint(1) NOT NULL,
  `is_desktop` tinyint(1) NOT NULL,
  `is_repeatable` tinyint(1) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `ref` varchar(100) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_46C4330DE9ED820C` (`block_id`),  KEY `IDX_46C4330D5DA0FB8` (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_template_block`
--

TRUNCATE TABLE `cms_template_block`;
--
-- Contenu de la table `cms_template_block`
--

INSERT INTO `cms_template_block` VALUES
(1, 1, 1, 1, 1, 1, 1, '', 'home_paragraph', 10, '2014-01-02 10:21:28', '2014-01-02 11:00:36');

-- --------------------------------------------------------

--
-- Structure de la table `core_chat`
--

CREATE TABLE IF NOT EXISTS `core_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` tinytext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_5778319FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `core_host`
--

CREATE TABLE IF NOT EXISTS `core_host` (
`id` int(11) NOT NULL AUTO_INCREMENT AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `is_multilingual` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `core_host`
--

TRUNCATE TABLE `core_host`;
--
-- Contenu de la table `core_host`
--

INSERT INTO `core_host` VALUES
(1, 'majesteel example', 'teel.dev', 1, '2014-01-02 10:14:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `core_language`
--

CREATE TABLE IF NOT EXISTS `core_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `locale` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `core_language`
--

TRUNCATE TABLE `core_language`;
--
-- Contenu de la table `core_language`
--

INSERT INTO `core_language` VALUES
(1, 1, 'fr', 'Française', NULL),
(2, 1, 'en', 'Anglais', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `core_language_token`
--

CREATE TABLE IF NOT EXISTS `core_language_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),  UNIQUE KEY `UNIQ_DB334CE55F37A13B` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `core_language_translation`
--

CREATE TABLE IF NOT EXISTS `core_language_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogue` varchar(200) NOT NULL,
  `translation` text NOT NULL,
  `locale` varchar(200) NOT NULL,
  `language_token_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_25471F552D7CBF83` (`language_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `core_log`
--

CREATE TABLE IF NOT EXISTS `core_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `route` varchar(200) NOT NULL,
  `params` text NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_B290BEE9A76ED395` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Vider la table avant d'insérer `core_log`
--

TRUNCATE TABLE `core_log`;
--
-- Contenu de la table `core_log`
--

INSERT INTO `core_log` VALUES
(1, 1, 'fr', 'SystemListener', 'majes_cms_1_fr', '{"_locale":"fr"}', '2014-01-02 11:01:14', '0000-00-00 00:00:00'),
(2, 1, 'fr', 'SystemListener', '_media_list', '{"context":"full","_locale":"fr"}', '2014-01-02 11:01:28', '0000-00-00 00:00:00'),
(3, 1, 'fr', 'SystemListener', '_cms_content', '{"id":null,"menu_id":null,"lang":null,"page_parent_id":null,"_locale":"fr"}', '2014-01-02 11:01:31', '0000-00-00 00:00:00'),
(4, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2014-01-02 11:01:34', '0000-00-00 00:00:00'),
(5, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2014-01-02 11:02:30', '0000-00-00 00:00:00'),
(6, 1, 'fr', 'SystemListener', 'majes_cms_1_fr', '{"_locale":"fr"}', '2014-01-02 11:02:34', '0000-00-00 00:00:00'),
(7, 1, 'en', 'SystemListener', 'majes_cms_1_en', '{"_locale":"en"}', '2014-01-02 11:02:42', '0000-00-00 00:00:00'),
(8, 1, 'en', 'SystemListener', '_admin_index', '{"_locale":"en"}', '2014-01-02 11:26:02', '0000-00-00 00:00:00'),
(9, 1, 'en', 'SystemListener', '_cms_content', '{"id":null,"menu_id":null,"lang":null,"page_parent_id":null,"_locale":"en"}', '2014-01-02 11:26:05', '0000-00-00 00:00:00'),
(10, 1, 'en', 'SystemListener', 'majes_cms_1_en', '{"_locale":"en"}', '2014-01-02 11:26:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `core_mailer`
--

CREATE TABLE IF NOT EXISTS `core_mailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_from` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address_to` text COLLATE utf8_unicode_ci NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_A0C485BCA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `core_stat`
--

CREATE TABLE IF NOT EXISTS `core_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_tablet` tinyint(1) NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `new_visits` int(11) NOT NULL,
  `percent_new_visits` decimal(10,0) NOT NULL,
  `avg_time_to_site` decimal(10,0) NOT NULL,
  `pageviews_per_visits` decimal(10,0) NOT NULL,
  `current` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ext_log_entries`
--

CREATE TABLE IF NOT EXISTS `ext_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),  KEY `log_class_lookup_idx` (`object_class`),  KEY `log_date_lookup_idx` (`logged_at`),  KEY `log_user_lookup_idx` (`username`),  KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ext_translations`
--

CREATE TABLE IF NOT EXISTS `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),  KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `embedded` longtext,
  `is_protected` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `bundle` varchar(50) NOT NULL DEFAULT '',
  `internal` tinyint(1) NOT NULL,
  `tags` text NOT NULL,
  PRIMARY KEY (`id`),  UNIQUE KEY `UNIQ_57698A6A57698A6A` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Vider la table avant d'insérer `role`
--

TRUNCATE TABLE `role`;
--
-- Contenu de la table `role`
--

INSERT INTO `role` VALUES
(1, 'Admin - is mandatory in order to have acces to admin panel', 'ROLE_ADMIN', '', 0, 'Role'),
(2, 'Admin user - has permissions to manage users', 'ROLE_ADMIN_USER', '', 0, 'Role'),
(3, 'Super admin - has all permissions', 'ROLE_SUPERADMIN', '', 0, 'Role'),
(4, 'User - access to their account', 'ROLE_USER', '', 0, 'Role'),
(9, 'Allow admin user to see all media', 'ROLE_MEDIA_LIST', 'media', 0, 'Role'),
(10, 'Allow admin user to edit or add a media', 'ROLE_MEDIA_EDIT', 'media', 0, 'Role'),
(11, 'Allow admin user to delete a media', 'ROLE_MEDIA_REMOVE', 'media', 0, 'Role'),
(13, 'Allowed users to add and edit content within the content management system', 'ROLE_CMS_CONTENT', 'cms', 0, 'Role'),
(14, 'Allowed users to publish pages within the content management system', 'ROLE_CMS_PUBLISH', 'cms', 0, 'Role'),
(15, 'Allowed users to edit blocks and templates within the content management system', 'ROLE_CMS_DESIGNER', 'cms', 0, 'Role'),
(16, 'Default user right', 'ROLE_CMS_USER', 'cms', 0, 'Role');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userdata_id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `social` longtext COMMENT '(DC2Type:json_array)',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `locale` varchar(200) NOT NULL,
  `wysiwyg` tinyint(1) NOT NULL,
  `tags` text NOT NULL,
  `lastconnected_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),  KEY `IDX_8D93D649EA9FDD75` (`media_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `user`
--

TRUNCATE TABLE `user`;
--
-- Contenu de la table `user`
--

INSERT INTO `user` VALUES
(1, 1, NULL, '', 'admin', 'admin@admin.fr', '9cc414192a04b925386bcd9d0bbb1517', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'Admin', 'Admin', 'en', 1, 'User', NULL, '2014-01-02 10:56:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
    `update_date` datetime NOT NULL,
    `create_date` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;
--
-- Vider la table avant d'insérer `user_role`
--

TRUNCATE TABLE `user_data`;

--
-- Contenu de la table `user_data`
--

INSERT INTO `user_data` (`id`, `update_date`, `create_date`) VALUES
(1, '2014-07-15 00:00:00', '2014-07-15 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user_address`
--

CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),  KEY `IDX_5543718BA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),  KEY `IDX_2DE8C6A3A76ED395` (`user_id`),  KEY `IDX_2DE8C6A3D60322AC` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `user_role`
--

TRUNCATE TABLE `user_role`;
--
-- Contenu de la table `user_role`
--

INSERT INTO `user_role` VALUES
(1, 1),
(1, 2),
(1, 3);


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cms_block`
--
ALTER TABLE `cms_block`
ADD CONSTRAINT `FK_AD680C0EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cms_block_attribute`
--
ALTER TABLE `cms_block_attribute`
ADD CONSTRAINT `FK_6A6984E1B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`),
ADD CONSTRAINT `FK_6A6984E1E9ED820C` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`id`);

--
-- Contraintes pour la table `cms_page`
--
ALTER TABLE `cms_page`
ADD CONSTRAINT `FK_D39C1B5D5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `cms_template` (`id`),
ADD CONSTRAINT `FK_D39C1B5D1FB8D185` FOREIGN KEY (`host_id`) REFERENCES `core_host` (`id`),
ADD CONSTRAINT `FK_D39C1B5D20576A6D` FOREIGN KEY (`page_id_parent`) REFERENCES `cms_page` (`id`),
ADD CONSTRAINT `FK_D39C1B5DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK_D39C1B5DCCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `cms_menu` (`id`);

--
-- Contraintes pour la table `cms_page_lang`
--
ALTER TABLE `cms_page_lang`
ADD CONSTRAINT `FK_75ABF8D5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK_75ABF8D5C4663E4` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`);

--
-- Contraintes pour la table `cms_page_role`
--
ALTER TABLE `cms_page_role`
ADD CONSTRAINT `FK_13CBF6DDD60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
ADD CONSTRAINT `FK_13CBF6DDC4663E4` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`);

--
-- Contraintes pour la table `cms_page_template_block`
--
ALTER TABLE `cms_page_template_block`
ADD CONSTRAINT `FK_925C55F7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK_925C55F7B6BBB27F` FOREIGN KEY (`template_block_id`) REFERENCES `cms_template_block` (`id`),
ADD CONSTRAINT `FK_925C55F7C4663E4` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`);

--
-- Contraintes pour la table `cms_page_template_block_version`
--
ALTER TABLE `cms_page_template_block_version`
ADD CONSTRAINT `FK_9F9D5501A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK_9F9D550139BF2BC8` FOREIGN KEY (`page_template_block_id`) REFERENCES `cms_page_template_block` (`id`);

--
-- Contraintes pour la table `cms_route`
--
ALTER TABLE `cms_route`
ADD CONSTRAINT `FK_2CB7BB55C4663E4` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`);

--
-- Contraintes pour la table `cms_template`
--
ALTER TABLE `cms_template`
ADD CONSTRAINT `FK_FD8ED37EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cms_template_block`
--
ALTER TABLE `cms_template_block`
ADD CONSTRAINT `FK_46C4330D5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `cms_template` (`id`),
ADD CONSTRAINT `FK_46C4330DE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`id`);

--
-- Contraintes pour la table `core_chat`
--
ALTER TABLE `core_chat`
ADD CONSTRAINT `FK_5778319FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `core_language_translation`
--
ALTER TABLE `core_language_translation`
ADD CONSTRAINT `FK_25471F552D7CBF83` FOREIGN KEY (`language_token_id`) REFERENCES `core_language_token` (`id`);

--
-- Contraintes pour la table `core_log`
--
ALTER TABLE `core_log`
ADD CONSTRAINT `FK_B290BEE9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `core_mailer`
--
ALTER TABLE `core_mailer`
ADD CONSTRAINT `FK_A0C485BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
ADD CONSTRAINT `FK_6A2CA10CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `FK_8D93D649EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `user_address`
--
ALTER TABLE `user_address`
ADD CONSTRAINT `FK_5543718BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
ADD CONSTRAINT `FK_2DE8C6A3D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
ADD CONSTRAINT `FK_2DE8C6A3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
