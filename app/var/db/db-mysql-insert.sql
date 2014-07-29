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

--DROP TABLE IF EXISTS `cms_attribute`;
--CREATE TABLE IF NOT EXISTS `cms_attribute` (
--`id` int(11) NOT NULL,
--  `title` varchar(150) NOT NULL,
--  `ref` varchar(100) NOT NULL
--) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Vider la table avant d'insérer `cms_attribute`
--

--TRUNCATE TABLE `cms_attribute`;
--
-- Contenu de la table `cms_attribute`
--


INSERT INTO `user_data` (`id`, `update_date`, `create_date`) VALUES
(1, '2014-07-15 00:00:00', '2014-07-15 00:00:00');


INSERT INTO `user` (`id`, `userdata_id`, `media_id`, `social`, `username`, `email`, `salt`, `password`, `is_active`, `firstname`, `lastname`, `locale`, `wysiwyg`, `tags`, `lastconnected_date`, `update_date`, `create_date`, `deleted`) VALUES
(1, 1, NULL, '', 'admin@admin.fr', 'admin@admin.fr', '', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'Admin', 'Admin', 'en', 1, 'User', NULL, '2014-07-28 17:27:34', '2014-01-01 00:00:00', 0);



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



INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3);


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



INSERT INTO `cms_block` (`id`, `user_id`, `is_repeatable`, `title`, `ref`, `create_date`, `update_date`, `deleted`) VALUES
(1, 1, 1, 'Paragraph', 'paragraph', '2014-01-02 10:20:10', '2014-01-02 11:00:40', 0);

INSERT INTO `cms_block_attribute` (`id`, `block_id`, `attribute_id`, `sort`, `title`, `ref`, `create_date`, `update_date`) VALUES
(1, 1, 1, 10, 'Title', 'title', '2014-01-02 10:20:19', '2014-01-02 11:02:24'),
(2, 1, 4, 20, 'Content', 'paragraph', '2014-01-02 10:20:19', '2014-01-02 11:02:28');



INSERT INTO `core_host` (`id`, `title`, `url`, `is_multilingual`, `create_date`, `update_date`, `deleted`) VALUES
(1, 'Majesteel', 'local.test.majesteel', 1, '2014-01-02 10:14:13', '0000-00-00 00:00:00', 0);



INSERT INTO `cms_menu` (`id`, `title`, `ref`) VALUES
(1, 'Main menu', 'main'),
(2, 'Footer menu', 'footer');



INSERT INTO `cms_template` (`id`, `user_id`, `title`, `ref`, `create_date`, `update_date`, `deleted`) VALUES
(1, 1, 'Home', 'home', '2014-01-02 10:21:25', '2014-01-02 11:00:22', 0);

INSERT INTO `cms_template_block` (`id`, `template_id`, `block_id`, `is_mobile`, `is_tablet`, `is_desktop`, `is_repeatable`, `title`, `ref`, `sort`, `create_date`, `update_date`) VALUES
(1, 1, 1, 1, 1, 1, 1, '', 'home_paragraph', 10, '2014-01-02 10:21:28', '2014-01-02 11:00:36');




INSERT INTO `core_language` (`id`, `is_active`, `locale`, `name`, `host`) VALUES
(1, 1, 'fr', 'Française', NULL),
(2, 1, 'en', 'Anglais', NULL);



INSERT INTO `cms_page` (`id`, `page_id_parent`, `user_id`, `host_id`, `menu_id`, `template_id`, `link_url`, `target_url`, `sort`, `is_inmenu`, `is_active`, `is_folder`, `enable_comments`, `create_date`, `update_date`, `deleted`) VALUES
(1, NULL, 1, 1, 1, 1, NULL, '', 0, 1, 1, 0, 0, '2014-01-02 10:23:33', '2014-01-02 10:58:58', 0);


INSERT INTO `cms_page_lang` (`id`, `page_id`, `locale`, `user_id`, `url`, `url_root`, `title`, `search_description`, `meta_title`, `meta_description`, `meta_keywords`, `tags`, `is_active`, `create_date`, `update_date`, `deleted`) VALUES
(1, 1, 'fr', 1, '/', '', 'Accueil en français', 'Teel framework - Page accueil', 'Teel framework - Page accueil', NULL, NULL, 'Page', 1, '2014-01-02 10:23:33', '2014-01-02 10:59:03', 0),
(2, 1, 'en', 1, '/', '', 'Home in English', 'Teel framework - Homepage', 'Teel framework - Homepage', NULL, NULL, 'Page', 1, '2014-01-02 10:45:50', '2014-01-02 10:59:12', 0);


INSERT INTO `cms_page_template_block` (`id`, `version`, `page_id`, `template_block_id`, `user_id`, `locale`, `content`, `create_date`, `update_date`) VALUES
(1, 1, 1, 1, 1, 'fr', '{"attributes":{"20140102104143":{"title":"Titre paragraphe 1","id":"20140102104143","content":{"title":{"ref":"textline","value":"Titre paragraphe 1"},"paragraph":{"ref":"editor","value":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>"}}}}}', '2014-01-02 10:41:43', '2014-01-02 10:59:36'),
(2, 2, 1, 1, 1, 'en', '{"attributes":{"20140102104143":{"title":"Paragraph1 title","id":"20140102104143","content":{"title":{"ref":"textline","value":"Paragraph1 title"},"paragraph":{"ref":"editor","value":"<p>[EN] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.[\\/EN]<\\/p>"}}}}}', '2014-01-02 10:45:50', '2014-01-02 10:59:38');


INSERT INTO `cms_page_template_block_version` (`page_template_block_id`, `version`, `user_id`, `locale`, `content`, `status`, `create_date`, `update_date`) VALUES
(2, 2, 1, 'en', '{"attributes":{"20140102104143":{"title":"Paragraph1 title","id":"20140102104143","content":{"title":{"ref":"textline","value":"Paragraph1 title"},"paragraph":{"ref":"editor","value":"<p>[EN] Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mattis lorem et risus hendrerit, convallis elementum eros facilisis. Etiam ornare rutrum orci et dignissim. Sed nec dolor venenatis, adipiscing ante quis, euismod lacus. Nullam nec vulputate magna. Nullam enim mi, gravida consequat nibh in, tincidunt blandit est. Donec non nunc sed lacus fringilla laoreet sed ac augue. Etiam nec congue mi. In sed lacus quis felis mattis fringilla.[\\/EN]<\\/p>"}}}}}', 'published', '2014-01-02 10:46:37', '2014-01-02 10:59:57');


INSERT INTO `cms_route` (`id`, `page_id`, `locale`, `title`, `host`, `url`, `redirect_url`) VALUES
(1, 1, 'fr', 'Accueil en français', 'local.test.majesteel', '/fr', ''),
(2, 1, 'en', 'Home in English', 'local.test.majesteel', '/en', '');

