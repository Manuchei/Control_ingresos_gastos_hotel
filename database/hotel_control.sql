/*
 Navicat Premium Data Transfer

 Source Server         : hotel
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : hotel_control

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 11/06/2023 18:55:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `balance` float NOT NULL DEFAULT 0,
  `date_created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `date_updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (10, 'Test1', '&lt;p&gt;Test&amp;nbsp;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&lt;b&gt;&amp;nbsp;&lt;/b&gt;&lt;/span&gt;&lt;b&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;&lt;b&gt;Test&lt;/b&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Test&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;', 1, 150, '2023-06-11 16:22:14', '2023-06-11 18:54:01');
INSERT INTO `categories` VALUES (11, 'Café', '&lt;p&gt;Aqu&iacute; se guardar&aacute; el caf&eacute; vendido&lt;/p&gt;', 1, 3, '2023-06-11 18:39:46', '2023-06-11 18:53:00');
INSERT INTO `categories` VALUES (12, 'Proveedor de café Marca Juan Valdéz', '&lt;p&gt;Don Luis&lt;/p&gt;', 1, 44, '2023-06-11 18:41:14', '2023-06-11 18:50:52');

-- ----------------------------
-- Table structure for running_balance
-- ----------------------------
DROP TABLE IF EXISTS `running_balance`;
CREATE TABLE `running_balance`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `balance_type` tinyint(1) NOT NULL COMMENT '1=budget, 2=expense',
  `category_id` int NOT NULL,
  `amount` float NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `date_updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `running_balance_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of running_balance
-- ----------------------------
INSERT INTO `running_balance` VALUES (30, 1, 11, 5, '&lt;p&gt;asdfasdf&lt;/p&gt;', '6', '2023-06-11 18:52:34', NULL);
INSERT INTO `running_balance` VALUES (31, 2, 11, 2, '', '6', '2023-06-11 18:53:00', NULL);
INSERT INTO `running_balance` VALUES (32, 1, 10, 200, '&lt;p&gt;Bolsas de caf&eacute; en grano&lt;/p&gt;', '6', '2023-06-11 18:53:35', NULL);
INSERT INTO `running_balance` VALUES (33, 2, 10, 50, '&lt;p&gt;Se vendieron 50 bolsas el d&iacute;a de hoy&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '6', '2023-06-11 18:54:01', NULL);

-- ----------------------------
-- Table structure for system_info
-- ----------------------------
DROP TABLE IF EXISTS `system_info`;
CREATE TABLE `system_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_field` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_info
-- ----------------------------
INSERT INTO `system_info` VALUES (1, 'name', 'Control de ingresos y gastos de Hotel');
INSERT INTO `system_info` VALUES (6, 'short_name', 'CDIGH');
INSERT INTO `system_info` VALUES (11, 'logo', 'uploads/1686526980_BG.jpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `date_updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Administrador', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2023-06-10 14:02:37', '2023-06-11 01:21:51');
INSERT INTO `users` VALUES (6, 'test', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', 'uploads/1686524280_BG.jpg', NULL, 2, '2023-06-11 17:55:19', '2023-06-11 17:58:26');

SET FOREIGN_KEY_CHECKS = 1;
