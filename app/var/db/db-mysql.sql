-- phpMyAdmin SQL Dump
-- version 4.2.3
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 28 Juillet 2014 à 17:30
-- Version du serveur :  5.5.38
-- Version de PHP :  5.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `teel_empty`
--

-- --------------------------------------------------------

--
-- Structure de la table `cms_attribute`
--

DROP TABLE IF EXISTS `cms_attribute`;
CREATE TABLE IF NOT EXISTS `cms_attribute` (
`id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Vider la table avant d'insérer `cms_attribute`
--

TRUNCATE TABLE `cms_attribute`;
--
-- Contenu de la table `cms_attribute`
--

INSERT INTO `cms_attribute` (`id`, `title`, `ref`) VALUES
(1, 'Text line', 'textline'),
(2, 'Picture', 'picture'),
(3, 'Text', 'textarea'),
(4, 'Html editor', 'editor'),
(5, 'Link', 'link'),
(6, 'File', 'file'),
(7, 'Video', 'video'),
(8, 'Checkbox', 'checkbox'),
(9, 'Date', 'date');

-- --------------------------------------------------------

--
-- Structure de la table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
CREATE TABLE IF NOT EXISTS `cms_block` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_repeatable` tinyint(1) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_block`
--

TRUNCATE TABLE `cms_block`;
--
-- Contenu de la table `cms_block`
--

INSERT INTO `cms_block` (`id`, `user_id`, `is_repeatable`, `title`, `ref`, `create_date`, `update_date`, `deleted`) VALUES
(1, 1, 1, 'Paragraph', 'paragraph', '2014-01-02 10:20:10', '2014-01-02 11:00:40', 0);

-- --------------------------------------------------------

--
-- Structure de la table `cms_block_attribute`
--

DROP TABLE IF EXISTS `cms_block_attribute`;
CREATE TABLE IF NOT EXISTS `cms_block_attribute` (
`id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `ref` varchar(150) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_block_attribute`
--

TRUNCATE TABLE `cms_block_attribute`;
--
-- Contenu de la table `cms_block_attribute`
--

INSERT INTO `cms_block_attribute` (`id`, `block_id`, `attribute_id`, `sort`, `title`, `ref`, `create_date`, `update_date`) VALUES
(1, 1, 1, 10, 'Title', 'title', '2014-01-02 10:20:19', '2014-01-02 11:02:24'),
(2, 1, 4, 20, 'Content', 'paragraph', '2014-01-02 10:20:19', '2014-01-02 11:02:28');

-- --------------------------------------------------------

--
-- Structure de la table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE IF NOT EXISTS `cms_menu` (
`id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_menu`
--

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

DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
`id` int(11) NOT NULL,
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
  `enable_comments` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_page`
--

TRUNCATE TABLE `cms_page`;
--
-- Contenu de la table `cms_page`
--

INSERT INTO `cms_page` (`id`, `page_id_parent`, `user_id`, `host_id`, `menu_id`, `template_id`, `link_url`, `target_url`, `sort`, `is_inmenu`, `is_active`, `is_folder`, `enable_comments`, `create_date`, `update_date`, `deleted`) VALUES
(1, NULL, 1, 1, 1, 1, NULL, '', 0, 1, 1, 0, 0, '2014-01-02 10:23:33', '2014-01-02 10:58:58', 0);

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_lang`
--

DROP TABLE IF EXISTS `cms_page_lang`;
CREATE TABLE IF NOT EXISTS `cms_page_lang` (
`id` int(11) NOT NULL,
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
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_page_lang`
--

TRUNCATE TABLE `cms_page_lang`;
--
-- Contenu de la table `cms_page_lang`
--

INSERT INTO `cms_page_lang` (`id`, `page_id`, `locale`, `user_id`, `url`, `url_root`, `title`, `search_description`, `meta_title`, `meta_description`, `meta_keywords`, `tags`, `is_active`, `create_date`, `update_date`, `deleted`) VALUES
(1, 1, 'fr', 1, '/', '', 'Accueil en français', 'Teel framework - Page accueil', 'Teel framework - Page accueil', NULL, NULL, 'Page', 1, '2014-01-02 10:23:33', '2014-01-02 10:59:03', 0),
(2, 1, 'en', 1, '/', '', 'Home in English', 'Teel framework - Homepage', 'Teel framework - Homepage', NULL, NULL, 'Page', 1, '2014-01-02 10:45:50', '2014-01-02 10:59:12', 0);

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_role`
--

DROP TABLE IF EXISTS `cms_page_role`;
CREATE TABLE IF NOT EXISTS `cms_page_role` (
  `page_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `cms_page_role`
--

TRUNCATE TABLE `cms_page_role`;
-- --------------------------------------------------------

--
-- Structure de la table `cms_page_template_block`
--

DROP TABLE IF EXISTS `cms_page_template_block`;
CREATE TABLE IF NOT EXISTS `cms_page_template_block` (
`id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `template_block_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_page_template_block`
--

TRUNCATE TABLE `cms_page_template_block`;
--
-- Contenu de la table `cms_page_template_block`
--

INSERT INTO `cms_page_template_block` (`id`, `version`, `page_id`, `template_block_id`, `user_id`, `locale`, `content`, `create_date`, `update_date`) VALUES
(1, 1, 1, 1, 1, 'fr', '{"attributes":{"20140102104143":{"title":"Titre paragraphe 1","id":"20140102104143","content":{"title":{"ref":"textline","value":"Titre paragraphe 1"},"paragraph":{"ref":"editor","value":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>"}}}}}', '2014-01-02 10:41:43', '2014-01-02 10:59:36'),
(2, 2, 1, 1, 1, 'en', '{"attributes":{"20140102104143":{"title":"Paragraph1 title","id":"20140102104143","content":{"title":{"ref":"textline","value":"Paragraph1 title"},"paragraph":{"ref":"editor","value":"<p>[EN] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.[\\/EN]<\\/p>"}}}}}', '2014-01-02 10:45:50', '2014-01-02 10:59:38');

-- --------------------------------------------------------

--
-- Structure de la table `cms_page_template_block_version`
--

DROP TABLE IF EXISTS `cms_page_template_block_version`;
CREATE TABLE IF NOT EXISTS `cms_page_template_block_version` (
  `page_template_block_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `cms_page_template_block_version`
--

TRUNCATE TABLE `cms_page_template_block_version`;
--
-- Contenu de la table `cms_page_template_block_version`
--

INSERT INTO `cms_page_template_block_version` (`page_template_block_id`, `version`, `user_id`, `locale`, `content`, `status`, `create_date`, `update_date`) VALUES
(2, 2, 1, 'en', '{"attributes":{"20140102104143":{"title":"Paragraph1 title","id":"20140102104143","content":{"title":{"ref":"textline","value":"Paragraph1 title"},"paragraph":{"ref":"editor","value":"<p>[EN] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.[\\/EN]<\\/p>"}}}}}', 'published', '2014-01-02 10:46:37', '2014-01-02 10:59:57');

-- --------------------------------------------------------

--
-- Structure de la table `cms_route`
--

DROP TABLE IF EXISTS `cms_route`;
CREATE TABLE IF NOT EXISTS `cms_route` (
`id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `redirect_url` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `cms_route`
--

TRUNCATE TABLE `cms_route`;
--
-- Contenu de la table `cms_route`
--

INSERT INTO `cms_route` (`id`, `page_id`, `locale`, `title`, `host`, `url`, `redirect_url`) VALUES
(1, 1, 'fr', 'Accueil en français', 'local.test.majesteel', '/fr', ''),
(2, 1, 'en', 'Home in English', 'local.test.majesteel', '/en', '');

-- --------------------------------------------------------

--
-- Structure de la table `cms_template`
--

DROP TABLE IF EXISTS `cms_template`;
CREATE TABLE IF NOT EXISTS `cms_template` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `ref` varchar(50) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_template`
--

TRUNCATE TABLE `cms_template`;
--
-- Contenu de la table `cms_template`
--

INSERT INTO `cms_template` (`id`, `user_id`, `title`, `ref`, `create_date`, `update_date`, `deleted`) VALUES
(1, 1, 'Home', 'home', '2014-01-02 10:21:25', '2014-01-02 11:00:22', 0);

-- --------------------------------------------------------

--
-- Structure de la table `cms_template_block`
--

DROP TABLE IF EXISTS `cms_template_block`;
CREATE TABLE IF NOT EXISTS `cms_template_block` (
`id` int(11) NOT NULL,
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
  `update_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `cms_template_block`
--

TRUNCATE TABLE `cms_template_block`;
--
-- Contenu de la table `cms_template_block`
--

INSERT INTO `cms_template_block` (`id`, `template_id`, `block_id`, `is_mobile`, `is_tablet`, `is_desktop`, `is_repeatable`, `title`, `ref`, `sort`, `create_date`, `update_date`) VALUES
(1, 1, 1, 1, 1, 1, 1, '', 'home_paragraph', 10, '2014-01-02 10:21:28', '2014-01-02 11:00:36');

-- --------------------------------------------------------

--
-- Structure de la table `core_chat`
--

DROP TABLE IF EXISTS `core_chat`;
CREATE TABLE IF NOT EXISTS `core_chat` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` tinytext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `core_chat`
--

TRUNCATE TABLE `core_chat`;
-- --------------------------------------------------------

--
-- Structure de la table `core_host`
--

DROP TABLE IF EXISTS `core_host`;
CREATE TABLE IF NOT EXISTS `core_host` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `is_multilingual` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `core_host`
--

TRUNCATE TABLE `core_host`;
--
-- Contenu de la table `core_host`
--

INSERT INTO `core_host` (`id`, `title`, `url`, `is_multilingual`, `create_date`, `update_date`, `deleted`) VALUES
(1, 'Majesteel', 'local.test.majesteel', 1, '2014-01-02 10:14:13', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `core_language`
--

DROP TABLE IF EXISTS `core_language`;
CREATE TABLE IF NOT EXISTS `core_language` (
`id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `locale` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `host` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `core_language`
--

TRUNCATE TABLE `core_language`;
--
-- Contenu de la table `core_language`
--

INSERT INTO `core_language` (`id`, `is_active`, `locale`, `name`, `host`) VALUES
(1, 1, 'fr', 'Française', NULL),
(2, 1, 'en', 'Anglais', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `core_language_token`
--

DROP TABLE IF EXISTS `core_language_token`;
CREATE TABLE IF NOT EXISTS `core_language_token` (
`id` int(11) NOT NULL,
  `token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `core_language_token`
--

TRUNCATE TABLE `core_language_token`;
-- --------------------------------------------------------

--
-- Structure de la table `core_language_translation`
--

DROP TABLE IF EXISTS `core_language_translation`;
CREATE TABLE IF NOT EXISTS `core_language_translation` (
`id` int(11) NOT NULL,
  `catalogue` varchar(200) NOT NULL,
  `translation` text NOT NULL,
  `locale` varchar(200) NOT NULL,
  `language_token_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `core_language_translation`
--

TRUNCATE TABLE `core_language_translation`;
-- --------------------------------------------------------

--
-- Structure de la table `core_log`
--

DROP TABLE IF EXISTS `core_log`;
CREATE TABLE IF NOT EXISTS `core_log` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `route` varchar(200) NOT NULL,
  `params` text NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Vider la table avant d'insérer `core_log`
--

TRUNCATE TABLE `core_log`;
--
-- Contenu de la table `core_log`
--

INSERT INTO `core_log` (`id`, `user_id`, `locale`, `name`, `route`, `params`, `create_date`, `update_date`) VALUES
(1, 1, 'fr', 'SystemListener', 'majes_cms_1_fr', '{"_locale":"fr"}', '2014-01-02 11:01:14', '0000-00-00 00:00:00'),
(2, 1, 'fr', 'SystemListener', '_media_list', '{"context":"full","_locale":"fr"}', '2014-01-02 11:01:28', '0000-00-00 00:00:00'),
(3, 1, 'fr', 'SystemListener', '_cms_content', '{"id":null,"menu_id":null,"lang":null,"page_parent_id":null,"_locale":"fr"}', '2014-01-02 11:01:31', '0000-00-00 00:00:00'),
(4, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2014-01-02 11:01:34', '0000-00-00 00:00:00'),
(5, 1, 'fr', 'SystemListener', '_cms_content', '{"id":"1","menu_id":"1","lang":"fr","page_parent_id":"0","_locale":"fr"}', '2014-01-02 11:02:30', '0000-00-00 00:00:00'),
(6, 1, 'fr', 'SystemListener', 'majes_cms_1_fr', '{"_locale":"fr"}', '2014-01-02 11:02:34', '0000-00-00 00:00:00'),
(7, 1, 'en', 'SystemListener', 'majes_cms_1_en', '{"_locale":"en"}', '2014-01-02 11:02:42', '0000-00-00 00:00:00'),
(8, 1, 'en', 'SystemListener', '_admin_index', '{"_locale":"en"}', '2014-01-02 11:26:02', '0000-00-00 00:00:00'),
(9, 1, 'en', 'SystemListener', '_cms_content', '{"id":null,"menu_id":null,"lang":null,"page_parent_id":null,"_locale":"en"}', '2014-01-02 11:26:05', '0000-00-00 00:00:00'),
(10, 1, 'en', 'SystemListener', 'majes_cms_1_en', '{"_locale":"en"}', '2014-01-02 11:26:16', '0000-00-00 00:00:00'),
(11, 1, 'fr', 'SystemListener', '_admin_index', '{"_locale":"fr"}', '2014-07-28 17:12:44', '2014-07-28 17:12:44'),
(12, 1, 'fr', 'SystemListener', '_admin_myaccount', '{"_locale":"fr"}', '2014-07-28 17:27:27', '2014-07-28 17:27:27'),
(13, 1, 'fr', 'SystemListener', '_admin_myaccount', '{"myaccount":{"firstname":"Admin","lastname":"Admin","email":"admin@admin.fr","is_active":"1","wysiwyg":"1","locale":"en","password":{"password":"admin","password_confirm":"admin"}},"_locale":"fr"}', '2014-07-28 17:27:34', '2014-07-28 17:27:34'),
(14, 1, 'fr', 'SystemListener', '_admin_index', '{"_locale":"fr"}', '2014-07-28 17:28:20', '2014-07-28 17:28:20');

-- --------------------------------------------------------

--
-- Structure de la table `core_mailer`
--

DROP TABLE IF EXISTS `core_mailer`;
CREATE TABLE IF NOT EXISTS `core_mailer` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_from` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address_to` text COLLATE utf8_unicode_ci NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `core_mailer`
--

TRUNCATE TABLE `core_mailer`;
-- --------------------------------------------------------

--
-- Structure de la table `core_stat`
--

DROP TABLE IF EXISTS `core_stat`;
CREATE TABLE IF NOT EXISTS `core_stat` (
`id` int(11) NOT NULL,
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
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `core_stat`
--

TRUNCATE TABLE `core_stat`;
-- --------------------------------------------------------

--
-- Structure de la table `ext_log_entries`
--

DROP TABLE IF EXISTS `ext_log_entries`;
CREATE TABLE IF NOT EXISTS `ext_log_entries` (
`id` int(11) NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `ext_log_entries`
--

TRUNCATE TABLE `ext_log_entries`;
-- --------------------------------------------------------

--
-- Structure de la table `ext_translations`
--

DROP TABLE IF EXISTS `ext_translations`;
CREATE TABLE IF NOT EXISTS `ext_translations` (
`id` int(11) NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `ext_translations`
--

TRUNCATE TABLE `ext_translations`;
-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `embedded` longtext,
  `is_protected` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vider la table avant d'insérer `media`
--

TRUNCATE TABLE `media`;
-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `bundle` varchar(50) NOT NULL DEFAULT '',
  `is_system` tinyint(1) NOT NULL,
  `tags` text NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Vider la table avant d'insérer `role`
--

TRUNCATE TABLE `role`;
--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `name`, `role`, `bundle`, `is_system`, `tags`, `deleted`) VALUES
(1, 'Admin - is mandatory in order to have acces to admin panel', 'ROLE_ADMIN', '', 0, 'Role', 0),
(2, 'Admin user - has permissions to manage users', 'ROLE_ADMIN_USER', '', 0, 'Role', 0),
(3, 'Super admin - has all permissions', 'ROLE_SUPERADMIN', '', 0, 'Role', 0),
(4, 'User - access to their account', 'ROLE_USER', '', 0, 'Role', 0),
(9, 'Allow admin user to see all media', 'ROLE_MEDIA_LIST', 'media', 0, 'Role', 0),
(10, 'Allow admin user to edit or add a media', 'ROLE_MEDIA_EDIT', 'media', 0, 'Role', 0),
(11, 'Allow admin user to delete a media', 'ROLE_MEDIA_REMOVE', 'media', 0, 'Role', 0),
(13, 'Allowed users to add and edit content within the content management system', 'ROLE_CMS_CONTENT', 'cms', 0, 'Role', 0),
(14, 'Allowed users to publish pages within the content management system', 'ROLE_CMS_PUBLISH', 'cms', 0, 'Role', 0),
(15, 'Allowed users to edit blocks and templates within the content management system', 'ROLE_CMS_DESIGNER', 'cms', 0, 'Role', 0),
(16, 'Default user right', 'ROLE_CMS_USER', 'cms', 0, 'Role', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `userdata_id` int(11) DEFAULT NULL,
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
  `update_date` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `user`
--

TRUNCATE TABLE `user`;
--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `userdata_id`, `media_id`, `social`, `username`, `email`, `salt`, `password`, `is_active`, `firstname`, `lastname`, `locale`, `wysiwyg`, `tags`, `lastconnected_date`, `update_date`, `create_date`, `deleted`) VALUES
(1, 1, NULL, '', 'admin@admin.fr', 'admin@admin.fr', '', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'Admin', 'Admin', 'en', 1, 'User', NULL, '2014-07-28 17:27:34', '2014-01-01 00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Vider la table avant d'insérer `user_address`
--

TRUNCATE TABLE `user_address`;
-- --------------------------------------------------------

--
-- Structure de la table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
CREATE TABLE IF NOT EXISTS `user_data` (
`id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Vider la table avant d'insérer `user_data`
--

TRUNCATE TABLE `user_data`;
--
-- Contenu de la table `user_data`
--

INSERT INTO `user_data` (`id`, `update_date`, `create_date`) VALUES
(1, '2014-07-15 00:00:00', '2014-07-15 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `user_role`
--

TRUNCATE TABLE `user_role`;
--
-- Contenu de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cms_attribute`
--
ALTER TABLE `cms_attribute`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cms_block`
--
ALTER TABLE `cms_block`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_AD680C0EA76ED395` (`user_id`);

--
-- Index pour la table `cms_block_attribute`
--
ALTER TABLE `cms_block_attribute`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_6A6984E1E9ED820C` (`block_id`), ADD KEY `IDX_6A6984E1B6E62EFA` (`attribute_id`);

--
-- Index pour la table `cms_menu`
--
ALTER TABLE `cms_menu`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cms_page`
--
ALTER TABLE `cms_page`
 ADD PRIMARY KEY (`id`), ADD KEY `page_id_parent` (`page_id_parent`), ADD KEY `user_id` (`user_id`), ADD KEY `host_id` (`host_id`), ADD KEY `template_id` (`template_id`), ADD KEY `IDX_D39C1B5DCCD7E912` (`menu_id`);

--
-- Index pour la table `cms_page_lang`
--
ALTER TABLE `cms_page_lang`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `id` (`id`), ADD KEY `IDX_75ABF8D5C4663E4` (`page_id`);

--
-- Index pour la table `cms_page_role`
--
ALTER TABLE `cms_page_role`
 ADD PRIMARY KEY (`page_id`,`role_id`), ADD KEY `IDX_13CBF6DDC4663E4` (`page_id`), ADD KEY `IDX_13CBF6DDD60322AC` (`role_id`);

--
-- Index pour la table `cms_page_template_block`
--
ALTER TABLE `cms_page_template_block`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`), ADD KEY `IDX_925C55F7B6BBB27F` (`template_block_id`), ADD KEY `IDX_925C55F7C4663E4` (`page_id`), ADD KEY `IDX_925C55F7A76ED395` (`user_id`);

--
-- Index pour la table `cms_page_template_block_version`
--
ALTER TABLE `cms_page_template_block_version`
 ADD PRIMARY KEY (`page_template_block_id`,`version`), ADD KEY `IDX_9F9D550139BF2BC8` (`page_template_block_id`), ADD KEY `IDX_9F9D5501A76ED395` (`user_id`);

--
-- Index pour la table `cms_route`
--
ALTER TABLE `cms_route`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_2CB7BB55C4663E4` (`page_id`);

--
-- Index pour la table `cms_template`
--
ALTER TABLE `cms_template`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_FD8ED37EA76ED395` (`user_id`);

--
-- Index pour la table `cms_template_block`
--
ALTER TABLE `cms_template_block`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_46C4330DE9ED820C` (`block_id`), ADD KEY `IDX_46C4330D5DA0FB8` (`template_id`);

--
-- Index pour la table `core_chat`
--
ALTER TABLE `core_chat`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_5778319FA76ED395` (`user_id`);

--
-- Index pour la table `core_host`
--
ALTER TABLE `core_host`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `core_language`
--
ALTER TABLE `core_language`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `core_language_token`
--
ALTER TABLE `core_language_token`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_DB334CE55F37A13B` (`token`);

--
-- Index pour la table `core_language_translation`
--
ALTER TABLE `core_language_translation`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_25471F552D7CBF83` (`language_token_id`);

--
-- Index pour la table `core_log`
--
ALTER TABLE `core_log`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_B290BEE9A76ED395` (`user_id`);

--
-- Index pour la table `core_mailer`
--
ALTER TABLE `core_mailer`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_A0C485BCA76ED395` (`user_id`);

--
-- Index pour la table `core_stat`
--
ALTER TABLE `core_stat`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ext_log_entries`
--
ALTER TABLE `ext_log_entries`
 ADD PRIMARY KEY (`id`), ADD KEY `log_class_lookup_idx` (`object_class`), ADD KEY `log_date_lookup_idx` (`logged_at`), ADD KEY `log_user_lookup_idx` (`username`), ADD KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`);

--
-- Index pour la table `ext_translations`
--
ALTER TABLE `ext_translations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`), ADD KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_57698A6A57698A6A` (`role`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`), ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`), ADD UNIQUE KEY `UNIQ_8D93D649AB945D82` (`userdata_id`), ADD KEY `IDX_8D93D649EA9FDD75` (`media_id`);

--
-- Index pour la table `user_address`
--
ALTER TABLE `user_address`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_5543718BA76ED395` (`user_id`);

--
-- Index pour la table `user_data`
--
ALTER TABLE `user_data`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
 ADD PRIMARY KEY (`user_id`,`role_id`), ADD KEY `IDX_2DE8C6A3A76ED395` (`user_id`), ADD KEY `IDX_2DE8C6A3D60322AC` (`role_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cms_attribute`
--
ALTER TABLE `cms_attribute`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `cms_block`
--
ALTER TABLE `cms_block`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `cms_block_attribute`
--
ALTER TABLE `cms_block_attribute`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `cms_menu`
--
ALTER TABLE `cms_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `cms_page`
--
ALTER TABLE `cms_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `cms_page_lang`
--
ALTER TABLE `cms_page_lang`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `cms_page_template_block`
--
ALTER TABLE `cms_page_template_block`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `cms_route`
--
ALTER TABLE `cms_route`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `cms_template`
--
ALTER TABLE `cms_template`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `cms_template_block`
--
ALTER TABLE `cms_template_block`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `core_chat`
--
ALTER TABLE `core_chat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `core_host`
--
ALTER TABLE `core_host`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `core_language`
--
ALTER TABLE `core_language`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `core_language_token`
--
ALTER TABLE `core_language_token`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `core_language_translation`
--
ALTER TABLE `core_language_translation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `core_log`
--
ALTER TABLE `core_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `core_mailer`
--
ALTER TABLE `core_mailer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `core_stat`
--
ALTER TABLE `core_stat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ext_log_entries`
--
ALTER TABLE `ext_log_entries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ext_translations`
--
ALTER TABLE `ext_translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `user_address`
--
ALTER TABLE `user_address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_data`
--
ALTER TABLE `user_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
ADD CONSTRAINT `FK_D39C1B5D1FB8D185` FOREIGN KEY (`host_id`) REFERENCES `core_host` (`id`),
ADD CONSTRAINT `FK_D39C1B5D20576A6D` FOREIGN KEY (`page_id_parent`) REFERENCES `cms_page` (`id`),
ADD CONSTRAINT `FK_D39C1B5D5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `cms_template` (`id`),
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
ADD CONSTRAINT `FK_8D93D649EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `FK_8D93D649AB945D82` FOREIGN KEY (`userdata_id`) REFERENCES `user_data` (`id`);

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
