/*
Navicat MySQL Data Transfer

Source Server         : localWeb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : coreinvdb_1

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-11-05 15:47:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'Super Admin', '2019-05-17 18:31:13', '2019-05-29 22:02:01', null);
INSERT INTO `groups` VALUES ('2', 'Company User (MCA)', '2019-05-29 20:25:12', '2019-12-11 04:37:05', null);
INSERT INTO `groups` VALUES ('3', 'Customer', '2019-05-29 22:02:11', '2019-05-29 22:02:11', null);
INSERT INTO `groups` VALUES ('4', 'RTR Recovery Group', '2019-11-30 08:06:18', '2019-11-30 08:06:18', null);

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_category_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` double(11,2) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for `item_categories`
-- ----------------------------
DROP TABLE IF EXISTS `item_categories`;
CREATE TABLE `item_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of item_categories
-- ----------------------------
INSERT INTO `item_categories` VALUES ('1', 'CATEGORY B', '2020-11-05 02:09:50', '2020-11-05 02:13:46', null);
INSERT INTO `item_categories` VALUES ('3', 'CATEGORY A', '2020-11-05 02:32:37', '2020-11-05 02:32:37', null);

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2020_11_05_013809_create_items_table', '1');
INSERT INTO `migrations` VALUES ('2', '2020_11_05_014241_create_item_category_table', '1');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_img` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) NOT NULL COMMENT '0=active,1=suspended',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `reset_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'Admin', 'Admin', 'Core', '09279983995', null, null, 'admin', 'bryann.revina@gmail.com', null, '$2y$10$t780SAl1b2k0yXzhh5eCtuwOjgzBEukfDScQrs6CW/FUzJHhAF2qK', null, '1d8bd9134663fad36847c53a65f6c98f.jpg', '0', null, '2019-05-11 19:03:15', '2020-11-05 01:28:48', null, '2020-11-05 01:28:48', null);

-- ----------------------------
-- Table structure for `user_logs`
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_logs
-- ----------------------------
INSERT INTO `user_logs` VALUES ('4', '1', '2020-04-02 02:30:06', '2020-04-02 16:30:06', null, null);
INSERT INTO `user_logs` VALUES ('5', '1', '2020-04-02 05:44:26', '2020-04-02 19:44:26', null, null);
INSERT INTO `user_logs` VALUES ('6', '3', '2020-04-02 09:59:48', '2020-04-02 23:59:48', null, null);
INSERT INTO `user_logs` VALUES ('7', '4', '2020-04-02 11:21:28', '2020-04-03 01:21:28', null, null);
INSERT INTO `user_logs` VALUES ('8', '10', '2020-04-02 12:55:05', '2020-04-03 02:55:05', null, null);
INSERT INTO `user_logs` VALUES ('9', '3', '2020-04-02 14:04:03', '2020-04-03 04:04:03', null, null);
INSERT INTO `user_logs` VALUES ('10', '9', '2020-04-02 16:32:13', '2020-04-03 06:32:13', null, null);
INSERT INTO `user_logs` VALUES ('11', '3', '2020-04-02 16:40:10', '2020-04-03 06:40:10', null, null);
INSERT INTO `user_logs` VALUES ('12', '1', '2020-04-03 00:02:05', '2020-04-03 14:02:05', null, null);
INSERT INTO `user_logs` VALUES ('13', '1', '2020-04-03 07:48:14', '2020-04-03 21:48:14', null, null);
INSERT INTO `user_logs` VALUES ('14', '3', '2020-04-03 10:06:59', '2020-04-04 00:06:59', null, null);
INSERT INTO `user_logs` VALUES ('15', '10', '2020-04-03 11:57:33', '2020-04-04 01:57:33', null, null);
INSERT INTO `user_logs` VALUES ('16', '24', '2020-04-03 13:31:45', '2020-04-04 03:31:45', null, null);
INSERT INTO `user_logs` VALUES ('17', '4', '2020-04-03 13:54:46', '2020-04-04 03:54:46', null, null);
INSERT INTO `user_logs` VALUES ('18', '8', '2020-04-03 14:09:14', '2020-04-04 04:09:14', null, null);
INSERT INTO `user_logs` VALUES ('19', '10', '2020-04-03 16:15:28', '2020-04-04 06:15:28', null, null);
INSERT INTO `user_logs` VALUES ('20', '1', '2020-04-05 22:39:46', '2020-04-06 12:39:46', null, null);
INSERT INTO `user_logs` VALUES ('21', '1', '2020-04-06 08:10:35', '2020-04-06 22:10:35', null, null);
INSERT INTO `user_logs` VALUES ('22', '3', '2020-04-06 10:27:03', '2020-04-07 00:27:03', null, null);
INSERT INTO `user_logs` VALUES ('23', '10', '2020-04-06 10:58:27', '2020-04-07 00:58:27', null, null);
INSERT INTO `user_logs` VALUES ('24', '4', '2020-04-06 12:31:11', '2020-04-07 02:31:11', null, null);
INSERT INTO `user_logs` VALUES ('25', '3', '2020-04-06 15:25:40', '2020-04-07 05:25:40', null, null);
INSERT INTO `user_logs` VALUES ('26', '3', '2020-04-06 16:59:16', '2020-04-07 06:59:16', null, null);
INSERT INTO `user_logs` VALUES ('27', '1', '2020-04-07 10:27:46', '2020-04-08 00:27:46', null, null);
INSERT INTO `user_logs` VALUES ('28', '3', '2020-04-07 10:46:38', '2020-04-08 00:46:38', null, null);
INSERT INTO `user_logs` VALUES ('29', '3', '2020-04-07 10:50:56', '2020-04-08 00:50:56', null, null);
INSERT INTO `user_logs` VALUES ('30', '10', '2020-04-07 11:26:08', '2020-04-08 01:26:08', null, null);
INSERT INTO `user_logs` VALUES ('31', '10', '2020-04-07 13:59:01', '2020-04-08 03:59:01', null, null);
INSERT INTO `user_logs` VALUES ('32', '3', '2020-04-07 14:23:13', '2020-04-08 04:23:13', null, null);
INSERT INTO `user_logs` VALUES ('33', '10', '2020-04-07 16:28:45', '2020-04-08 06:28:45', null, null);
INSERT INTO `user_logs` VALUES ('34', '3', '2020-04-08 10:36:17', '2020-04-09 00:36:17', null, null);
INSERT INTO `user_logs` VALUES ('35', '8', '2020-04-08 11:58:52', '2020-04-09 01:58:52', null, null);
INSERT INTO `user_logs` VALUES ('36', '4', '2020-04-08 12:50:39', '2020-04-09 02:50:39', null, null);
INSERT INTO `user_logs` VALUES ('37', '10', '2020-04-08 17:13:43', '2020-04-09 07:13:43', null, null);
INSERT INTO `user_logs` VALUES ('38', '3', '2020-04-09 10:23:35', '2020-04-10 00:23:35', null, null);
INSERT INTO `user_logs` VALUES ('39', '10', '2020-04-09 11:58:00', '2020-04-10 01:58:00', null, null);
INSERT INTO `user_logs` VALUES ('40', '4', '2020-04-09 12:03:59', '2020-04-10 02:03:59', null, null);
INSERT INTO `user_logs` VALUES ('41', '24', '2020-04-09 14:28:43', '2020-04-10 04:28:43', null, null);
INSERT INTO `user_logs` VALUES ('42', '9', '2020-04-09 14:31:59', '2020-04-10 04:31:59', null, null);
INSERT INTO `user_logs` VALUES ('43', '9', '2020-04-09 14:36:48', '2020-04-10 04:36:48', null, null);
INSERT INTO `user_logs` VALUES ('44', '3', '2020-04-09 15:01:30', '2020-04-10 05:01:30', null, null);
INSERT INTO `user_logs` VALUES ('45', '4', '2020-04-09 17:10:20', '2020-04-10 07:10:20', null, null);
INSERT INTO `user_logs` VALUES ('46', '1', '2020-04-10 02:00:15', '2020-04-10 16:00:15', null, null);
INSERT INTO `user_logs` VALUES ('47', '3', '2020-04-10 10:04:23', '2020-04-11 00:04:23', null, null);
INSERT INTO `user_logs` VALUES ('48', '5', '2020-04-10 10:27:12', '2020-04-11 00:27:12', null, null);
INSERT INTO `user_logs` VALUES ('49', '10', '2020-04-10 13:41:41', '2020-04-11 03:41:41', null, null);
INSERT INTO `user_logs` VALUES ('50', '10', '2020-04-10 16:24:54', '2020-04-11 06:24:54', null, null);
INSERT INTO `user_logs` VALUES ('51', '17', '2020-04-10 16:43:27', '2020-04-11 06:43:27', null, null);
INSERT INTO `user_logs` VALUES ('52', '4', '2020-04-13 10:30:19', '2020-04-14 00:30:19', null, null);
INSERT INTO `user_logs` VALUES ('53', '8', '2020-04-13 11:53:33', '2020-04-14 01:53:33', null, null);
INSERT INTO `user_logs` VALUES ('54', '9', '2020-04-13 16:47:28', '2020-04-14 06:47:28', null, null);
INSERT INTO `user_logs` VALUES ('55', '3', '2020-04-13 17:10:30', '2020-04-14 07:10:30', null, null);
INSERT INTO `user_logs` VALUES ('56', '3', '2020-04-14 09:49:45', '2020-04-14 23:49:45', null, null);
INSERT INTO `user_logs` VALUES ('57', '9', '2020-04-14 13:15:30', '2020-04-15 03:15:30', null, null);
INSERT INTO `user_logs` VALUES ('58', '4', '2020-04-14 13:22:58', '2020-04-15 03:22:58', null, null);
INSERT INTO `user_logs` VALUES ('59', '3', '2020-04-14 13:46:01', '2020-04-15 03:46:01', null, null);
INSERT INTO `user_logs` VALUES ('60', '9', '2020-04-14 16:08:15', '2020-04-15 06:08:15', null, null);
INSERT INTO `user_logs` VALUES ('61', '3', '2020-04-14 16:08:36', '2020-04-15 06:08:36', null, null);
INSERT INTO `user_logs` VALUES ('62', '4', '2020-04-14 17:33:31', '2020-04-15 07:33:31', null, null);
INSERT INTO `user_logs` VALUES ('63', '1', '2020-04-15 05:08:46', '2020-04-15 19:08:46', null, null);
INSERT INTO `user_logs` VALUES ('64', '3', '2020-04-15 10:05:50', '2020-04-16 00:05:50', null, null);
INSERT INTO `user_logs` VALUES ('65', '3', '2020-04-16 10:12:23', '2020-04-17 00:12:23', null, null);
INSERT INTO `user_logs` VALUES ('66', '4', '2020-04-16 13:07:28', '2020-04-17 03:07:28', null, null);
INSERT INTO `user_logs` VALUES ('67', '10', '2020-04-16 14:18:39', '2020-04-17 04:18:39', null, null);
INSERT INTO `user_logs` VALUES ('68', '3', '2020-04-16 15:38:55', '2020-04-17 05:38:55', null, null);
INSERT INTO `user_logs` VALUES ('69', '3', '2020-04-17 10:19:49', '2020-04-18 00:19:49', null, null);
INSERT INTO `user_logs` VALUES ('70', '5', '2020-04-17 10:24:41', '2020-04-18 00:24:41', null, null);
INSERT INTO `user_logs` VALUES ('71', '3', '2020-04-17 10:39:54', '2020-04-18 00:39:54', null, null);
INSERT INTO `user_logs` VALUES ('72', '4', '2020-04-17 13:03:16', '2020-04-18 03:03:16', null, null);
INSERT INTO `user_logs` VALUES ('73', '3', '2020-04-17 15:40:54', '2020-04-18 05:40:54', null, null);
INSERT INTO `user_logs` VALUES ('74', '10', '2020-04-17 16:31:12', '2020-04-18 06:31:12', null, null);
INSERT INTO `user_logs` VALUES ('75', '3', '2020-04-20 10:17:37', '2020-04-21 00:17:37', null, null);
INSERT INTO `user_logs` VALUES ('76', '4', '2020-04-20 11:50:55', '2020-04-21 01:50:55', null, null);
INSERT INTO `user_logs` VALUES ('77', '3', '2020-04-20 13:09:51', '2020-04-21 03:09:51', null, null);
INSERT INTO `user_logs` VALUES ('78', '10', '2020-04-20 15:08:32', '2020-04-21 05:08:32', null, null);
INSERT INTO `user_logs` VALUES ('79', '4', '2020-04-20 15:12:46', '2020-04-21 05:12:46', null, null);
INSERT INTO `user_logs` VALUES ('80', '17', '2020-04-20 15:27:50', '2020-04-21 05:27:50', null, null);
INSERT INTO `user_logs` VALUES ('81', '3', '2020-04-20 16:28:20', '2020-04-21 06:28:20', null, null);
INSERT INTO `user_logs` VALUES ('82', '24', '2020-04-20 22:54:42', '2020-04-21 12:54:42', null, null);
INSERT INTO `user_logs` VALUES ('83', '3', '2020-04-21 10:07:18', '2020-04-22 00:07:18', null, null);
INSERT INTO `user_logs` VALUES ('84', '3', '2020-04-21 10:28:35', '2020-04-22 00:28:35', null, null);
INSERT INTO `user_logs` VALUES ('85', '10', '2020-04-21 13:07:19', '2020-04-22 03:07:19', null, null);
INSERT INTO `user_logs` VALUES ('86', '4', '2020-04-21 13:10:50', '2020-04-22 03:10:50', null, null);
INSERT INTO `user_logs` VALUES ('87', '10', '2020-04-21 15:57:55', '2020-04-22 05:57:55', null, null);
INSERT INTO `user_logs` VALUES ('88', '3', '2020-04-22 11:15:52', '2020-04-23 01:15:52', null, null);
INSERT INTO `user_logs` VALUES ('89', '8', '2020-04-22 11:35:59', '2020-04-23 01:35:59', null, null);
INSERT INTO `user_logs` VALUES ('90', '3', '2020-04-22 11:56:23', '2020-04-23 01:56:23', null, null);
INSERT INTO `user_logs` VALUES ('91', '10', '2020-04-22 14:52:42', '2020-04-23 04:52:42', null, null);
INSERT INTO `user_logs` VALUES ('92', '8', '2020-04-22 16:54:28', '2020-04-23 06:54:28', null, null);
INSERT INTO `user_logs` VALUES ('93', '3', '2020-04-23 10:57:09', '2020-04-24 00:57:09', null, null);
INSERT INTO `user_logs` VALUES ('94', '3', '2020-04-23 12:21:49', '2020-04-24 02:21:49', null, null);
INSERT INTO `user_logs` VALUES ('95', '3', '2020-04-23 17:20:42', '2020-04-24 07:20:42', null, null);
INSERT INTO `user_logs` VALUES ('96', '3', '2020-04-24 10:20:21', '2020-04-25 00:20:21', null, null);
INSERT INTO `user_logs` VALUES ('97', '5', '2020-04-24 10:25:55', '2020-04-25 00:25:55', null, null);
INSERT INTO `user_logs` VALUES ('98', '17', '2020-04-24 13:07:30', '2020-04-25 03:07:30', null, null);
INSERT INTO `user_logs` VALUES ('99', '3', '2020-04-27 10:53:03', '2020-04-28 00:53:03', null, null);
INSERT INTO `user_logs` VALUES ('100', '4', '2020-04-27 10:57:54', '2020-04-28 00:57:54', null, null);
INSERT INTO `user_logs` VALUES ('101', '3', '2020-04-27 11:35:05', '2020-04-28 01:35:05', null, null);
INSERT INTO `user_logs` VALUES ('102', '5', '2020-04-27 12:21:52', '2020-04-28 02:21:52', null, null);
INSERT INTO `user_logs` VALUES ('103', '10', '2020-04-27 13:02:00', '2020-04-28 03:02:00', null, null);
INSERT INTO `user_logs` VALUES ('104', '17', '2020-04-27 14:21:15', '2020-04-28 04:21:15', null, null);
INSERT INTO `user_logs` VALUES ('105', '10', '2020-04-27 17:47:27', '2020-04-28 07:47:27', null, null);
INSERT INTO `user_logs` VALUES ('106', '1', '2020-04-27 23:47:27', '2020-04-28 13:47:27', null, null);
INSERT INTO `user_logs` VALUES ('107', '3', '2020-04-28 09:55:11', '2020-04-28 23:55:11', null, null);
INSERT INTO `user_logs` VALUES ('108', '4', '2020-04-28 11:03:56', '2020-04-29 01:03:56', null, null);
INSERT INTO `user_logs` VALUES ('109', '3', '2020-04-28 11:13:06', '2020-04-29 01:13:06', null, null);
INSERT INTO `user_logs` VALUES ('110', '17', '2020-04-28 12:26:48', '2020-04-29 02:26:48', null, null);
INSERT INTO `user_logs` VALUES ('111', '17', '2020-04-28 12:31:33', '2020-04-29 02:31:33', null, null);
INSERT INTO `user_logs` VALUES ('112', '24', '2020-04-28 13:29:30', '2020-04-29 03:29:30', null, null);
INSERT INTO `user_logs` VALUES ('113', '17', '2020-04-28 15:05:58', '2020-04-29 05:05:58', null, null);
INSERT INTO `user_logs` VALUES ('114', '17', '2020-04-28 15:24:14', '2020-04-29 05:24:14', null, null);
INSERT INTO `user_logs` VALUES ('115', '17', '2020-04-28 15:43:30', '2020-04-29 05:43:30', null, null);
INSERT INTO `user_logs` VALUES ('116', '17', '2020-04-28 16:20:28', '2020-04-29 06:20:28', null, null);
INSERT INTO `user_logs` VALUES ('117', '3', '2020-04-28 17:14:28', '2020-04-29 07:14:28', null, null);
INSERT INTO `user_logs` VALUES ('118', '17', '2020-04-29 10:12:40', '2020-04-30 00:12:40', null, null);
INSERT INTO `user_logs` VALUES ('119', '17', '2020-04-29 11:10:01', '2020-04-30 01:10:01', null, null);
INSERT INTO `user_logs` VALUES ('120', '3', '2020-04-29 11:19:31', '2020-04-30 01:19:31', null, null);
INSERT INTO `user_logs` VALUES ('121', '3', '2020-04-29 11:33:01', '2020-04-30 01:33:01', null, null);
INSERT INTO `user_logs` VALUES ('122', '4', '2020-04-29 13:45:52', '2020-04-30 03:45:52', null, null);
INSERT INTO `user_logs` VALUES ('123', '17', '2020-04-29 13:46:35', '2020-04-30 03:46:35', null, null);
INSERT INTO `user_logs` VALUES ('124', '17', '2020-04-29 15:22:31', '2020-04-30 05:22:31', null, null);
INSERT INTO `user_logs` VALUES ('125', '17', '2020-04-29 15:42:48', '2020-04-30 05:42:48', null, null);
INSERT INTO `user_logs` VALUES ('126', '3', '2020-04-29 16:26:11', '2020-04-30 06:26:11', null, null);
INSERT INTO `user_logs` VALUES ('127', '3', '2020-04-30 10:02:54', '2020-05-01 00:02:54', null, null);
INSERT INTO `user_logs` VALUES ('128', '17', '2020-04-30 11:10:50', '2020-05-01 01:10:50', null, null);
INSERT INTO `user_logs` VALUES ('129', '17', '2020-04-30 11:39:32', '2020-05-01 01:39:32', null, null);
INSERT INTO `user_logs` VALUES ('130', '3', '2020-04-30 17:28:52', '2020-05-01 07:28:52', null, null);
INSERT INTO `user_logs` VALUES ('131', '3', '2020-04-30 17:41:20', '2020-05-01 07:41:20', null, null);
INSERT INTO `user_logs` VALUES ('132', '1', '2020-05-01 00:25:54', '2020-05-01 14:25:54', null, null);
INSERT INTO `user_logs` VALUES ('133', '3', '2020-05-01 10:30:41', '2020-05-02 00:30:41', null, null);
INSERT INTO `user_logs` VALUES ('134', '5', '2020-05-01 10:31:45', '2020-05-02 00:31:45', null, null);
INSERT INTO `user_logs` VALUES ('135', '17', '2020-05-01 12:15:22', '2020-05-02 02:15:22', null, null);
INSERT INTO `user_logs` VALUES ('136', '5', '2020-05-01 13:37:53', '2020-05-02 03:37:53', null, null);
INSERT INTO `user_logs` VALUES ('137', '3', '2020-05-01 15:50:40', '2020-05-02 05:50:40', null, null);
INSERT INTO `user_logs` VALUES ('138', '17', '2020-05-01 16:57:18', '2020-05-02 06:57:18', null, null);
INSERT INTO `user_logs` VALUES ('139', '3', '2020-05-04 11:12:49', '2020-05-05 01:12:49', null, null);
INSERT INTO `user_logs` VALUES ('140', '10', '2020-05-04 12:51:28', '2020-05-05 02:51:28', null, null);
INSERT INTO `user_logs` VALUES ('141', '4', '2020-05-04 12:53:43', '2020-05-05 02:53:43', null, null);
INSERT INTO `user_logs` VALUES ('142', '17', '2020-05-04 13:47:25', '2020-05-05 03:47:25', null, null);
INSERT INTO `user_logs` VALUES ('143', '3', '2020-05-05 10:27:45', '2020-05-06 00:27:45', null, null);
INSERT INTO `user_logs` VALUES ('144', '17', '2020-05-05 12:59:35', '2020-05-06 02:59:35', null, null);
INSERT INTO `user_logs` VALUES ('145', '4', '2020-05-05 14:37:31', '2020-05-06 04:37:31', null, null);
INSERT INTO `user_logs` VALUES ('146', '3', '2020-05-05 15:03:30', '2020-05-06 05:03:30', null, null);
INSERT INTO `user_logs` VALUES ('147', '10', '2020-05-05 15:35:30', '2020-05-06 05:35:30', null, null);
INSERT INTO `user_logs` VALUES ('148', '17', '2020-05-05 16:38:41', '2020-05-06 06:38:41', null, null);
INSERT INTO `user_logs` VALUES ('149', '3', '2020-05-06 10:16:55', '2020-05-07 00:16:55', null, null);
INSERT INTO `user_logs` VALUES ('150', '4', '2020-05-06 14:12:12', '2020-05-07 04:12:12', null, null);
INSERT INTO `user_logs` VALUES ('151', '10', '2020-05-06 16:03:25', '2020-05-07 06:03:25', null, null);
INSERT INTO `user_logs` VALUES ('152', '3', '2020-05-06 20:05:46', '2020-05-07 10:05:46', null, null);
INSERT INTO `user_logs` VALUES ('153', '3', '2020-05-07 10:39:11', '2020-05-08 00:39:11', null, null);
INSERT INTO `user_logs` VALUES ('154', '4', '2020-05-07 14:02:09', '2020-05-08 04:02:09', null, null);
INSERT INTO `user_logs` VALUES ('155', '10', '2020-05-07 15:30:10', '2020-05-08 05:30:10', null, null);
INSERT INTO `user_logs` VALUES ('156', '4', '2020-05-07 20:43:15', '2020-05-08 10:43:15', null, null);
INSERT INTO `user_logs` VALUES ('157', '3', '2020-05-08 09:58:23', '2020-05-08 23:58:23', null, null);
INSERT INTO `user_logs` VALUES ('158', '5', '2020-05-08 10:47:39', '2020-05-09 00:47:39', null, null);
INSERT INTO `user_logs` VALUES ('159', '3', '2020-05-08 10:53:30', '2020-05-09 00:53:30', null, null);
INSERT INTO `user_logs` VALUES ('160', '10', '2020-05-08 11:32:44', '2020-05-09 01:32:44', null, null);
INSERT INTO `user_logs` VALUES ('161', '5', '2020-05-08 13:22:35', '2020-05-09 03:22:35', null, null);
INSERT INTO `user_logs` VALUES ('162', '3', '2020-05-08 13:34:33', '2020-05-09 03:34:33', null, null);
INSERT INTO `user_logs` VALUES ('163', '3', '2020-05-11 11:15:44', '2020-05-12 01:15:44', null, null);
INSERT INTO `user_logs` VALUES ('164', '10', '2020-05-11 12:14:14', '2020-05-12 02:14:14', null, null);
INSERT INTO `user_logs` VALUES ('165', '4', '2020-05-11 13:07:59', '2020-05-12 03:07:59', null, null);
INSERT INTO `user_logs` VALUES ('166', '17', '2020-05-11 16:51:57', '2020-05-12 06:51:57', null, null);
INSERT INTO `user_logs` VALUES ('167', '3', '2020-05-12 10:06:24', '2020-05-13 00:06:24', null, null);
INSERT INTO `user_logs` VALUES ('168', '4', '2020-05-12 10:59:35', '2020-05-13 00:59:35', null, null);
INSERT INTO `user_logs` VALUES ('169', '3', '2020-05-12 15:08:06', '2020-05-13 05:08:06', null, null);
INSERT INTO `user_logs` VALUES ('170', '3', '2020-05-12 17:24:01', '2020-05-13 07:24:01', null, null);
INSERT INTO `user_logs` VALUES ('171', '4', '2020-05-13 11:42:22', '2020-05-14 01:42:22', null, null);
INSERT INTO `user_logs` VALUES ('172', '3', '2020-05-13 11:58:05', '2020-05-14 01:58:05', null, null);
INSERT INTO `user_logs` VALUES ('173', '10', '2020-05-13 14:44:37', '2020-05-14 04:44:37', null, null);
INSERT INTO `user_logs` VALUES ('174', '9', '2020-05-13 15:09:58', '2020-05-14 05:09:58', null, null);
INSERT INTO `user_logs` VALUES ('175', '3', '2020-05-14 10:44:28', '2020-05-15 00:44:28', null, null);
INSERT INTO `user_logs` VALUES ('176', '4', '2020-05-14 11:20:15', '2020-05-15 01:20:15', null, null);
INSERT INTO `user_logs` VALUES ('177', '24', '2020-05-14 14:14:22', '2020-05-15 04:14:22', null, null);
INSERT INTO `user_logs` VALUES ('178', '3', '2020-05-14 18:30:03', '2020-05-15 08:30:03', null, null);
INSERT INTO `user_logs` VALUES ('179', '5', '2020-05-15 10:22:10', '2020-05-16 00:22:10', null, null);
INSERT INTO `user_logs` VALUES ('180', '17', '2020-05-15 11:12:48', '2020-05-16 01:12:48', null, null);
INSERT INTO `user_logs` VALUES ('181', '3', '2020-05-15 11:59:36', '2020-05-16 01:59:36', null, null);
INSERT INTO `user_logs` VALUES ('182', '10', '2020-05-15 13:51:24', '2020-05-16 03:51:24', null, null);
INSERT INTO `user_logs` VALUES ('183', '1', '2020-05-18 05:25:51', '2020-05-18 19:25:51', null, null);
INSERT INTO `user_logs` VALUES ('184', '3', '2020-05-18 09:56:02', '2020-05-18 23:56:02', null, null);
INSERT INTO `user_logs` VALUES ('185', '17', '2020-05-18 10:40:31', '2020-05-19 00:40:31', null, null);
INSERT INTO `user_logs` VALUES ('186', '10', '2020-05-18 11:50:18', '2020-05-19 01:50:18', null, null);
INSERT INTO `user_logs` VALUES ('187', '17', '2020-05-18 12:13:20', '2020-05-19 02:13:20', null, null);
INSERT INTO `user_logs` VALUES ('188', '3', '2020-05-18 13:26:34', '2020-05-19 03:26:34', null, null);
INSERT INTO `user_logs` VALUES ('189', '3', '2020-05-18 13:54:26', '2020-05-19 03:54:26', null, null);
INSERT INTO `user_logs` VALUES ('190', '17', '2020-05-19 09:53:18', '2020-05-19 23:53:18', null, null);
INSERT INTO `user_logs` VALUES ('191', '3', '2020-05-19 10:03:10', '2020-05-20 00:03:10', null, null);
INSERT INTO `user_logs` VALUES ('192', '9', '2020-05-19 10:44:39', '2020-05-20 00:44:39', null, null);
INSERT INTO `user_logs` VALUES ('193', '4', '2020-05-19 12:11:03', '2020-05-20 02:11:03', null, null);
INSERT INTO `user_logs` VALUES ('194', '3', '2020-05-19 13:09:00', '2020-05-20 03:09:00', null, null);
INSERT INTO `user_logs` VALUES ('195', '4', '2020-05-19 15:06:32', '2020-05-20 05:06:32', null, null);
INSERT INTO `user_logs` VALUES ('196', '3', '2020-05-20 11:10:14', '2020-05-21 01:10:14', null, null);
INSERT INTO `user_logs` VALUES ('197', '4', '2020-05-20 11:24:24', '2020-05-21 01:24:24', null, null);
INSERT INTO `user_logs` VALUES ('198', '3', '2020-05-20 17:18:05', '2020-05-21 07:18:05', null, null);
INSERT INTO `user_logs` VALUES ('199', '3', '2020-05-21 09:41:39', '2020-05-21 23:41:39', null, null);
INSERT INTO `user_logs` VALUES ('200', '17', '2020-05-21 10:46:47', '2020-05-22 00:46:47', null, null);
INSERT INTO `user_logs` VALUES ('201', '4', '2020-05-21 12:40:18', '2020-05-22 02:40:18', null, null);
INSERT INTO `user_logs` VALUES ('202', '37', '2020-05-21 13:32:02', '2020-05-22 03:32:02', null, null);
INSERT INTO `user_logs` VALUES ('203', '10', '2020-05-21 13:51:32', '2020-05-22 03:51:32', null, null);
INSERT INTO `user_logs` VALUES ('204', '24', '2020-05-21 15:15:19', '2020-05-22 05:15:19', null, null);
INSERT INTO `user_logs` VALUES ('205', '17', '2020-05-21 16:00:08', '2020-05-22 06:00:08', null, null);
INSERT INTO `user_logs` VALUES ('206', '3', '2020-05-21 17:09:13', '2020-05-22 07:09:13', null, null);
INSERT INTO `user_logs` VALUES ('207', '17', '2020-05-22 09:55:04', '2020-05-22 23:55:04', null, null);
INSERT INTO `user_logs` VALUES ('208', '3', '2020-05-22 13:02:41', '2020-05-23 03:02:41', null, null);
INSERT INTO `user_logs` VALUES ('209', '1', '2020-05-25 02:13:52', '2020-05-25 16:13:52', null, null);
INSERT INTO `user_logs` VALUES ('210', '3', '2020-05-25 09:57:23', '2020-05-25 23:57:23', null, null);
INSERT INTO `user_logs` VALUES ('211', '3', '2020-05-25 19:20:15', '2020-05-26 09:20:15', null, null);
INSERT INTO `user_logs` VALUES ('212', '3', '2020-05-25 19:40:18', '2020-05-26 09:40:18', null, null);
INSERT INTO `user_logs` VALUES ('213', '1', '2020-05-26 08:20:37', '2020-05-26 22:20:37', null, null);
INSERT INTO `user_logs` VALUES ('214', '3', '2020-05-26 09:58:21', '2020-05-26 23:58:21', null, null);
INSERT INTO `user_logs` VALUES ('215', '10', '2020-05-26 10:33:14', '2020-05-27 00:33:14', null, null);
INSERT INTO `user_logs` VALUES ('216', '8', '2020-05-26 10:36:14', '2020-05-27 00:36:14', null, null);
INSERT INTO `user_logs` VALUES ('217', '4', '2020-05-26 11:29:38', '2020-05-27 01:29:38', null, null);
INSERT INTO `user_logs` VALUES ('218', '17', '2020-05-26 14:43:18', '2020-05-27 04:43:18', null, null);
INSERT INTO `user_logs` VALUES ('219', '10', '2020-05-26 16:36:43', '2020-05-27 06:36:43', null, null);
INSERT INTO `user_logs` VALUES ('220', '17', '2020-05-26 16:58:56', '2020-05-27 06:58:56', null, null);
INSERT INTO `user_logs` VALUES ('221', '3', '2020-05-27 11:49:01', '2020-05-28 01:49:01', null, null);
INSERT INTO `user_logs` VALUES ('222', '10', '2020-05-27 12:35:14', '2020-05-28 02:35:14', null, null);
INSERT INTO `user_logs` VALUES ('223', '3', '2020-05-27 12:59:10', '2020-05-28 02:59:10', null, null);
INSERT INTO `user_logs` VALUES ('224', '17', '2020-05-27 13:00:23', '2020-05-28 03:00:23', null, null);
INSERT INTO `user_logs` VALUES ('225', '4', '2020-05-27 14:42:10', '2020-05-28 04:42:10', null, null);
INSERT INTO `user_logs` VALUES ('226', '3', '2020-05-27 15:09:05', '2020-05-28 05:09:05', null, null);
INSERT INTO `user_logs` VALUES ('227', '17', '2020-05-27 15:11:47', '2020-05-28 05:11:47', null, null);
INSERT INTO `user_logs` VALUES ('228', '3', '2020-05-27 15:19:21', '2020-05-28 05:19:21', null, null);
INSERT INTO `user_logs` VALUES ('229', '17', '2020-05-27 15:32:56', '2020-05-28 05:32:56', null, null);
INSERT INTO `user_logs` VALUES ('230', '10', '2020-05-28 10:04:13', '2020-05-29 00:04:13', null, null);
INSERT INTO `user_logs` VALUES ('231', '3', '2020-05-28 11:11:30', '2020-05-29 01:11:30', null, null);
INSERT INTO `user_logs` VALUES ('232', '4', '2020-05-28 15:16:19', '2020-05-29 05:16:19', null, null);
INSERT INTO `user_logs` VALUES ('233', '17', '2020-05-28 15:47:19', '2020-05-29 05:47:19', null, null);
INSERT INTO `user_logs` VALUES ('234', '3', '2020-05-28 20:51:26', '2020-05-29 10:51:26', null, null);
INSERT INTO `user_logs` VALUES ('235', '3', '2020-05-29 09:14:34', '2020-05-29 23:14:34', null, null);
INSERT INTO `user_logs` VALUES ('236', '5', '2020-05-29 10:29:05', '2020-05-30 00:29:05', null, null);
INSERT INTO `user_logs` VALUES ('237', '10', '2020-05-29 10:41:04', '2020-05-30 00:41:04', null, null);
INSERT INTO `user_logs` VALUES ('238', '4', '2020-05-29 12:25:32', '2020-05-30 02:25:32', null, null);
INSERT INTO `user_logs` VALUES ('239', '8', '2020-05-29 12:54:07', '2020-05-30 02:54:07', null, null);
INSERT INTO `user_logs` VALUES ('240', '9', '2020-05-29 13:48:07', '2020-05-30 03:48:07', null, null);
INSERT INTO `user_logs` VALUES ('241', '5', '2020-05-29 14:14:25', '2020-05-30 04:14:25', null, null);
INSERT INTO `user_logs` VALUES ('242', '3', '2020-05-29 14:17:04', '2020-05-30 04:17:04', null, null);
INSERT INTO `user_logs` VALUES ('243', '3', '2020-05-30 08:57:19', '2020-05-30 22:57:19', null, null);
INSERT INTO `user_logs` VALUES ('244', '3', '2020-05-31 10:54:08', '2020-06-01 00:54:08', null, null);
INSERT INTO `user_logs` VALUES ('245', '3', '2020-05-31 16:22:30', '2020-06-01 06:22:30', null, null);
INSERT INTO `user_logs` VALUES ('246', '10', '2020-06-01 10:34:38', '2020-06-02 00:34:38', null, null);
INSERT INTO `user_logs` VALUES ('247', '4', '2020-06-01 10:47:18', '2020-06-02 00:47:18', null, null);
INSERT INTO `user_logs` VALUES ('248', '3', '2020-06-01 11:03:15', '2020-06-02 01:03:15', null, null);
INSERT INTO `user_logs` VALUES ('249', '17', '2020-06-01 13:21:11', '2020-06-02 03:21:11', null, null);
INSERT INTO `user_logs` VALUES ('250', '4', '2020-06-01 13:29:28', '2020-06-02 03:29:28', null, null);
INSERT INTO `user_logs` VALUES ('251', '10', '2020-06-01 14:31:27', '2020-06-02 04:31:27', null, null);
INSERT INTO `user_logs` VALUES ('252', '4', '2020-06-01 16:32:14', '2020-06-02 06:32:14', null, null);
INSERT INTO `user_logs` VALUES ('253', '10', '2020-06-01 17:44:51', '2020-06-02 07:44:51', null, null);
INSERT INTO `user_logs` VALUES ('254', '10', '2020-06-02 10:03:47', '2020-06-03 00:03:47', null, null);
INSERT INTO `user_logs` VALUES ('255', '3', '2020-06-02 10:10:10', '2020-06-03 00:10:10', null, null);
INSERT INTO `user_logs` VALUES ('256', '5', '2020-06-02 11:24:16', '2020-06-03 01:24:16', null, null);
INSERT INTO `user_logs` VALUES ('257', '8', '2020-06-02 12:48:59', '2020-06-03 02:48:59', null, null);
INSERT INTO `user_logs` VALUES ('258', '4', '2020-06-02 14:15:06', '2020-06-03 04:15:06', null, null);
INSERT INTO `user_logs` VALUES ('259', '24', '2020-06-02 16:24:38', '2020-06-03 06:24:38', null, null);
INSERT INTO `user_logs` VALUES ('260', '10', '2020-06-03 10:04:36', '2020-06-04 00:04:36', null, null);
INSERT INTO `user_logs` VALUES ('261', '4', '2020-06-03 12:18:46', '2020-06-04 02:18:46', null, null);
INSERT INTO `user_logs` VALUES ('262', '10', '2020-06-03 12:50:05', '2020-06-04 02:50:05', null, null);
INSERT INTO `user_logs` VALUES ('263', '10', '2020-06-03 15:38:08', '2020-06-04 05:38:08', null, null);
INSERT INTO `user_logs` VALUES ('264', '4', '2020-06-03 17:54:52', '2020-06-04 07:54:52', null, null);
INSERT INTO `user_logs` VALUES ('265', '10', '2020-06-04 10:04:14', '2020-06-05 00:04:14', null, null);
INSERT INTO `user_logs` VALUES ('266', '4', '2020-06-04 14:02:50', '2020-06-05 04:02:50', null, null);
INSERT INTO `user_logs` VALUES ('267', '1', '2020-06-05 02:59:10', '2020-06-05 16:59:10', null, null);
INSERT INTO `user_logs` VALUES ('268', '10', '2020-06-05 10:04:28', '2020-06-06 00:04:28', null, null);
INSERT INTO `user_logs` VALUES ('269', '9', '2020-06-05 10:41:02', '2020-06-06 00:41:02', null, null);
INSERT INTO `user_logs` VALUES ('270', '5', '2020-06-05 10:46:20', '2020-06-06 00:46:20', null, null);
INSERT INTO `user_logs` VALUES ('271', '4', '2020-06-05 11:11:54', '2020-06-06 01:11:54', null, null);
INSERT INTO `user_logs` VALUES ('272', '8', '2020-06-05 11:36:36', '2020-06-06 01:36:36', null, null);
INSERT INTO `user_logs` VALUES ('273', '9', '2020-06-05 12:49:27', '2020-06-06 02:49:27', null, null);
INSERT INTO `user_logs` VALUES ('274', '17', '2020-06-05 13:41:11', '2020-06-06 03:41:11', null, null);
INSERT INTO `user_logs` VALUES ('275', '4', '2020-06-05 15:47:47', '2020-06-06 05:47:47', null, null);
INSERT INTO `user_logs` VALUES ('276', '24', '2020-06-06 01:23:22', '2020-06-06 15:23:22', null, null);
INSERT INTO `user_logs` VALUES ('277', '3', '2020-06-08 07:03:04', '2020-06-08 21:03:04', null, null);
INSERT INTO `user_logs` VALUES ('278', '1', '2020-06-08 10:42:08', '2020-06-09 00:42:08', null, null);
INSERT INTO `user_logs` VALUES ('279', '17', '2020-06-08 11:55:50', '2020-06-09 01:55:50', null, null);
INSERT INTO `user_logs` VALUES ('280', '4', '2020-06-08 13:33:05', '2020-06-09 03:33:05', null, null);
INSERT INTO `user_logs` VALUES ('281', '8', '2020-06-08 13:54:15', '2020-06-09 03:54:15', null, null);
INSERT INTO `user_logs` VALUES ('282', '17', '2020-06-08 16:28:20', '2020-06-09 06:28:20', null, null);
INSERT INTO `user_logs` VALUES ('283', '1', '2020-06-09 01:48:15', '2020-06-09 15:48:15', null, null);
INSERT INTO `user_logs` VALUES ('284', '3', '2020-06-09 08:45:33', '2020-06-09 22:45:33', null, null);
INSERT INTO `user_logs` VALUES ('285', '17', '2020-06-09 10:49:53', '2020-06-10 00:49:53', null, null);
INSERT INTO `user_logs` VALUES ('286', '10', '2020-06-09 11:48:41', '2020-06-10 01:48:41', null, null);
INSERT INTO `user_logs` VALUES ('287', '10', '2020-06-09 14:04:40', '2020-06-10 04:04:40', null, null);
INSERT INTO `user_logs` VALUES ('288', '10', '2020-06-10 11:08:40', '2020-06-11 01:08:40', null, null);
INSERT INTO `user_logs` VALUES ('289', '17', '2020-06-10 11:08:49', '2020-06-11 01:08:49', null, null);
INSERT INTO `user_logs` VALUES ('290', '5', '2020-06-10 11:53:11', '2020-06-11 01:53:11', null, null);
INSERT INTO `user_logs` VALUES ('291', '5', '2020-06-10 11:54:38', '2020-06-11 01:54:38', null, null);
INSERT INTO `user_logs` VALUES ('292', '10', '2020-06-10 19:31:11', '2020-06-11 09:31:11', null, null);
INSERT INTO `user_logs` VALUES ('293', '10', '2020-06-10 23:29:52', '2020-06-11 13:29:52', null, null);
INSERT INTO `user_logs` VALUES ('294', '3', '2020-06-11 09:53:41', '2020-06-11 23:53:41', null, null);
INSERT INTO `user_logs` VALUES ('295', '10', '2020-06-11 10:06:21', '2020-06-12 00:06:21', null, null);
INSERT INTO `user_logs` VALUES ('296', '5', '2020-06-11 10:35:18', '2020-06-12 00:35:18', null, null);
INSERT INTO `user_logs` VALUES ('297', '8', '2020-06-11 11:29:50', '2020-06-12 01:29:50', null, null);
INSERT INTO `user_logs` VALUES ('298', '17', '2020-06-11 15:16:25', '2020-06-12 05:16:25', null, null);
INSERT INTO `user_logs` VALUES ('299', '3', '2020-06-11 15:16:48', '2020-06-12 05:16:48', null, null);
INSERT INTO `user_logs` VALUES ('300', '5', '2020-06-12 10:21:21', '2020-06-13 00:21:21', null, null);
INSERT INTO `user_logs` VALUES ('301', '3', '2020-06-12 10:39:57', '2020-06-13 00:39:57', null, null);
INSERT INTO `user_logs` VALUES ('302', '17', '2020-06-12 12:04:59', '2020-06-13 02:04:59', null, null);
INSERT INTO `user_logs` VALUES ('303', '3', '2020-06-15 10:26:40', '2020-06-16 00:26:40', null, null);
INSERT INTO `user_logs` VALUES ('304', '4', '2020-06-15 11:31:02', '2020-06-16 01:31:02', null, null);
INSERT INTO `user_logs` VALUES ('305', '10', '2020-06-15 11:53:17', '2020-06-16 01:53:17', null, null);
INSERT INTO `user_logs` VALUES ('306', '17', '2020-06-15 13:09:41', '2020-06-16 03:09:41', null, null);
INSERT INTO `user_logs` VALUES ('307', '10', '2020-06-15 15:28:16', '2020-06-16 05:28:16', null, null);
INSERT INTO `user_logs` VALUES ('308', '8', '2020-06-15 18:59:32', '2020-06-16 08:59:32', null, null);
INSERT INTO `user_logs` VALUES ('309', '8', '2020-06-16 06:19:07', '2020-06-16 20:19:07', null, null);
INSERT INTO `user_logs` VALUES ('310', '10', '2020-06-16 10:05:49', '2020-06-17 00:05:49', null, null);
INSERT INTO `user_logs` VALUES ('311', '3', '2020-06-16 10:12:26', '2020-06-17 00:12:26', null, null);
INSERT INTO `user_logs` VALUES ('312', '4', '2020-06-16 12:01:48', '2020-06-17 02:01:48', null, null);
INSERT INTO `user_logs` VALUES ('313', '10', '2020-06-16 12:07:34', '2020-06-17 02:07:34', null, null);
INSERT INTO `user_logs` VALUES ('314', '8', '2020-06-16 14:06:28', '2020-06-17 04:06:28', null, null);
INSERT INTO `user_logs` VALUES ('315', '10', '2020-06-16 14:33:31', '2020-06-17 04:33:31', null, null);
INSERT INTO `user_logs` VALUES ('316', '17', '2020-06-16 15:46:47', '2020-06-17 05:46:47', null, null);
INSERT INTO `user_logs` VALUES ('317', '3', '2020-06-17 10:19:59', '2020-06-18 00:19:59', null, null);
INSERT INTO `user_logs` VALUES ('318', '4', '2020-06-17 10:31:13', '2020-06-18 00:31:13', null, null);
INSERT INTO `user_logs` VALUES ('319', '10', '2020-06-17 15:06:18', '2020-06-18 05:06:18', null, null);
INSERT INTO `user_logs` VALUES ('320', '4', '2020-06-17 16:11:20', '2020-06-18 06:11:20', null, null);
INSERT INTO `user_logs` VALUES ('321', '3', '2020-06-18 10:08:31', '2020-06-19 00:08:31', null, null);
INSERT INTO `user_logs` VALUES ('322', '8', '2020-06-18 10:59:30', '2020-06-19 00:59:30', null, null);
INSERT INTO `user_logs` VALUES ('323', '10', '2020-06-18 12:01:32', '2020-06-19 02:01:32', null, null);
INSERT INTO `user_logs` VALUES ('324', '3', '2020-06-18 14:20:12', '2020-06-19 04:20:12', null, null);
INSERT INTO `user_logs` VALUES ('325', '4', '2020-06-18 14:50:31', '2020-06-19 04:50:31', null, null);
INSERT INTO `user_logs` VALUES ('326', '3', '2020-06-19 10:22:29', '2020-06-20 00:22:29', null, null);
INSERT INTO `user_logs` VALUES ('327', '5', '2020-06-19 10:33:53', '2020-06-20 00:33:53', null, null);
INSERT INTO `user_logs` VALUES ('328', '8', '2020-06-19 10:52:09', '2020-06-20 00:52:09', null, null);
INSERT INTO `user_logs` VALUES ('329', '4', '2020-06-19 11:37:44', '2020-06-20 01:37:44', null, null);
INSERT INTO `user_logs` VALUES ('330', '9', '2020-06-19 13:36:42', '2020-06-20 03:36:42', null, null);
INSERT INTO `user_logs` VALUES ('331', '4', '2020-06-19 14:57:56', '2020-06-20 04:57:56', null, null);
INSERT INTO `user_logs` VALUES ('332', '3', '2020-06-22 10:15:12', '2020-06-23 00:15:12', null, null);
INSERT INTO `user_logs` VALUES ('333', '5', '2020-06-22 10:48:12', '2020-06-23 00:48:12', null, null);
INSERT INTO `user_logs` VALUES ('334', '5', '2020-06-22 11:29:11', '2020-06-23 01:29:11', null, null);
INSERT INTO `user_logs` VALUES ('335', '24', '2020-06-22 12:01:29', '2020-06-23 02:01:29', null, null);
INSERT INTO `user_logs` VALUES ('336', '10', '2020-06-22 13:20:40', '2020-06-23 03:20:40', null, null);
INSERT INTO `user_logs` VALUES ('337', '3', '2020-06-22 14:17:30', '2020-06-23 04:17:30', null, null);
INSERT INTO `user_logs` VALUES ('338', '3', '2020-06-23 10:14:08', '2020-06-24 00:14:08', null, null);
INSERT INTO `user_logs` VALUES ('339', '10', '2020-06-23 11:42:26', '2020-06-24 01:42:26', null, null);
INSERT INTO `user_logs` VALUES ('340', '5', '2020-06-23 12:02:57', '2020-06-24 02:02:57', null, null);
INSERT INTO `user_logs` VALUES ('341', '5', '2020-06-23 12:03:22', '2020-06-24 02:03:22', null, null);
INSERT INTO `user_logs` VALUES ('342', '5', '2020-06-23 12:21:46', '2020-06-24 02:21:46', null, null);
INSERT INTO `user_logs` VALUES ('343', '17', '2020-06-23 14:26:38', '2020-06-24 04:26:38', null, null);
INSERT INTO `user_logs` VALUES ('344', '5', '2020-06-23 14:41:55', '2020-06-24 04:41:55', null, null);
INSERT INTO `user_logs` VALUES ('345', '10', '2020-06-23 15:10:26', '2020-06-24 05:10:26', null, null);
INSERT INTO `user_logs` VALUES ('346', '4', '2020-06-23 16:56:26', '2020-06-24 06:56:26', null, null);
INSERT INTO `user_logs` VALUES ('347', '3', '2020-06-24 10:39:50', '2020-06-25 00:39:50', null, null);
INSERT INTO `user_logs` VALUES ('348', '4', '2020-06-24 13:57:01', '2020-06-25 03:57:01', null, null);
INSERT INTO `user_logs` VALUES ('349', '17', '2020-06-24 16:29:25', '2020-06-25 06:29:25', null, null);
INSERT INTO `user_logs` VALUES ('350', '3', '2020-06-25 10:17:22', '2020-06-26 00:17:22', null, null);
INSERT INTO `user_logs` VALUES ('351', '5', '2020-06-25 11:44:06', '2020-06-26 01:44:06', null, null);
INSERT INTO `user_logs` VALUES ('352', '8', '2020-06-25 12:34:10', '2020-06-26 02:34:10', null, null);
INSERT INTO `user_logs` VALUES ('353', '10', '2020-06-25 14:09:57', '2020-06-26 04:09:57', null, null);
INSERT INTO `user_logs` VALUES ('354', '3', '2020-06-25 16:09:09', '2020-06-26 06:09:09', null, null);
INSERT INTO `user_logs` VALUES ('355', '3', '2020-06-26 10:37:37', '2020-06-27 00:37:37', null, null);
INSERT INTO `user_logs` VALUES ('356', '4', '2020-06-26 10:41:03', '2020-06-27 00:41:03', null, null);
INSERT INTO `user_logs` VALUES ('357', '5', '2020-06-26 11:15:46', '2020-06-27 01:15:46', null, null);
INSERT INTO `user_logs` VALUES ('358', '17', '2020-06-26 15:58:30', '2020-06-27 05:58:30', null, null);
INSERT INTO `user_logs` VALUES ('359', '4', '2020-06-26 16:29:15', '2020-06-27 06:29:15', null, null);
INSERT INTO `user_logs` VALUES ('360', '1', '2020-06-27 11:50:53', '2020-06-28 01:50:53', null, null);
INSERT INTO `user_logs` VALUES ('361', '3', '2020-06-29 10:18:48', '2020-06-30 00:18:48', null, null);
INSERT INTO `user_logs` VALUES ('362', '8', '2020-06-29 11:28:03', '2020-06-30 01:28:03', null, null);
INSERT INTO `user_logs` VALUES ('363', '10', '2020-06-29 12:18:04', '2020-06-30 02:18:04', null, null);
INSERT INTO `user_logs` VALUES ('364', '4', '2020-06-29 12:52:03', '2020-06-30 02:52:03', null, null);
INSERT INTO `user_logs` VALUES ('365', '3', '2020-06-30 10:04:54', '2020-07-01 00:04:54', null, null);
INSERT INTO `user_logs` VALUES ('366', '4', '2020-06-30 12:19:41', '2020-07-01 02:19:41', null, null);
INSERT INTO `user_logs` VALUES ('367', '3', '2020-06-30 12:50:13', '2020-07-01 02:50:13', null, null);
INSERT INTO `user_logs` VALUES ('368', '10', '2020-06-30 14:37:37', '2020-07-01 04:37:37', null, null);
INSERT INTO `user_logs` VALUES ('369', '10', '2020-06-30 17:10:06', '2020-07-01 07:10:06', null, null);
INSERT INTO `user_logs` VALUES ('370', '3', '2020-06-30 21:54:43', '2020-07-01 11:54:43', null, null);
INSERT INTO `user_logs` VALUES ('371', '3', '2020-07-01 08:56:58', '2020-07-01 22:56:58', null, null);
INSERT INTO `user_logs` VALUES ('372', '17', '2020-07-01 13:37:23', '2020-07-02 03:37:23', null, null);
INSERT INTO `user_logs` VALUES ('373', '3', '2020-07-01 16:38:04', '2020-07-02 06:38:04', null, null);
INSERT INTO `user_logs` VALUES ('374', '24', '2020-07-01 18:13:25', '2020-07-02 08:13:25', null, null);
INSERT INTO `user_logs` VALUES ('375', '5', '2020-07-02 11:24:23', '2020-07-03 01:24:23', null, null);
INSERT INTO `user_logs` VALUES ('376', '17', '2020-07-02 14:05:54', '2020-07-03 04:05:54', null, null);
INSERT INTO `user_logs` VALUES ('377', '24', '2020-07-02 17:22:32', '2020-07-03 07:22:32', null, null);
INSERT INTO `user_logs` VALUES ('378', '24', '2020-07-02 17:23:33', '2020-07-03 07:23:33', null, null);
INSERT INTO `user_logs` VALUES ('379', '24', '2020-07-02 17:26:10', '2020-07-03 07:26:10', null, null);
INSERT INTO `user_logs` VALUES ('380', '17', '2020-07-03 10:53:35', '2020-07-04 00:53:35', null, null);
INSERT INTO `user_logs` VALUES ('381', '4', '2020-07-03 11:44:19', '2020-07-04 01:44:19', null, null);
INSERT INTO `user_logs` VALUES ('382', '4', '2020-07-03 14:54:43', '2020-07-04 04:54:43', null, null);
INSERT INTO `user_logs` VALUES ('383', '1', '2020-07-04 13:29:49', '2020-07-05 03:29:49', null, null);
INSERT INTO `user_logs` VALUES ('384', '10', '2020-07-06 10:33:12', '2020-07-07 00:33:12', null, null);
INSERT INTO `user_logs` VALUES ('385', '5', '2020-07-06 10:35:53', '2020-07-07 00:35:53', null, null);
INSERT INTO `user_logs` VALUES ('386', '3', '2020-07-06 10:57:33', '2020-07-07 00:57:33', null, null);
INSERT INTO `user_logs` VALUES ('387', '4', '2020-07-06 11:48:51', '2020-07-07 01:48:51', null, null);
INSERT INTO `user_logs` VALUES ('388', '8', '2020-07-06 12:42:26', '2020-07-07 02:42:26', null, null);
INSERT INTO `user_logs` VALUES ('389', '10', '2020-07-06 15:37:12', '2020-07-07 05:37:12', null, null);
INSERT INTO `user_logs` VALUES ('390', '24', '2020-07-06 15:38:11', '2020-07-07 05:38:11', null, null);
INSERT INTO `user_logs` VALUES ('391', '17', '2020-07-06 16:35:23', '2020-07-07 06:35:23', null, null);
INSERT INTO `user_logs` VALUES ('392', '1', '2020-07-07 05:48:51', '2020-07-07 19:48:51', null, null);
INSERT INTO `user_logs` VALUES ('393', '3', '2020-07-07 10:40:45', '2020-07-08 00:40:45', null, null);
INSERT INTO `user_logs` VALUES ('394', '10', '2020-07-07 11:39:45', '2020-07-08 01:39:45', null, null);
INSERT INTO `user_logs` VALUES ('395', '4', '2020-07-07 12:31:49', '2020-07-08 02:31:49', null, null);
INSERT INTO `user_logs` VALUES ('396', '17', '2020-07-07 14:58:59', '2020-07-08 04:58:59', null, null);
INSERT INTO `user_logs` VALUES ('397', '3', '2020-07-07 15:14:55', '2020-07-08 05:14:55', null, null);
INSERT INTO `user_logs` VALUES ('398', '8', '2020-07-07 15:43:31', '2020-07-08 05:43:31', null, null);
INSERT INTO `user_logs` VALUES ('399', '10', '2020-07-07 16:19:14', '2020-07-08 06:19:14', null, null);
INSERT INTO `user_logs` VALUES ('400', '24', '2020-07-07 16:52:19', '2020-07-08 06:52:19', null, null);
INSERT INTO `user_logs` VALUES ('401', '8', '2020-07-08 10:01:37', '2020-07-09 00:01:37', null, null);
INSERT INTO `user_logs` VALUES ('402', '3', '2020-07-08 10:09:26', '2020-07-09 00:09:26', null, null);
INSERT INTO `user_logs` VALUES ('403', '10', '2020-07-08 10:55:56', '2020-07-09 00:55:56', null, null);
INSERT INTO `user_logs` VALUES ('404', '5', '2020-07-08 11:28:54', '2020-07-09 01:28:54', null, null);
INSERT INTO `user_logs` VALUES ('405', '9', '2020-07-08 11:40:51', '2020-07-09 01:40:51', null, null);
INSERT INTO `user_logs` VALUES ('406', '8', '2020-07-08 15:00:11', '2020-07-09 05:00:11', null, null);
INSERT INTO `user_logs` VALUES ('407', '3', '2020-07-08 17:42:59', '2020-07-09 07:42:59', null, null);
INSERT INTO `user_logs` VALUES ('408', '3', '2020-07-09 09:23:59', '2020-07-09 23:23:59', null, null);
INSERT INTO `user_logs` VALUES ('409', '4', '2020-07-09 12:35:01', '2020-07-10 02:35:01', null, null);
INSERT INTO `user_logs` VALUES ('410', '3', '2020-07-09 15:02:51', '2020-07-10 05:02:51', null, null);
INSERT INTO `user_logs` VALUES ('411', '17', '2020-07-09 15:49:55', '2020-07-10 05:49:55', null, null);
INSERT INTO `user_logs` VALUES ('412', '10', '2020-07-09 18:02:25', '2020-07-10 08:02:25', null, null);
INSERT INTO `user_logs` VALUES ('413', '10', '2020-07-10 10:08:10', '2020-07-11 00:08:10', null, null);
INSERT INTO `user_logs` VALUES ('414', '17', '2020-07-10 10:19:15', '2020-07-11 00:19:15', null, null);
INSERT INTO `user_logs` VALUES ('415', '5', '2020-07-10 11:42:19', '2020-07-11 01:42:19', null, null);
INSERT INTO `user_logs` VALUES ('416', '9', '2020-07-10 11:42:51', '2020-07-11 01:42:51', null, null);
INSERT INTO `user_logs` VALUES ('417', '3', '2020-07-13 10:17:56', '2020-07-14 00:17:56', null, null);
INSERT INTO `user_logs` VALUES ('418', '10', '2020-07-13 11:10:23', '2020-07-14 01:10:23', null, null);
INSERT INTO `user_logs` VALUES ('419', '8', '2020-07-13 11:50:16', '2020-07-14 01:50:16', null, null);
INSERT INTO `user_logs` VALUES ('420', '4', '2020-07-13 12:09:07', '2020-07-14 02:09:07', null, null);
INSERT INTO `user_logs` VALUES ('421', '46', '2020-07-13 15:24:48', '2020-07-14 05:24:48', null, null);
INSERT INTO `user_logs` VALUES ('422', '4', '2020-07-14 12:05:27', '2020-07-15 02:05:27', null, null);
INSERT INTO `user_logs` VALUES ('423', '10', '2020-07-14 12:13:42', '2020-07-15 02:13:42', null, null);
INSERT INTO `user_logs` VALUES ('424', '3', '2020-07-14 12:19:20', '2020-07-15 02:19:20', null, null);
INSERT INTO `user_logs` VALUES ('425', '3', '2020-07-14 13:15:42', '2020-07-15 03:15:42', null, null);
INSERT INTO `user_logs` VALUES ('426', '10', '2020-07-14 15:43:06', '2020-07-15 05:43:06', null, null);
INSERT INTO `user_logs` VALUES ('427', '17', '2020-07-14 16:03:23', '2020-07-15 06:03:23', null, null);
INSERT INTO `user_logs` VALUES ('428', '5', '2020-07-15 10:21:11', '2020-07-16 00:21:11', null, null);
INSERT INTO `user_logs` VALUES ('429', '10', '2020-07-15 10:31:00', '2020-07-16 00:31:00', null, null);
INSERT INTO `user_logs` VALUES ('430', '3', '2020-07-15 10:45:30', '2020-07-16 00:45:30', null, null);
INSERT INTO `user_logs` VALUES ('431', '17', '2020-07-15 11:41:06', '2020-07-16 01:41:06', null, null);
INSERT INTO `user_logs` VALUES ('432', '4', '2020-07-15 13:02:31', '2020-07-16 03:02:31', null, null);
INSERT INTO `user_logs` VALUES ('433', '3', '2020-07-16 06:46:43', '2020-07-16 20:46:43', null, null);
INSERT INTO `user_logs` VALUES ('434', '10', '2020-07-16 10:05:41', '2020-07-17 00:05:41', null, null);
INSERT INTO `user_logs` VALUES ('435', '3', '2020-07-16 12:24:44', '2020-07-17 02:24:44', null, null);
INSERT INTO `user_logs` VALUES ('436', '4', '2020-07-16 15:19:41', '2020-07-17 05:19:41', null, null);
INSERT INTO `user_logs` VALUES ('437', '3', '2020-07-16 15:21:53', '2020-07-17 05:21:53', null, null);
INSERT INTO `user_logs` VALUES ('438', '3', '2020-07-16 22:52:10', '2020-07-17 12:52:10', null, null);
INSERT INTO `user_logs` VALUES ('439', '10', '2020-07-17 10:59:38', '2020-07-18 00:59:38', null, null);
INSERT INTO `user_logs` VALUES ('440', '3', '2020-07-17 11:05:55', '2020-07-18 01:05:55', null, null);
INSERT INTO `user_logs` VALUES ('441', '5', '2020-07-17 11:28:23', '2020-07-18 01:28:23', null, null);
INSERT INTO `user_logs` VALUES ('442', '4', '2020-07-17 11:33:13', '2020-07-18 01:33:13', null, null);
INSERT INTO `user_logs` VALUES ('443', '17', '2020-07-17 12:23:02', '2020-07-18 02:23:02', null, null);
INSERT INTO `user_logs` VALUES ('444', '3', '2020-07-17 15:21:07', '2020-07-18 05:21:07', null, null);
INSERT INTO `user_logs` VALUES ('445', '10', '2020-07-17 17:35:19', '2020-07-18 07:35:19', null, null);
INSERT INTO `user_logs` VALUES ('446', '1', '2020-07-18 01:41:07', '2020-07-18 15:41:07', null, null);
INSERT INTO `user_logs` VALUES ('447', '10', '2020-07-20 10:12:12', '2020-07-21 00:12:12', null, null);
INSERT INTO `user_logs` VALUES ('448', '3', '2020-07-20 10:56:00', '2020-07-21 00:56:00', null, null);
INSERT INTO `user_logs` VALUES ('449', '5', '2020-07-20 11:03:49', '2020-07-21 01:03:49', null, null);
INSERT INTO `user_logs` VALUES ('450', '4', '2020-07-20 11:57:12', '2020-07-21 01:57:12', null, null);
INSERT INTO `user_logs` VALUES ('451', '9', '2020-07-20 14:09:46', '2020-07-21 04:09:46', null, null);
INSERT INTO `user_logs` VALUES ('452', '17', '2020-07-20 14:28:57', '2020-07-21 04:28:57', null, null);
INSERT INTO `user_logs` VALUES ('453', '10', '2020-07-21 10:30:58', '2020-07-22 00:30:58', null, null);
INSERT INTO `user_logs` VALUES ('454', '3', '2020-07-21 11:12:41', '2020-07-22 01:12:41', null, null);
INSERT INTO `user_logs` VALUES ('455', '4', '2020-07-21 11:13:46', '2020-07-22 01:13:46', null, null);
INSERT INTO `user_logs` VALUES ('456', '17', '2020-07-21 11:58:15', '2020-07-22 01:58:15', null, null);
INSERT INTO `user_logs` VALUES ('457', '10', '2020-07-21 17:42:45', '2020-07-22 07:42:45', null, null);
INSERT INTO `user_logs` VALUES ('458', '3', '2020-07-22 10:19:36', '2020-07-23 00:19:36', null, null);
INSERT INTO `user_logs` VALUES ('459', '10', '2020-07-22 10:55:55', '2020-07-23 00:55:55', null, null);
INSERT INTO `user_logs` VALUES ('460', '5', '2020-07-22 12:01:33', '2020-07-23 02:01:33', null, null);
INSERT INTO `user_logs` VALUES ('461', '9', '2020-07-22 13:23:09', '2020-07-23 03:23:09', null, null);
INSERT INTO `user_logs` VALUES ('462', '4', '2020-07-22 13:27:20', '2020-07-23 03:27:20', null, null);
INSERT INTO `user_logs` VALUES ('463', '10', '2020-07-22 14:43:24', '2020-07-23 04:43:24', null, null);
INSERT INTO `user_logs` VALUES ('464', '5', '2020-07-22 15:26:07', '2020-07-23 05:26:07', null, null);
INSERT INTO `user_logs` VALUES ('465', '10', '2020-07-23 10:03:17', '2020-07-24 00:03:17', null, null);
INSERT INTO `user_logs` VALUES ('466', '17', '2020-07-23 10:34:54', '2020-07-24 00:34:54', null, null);
INSERT INTO `user_logs` VALUES ('467', '3', '2020-07-23 10:52:27', '2020-07-24 00:52:27', null, null);
INSERT INTO `user_logs` VALUES ('468', '10', '2020-07-23 12:23:32', '2020-07-24 02:23:32', null, null);
INSERT INTO `user_logs` VALUES ('469', '17', '2020-07-23 14:51:48', '2020-07-24 04:51:48', null, null);
INSERT INTO `user_logs` VALUES ('470', '3', '2020-07-24 10:14:26', '2020-07-25 00:14:26', null, null);
INSERT INTO `user_logs` VALUES ('471', '10', '2020-07-24 10:34:55', '2020-07-25 00:34:55', null, null);
INSERT INTO `user_logs` VALUES ('472', '5', '2020-07-24 10:35:28', '2020-07-25 00:35:28', null, null);
INSERT INTO `user_logs` VALUES ('473', '3', '2020-07-24 11:59:41', '2020-07-25 01:59:41', null, null);
INSERT INTO `user_logs` VALUES ('474', '3', '2020-07-24 14:51:17', '2020-07-25 04:51:17', null, null);
INSERT INTO `user_logs` VALUES ('475', '3', '2020-07-27 10:15:36', '2020-07-28 00:15:36', null, null);
INSERT INTO `user_logs` VALUES ('476', '17', '2020-07-27 10:40:12', '2020-07-28 00:40:12', null, null);
INSERT INTO `user_logs` VALUES ('477', '5', '2020-07-27 11:33:35', '2020-07-28 01:33:35', null, null);
INSERT INTO `user_logs` VALUES ('478', '10', '2020-07-27 12:24:08', '2020-07-28 02:24:08', null, null);
INSERT INTO `user_logs` VALUES ('479', '3', '2020-07-28 10:40:14', '2020-07-29 00:40:14', null, null);
INSERT INTO `user_logs` VALUES ('480', '10', '2020-07-28 13:01:37', '2020-07-29 03:01:37', null, null);
INSERT INTO `user_logs` VALUES ('481', '17', '2020-07-28 16:35:39', '2020-07-29 06:35:39', null, null);
INSERT INTO `user_logs` VALUES ('482', '3', '2020-07-28 17:40:13', '2020-07-29 07:40:13', null, null);
INSERT INTO `user_logs` VALUES ('483', '24', '2020-07-28 18:53:34', '2020-07-29 08:53:34', null, null);
INSERT INTO `user_logs` VALUES ('484', '1', '2020-07-29 01:40:18', '2020-07-29 15:40:18', null, null);
INSERT INTO `user_logs` VALUES ('485', '1', '2020-07-29 01:57:04', '2020-07-29 15:57:04', null, null);
INSERT INTO `user_logs` VALUES ('486', '1', '2020-07-29 02:33:50', '2020-07-29 16:33:50', null, null);
INSERT INTO `user_logs` VALUES ('487', '1', '2020-07-29 03:36:02', '2020-07-29 17:36:02', null, null);
INSERT INTO `user_logs` VALUES ('488', '1', '2020-07-29 04:03:24', '2020-07-29 18:03:24', null, null);
INSERT INTO `user_logs` VALUES ('489', '1', '2020-07-29 04:11:05', '2020-07-29 18:11:05', null, null);
INSERT INTO `user_logs` VALUES ('490', '3', '2020-07-29 09:18:03', '2020-07-29 23:18:03', null, null);
INSERT INTO `user_logs` VALUES ('491', '5', '2020-07-29 10:20:40', '2020-07-30 00:20:40', null, null);
INSERT INTO `user_logs` VALUES ('492', '10', '2020-07-29 10:30:07', '2020-07-30 00:30:07', null, null);
INSERT INTO `user_logs` VALUES ('493', '17', '2020-07-29 11:11:17', '2020-07-30 01:11:17', null, null);
INSERT INTO `user_logs` VALUES ('494', '9', '2020-07-29 13:47:26', '2020-07-30 03:47:26', null, null);
INSERT INTO `user_logs` VALUES ('495', '5', '2020-07-29 15:46:59', '2020-07-30 05:46:59', null, null);
INSERT INTO `user_logs` VALUES ('496', '3', '2020-07-29 15:52:22', '2020-07-30 05:52:22', null, null);
INSERT INTO `user_logs` VALUES ('497', '1', '2020-07-29 22:45:17', '2020-07-30 12:45:17', null, null);
INSERT INTO `user_logs` VALUES ('498', '10', '2020-07-30 00:06:58', '2020-07-30 14:06:58', null, null);
INSERT INTO `user_logs` VALUES ('499', '3', '2020-07-30 09:55:11', '2020-07-30 23:55:11', null, null);
INSERT INTO `user_logs` VALUES ('500', '3', '2020-07-30 12:16:59', '2020-07-31 02:16:59', null, null);
INSERT INTO `user_logs` VALUES ('501', '10', '2020-07-30 13:37:16', '2020-07-31 03:37:16', null, null);
INSERT INTO `user_logs` VALUES ('502', '3', '2020-07-30 14:18:36', '2020-07-31 04:18:36', null, null);
INSERT INTO `user_logs` VALUES ('503', '8', '2020-07-30 17:33:21', '2020-07-31 07:33:21', null, null);
INSERT INTO `user_logs` VALUES ('504', '3', '2020-07-30 17:48:05', '2020-07-31 07:48:05', null, null);
INSERT INTO `user_logs` VALUES ('505', '3', '2020-07-31 08:10:38', '2020-07-31 22:10:38', null, null);
INSERT INTO `user_logs` VALUES ('506', '3', '2020-07-31 08:21:40', '2020-07-31 22:21:40', null, null);
INSERT INTO `user_logs` VALUES ('507', '5', '2020-07-31 10:15:23', '2020-08-01 00:15:23', null, null);
INSERT INTO `user_logs` VALUES ('508', '10', '2020-07-31 11:17:52', '2020-08-01 01:17:52', null, null);
INSERT INTO `user_logs` VALUES ('509', '8', '2020-07-31 12:23:50', '2020-08-01 02:23:50', null, null);
INSERT INTO `user_logs` VALUES ('510', '24', '2020-07-31 14:10:38', '2020-08-01 04:10:38', null, null);
INSERT INTO `user_logs` VALUES ('511', '10', '2020-07-31 14:37:40', '2020-08-01 04:37:40', null, null);
INSERT INTO `user_logs` VALUES ('512', '8', '2020-07-31 15:03:15', '2020-08-01 05:03:15', null, null);
INSERT INTO `user_logs` VALUES ('513', '3', '2020-08-02 13:41:22', '2020-08-03 03:41:22', null, null);
INSERT INTO `user_logs` VALUES ('514', '3', '2020-08-03 10:13:36', '2020-08-04 00:13:36', null, null);
INSERT INTO `user_logs` VALUES ('515', '8', '2020-08-03 10:46:31', '2020-08-04 00:46:31', null, null);
INSERT INTO `user_logs` VALUES ('516', '10', '2020-08-03 11:13:38', '2020-08-04 01:13:38', null, null);
INSERT INTO `user_logs` VALUES ('517', '5', '2020-08-03 12:08:52', '2020-08-04 02:08:52', null, null);
INSERT INTO `user_logs` VALUES ('518', '17', '2020-08-03 14:55:49', '2020-08-04 04:55:49', null, null);
INSERT INTO `user_logs` VALUES ('519', '10', '2020-08-03 14:59:57', '2020-08-04 04:59:57', null, null);
INSERT INTO `user_logs` VALUES ('520', '3', '2020-08-03 15:14:12', '2020-08-04 05:14:12', null, null);
INSERT INTO `user_logs` VALUES ('521', '10', '2020-08-03 15:25:07', '2020-08-04 05:25:07', null, null);
INSERT INTO `user_logs` VALUES ('522', '24', '2020-08-03 17:14:31', '2020-08-04 07:14:31', null, null);
INSERT INTO `user_logs` VALUES ('523', '10', '2020-08-04 10:04:37', '2020-08-05 00:04:37', null, null);
INSERT INTO `user_logs` VALUES ('524', '3', '2020-08-04 10:46:05', '2020-08-05 00:46:05', null, null);
INSERT INTO `user_logs` VALUES ('525', '3', '2020-08-04 20:27:08', '2020-08-05 10:27:08', null, null);
INSERT INTO `user_logs` VALUES ('526', '10', '2020-08-05 10:53:03', '2020-08-06 00:53:03', null, null);
INSERT INTO `user_logs` VALUES ('527', '3', '2020-08-05 10:55:34', '2020-08-06 00:55:34', null, null);
INSERT INTO `user_logs` VALUES ('528', '10', '2020-08-05 16:00:41', '2020-08-06 06:00:41', null, null);
INSERT INTO `user_logs` VALUES ('529', '3', '2020-08-06 09:33:46', '2020-08-06 23:33:46', null, null);
INSERT INTO `user_logs` VALUES ('530', '3', '2020-08-06 12:22:28', '2020-08-07 02:22:28', null, null);
INSERT INTO `user_logs` VALUES ('531', '10', '2020-08-06 12:43:29', '2020-08-07 02:43:29', null, null);
INSERT INTO `user_logs` VALUES ('532', '3', '2020-08-06 14:02:11', '2020-08-07 04:02:11', null, null);
INSERT INTO `user_logs` VALUES ('533', '10', '2020-08-06 15:54:07', '2020-08-07 05:54:07', null, null);
INSERT INTO `user_logs` VALUES ('534', '5', '2020-08-07 10:26:25', '2020-08-08 00:26:25', null, null);
INSERT INTO `user_logs` VALUES ('535', '3', '2020-08-07 10:27:24', '2020-08-08 00:27:24', null, null);
INSERT INTO `user_logs` VALUES ('536', '10', '2020-08-07 10:46:47', '2020-08-08 00:46:47', null, null);
INSERT INTO `user_logs` VALUES ('537', '8', '2020-08-07 12:39:44', '2020-08-08 02:39:44', null, null);
INSERT INTO `user_logs` VALUES ('538', '5', '2020-08-07 13:51:10', '2020-08-08 03:51:10', null, null);
INSERT INTO `user_logs` VALUES ('539', '3', '2020-08-10 10:09:45', '2020-08-11 00:09:45', null, null);
INSERT INTO `user_logs` VALUES ('540', '5', '2020-08-10 12:53:28', '2020-08-11 02:53:28', null, null);
INSERT INTO `user_logs` VALUES ('541', '10', '2020-08-10 13:11:25', '2020-08-11 03:11:25', null, null);
INSERT INTO `user_logs` VALUES ('542', '8', '2020-08-10 13:34:36', '2020-08-11 03:34:36', null, null);
INSERT INTO `user_logs` VALUES ('543', '3', '2020-08-10 15:45:09', '2020-08-11 05:45:09', null, null);
INSERT INTO `user_logs` VALUES ('544', '5', '2020-08-10 16:01:13', '2020-08-11 06:01:13', null, null);
INSERT INTO `user_logs` VALUES ('545', '10', '2020-08-10 16:27:41', '2020-08-11 06:27:41', null, null);
INSERT INTO `user_logs` VALUES ('546', '3', '2020-08-11 10:09:31', '2020-08-12 00:09:31', null, null);
INSERT INTO `user_logs` VALUES ('547', '3', '2020-08-12 09:56:56', '2020-08-12 23:56:56', null, null);
INSERT INTO `user_logs` VALUES ('548', '3', '2020-08-12 10:01:16', '2020-08-13 00:01:16', null, null);
INSERT INTO `user_logs` VALUES ('549', '10', '2020-08-12 10:29:37', '2020-08-13 00:29:37', null, null);
INSERT INTO `user_logs` VALUES ('550', '8', '2020-08-12 11:12:39', '2020-08-13 01:12:39', null, null);
INSERT INTO `user_logs` VALUES ('551', '5', '2020-08-12 11:16:40', '2020-08-13 01:16:40', null, null);
INSERT INTO `user_logs` VALUES ('552', '3', '2020-08-12 16:20:25', '2020-08-13 06:20:25', null, null);
INSERT INTO `user_logs` VALUES ('553', '3', '2020-08-12 16:22:40', '2020-08-13 06:22:40', null, null);
INSERT INTO `user_logs` VALUES ('554', '5', '2020-08-14 10:36:14', '2020-08-15 00:36:14', null, null);
INSERT INTO `user_logs` VALUES ('555', '10', '2020-08-14 10:55:46', '2020-08-15 00:55:46', null, null);
INSERT INTO `user_logs` VALUES ('556', '8', '2020-08-14 11:02:08', '2020-08-15 01:02:08', null, null);
INSERT INTO `user_logs` VALUES ('557', '3', '2020-08-14 11:08:37', '2020-08-15 01:08:37', null, null);
INSERT INTO `user_logs` VALUES ('558', '8', '2020-08-14 13:30:30', '2020-08-15 03:30:30', null, null);
INSERT INTO `user_logs` VALUES ('559', '9', '2020-08-14 14:46:05', '2020-08-15 04:46:05', null, null);
INSERT INTO `user_logs` VALUES ('560', '5', '2020-08-14 16:33:49', '2020-08-15 06:33:49', null, null);
INSERT INTO `user_logs` VALUES ('561', '17', '2020-08-14 16:41:19', '2020-08-15 06:41:19', null, null);
INSERT INTO `user_logs` VALUES ('562', '5', '2020-08-16 12:44:21', '2020-08-17 02:44:21', null, null);
INSERT INTO `user_logs` VALUES ('563', '3', '2020-08-17 09:50:14', '2020-08-17 23:50:14', null, null);
INSERT INTO `user_logs` VALUES ('564', '3', '2020-08-17 09:50:46', '2020-08-17 23:50:46', null, null);
INSERT INTO `user_logs` VALUES ('565', '5', '2020-08-17 10:54:06', '2020-08-18 00:54:06', null, null);
INSERT INTO `user_logs` VALUES ('566', '10', '2020-08-17 10:54:44', '2020-08-18 00:54:44', null, null);
INSERT INTO `user_logs` VALUES ('567', '3', '2020-08-17 12:42:55', '2020-08-18 02:42:55', null, null);
INSERT INTO `user_logs` VALUES ('568', '8', '2020-08-17 14:28:52', '2020-08-18 04:28:52', null, null);
INSERT INTO `user_logs` VALUES ('569', '9', '2020-08-17 14:36:57', '2020-08-18 04:36:57', null, null);
INSERT INTO `user_logs` VALUES ('570', '17', '2020-08-17 16:26:24', '2020-08-18 06:26:24', null, null);
INSERT INTO `user_logs` VALUES ('571', '8', '2020-08-17 17:32:46', '2020-08-18 07:32:46', null, null);
INSERT INTO `user_logs` VALUES ('572', '10', '2020-08-18 10:04:19', '2020-08-19 00:04:19', null, null);
INSERT INTO `user_logs` VALUES ('573', '17', '2020-08-18 10:51:17', '2020-08-19 00:51:17', null, null);
INSERT INTO `user_logs` VALUES ('574', '3', '2020-08-18 11:52:37', '2020-08-19 01:52:37', null, null);
INSERT INTO `user_logs` VALUES ('575', '17', '2020-08-18 16:22:57', '2020-08-19 06:22:57', null, null);
INSERT INTO `user_logs` VALUES ('576', '3', '2020-08-19 10:02:34', '2020-08-20 00:02:34', null, null);
INSERT INTO `user_logs` VALUES ('577', '3', '2020-08-19 10:55:55', '2020-08-20 00:55:55', null, null);
INSERT INTO `user_logs` VALUES ('578', '10', '2020-08-19 11:13:57', '2020-08-20 01:13:57', null, null);
INSERT INTO `user_logs` VALUES ('579', '5', '2020-08-19 11:22:16', '2020-08-20 01:22:16', null, null);
INSERT INTO `user_logs` VALUES ('580', '8', '2020-08-19 11:46:39', '2020-08-20 01:46:39', null, null);
INSERT INTO `user_logs` VALUES ('581', '9', '2020-08-19 14:48:54', '2020-08-20 04:48:54', null, null);
INSERT INTO `user_logs` VALUES ('582', '10', '2020-08-19 15:32:10', '2020-08-20 05:32:10', null, null);
INSERT INTO `user_logs` VALUES ('583', '3', '2020-08-20 10:10:02', '2020-08-21 00:10:02', null, null);
INSERT INTO `user_logs` VALUES ('584', '10', '2020-08-20 13:06:16', '2020-08-21 03:06:16', null, null);
INSERT INTO `user_logs` VALUES ('585', '17', '2020-08-20 15:49:24', '2020-08-21 05:49:24', null, null);
INSERT INTO `user_logs` VALUES ('586', '3', '2020-08-21 10:05:55', '2020-08-22 00:05:55', null, null);
INSERT INTO `user_logs` VALUES ('587', '10', '2020-08-21 10:50:38', '2020-08-22 00:50:38', null, null);
INSERT INTO `user_logs` VALUES ('588', '8', '2020-08-21 11:00:02', '2020-08-22 01:00:02', null, null);
INSERT INTO `user_logs` VALUES ('589', '5', '2020-08-21 11:03:29', '2020-08-22 01:03:29', null, null);
INSERT INTO `user_logs` VALUES ('590', '17', '2020-08-21 11:08:12', '2020-08-22 01:08:12', null, null);
INSERT INTO `user_logs` VALUES ('591', '10', '2020-08-21 15:00:22', '2020-08-22 05:00:22', null, null);
INSERT INTO `user_logs` VALUES ('592', '1', '2020-08-24 04:04:48', '2020-08-24 18:04:48', null, null);
INSERT INTO `user_logs` VALUES ('593', '3', '2020-08-24 10:06:29', '2020-08-25 00:06:29', null, null);
INSERT INTO `user_logs` VALUES ('594', '10', '2020-08-24 10:47:49', '2020-08-25 00:47:49', null, null);
INSERT INTO `user_logs` VALUES ('595', '5', '2020-08-24 10:55:36', '2020-08-25 00:55:36', null, null);
INSERT INTO `user_logs` VALUES ('596', '8', '2020-08-24 11:18:22', '2020-08-25 01:18:22', null, null);
INSERT INTO `user_logs` VALUES ('597', '10', '2020-08-24 16:11:05', '2020-08-25 06:11:05', null, null);
INSERT INTO `user_logs` VALUES ('598', '8', '2020-08-24 16:52:16', '2020-08-25 06:52:16', null, null);
INSERT INTO `user_logs` VALUES ('599', '3', '2020-08-25 10:10:55', '2020-08-26 00:10:55', null, null);
INSERT INTO `user_logs` VALUES ('600', '10', '2020-08-25 11:32:25', '2020-08-26 01:32:25', null, null);
INSERT INTO `user_logs` VALUES ('601', '24', '2020-08-25 22:55:03', '2020-08-26 12:55:03', null, null);
INSERT INTO `user_logs` VALUES ('602', '3', '2020-08-26 09:59:06', '2020-08-26 23:59:06', null, null);
INSERT INTO `user_logs` VALUES ('603', '10', '2020-08-26 10:45:07', '2020-08-27 00:45:07', null, null);
INSERT INTO `user_logs` VALUES ('604', '17', '2020-08-26 15:19:10', '2020-08-27 05:19:10', null, null);
INSERT INTO `user_logs` VALUES ('605', '10', '2020-08-27 10:04:32', '2020-08-28 00:04:32', null, null);
INSERT INTO `user_logs` VALUES ('606', '3', '2020-08-27 11:03:38', '2020-08-28 01:03:38', null, null);
INSERT INTO `user_logs` VALUES ('607', '10', '2020-08-27 12:58:27', '2020-08-28 02:58:27', null, null);
INSERT INTO `user_logs` VALUES ('608', '5', '2020-08-27 14:15:40', '2020-08-28 04:15:40', null, null);
INSERT INTO `user_logs` VALUES ('609', '3', '2020-08-28 10:07:40', '2020-08-29 00:07:40', null, null);
INSERT INTO `user_logs` VALUES ('610', '5', '2020-08-28 10:33:24', '2020-08-29 00:33:24', null, null);
INSERT INTO `user_logs` VALUES ('611', '10', '2020-08-28 10:42:22', '2020-08-29 00:42:22', null, null);
INSERT INTO `user_logs` VALUES ('612', '8', '2020-08-28 11:01:11', '2020-08-29 01:01:11', null, null);
INSERT INTO `user_logs` VALUES ('613', '10', '2020-08-31 10:31:18', '2020-09-01 00:31:18', null, null);
INSERT INTO `user_logs` VALUES ('614', '3', '2020-08-31 10:48:37', '2020-09-01 00:48:37', null, null);
INSERT INTO `user_logs` VALUES ('615', '8', '2020-08-31 11:35:39', '2020-09-01 01:35:39', null, null);
INSERT INTO `user_logs` VALUES ('616', '9', '2020-08-31 13:58:09', '2020-09-01 03:58:09', null, null);
INSERT INTO `user_logs` VALUES ('617', '8', '2020-08-31 16:42:42', '2020-09-01 06:42:42', null, null);
INSERT INTO `user_logs` VALUES ('618', '17', '2020-08-31 16:46:28', '2020-09-01 06:46:28', null, null);
INSERT INTO `user_logs` VALUES ('619', '10', '2020-09-01 09:55:14', '2020-09-01 23:55:14', null, null);
INSERT INTO `user_logs` VALUES ('620', '17', '2020-09-01 09:56:38', '2020-09-01 23:56:38', null, null);
INSERT INTO `user_logs` VALUES ('621', '3', '2020-09-01 10:16:40', '2020-09-02 00:16:40', null, null);
INSERT INTO `user_logs` VALUES ('622', '17', '2020-09-01 13:16:14', '2020-09-02 03:16:14', null, null);
INSERT INTO `user_logs` VALUES ('623', '3', '2020-09-01 22:58:41', '2020-09-02 12:58:41', null, null);
INSERT INTO `user_logs` VALUES ('624', '5', '2020-09-02 10:20:36', '2020-09-03 00:20:36', null, null);
INSERT INTO `user_logs` VALUES ('625', '10', '2020-09-02 10:35:39', '2020-09-03 00:35:39', null, null);
INSERT INTO `user_logs` VALUES ('626', '3', '2020-09-02 10:59:28', '2020-09-03 00:59:28', null, null);
INSERT INTO `user_logs` VALUES ('627', '4', '2020-09-02 11:00:58', '2020-09-03 01:00:58', null, null);
INSERT INTO `user_logs` VALUES ('628', '8', '2020-09-02 11:01:00', '2020-09-03 01:01:00', null, null);
INSERT INTO `user_logs` VALUES ('629', '9', '2020-09-02 11:39:40', '2020-09-03 01:39:40', null, null);
INSERT INTO `user_logs` VALUES ('630', '10', '2020-09-02 12:40:13', '2020-09-03 02:40:13', null, null);
INSERT INTO `user_logs` VALUES ('631', '17', '2020-09-02 13:44:24', '2020-09-03 03:44:24', null, null);
INSERT INTO `user_logs` VALUES ('632', '3', '2020-09-02 17:35:48', '2020-09-03 07:35:48', null, null);
INSERT INTO `user_logs` VALUES ('633', '10', '2020-09-02 17:36:46', '2020-09-03 07:36:46', null, null);
INSERT INTO `user_logs` VALUES ('634', '5', '2020-09-02 19:36:37', '2020-09-03 09:36:37', null, null);
INSERT INTO `user_logs` VALUES ('635', '17', '2020-09-03 09:45:28', '2020-09-03 23:45:28', null, null);
INSERT INTO `user_logs` VALUES ('636', '10', '2020-09-03 10:03:39', '2020-09-04 00:03:39', null, null);
INSERT INTO `user_logs` VALUES ('637', '17', '2020-09-03 15:21:55', '2020-09-04 05:21:55', null, null);
INSERT INTO `user_logs` VALUES ('638', '9', '2020-09-03 15:51:40', '2020-09-04 05:51:40', null, null);
INSERT INTO `user_logs` VALUES ('639', '17', '2020-09-04 11:32:39', '2020-09-05 01:32:39', null, null);
INSERT INTO `user_logs` VALUES ('640', '1', '2020-09-08 02:37:42', '2020-09-08 16:37:42', null, null);
INSERT INTO `user_logs` VALUES ('641', '8', '2020-09-08 09:13:53', '2020-09-08 23:13:53', null, null);
INSERT INTO `user_logs` VALUES ('642', '3', '2020-09-08 09:40:42', '2020-09-08 23:40:42', null, null);
INSERT INTO `user_logs` VALUES ('643', '10', '2020-09-08 10:00:29', '2020-09-09 00:00:29', null, null);
INSERT INTO `user_logs` VALUES ('644', '17', '2020-09-08 12:54:50', '2020-09-09 02:54:50', null, null);
INSERT INTO `user_logs` VALUES ('645', '8', '2020-09-08 14:32:58', '2020-09-09 04:32:58', null, null);
INSERT INTO `user_logs` VALUES ('646', '10', '2020-09-08 15:14:41', '2020-09-09 05:14:41', null, null);
INSERT INTO `user_logs` VALUES ('647', '17', '2020-09-08 16:27:53', '2020-09-09 06:27:53', null, null);
INSERT INTO `user_logs` VALUES ('648', '1', '2020-09-09 01:19:29', '2020-09-09 15:19:29', null, null);
INSERT INTO `user_logs` VALUES ('649', '8', '2020-09-09 10:13:38', '2020-09-10 00:13:38', null, null);
INSERT INTO `user_logs` VALUES ('650', '3', '2020-09-09 10:15:40', '2020-09-10 00:15:40', null, null);
INSERT INTO `user_logs` VALUES ('651', '5', '2020-09-09 11:17:14', '2020-09-10 01:17:14', null, null);
INSERT INTO `user_logs` VALUES ('652', '3', '2020-09-09 11:34:12', '2020-09-10 01:34:12', null, null);
INSERT INTO `user_logs` VALUES ('653', '10', '2020-09-09 13:53:15', '2020-09-10 03:53:15', null, null);
INSERT INTO `user_logs` VALUES ('654', '17', '2020-09-09 14:05:26', '2020-09-10 04:05:26', null, null);
INSERT INTO `user_logs` VALUES ('655', '5', '2020-09-09 16:39:18', '2020-09-10 06:39:18', null, null);
INSERT INTO `user_logs` VALUES ('656', '5', '2020-09-09 16:42:10', '2020-09-10 06:42:10', null, null);
INSERT INTO `user_logs` VALUES ('657', '8', '2020-09-10 07:33:37', '2020-09-10 21:33:37', null, null);
INSERT INTO `user_logs` VALUES ('658', '10', '2020-09-10 09:57:46', '2020-09-10 23:57:46', null, null);
INSERT INTO `user_logs` VALUES ('659', '3', '2020-09-10 12:19:25', '2020-09-11 02:19:25', null, null);
INSERT INTO `user_logs` VALUES ('660', '17', '2020-09-10 13:17:49', '2020-09-11 03:17:49', null, null);
INSERT INTO `user_logs` VALUES ('661', '10', '2020-09-10 13:18:20', '2020-09-11 03:18:20', null, null);
INSERT INTO `user_logs` VALUES ('662', '3', '2020-09-11 10:10:01', '2020-09-12 00:10:01', null, null);
INSERT INTO `user_logs` VALUES ('663', '5', '2020-09-11 10:22:41', '2020-09-12 00:22:41', null, null);
INSERT INTO `user_logs` VALUES ('664', '10', '2020-09-11 11:44:14', '2020-09-12 01:44:14', null, null);
INSERT INTO `user_logs` VALUES ('665', '8', '2020-09-11 12:10:05', '2020-09-12 02:10:05', null, null);
INSERT INTO `user_logs` VALUES ('666', '3', '2020-09-11 14:01:09', '2020-09-12 04:01:09', null, null);
INSERT INTO `user_logs` VALUES ('667', '10', '2020-09-11 16:04:52', '2020-09-12 06:04:52', null, null);
INSERT INTO `user_logs` VALUES ('668', '3', '2020-09-14 10:07:39', '2020-09-15 00:07:39', null, null);
INSERT INTO `user_logs` VALUES ('669', '10', '2020-09-14 10:15:21', '2020-09-15 00:15:21', null, null);
INSERT INTO `user_logs` VALUES ('670', '17', '2020-09-14 12:39:33', '2020-09-15 02:39:33', null, null);
INSERT INTO `user_logs` VALUES ('671', '9', '2020-09-14 14:15:27', '2020-09-15 04:15:27', null, null);
INSERT INTO `user_logs` VALUES ('672', '5', '2020-09-14 14:17:57', '2020-09-15 04:17:57', null, null);
INSERT INTO `user_logs` VALUES ('673', '3', '2020-09-14 15:40:36', '2020-09-15 05:40:36', null, null);
INSERT INTO `user_logs` VALUES ('674', '10', '2020-09-14 16:03:48', '2020-09-15 06:03:48', null, null);
INSERT INTO `user_logs` VALUES ('675', '17', '2020-09-14 16:19:54', '2020-09-15 06:19:54', null, null);
INSERT INTO `user_logs` VALUES ('676', '9', '2020-09-14 17:34:05', '2020-09-15 07:34:05', null, null);
INSERT INTO `user_logs` VALUES ('677', '10', '2020-09-15 10:01:10', '2020-09-16 00:01:10', null, null);
INSERT INTO `user_logs` VALUES ('678', '17', '2020-09-15 11:17:01', '2020-09-16 01:17:01', null, null);
INSERT INTO `user_logs` VALUES ('679', '10', '2020-09-15 12:52:26', '2020-09-16 02:52:26', null, null);
INSERT INTO `user_logs` VALUES ('680', '3', '2020-09-15 13:33:08', '2020-09-16 03:33:08', null, null);
INSERT INTO `user_logs` VALUES ('681', '17', '2020-09-15 15:42:19', '2020-09-16 05:42:19', null, null);
INSERT INTO `user_logs` VALUES ('682', '3', '2020-09-16 10:08:49', '2020-09-17 00:08:49', null, null);
INSERT INTO `user_logs` VALUES ('683', '9', '2020-09-16 10:30:32', '2020-09-17 00:30:32', null, null);
INSERT INTO `user_logs` VALUES ('684', '5', '2020-09-16 10:32:01', '2020-09-17 00:32:01', null, null);
INSERT INTO `user_logs` VALUES ('685', '10', '2020-09-16 10:38:15', '2020-09-17 00:38:15', null, null);
INSERT INTO `user_logs` VALUES ('686', '1', '2020-09-16 23:55:37', '2020-09-17 13:55:37', null, null);
INSERT INTO `user_logs` VALUES ('687', '10', '2020-09-17 10:06:59', '2020-09-18 00:06:59', null, null);
INSERT INTO `user_logs` VALUES ('688', '3', '2020-09-17 10:25:02', '2020-09-18 00:25:02', null, null);
INSERT INTO `user_logs` VALUES ('689', '17', '2020-09-17 10:54:34', '2020-09-18 00:54:34', null, null);
INSERT INTO `user_logs` VALUES ('690', '10', '2020-09-17 13:22:30', '2020-09-18 03:22:30', null, null);
INSERT INTO `user_logs` VALUES ('691', '10', '2020-09-18 10:25:23', '2020-09-19 00:25:23', null, null);
INSERT INTO `user_logs` VALUES ('692', '3', '2020-09-18 10:52:00', '2020-09-19 00:52:00', null, null);
INSERT INTO `user_logs` VALUES ('693', '9', '2020-09-18 11:04:45', '2020-09-19 01:04:45', null, null);
INSERT INTO `user_logs` VALUES ('694', '5', '2020-09-18 11:47:32', '2020-09-19 01:47:32', null, null);
INSERT INTO `user_logs` VALUES ('695', '3', '2020-09-18 16:22:47', '2020-09-19 06:22:47', null, null);
INSERT INTO `user_logs` VALUES ('696', '5', '2020-09-21 10:37:20', '2020-09-22 00:37:20', null, null);
INSERT INTO `user_logs` VALUES ('697', '3', '2020-09-21 10:42:12', '2020-09-22 00:42:12', null, null);
INSERT INTO `user_logs` VALUES ('698', '9', '2020-09-21 12:17:28', '2020-09-22 02:17:28', null, null);
INSERT INTO `user_logs` VALUES ('699', '10', '2020-09-21 12:40:08', '2020-09-22 02:40:08', null, null);
INSERT INTO `user_logs` VALUES ('700', '17', '2020-09-21 14:18:36', '2020-09-22 04:18:36', null, null);
INSERT INTO `user_logs` VALUES ('701', '3', '2020-09-21 16:07:15', '2020-09-22 06:07:15', null, null);
INSERT INTO `user_logs` VALUES ('702', '8', '2020-09-21 17:13:01', '2020-09-22 07:13:01', null, null);
INSERT INTO `user_logs` VALUES ('703', '10', '2020-09-22 10:04:36', '2020-09-23 00:04:36', null, null);
INSERT INTO `user_logs` VALUES ('704', '3', '2020-09-22 10:25:52', '2020-09-23 00:25:52', null, null);
INSERT INTO `user_logs` VALUES ('705', '9', '2020-09-22 12:33:00', '2020-09-23 02:33:00', null, null);
INSERT INTO `user_logs` VALUES ('706', '1', '2020-09-23 04:03:33', '2020-09-23 04:03:33', null, null);
INSERT INTO `user_logs` VALUES ('707', '1', '2020-09-23 04:13:38', '2020-09-23 04:13:38', null, null);
INSERT INTO `user_logs` VALUES ('708', '1', '2020-11-04 02:38:54', '2020-11-04 02:38:54', null, null);
INSERT INTO `user_logs` VALUES ('709', '1', '2020-11-04 03:13:03', '2020-11-04 03:13:03', null, null);
INSERT INTO `user_logs` VALUES ('710', '1', '2020-11-05 01:28:48', '2020-11-05 01:28:48', null, null);
