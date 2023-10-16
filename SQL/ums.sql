/*
 Navicat Premium Data Transfer

 Source Server         : learning
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : ums

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 16/10/2023 14:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `originalname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (1, '0da90396ede4935e7e07d6def7ec0651', 'image/png', 17900, 1, '2023-05-17 22:50:27', '2023-05-17 22:50:27', 'insist.png');
INSERT INTO `avatar` VALUES (2, 'e08289987804f371850b2c62e037b9a2', 'image/jpeg', 49608, 1, '2023-05-17 23:17:37', '2023-05-17 23:17:37', 'avater2.jpg');
INSERT INTO `avatar` VALUES (3, 'ce4c60debce6b6d52bfbddf3941c7800', 'image/jpeg', 49608, 1, '2023-05-18 10:01:36', '2023-05-18 10:01:36', 'avater2.jpg');
INSERT INTO `avatar` VALUES (4, 'ce8f9377c70eff4a4c62edcf48873776', 'image/jpeg', 49608, 1, '2023-05-18 10:05:52', '2023-05-18 10:05:52', 'avater2.jpg');
INSERT INTO `avatar` VALUES (5, 'dfb6fcc61ba2a4814dc0d64840643d9e', 'image/jpeg', 28111, 1, '2023-05-18 10:06:08', '2023-05-18 10:06:08', 'avatar3.jpg');
INSERT INTO `avatar` VALUES (6, 'd9669d7b974bbfd159640d2e8984dcd4', 'image/jpeg', 28111, 1, '2023-05-22 13:42:41', '2023-05-22 13:42:41', 'avatar3.jpg');
INSERT INTO `avatar` VALUES (7, 'cf3dde9127217765f5a95ce9a09c8e63', 'image/jpeg', 46959, 1, '2023-05-22 14:13:58', '2023-05-22 14:13:58', 'avatar1.jpg');
INSERT INTO `avatar` VALUES (8, '687f22c296ebbeffb28cd78cf039de99', 'image/jpeg', 28111, 1, '2023-05-22 14:15:59', '2023-05-22 14:15:59', 'avatar3.jpg');
INSERT INTO `avatar` VALUES (9, '8323e3cab9de2f4dbfe87325e6eb610f', 'image/jpeg', 49608, 1, '2023-05-22 14:21:55', '2023-05-22 14:21:55', 'avater2.jpg');
INSERT INTO `avatar` VALUES (10, '5ec92bbb711ad0eeb5659530b8579b20', 'image/jpeg', 28111, 1, '2023-05-22 14:22:08', '2023-05-22 14:22:08', 'avatar3.jpg');
INSERT INTO `avatar` VALUES (11, '0a94b91a189e1e08ab39767976843d37', 'image/jpeg', 28111, 1, '2023-05-22 14:22:36', '2023-05-22 14:22:36', 'avatar3.jpg');
INSERT INTO `avatar` VALUES (12, '1c4ddac3a8381ba58c685f8d63fbbe6d', 'image/jpeg', 46959, 1, '2023-05-22 14:25:09', '2023-05-22 14:25:09', 'avatar1.jpg');
INSERT INTO `avatar` VALUES (13, 'dac544bd2754d306d6f833db9c30914e', 'image/jpeg', 28111, 1, '2023-05-22 14:35:55', '2023-05-22 14:35:55', 'avatar3.jpg');
INSERT INTO `avatar` VALUES (14, 'cbc515e45755512e8da13bb4535aa7a9', 'image/jpeg', 46959, 1, '2023-05-22 14:36:36', '2023-05-22 14:36:36', 'avatar1.jpg');
INSERT INTO `avatar` VALUES (15, '045087ac044b39905e9c131ae80716de', 'image/jpeg', 49608, 1, '2023-05-22 14:36:53', '2023-05-22 14:36:53', 'avater2.jpg');
INSERT INTO `avatar` VALUES (16, '6f8676041a2bbb95f63b83031d0b8620', 'image/jpeg', 28111, 1, '2023-05-22 23:04:13', '2023-05-22 23:04:13', 'avatar3.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `moment_id`(`moment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `comment_id`(`comment_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentId` int NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `leader` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '总裁办', NULL, '2023-05-09 20:14:29', '2023-05-11 17:14:40', '张浩然');
INSERT INTO `department` VALUES (2, '研发部', NULL, '2023-05-09 20:14:50', '2023-05-11 17:15:08', '科比');
INSERT INTO `department` VALUES (3, '运维部', NULL, '2023-05-11 16:53:15', '2023-05-15 21:27:29', '张佳佳');
INSERT INTO `department` VALUES (4, '交付中心', NULL, '2023-05-15 17:56:22', '2023-05-15 21:27:29', '哈登');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `oldPrice` double NULL DEFAULT NULL,
  `newPrice` double NULL DEFAULT NULL,
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `imgUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `inventoryCount` int NULL DEFAULT NULL,
  `saleCount` int NULL DEFAULT NULL,
  `favorCount` int NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `categoryId` int NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '吊带背心女夏2018秋季新款内搭吊带衫短款性感修身针织打底衫上衣显瘦', 43, 30, '吊带背心女夏2018秋季新款内搭吊带衫短款性感修身针织打底衫上衣显瘦', 1, 'http://s11.mogucdn.com/mlcdn/17f85e/180927_5i77e04lhaalbg3dai0j4588lbahh_640x960.jpg_560x999.jpg', 6285, 2, 3, '天津', 6, '2023-05-11 00:18:59', '2023-05-11 00:18:59');
INSERT INTO `goods` VALUES (2, '2018秋季新款时尚套装蝴蝶结波点衬衫圆领麻花毛衣无袖马甲百褶半身裙中长款A字裙套装三件套', 86, 60, '2018秋季新款时尚套装蝴蝶结波点衬衫圆领麻花毛衣无袖马甲百褶半身裙中长款A字裙套装三件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180131_1kgh02j1j4lbb74g0427ljk976612_640x960.jpg_560x999.jpg', 4118, 1356, 311, '青岛', 8, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (3, '时尚套装韩版气质甜美镂空灯笼袖针织衫百搭显瘦毛衣女2018秋季新款连衣裙套装', 70, 70, '时尚套装韩版气质甜美镂空灯笼袖针织衫百搭显瘦毛衣女2018秋季新款连衣裙套装', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180822_5bl46cl4g934133a6cbhkk8l37hl0_640x960.jpg_560x999.jpg', 1615, 1360, 286, '沈阳', 3, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (4, '2018秋冬新款时尚韩范百搭显瘦背带裤套装灯芯绒裤子+毛衣两件套女', 99, 69, '2018秋冬新款时尚韩范百搭显瘦背带裤套装灯芯绒裤子+毛衣两件套女', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180831_3lccd4912aec0lb8fga9ji7ah6bkd_640x960.jpg_560x999.jpg', 4339, 1382, 55, '南京', 8, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (5, '2018秋装套装新款韩版百搭显瘦长袖条纹雪纺衬衫女宽松直筒背带裤套装两件套', 84, 59, '2018秋装套装新款韩版百搭显瘦长袖条纹雪纺衬衫女宽松直筒背带裤套装两件套', 1, 'http://s11.mogucdn.com/mlcdn/c45406/180312_5ebi8i8k389leic0g487h3l611kek_640x960.jpg_560x999.jpg', 7966, 1384, 80, '西安', 3, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (6, '时尚套装两件套网红同款2018秋装女套装新款学生牛仔外套配内搭温柔风小黑裙黑色v领吊带裙潮', 100, 70, '时尚套装两件套网红同款2018秋装女套装新款学生牛仔外套配内搭温柔风小黑裙黑色v领吊带裙潮', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180819_44ee3hf251agika4lji8958i46e6d_640x960.jpg_560x999.jpg', 1281, 1404, 75, '青岛', 7, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (7, '连衣裙女新款2018秋款韩版小碎花裙子长袖文艺学生百搭小黑裙', 97, 68, '连衣裙女新款2018秋款韩版小碎花裙子长袖文艺学生百搭小黑裙', 1, 'http://s11.mogucdn.com/mlcdn/c45406/170402_06ehihjk325cjc7jc4653k1bkek2b_640x960.jpg_560x999.jpg', 7702, 1416, 441, '西安', 5, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (8, '格姬2018秋装新款两件套圆领灯笼袖连衣裙春装新款韩版名媛大裙摆套装裙时尚套装女6254', 285, 199, '格姬2018秋装新款两件套圆领灯笼袖连衣裙春装新款韩版名媛大裙摆套装裙时尚套装女6254', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180302_4ji3hab7c3kdhfdg4i0lc86a1287h_640x960.jpg_560x999.jpg', 2455, 1416, 62, '南京', 7, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (9, '秋装2018新款牛仔外套女韩版宽松短款针织背心高腰半身裙中长裙小个子显高时尚套装裙子三件套', 39, 27, '秋装2018新款牛仔外套女韩版宽松短款针织背心高腰半身裙中长裙小个子显高时尚套装裙子三件套', 1, 'http://s3.mogucdn.com/mlcdn/c45406/180731_5be6jhh7ggj68d4063gkca4egh02i_750x1000.jpg_560x999.jpg', 7012, 1432, 103, '昆明', 8, '2023-05-11 00:24:14', '2023-05-11 00:24:14');
INSERT INTO `goods` VALUES (10, '2018秋装女装韩版新款休闲时尚套装女圆领条纹薄款上衣+高腰束脚灯笼裤两件套女潮', 198, 198, '2018秋装女装韩版新款休闲时尚套装女圆领条纹薄款上衣+高腰束脚灯笼裤两件套女潮', 1, 'http://s11.mogucdn.com/mlcdn/55cf19/180803_44ec95haiehdddjk126fgidfg52le_640x960.jpg_560x999.jpg', 1582, 1459, 13, '重庆', 5, '2023-05-11 00:24:14', '2023-05-11 00:24:14');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, 'NBA', '2023-05-16 22:17:22', '2023-05-16 22:17:22');
INSERT INTO `label` VALUES (2, '篮球', '2023-05-16 22:19:26', '2023-05-16 22:19:26');
INSERT INTO `label` VALUES (3, '文学', '2023-05-16 22:22:40', '2023-05-16 22:22:40');
INSERT INTO `label` VALUES (4, '体育', '2023-05-16 22:22:50', '2023-05-16 22:22:50');
INSERT INTO `label` VALUES (5, '科学', '2023-05-16 22:22:57', '2023-05-16 22:22:57');
INSERT INTO `label` VALUES (6, '足球', '2023-05-17 10:42:52', '2023-05-17 10:42:52');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentId` int NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url`) USING BTREE,
  UNIQUE INDEX `permission`(`permission`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统总览', 1, 'el-icon-monitor', NULL, '/main/analysis', NULL, 1, '2023-05-08 20:21:42', '2023-05-08 20:22:04');
INSERT INTO `menu` VALUES (2, '系统管理', 1, 'el-icon-setting', NULL, '/main/system', NULL, 2, '2023-05-08 20:32:15', '2023-05-08 20:32:15');
INSERT INTO `menu` VALUES (3, '商品中心', 1, 'el-icon-goods', NULL, '/main/product', NULL, NULL, '2023-05-08 20:32:50', '2023-05-15 19:28:20');
INSERT INTO `menu` VALUES (4, '随便聊聊', 1, 'el-icon-chat-line-round', NULL, '/main/story', NULL, NULL, '2023-05-15 20:37:54', '2023-05-15 20:49:37');
INSERT INTO `menu` VALUES (5, '核心技术', 2, NULL, 1, '/main/analysis/overview', NULL, 101, '2023-05-08 21:19:13', '2023-05-08 21:32:53');
INSERT INTO `menu` VALUES (6, '商品统计', 2, NULL, 1, '/main/analysis/dashboard', NULL, 102, '2023-05-08 21:19:52', '2023-05-08 21:32:57');
INSERT INTO `menu` VALUES (7, '用户管理', 2, NULL, 2, '/main/system/user', NULL, 201, '2023-05-08 21:22:27', '2023-05-08 21:33:05');
INSERT INTO `menu` VALUES (8, '部门管理', 2, NULL, 2, '/main/system/department', NULL, 202, '2023-05-08 21:23:06', '2023-05-08 21:33:14');
INSERT INTO `menu` VALUES (9, '菜单管理', 2, NULL, 2, '/main/system/menu', NULL, 203, '2023-05-08 21:23:30', '2023-05-08 21:33:18');
INSERT INTO `menu` VALUES (10, '角色管理', 2, NULL, 2, '/main/system/role', NULL, 204, '2023-05-08 21:23:50', '2023-05-08 21:33:22');
INSERT INTO `menu` VALUES (11, '商品类别', 2, NULL, 3, '/main/product/category', NULL, 301, '2023-05-08 21:24:10', '2023-05-08 21:33:29');
INSERT INTO `menu` VALUES (12, '商品信息', 2, NULL, 3, '/main/product/goods', NULL, 302, '2023-05-08 21:24:28', '2023-05-08 21:33:32');
INSERT INTO `menu` VALUES (13, '你的故事', 2, NULL, 4, '/main/story/chat', NULL, NULL, '2023-05-15 20:43:38', '2023-05-15 20:50:12');
INSERT INTO `menu` VALUES (14, '故事列表', 2, NULL, 4, '/main/story/list', NULL, NULL, '2023-05-15 20:44:03', '2023-05-15 20:50:15');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `user_id` int NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (3, '不要告诉我你不需要保护，不要告诉我你不寂寞，知微，我只希望你，在走过黑夜的那个时辰，不要倔强的选择一个人。', 3, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (5, '在世间万物中我都发现了你，渺小时，你是阳光下一粒种子，伟大时，你隐身在高山海洋里。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (6, '某一天，突然发现，许多结果都与路径无关。', 4, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (7, '限定目的，能使人生变得简洁。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (8, '翅膀长在你的肩上，太在乎别人对于飞行姿势的批评，所以你飞不起来', 4, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (9, '一个人至少拥有一个梦想，有一个理由去坚强。心若没有栖息的地方，到哪里都是在流浪。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (10, '不乱于心，不困于情。不畏将来，不念过往。如此，安好。', 3, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (11, '如果你给我的，和你给别人的是一样的，那我就不要了。', 3, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (12, '故事的开头总是这样，适逢其会，猝不及防。故事的结局总是这样，花开两朵，天各一方。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (13, '你不愿意种花，你说，我不愿看见它一点点凋落。是的，为了避免结束，你避免了一切开始。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (14, '你如果认识从前的我，也许你会原谅现在的我。', 4, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (15, '每一个不曾起舞的日子，都是对生命的辜负。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (16, '向来缘浅，奈何情深。', 2, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (17, '心之所向 素履以往 生如逆旅 一苇以航', 3, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (18, '生如夏花之绚烂，死如秋叶之静美。', 3, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (19, '答案很长，我准备用一生的时间来回答，你准备要听了吗？', 4, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (20, '因为爱过，所以慈悲；因为懂得，所以宽容。', 4, '2023-05-07 17:27:01', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (21, '我们听过无数的道理，却仍旧过不好这一生。', 1, '2023-05-07 17:27:14', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (22, '我来不及认真地年轻，待明白过来时，只能选择认真地老去。', 2, '2023-05-07 17:27:14', '2023-05-08 20:21:14', NULL);
INSERT INTO `moment` VALUES (23, '我是动态，哈哈哈哈！', 1, '2023-05-16 14:20:32', '2023-05-16 14:20:32', NULL);
INSERT INTO `moment` VALUES (24, '我是动态，哈哈哈哈！', 1, '2023-05-18 11:01:29', '2023-05-18 11:01:29', NULL);
INSERT INTO `moment` VALUES (25, '我修改了动态，哈哈哈~', 1, '2023-05-18 11:02:01', '2023-05-18 11:10:59', '我修改了标题');
INSERT INTO `moment` VALUES (26, '<table style=\"width: auto;\"><tbody><tr><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\">11111</th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\">11</th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\">11</th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></th><th colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></th></tr><tr><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\">1</td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\">1111</td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td></tr><tr><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td></tr><tr><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\">11</td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\">11</td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td></tr><tr><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td></tr><tr><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td></tr><tr><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td><td colSpan=\"1\" rowSpan=\"1\" width=\"auto\"></td></tr></tbody></table><p><br></p>', 1, '2023-05-21 13:49:19', '2023-05-21 13:49:19', '我的故事');
INSERT INTO `moment` VALUES (27, '<p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; &nbsp;<strong>先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗德，恢弘志士之气，不宜妄自菲薄，引喻失义，以塞忠谏之路也。</strong></p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; &nbsp;<em>宫中府中，俱为一体，陟罚臧否，不宜异同。若有作奸犯科及为忠善者，宜付有司论其刑赏，以昭陛下平明之理，不宜偏私，使内外异法也。</em></p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"background-color: rgb(9, 109, 217);\">侍中、侍郎郭攸之、费祎、董允等，此皆良实，志虑忠纯，是以先帝简拔以遗陛下。愚以为宫中之事，事无大小，悉以咨之，然后施行，必能裨补阙漏，有所广益。</span></p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; <s> 将军向宠，性行淑均，晓畅军事，试用于昔日，先帝称之曰能，是以众议举宠为督。愚以为营中之事，悉以咨之，必能使行阵和睦，优劣得所。</s></p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; <a href=\"111111111111\" target=\"_blank\"> 亲贤臣，远小人，此先汉所以兴隆也；亲小人，远贤臣，此后汉所以倾颓也。先帝在时，每与臣论此事，未尝不叹息痛恨于桓、灵也。侍中、尚书、长史、参军，此悉贞良死节之臣，愿陛下亲之信之，则汉室之隆，可计日而待也。</a></p><p style=\"text-align: start;\">臣本布衣，躬耕于南阳，苟全性命于乱世，不求闻达于诸侯。先帝不以臣卑鄙，猥自枉屈，三顾臣于草庐之中，咨臣以当世之事，由是感激，遂许先帝以驱驰。后值倾覆，受任于败军之际，奉命于危难之间，尔来二十有一年矣。</p><p style=\"text-align: start;\">先帝知臣谨慎，故临崩寄臣以大事也。受命以来，夙夜忧叹，恐托付不效，以伤先帝之明，故五月渡泸，深入不毛。今南方已定，兵甲已足，当奖率三军，北定中原，庶竭驽钝，攘除奸凶，兴复汉室，还于旧都。此臣所以报先帝而忠陛下之职分也。至于斟酌损益，进尽忠言，则攸之、祎、允之任也。</p><p style=\"text-align: start;\">愿陛下托臣以讨贼兴复之效，不效，则治臣之罪，以告先帝之灵。若无兴德之言，则责攸之、祎、允等之慢，以彰其咎；陛下亦宜自谋，以咨诹善道，察纳雅言，深追先帝遗诏，臣不胜受恩感激。</p><p style=\"text-align: start;\">今当远离，临表涕零，不知所言。</p>', 1, '2023-05-22 15:14:40', '2023-05-22 15:14:40', '出师表/前出师表');
INSERT INTO `moment` VALUES (28, '<h2 style=\"text-align: center;\"><strong>七律·人民解放军占领南京</strong></h2><p style=\"text-align: center;\">近现代·毛泽东</p><p style=\"text-align: center;\"><span style=\"color: rgb(56, 158, 13);\"><strong>钟山风雨起苍黄，</strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(56, 158, 13);\"><strong>百万雄师过大江。</strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(56, 158, 13);\"><strong>虎踞龙盘今胜昔，</strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(56, 158, 13);\"><strong>天翻地覆慨而慷。</strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(56, 158, 13);\"><strong>宜将剩勇追穷寇，</strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(56, 158, 13);\"><strong>不可沽名学霸王。</strong></span></p>', 1, '2023-05-29 10:35:00', '2023-05-29 11:02:11', '七律·人民解放军占领南京1');

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label`  (
  `moment_id` int NOT NULL,
  `label_id` int NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`moment_id`, `label_id`) USING BTREE,
  INDEX `label_id`(`label_id`) USING BTREE,
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment_label
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `moment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `moment_id`(`moment_id`) USING BTREE,
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, '26c2a89a1d48face32b970e10354b70d', 'image/jpeg', 49608, 26, 1, '2023-05-25 17:51:01', '2023-05-25 17:51:01');
INSERT INTO `picture` VALUES (2, '83a09c7d2e1eb801b7ca11cd061e28fc', 'image/jpeg', 28111, 26, 1, '2023-05-25 17:51:01', '2023-05-25 17:51:01');
INSERT INTO `picture` VALUES (3, 'f12c17ec364606aa999e96f7ef431244', 'image/jpeg', 46959, 26, 1, '2023-05-25 23:34:51', '2023-05-25 23:34:51');
INSERT INTO `picture` VALUES (4, '80bc4947299730410cc0e1067c3db234', 'image/jpeg', 28111, 26, 1, '2023-05-25 23:38:14', '2023-05-25 23:38:14');
INSERT INTO `picture` VALUES (5, '060f98093338fdfdaecab4d3cc58e0e4', 'image/jpeg', 28111, 26, 1, '2023-05-25 23:38:56', '2023-05-25 23:38:56');
INSERT INTO `picture` VALUES (6, 'bfa4045d34f5a169fc3b323423a14f35', 'image/jpeg', 49608, 26, 1, '2023-05-25 23:40:44', '2023-05-25 23:40:44');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员', '2023-05-08 17:17:39', '2023-05-09 22:18:09');
INSERT INTO `role` VALUES (2, 'JAVA开发', 'JAVA开发', '2023-05-08 17:22:38', '2023-05-09 22:18:30');
INSERT INTO `role` VALUES (3, '前端开发', '前端开发', '2023-05-09 21:51:20', '2023-05-15 21:25:25');
INSERT INTO `role` VALUES (4, '运维', '运维', '2023-05-10 13:53:03', '2023-05-15 21:25:25');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `roleId` int NOT NULL,
  `menuId` int NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`roleId`, `menuId`) USING BTREE,
  INDEX `menuId`(`menuId`) USING BTREE,
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 2, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 3, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 4, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 5, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 6, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 7, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 8, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 9, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 10, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 11, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 12, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 13, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (1, 14, '2023-05-15 21:35:52', '2023-05-15 21:35:52');
INSERT INTO `role_menu` VALUES (2, 1, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 2, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 5, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 6, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 7, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 8, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 9, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (2, 10, '2023-05-09 22:18:30', '2023-05-09 22:18:30');
INSERT INTO `role_menu` VALUES (3, 1, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 2, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 5, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 6, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 7, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 8, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 9, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (3, 10, '2023-05-09 22:17:34', '2023-05-09 22:17:34');
INSERT INTO `role_menu` VALUES (4, 1, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 2, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 5, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 6, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 7, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 8, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 9, '2023-05-10 13:53:03', '2023-05-10 13:53:03');
INSERT INTO `role_menu` VALUES (4, 10, '2023-05-10 13:53:03', '2023-05-10 13:53:03');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `roleId` int NULL DEFAULT NULL,
  `departmentId` int NULL DEFAULT NULL,
  `realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cellphone` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `departmentId`(`departmentId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'coderzhr', 'dc483e80a7a0bd9ef71d8cf973673924', '2023-05-07 13:47:09', '2023-05-18 10:01:36', 1, 1, '张浩然', 15318956414, NULL, 'http://localhost:5000/users/avatar/1');
INSERT INTO `user` VALUES (2, 'kobe', 'dc483e80a7a0bd9ef71d8cf973673924', '2023-05-07 17:25:27', '2023-05-09 21:38:46', 2, 2, 'kobe', 13987654321, NULL, NULL);
INSERT INTO `user` VALUES (3, 'james', 'dc483e80a7a0bd9ef71d8cf973673924', '2023-05-07 17:25:35', '2023-05-11 22:30:18', 2, 2, 'james', 13987654321, NULL, NULL);
INSERT INTO `user` VALUES (4, 'jordan', 'dc483e80a7a0bd9ef71d8cf973673924', '2023-05-07 17:26:21', '2023-05-15 21:26:34', 3, 2, 'jordan', 13987654321, NULL, NULL);
INSERT INTO `user` VALUES (5, 'kd', 'dc483e80a7a0bd9ef71d8cf973673924', '2023-05-09 21:30:13', '2023-05-11 22:31:11', 2, 2, 'kd', 13678906541, NULL, NULL);
INSERT INTO `user` VALUES (8, 'kg', 'dc483e80a7a0bd9ef71d8cf973673924', '2023-05-15 17:53:55', '2023-05-15 17:53:55', 4, 3, 'kg', 16812567896, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
