/*
 Navicat Premium Data Transfer

 Source Server         : 虚拟机mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 192.168.2.5:3306
 Source Schema         : ApolloPortalDB

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 07/04/2022 00:12:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `App` VALUES (2, 'CarCook', '车煮平台', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'1', 'admin', '2019-11-05 23:42:39', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `App` VALUES (3, 'CookCar', 'CookCar', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-12-02 11:35:59', 'apollo', '2019-12-02 11:35:59');
INSERT INTO `App` VALUES (4, 'CookCarDEV', 'CookCarDEV', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-12-04 18:54:44', 'apollo', '2019-12-04 18:54:44');
INSERT INTO `App` VALUES (5, 'epidemic-bg', '武汉微应急二开', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'0', 'admin', '2020-03-04 14:46:04', 'admin', '2020-03-04 14:46:04');
INSERT INTO `App` VALUES (6, 'changShaSuperBrain', '长沙超级大脑', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'0', 'admin', '2020-05-11 13:55:42', 'admin', '2020-05-11 13:55:42');
INSERT INTO `App` VALUES (7, 'changShaSuperBrain1', 'changShaSuperBrain1', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `App` VALUES (8, 'taskCenter', '统一待办开发环境专用', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'0', 'admin', '2020-05-23 00:42:44', 'admin', '2020-05-23 00:42:44');
INSERT INTO `App` VALUES (9, 'appCenter', '长沙应用中台', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'0', 'admin', '2020-07-07 11:44:01', 'admin', '2020-07-07 11:44:01');
INSERT INTO `App` VALUES (10, 'Fund', '基金', 'TEST1', '样例部门1', 'admin', 'tanbinyuan@do1.com.cn', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES (1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `AppNamespace` VALUES (2, 'application', 'CarCook', 'properties', b'0', 'default app namespace', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (3, 'mysql', 'CarCook', 'properties', b'0', '', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (4, 'rabbitmq', 'CarCook', 'properties', b'0', '', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (5, 'elasticsearch', 'CarCook', 'properties', b'0', '', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (6, 'redis', 'CarCook', 'properties', b'0', '', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (7, 'UserCenter', 'CarCook', 'properties', b'0', '', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (8, 'zipkin', 'CarCook', 'properties', b'0', '', b'1', 'admin', '2019-11-07 09:42:38', 'apollo', '2019-12-02 12:00:40');
INSERT INTO `AppNamespace` VALUES (9, 'application', 'CookCar', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-12-02 11:36:00', 'apollo', '2019-12-02 11:36:00');
INSERT INTO `AppNamespace` VALUES (10, 'rabbitmq', 'CookCar', 'properties', b'0', '', b'0', 'apollo', '2019-12-02 11:57:41', 'apollo', '2019-12-02 11:57:41');
INSERT INTO `AppNamespace` VALUES (11, 'elasticsearch', 'CookCar', 'properties', b'0', '', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `AppNamespace` VALUES (12, 'redis', 'CookCar', 'properties', b'0', '', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `AppNamespace` VALUES (13, 'mysql', 'CookCar', 'properties', b'0', '', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `AppNamespace` VALUES (14, 'cookcar-user', 'CookCar', 'properties', b'0', 'cookcar-user', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `AppNamespace` VALUES (15, 'cookcar-order', 'CookCar', 'properties', b'0', '', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `AppNamespace` VALUES (16, 'application', 'CookCarDEV', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-12-04 18:54:44', 'apollo', '2019-12-04 18:54:44');
INSERT INTO `AppNamespace` VALUES (17, 'rabbitmq', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-04 19:01:30', 'apollo', '2019-12-04 19:01:30');
INSERT INTO `AppNamespace` VALUES (18, 'elasticsearch', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `AppNamespace` VALUES (19, 'redis', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `AppNamespace` VALUES (20, 'mysql', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `AppNamespace` VALUES (21, 'cookcar-user', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-04 19:04:52', 'apollo', '2019-12-04 19:04:52');
INSERT INTO `AppNamespace` VALUES (22, 'cookcar-order', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `AppNamespace` VALUES (23, 'cookcar-msg', 'CookCarDEV', 'properties', b'0', '', b'0', 'apollo', '2019-12-24 15:39:14', 'apollo', '2019-12-24 15:39:14');
INSERT INTO `AppNamespace` VALUES (24, 'cookcar-msg', 'CookCar', 'properties', b'0', '', b'0', 'apollo', '2019-12-24 16:18:23', 'apollo', '2019-12-24 16:18:23');
INSERT INTO `AppNamespace` VALUES (25, 'application', 'epidemic-bg', 'properties', b'0', 'default app namespace', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `AppNamespace` VALUES (26, 'TEST1.mybatis', 'epidemic-bg', 'properties', b'1', '', b'1', 'admin', '2020-03-04 15:21:35', 'apollo', '2020-03-04 07:37:31');
INSERT INTO `AppNamespace` VALUES (27, 'mybatis', 'epidemic-bg', 'properties', b'0', '', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `AppNamespace` VALUES (28, 'mysql', 'epidemic-bg', 'properties', b'0', '', b'0', 'admin', '2020-03-04 15:40:42', 'admin', '2020-03-04 15:40:42');
INSERT INTO `AppNamespace` VALUES (29, 'application', 'changShaSuperBrain', 'properties', b'0', 'default app namespace', b'0', 'admin', '2020-05-11 13:55:44', 'admin', '2020-05-11 13:55:44');
INSERT INTO `AppNamespace` VALUES (30, 'global', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:02:39', 'admin', '2020-05-11 14:02:39');
INSERT INTO `AppNamespace` VALUES (31, 'mysql', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:03:29', 'admin', '2020-05-11 14:03:29');
INSERT INTO `AppNamespace` VALUES (32, 'redis', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:04:52', 'admin', '2020-05-11 14:04:52');
INSERT INTO `AppNamespace` VALUES (33, 'rabbitmq', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `AppNamespace` VALUES (34, 'sys-authorize', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `AppNamespace` VALUES (35, 'zipkin_server', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `AppNamespace` VALUES (36, 'zipkin', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `AppNamespace` VALUES (37, 'sys-message', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `AppNamespace` VALUES (38, 'elasticsearch', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `AppNamespace` VALUES (39, 'do1cloud-agency', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:11:19', 'admin', '2020-05-11 14:11:19');
INSERT INTO `AppNamespace` VALUES (40, 'message-consumer', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:12:31', 'admin', '2020-05-11 14:12:31');
INSERT INTO `AppNamespace` VALUES (41, 'message-schedule', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:13:21', 'admin', '2020-05-11 14:13:21');
INSERT INTO `AppNamespace` VALUES (42, 'agency-consumer', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `AppNamespace` VALUES (43, 'do1cloud-usercenter', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `AppNamespace` VALUES (44, 'biz-payment-center', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `AppNamespace` VALUES (45, 'impmanager', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `AppNamespace` VALUES (46, 'message-common', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `AppNamespace` VALUES (47, 'agency-schedule', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-11 14:18:36', 'admin', '2020-05-11 14:18:36');
INSERT INTO `AppNamespace` VALUES (48, 'application', 'changShaSuperBrain1', 'properties', b'0', 'default app namespace', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `AppNamespace` VALUES (49, 'TEST1.global', 'changShaSuperBrain1', 'properties', b'1', '', b'0', 'admin', '2020-05-20 11:40:35', 'admin', '2020-05-20 11:40:35');
INSERT INTO `AppNamespace` VALUES (50, 'global', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `AppNamespace` VALUES (51, 'mysql', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `AppNamespace` VALUES (52, 'redis', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:43:13', 'admin', '2020-05-20 11:43:13');
INSERT INTO `AppNamespace` VALUES (53, 'rabbitmq', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `AppNamespace` VALUES (54, 'elasticsearch', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `AppNamespace` VALUES (55, 'do1cloud-usercenter', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:46:22', 'admin', '2020-05-20 11:46:22');
INSERT INTO `AppNamespace` VALUES (56, 'zipkin', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `AppNamespace` VALUES (57, 'zipkin_server', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-20 11:54:44', 'admin', '2020-05-20 11:54:44');
INSERT INTO `AppNamespace` VALUES (58, 'application', 'taskCenter', 'properties', b'0', 'default app namespace', b'0', 'admin', '2020-05-23 00:42:45', 'admin', '2020-05-23 00:42:45');
INSERT INTO `AppNamespace` VALUES (59, 'mysql', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 00:49:55', 'admin', '2020-05-23 00:49:55');
INSERT INTO `AppNamespace` VALUES (60, 'redis', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 00:55:03', 'admin', '2020-05-23 00:55:03');
INSERT INTO `AppNamespace` VALUES (61, 'rabbitmq', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `AppNamespace` VALUES (62, 'elasticsearch', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 00:57:40', 'admin', '2020-05-23 00:57:40');
INSERT INTO `AppNamespace` VALUES (63, 'do1cloud-agency', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `AppNamespace` VALUES (64, 'agency-consumer', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 01:01:02', 'admin', '2020-05-23 01:01:02');
INSERT INTO `AppNamespace` VALUES (65, 'agency-schedule', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `AppNamespace` VALUES (66, 'global', 'taskCenter', 'properties', b'0', '', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `AppNamespace` VALUES (67, 'sys-authorize', 'changShaSuperBrain1', 'properties', b'0', '', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `AppNamespace` VALUES (68, 'tanby', 'changShaSuperBrain', 'properties', b'0', '', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `AppNamespace` VALUES (69, 'application', 'appCenter', 'properties', b'0', 'default app namespace', b'0', 'admin', '2020-07-07 11:44:01', 'admin', '2020-07-07 11:44:01');
INSERT INTO `AppNamespace` VALUES (70, 'mysql', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `AppNamespace` VALUES (71, 'mybatis', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `AppNamespace` VALUES (72, 'redis', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `AppNamespace` VALUES (73, 'rabbitmq', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-07 14:46:15', 'admin', '2020-07-07 14:46:15');
INSERT INTO `AppNamespace` VALUES (74, 'fastdfs', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-16 14:21:18', 'admin', '2020-07-16 14:21:18');
INSERT INTO `AppNamespace` VALUES (75, 'manager-center', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `AppNamespace` VALUES (76, 'user-center', 'appCenter', 'properties', b'0', '', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `AppNamespace` VALUES (77, 'application', 'Fund', 'properties', b'0', 'default app namespace', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `AppNamespace` VALUES (78, 'mysql', 'Fund', 'properties', b'0', '', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `AppNamespace` VALUES (79, 'mybatis', 'Fund', 'properties', b'0', '', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');

-- ----------------------------
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
INSERT INTO `Authorities` VALUES (1, 'apollo', 'ROLE_user');
INSERT INTO `Authorities` VALUES (2, 'admin', 'ROLE_user');

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '开放API消费者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'consumer审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'consumer token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(0) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 355 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'permission表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO `Permission` VALUES (1, 'CreateCluster', 'SampleApp', b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Permission` VALUES (2, 'CreateNamespace', 'SampleApp', b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Permission` VALUES (3, 'AssignRole', 'SampleApp', b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Permission` VALUES (4, 'ModifyNamespace', 'SampleApp+application', b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Permission` VALUES (5, 'ReleaseNamespace', 'SampleApp+application', b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Permission` VALUES (6, 'CreateApplication', 'SystemRole', b'0', 'apollo', '2019-11-05 23:09:22', 'apollo', '2019-11-05 23:09:22');
INSERT INTO `Permission` VALUES (7, 'AssignRole', 'CarCook', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (8, 'CreateNamespace', 'CarCook', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (9, 'CreateCluster', 'CarCook', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (10, 'ManageAppMaster', 'CarCook', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (11, 'ModifyNamespace', 'CarCook+application', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (12, 'ReleaseNamespace', 'CarCook+application', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (13, 'ModifyNamespace', 'CarCook+application+DEV', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (14, 'ReleaseNamespace', 'CarCook+application+DEV', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (15, 'ModifyNamespace', 'CarCook+mysql', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (16, 'ReleaseNamespace', 'CarCook+mysql', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (17, 'ModifyNamespace', 'CarCook+mysql+DEV', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (18, 'ReleaseNamespace', 'CarCook+mysql+DEV', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (19, 'ModifyNamespace', 'CarCook+rabbitmq', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (20, 'ReleaseNamespace', 'CarCook+rabbitmq', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (21, 'ModifyNamespace', 'CarCook+rabbitmq+DEV', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (22, 'ReleaseNamespace', 'CarCook+rabbitmq+DEV', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (23, 'ModifyNamespace', 'CarCook+elasticsearch', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (24, 'ReleaseNamespace', 'CarCook+elasticsearch', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (25, 'ModifyNamespace', 'CarCook+elasticsearch+DEV', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (26, 'ReleaseNamespace', 'CarCook+elasticsearch+DEV', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (27, 'ModifyNamespace', 'CarCook+redis', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (28, 'ReleaseNamespace', 'CarCook+redis', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (29, 'ModifyNamespace', 'CarCook+redis+DEV', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (30, 'ReleaseNamespace', 'CarCook+redis+DEV', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (31, 'ModifyNamespace', 'CarCook+UserCenter', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (32, 'ReleaseNamespace', 'CarCook+UserCenter', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (33, 'ModifyNamespace', 'CarCook+UserCenter+DEV', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (34, 'ReleaseNamespace', 'CarCook+UserCenter+DEV', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (35, 'ModifyNamespace', 'CarCook+zipkin', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (36, 'ReleaseNamespace', 'CarCook+zipkin', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (37, 'ModifyNamespace', 'CarCook+zipkin+DEV', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (38, 'ReleaseNamespace', 'CarCook+zipkin+DEV', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Permission` VALUES (39, 'CreateCluster', 'CookCar', b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `Permission` VALUES (40, 'AssignRole', 'CookCar', b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `Permission` VALUES (41, 'CreateNamespace', 'CookCar', b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `Permission` VALUES (42, 'ManageAppMaster', 'CookCar', b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `Permission` VALUES (43, 'ModifyNamespace', 'CookCar+application', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Permission` VALUES (44, 'ReleaseNamespace', 'CookCar+application', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Permission` VALUES (45, 'ModifyNamespace', 'CookCar+application+DEV', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Permission` VALUES (46, 'ReleaseNamespace', 'CookCar+application+DEV', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Permission` VALUES (47, 'ModifyNamespace', 'CookCar+rabbitmq', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Permission` VALUES (48, 'ReleaseNamespace', 'CookCar+rabbitmq', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Permission` VALUES (49, 'ModifyNamespace', 'CookCar+rabbitmq+DEV', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Permission` VALUES (50, 'ReleaseNamespace', 'CookCar+rabbitmq+DEV', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Permission` VALUES (51, 'ModifyNamespace', 'CookCar+elasticsearch', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Permission` VALUES (52, 'ReleaseNamespace', 'CookCar+elasticsearch', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Permission` VALUES (53, 'ModifyNamespace', 'CookCar+elasticsearch+DEV', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Permission` VALUES (54, 'ReleaseNamespace', 'CookCar+elasticsearch+DEV', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Permission` VALUES (55, 'ModifyNamespace', 'CookCar+redis', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Permission` VALUES (56, 'ReleaseNamespace', 'CookCar+redis', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Permission` VALUES (57, 'ModifyNamespace', 'CookCar+redis+DEV', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Permission` VALUES (58, 'ReleaseNamespace', 'CookCar+redis+DEV', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Permission` VALUES (59, 'ModifyNamespace', 'CookCar+mysql', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Permission` VALUES (60, 'ReleaseNamespace', 'CookCar+mysql', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Permission` VALUES (61, 'ModifyNamespace', 'CookCar+mysql+DEV', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Permission` VALUES (62, 'ReleaseNamespace', 'CookCar+mysql+DEV', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Permission` VALUES (63, 'ModifyNamespace', 'CookCar+cookcar-user', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Permission` VALUES (64, 'ReleaseNamespace', 'CookCar+cookcar-user', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Permission` VALUES (65, 'ModifyNamespace', 'CookCar+cookcar-user+DEV', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Permission` VALUES (66, 'ReleaseNamespace', 'CookCar+cookcar-user+DEV', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Permission` VALUES (67, 'ModifyNamespace', 'CookCar+cookcar-order', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Permission` VALUES (68, 'ReleaseNamespace', 'CookCar+cookcar-order', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Permission` VALUES (69, 'ModifyNamespace', 'CookCar+cookcar-order+DEV', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Permission` VALUES (70, 'ReleaseNamespace', 'CookCar+cookcar-order+DEV', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Permission` VALUES (71, 'CreateNamespace', 'CookCarDEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (72, 'AssignRole', 'CookCarDEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (73, 'CreateCluster', 'CookCarDEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (74, 'ManageAppMaster', 'CookCarDEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (75, 'ModifyNamespace', 'CookCarDEV+application', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (76, 'ReleaseNamespace', 'CookCarDEV+application', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (77, 'ModifyNamespace', 'CookCarDEV+application+DEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (78, 'ReleaseNamespace', 'CookCarDEV+application+DEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Permission` VALUES (79, 'ModifyNamespace', 'CookCarDEV+rabbitmq', b'0', 'apollo', '2019-12-04 19:01:32', 'apollo', '2019-12-04 19:01:32');
INSERT INTO `Permission` VALUES (80, 'ReleaseNamespace', 'CookCarDEV+rabbitmq', b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `Permission` VALUES (81, 'ModifyNamespace', 'CookCarDEV+rabbitmq+DEV', b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `Permission` VALUES (82, 'ReleaseNamespace', 'CookCarDEV+rabbitmq+DEV', b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `Permission` VALUES (83, 'ModifyNamespace', 'CookCarDEV+elasticsearch', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Permission` VALUES (84, 'ReleaseNamespace', 'CookCarDEV+elasticsearch', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Permission` VALUES (85, 'ModifyNamespace', 'CookCarDEV+elasticsearch+DEV', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Permission` VALUES (86, 'ReleaseNamespace', 'CookCarDEV+elasticsearch+DEV', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Permission` VALUES (87, 'ModifyNamespace', 'CookCarDEV+redis', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Permission` VALUES (88, 'ReleaseNamespace', 'CookCarDEV+redis', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Permission` VALUES (89, 'ModifyNamespace', 'CookCarDEV+redis+DEV', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Permission` VALUES (90, 'ReleaseNamespace', 'CookCarDEV+redis+DEV', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Permission` VALUES (91, 'ModifyNamespace', 'CookCarDEV+mysql', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Permission` VALUES (92, 'ReleaseNamespace', 'CookCarDEV+mysql', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Permission` VALUES (93, 'ModifyNamespace', 'CookCarDEV+mysql+DEV', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Permission` VALUES (94, 'ReleaseNamespace', 'CookCarDEV+mysql+DEV', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Permission` VALUES (95, 'ModifyNamespace', 'CookCarDEV+cookcar-user', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Permission` VALUES (96, 'ReleaseNamespace', 'CookCarDEV+cookcar-user', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Permission` VALUES (97, 'ModifyNamespace', 'CookCarDEV+cookcar-user+DEV', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Permission` VALUES (98, 'ReleaseNamespace', 'CookCarDEV+cookcar-user+DEV', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Permission` VALUES (99, 'ModifyNamespace', 'CookCarDEV+cookcar-order', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Permission` VALUES (100, 'ReleaseNamespace', 'CookCarDEV+cookcar-order', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Permission` VALUES (101, 'ModifyNamespace', 'CookCarDEV+cookcar-order+DEV', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Permission` VALUES (102, 'ReleaseNamespace', 'CookCarDEV+cookcar-order+DEV', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Permission` VALUES (103, 'ModifyNamespace', 'CookCarDEV+cookcar-msg', b'0', 'apollo', '2019-12-24 15:39:14', 'apollo', '2019-12-24 15:39:14');
INSERT INTO `Permission` VALUES (104, 'ReleaseNamespace', 'CookCarDEV+cookcar-msg', b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `Permission` VALUES (105, 'ModifyNamespace', 'CookCarDEV+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `Permission` VALUES (106, 'ReleaseNamespace', 'CookCarDEV+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `Permission` VALUES (107, 'ModifyNamespace', 'CookCar+cookcar-msg', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Permission` VALUES (108, 'ReleaseNamespace', 'CookCar+cookcar-msg', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Permission` VALUES (109, 'ModifyNamespace', 'CookCar+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Permission` VALUES (110, 'ReleaseNamespace', 'CookCar+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Permission` VALUES (111, 'CreateNamespace', 'epidemic-bg', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (112, 'AssignRole', 'epidemic-bg', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (113, 'CreateCluster', 'epidemic-bg', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (114, 'ManageAppMaster', 'epidemic-bg', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (115, 'ModifyNamespace', 'epidemic-bg+application', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (116, 'ReleaseNamespace', 'epidemic-bg+application', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (117, 'ModifyNamespace', 'epidemic-bg+application+DEV', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (118, 'ReleaseNamespace', 'epidemic-bg+application+DEV', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Permission` VALUES (119, 'ModifyNamespace', 'epidemic-bg+TEST1.mybatis', b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:31');
INSERT INTO `Permission` VALUES (120, 'ReleaseNamespace', 'epidemic-bg+TEST1.mybatis', b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:31');
INSERT INTO `Permission` VALUES (121, 'ModifyNamespace', 'epidemic-bg+TEST1.mybatis+DEV', b'0', 'admin', '2020-03-04 15:21:36', 'admin', '2020-03-04 15:21:36');
INSERT INTO `Permission` VALUES (122, 'ReleaseNamespace', 'epidemic-bg+TEST1.mybatis+DEV', b'0', 'admin', '2020-03-04 15:21:36', 'admin', '2020-03-04 15:21:36');
INSERT INTO `Permission` VALUES (123, 'ModifyNamespace', 'epidemic-bg+mybatis', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Permission` VALUES (124, 'ReleaseNamespace', 'epidemic-bg+mybatis', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Permission` VALUES (125, 'ModifyNamespace', 'epidemic-bg+mybatis+DEV', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Permission` VALUES (126, 'ReleaseNamespace', 'epidemic-bg+mybatis+DEV', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Permission` VALUES (127, 'ModifyNamespace', 'epidemic-bg+mysql', b'0', 'admin', '2020-03-04 15:40:42', 'admin', '2020-03-04 15:40:42');
INSERT INTO `Permission` VALUES (128, 'ReleaseNamespace', 'epidemic-bg+mysql', b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `Permission` VALUES (129, 'ModifyNamespace', 'epidemic-bg+mysql+DEV', b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `Permission` VALUES (130, 'ReleaseNamespace', 'epidemic-bg+mysql+DEV', b'0', 'admin', '2020-03-04 15:40:44', 'admin', '2020-03-04 15:40:44');
INSERT INTO `Permission` VALUES (131, 'CreateCluster', 'changShaSuperBrain', b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `Permission` VALUES (132, 'AssignRole', 'changShaSuperBrain', b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `Permission` VALUES (133, 'CreateNamespace', 'changShaSuperBrain', b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `Permission` VALUES (134, 'ManageAppMaster', 'changShaSuperBrain', b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `Permission` VALUES (135, 'ModifyNamespace', 'changShaSuperBrain+application', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Permission` VALUES (136, 'ReleaseNamespace', 'changShaSuperBrain+application', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Permission` VALUES (137, 'ModifyNamespace', 'changShaSuperBrain+application+DEV', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Permission` VALUES (138, 'ReleaseNamespace', 'changShaSuperBrain+application+DEV', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Permission` VALUES (139, 'ModifyNamespace', 'changShaSuperBrain+global', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Permission` VALUES (140, 'ReleaseNamespace', 'changShaSuperBrain+global', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Permission` VALUES (141, 'ModifyNamespace', 'changShaSuperBrain+global+DEV', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Permission` VALUES (142, 'ReleaseNamespace', 'changShaSuperBrain+global+DEV', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Permission` VALUES (143, 'ModifyNamespace', 'changShaSuperBrain+mysql', b'0', 'admin', '2020-05-11 14:03:29', 'admin', '2020-05-11 14:03:29');
INSERT INTO `Permission` VALUES (144, 'ReleaseNamespace', 'changShaSuperBrain+mysql', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Permission` VALUES (145, 'ModifyNamespace', 'changShaSuperBrain+mysql+DEV', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Permission` VALUES (146, 'ReleaseNamespace', 'changShaSuperBrain+mysql+DEV', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Permission` VALUES (147, 'ModifyNamespace', 'changShaSuperBrain+redis', b'0', 'admin', '2020-05-11 14:04:52', 'admin', '2020-05-11 14:04:52');
INSERT INTO `Permission` VALUES (148, 'ReleaseNamespace', 'changShaSuperBrain+redis', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Permission` VALUES (149, 'ModifyNamespace', 'changShaSuperBrain+redis+DEV', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Permission` VALUES (150, 'ReleaseNamespace', 'changShaSuperBrain+redis+DEV', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Permission` VALUES (151, 'ModifyNamespace', 'changShaSuperBrain+rabbitmq', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Permission` VALUES (152, 'ReleaseNamespace', 'changShaSuperBrain+rabbitmq', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Permission` VALUES (153, 'ModifyNamespace', 'changShaSuperBrain+rabbitmq+DEV', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Permission` VALUES (154, 'ReleaseNamespace', 'changShaSuperBrain+rabbitmq+DEV', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Permission` VALUES (155, 'ModifyNamespace', 'changShaSuperBrain+sys-authorize', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Permission` VALUES (156, 'ReleaseNamespace', 'changShaSuperBrain+sys-authorize', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Permission` VALUES (157, 'ModifyNamespace', 'changShaSuperBrain+sys-authorize+DEV', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Permission` VALUES (158, 'ReleaseNamespace', 'changShaSuperBrain+sys-authorize+DEV', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Permission` VALUES (159, 'ModifyNamespace', 'changShaSuperBrain+zipkin_server', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Permission` VALUES (160, 'ReleaseNamespace', 'changShaSuperBrain+zipkin_server', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Permission` VALUES (161, 'ModifyNamespace', 'changShaSuperBrain+zipkin_server+DEV', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Permission` VALUES (162, 'ReleaseNamespace', 'changShaSuperBrain+zipkin_server+DEV', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Permission` VALUES (163, 'ModifyNamespace', 'changShaSuperBrain+zipkin', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Permission` VALUES (164, 'ReleaseNamespace', 'changShaSuperBrain+zipkin', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Permission` VALUES (165, 'ModifyNamespace', 'changShaSuperBrain+zipkin+DEV', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Permission` VALUES (166, 'ReleaseNamespace', 'changShaSuperBrain+zipkin+DEV', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Permission` VALUES (167, 'ModifyNamespace', 'changShaSuperBrain+sys-message', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Permission` VALUES (168, 'ReleaseNamespace', 'changShaSuperBrain+sys-message', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Permission` VALUES (169, 'ModifyNamespace', 'changShaSuperBrain+sys-message+DEV', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Permission` VALUES (170, 'ReleaseNamespace', 'changShaSuperBrain+sys-message+DEV', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Permission` VALUES (171, 'ModifyNamespace', 'changShaSuperBrain+elasticsearch', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Permission` VALUES (172, 'ReleaseNamespace', 'changShaSuperBrain+elasticsearch', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Permission` VALUES (173, 'ModifyNamespace', 'changShaSuperBrain+elasticsearch+DEV', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Permission` VALUES (174, 'ReleaseNamespace', 'changShaSuperBrain+elasticsearch+DEV', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Permission` VALUES (175, 'ModifyNamespace', 'changShaSuperBrain+do1cloud-agency', b'0', 'admin', '2020-05-11 14:11:19', 'admin', '2020-05-11 14:11:19');
INSERT INTO `Permission` VALUES (176, 'ReleaseNamespace', 'changShaSuperBrain+do1cloud-agency', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Permission` VALUES (177, 'ModifyNamespace', 'changShaSuperBrain+do1cloud-agency+DEV', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Permission` VALUES (178, 'ReleaseNamespace', 'changShaSuperBrain+do1cloud-agency+DEV', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Permission` VALUES (179, 'ModifyNamespace', 'changShaSuperBrain+message-consumer', b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `Permission` VALUES (180, 'ReleaseNamespace', 'changShaSuperBrain+message-consumer', b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `Permission` VALUES (181, 'ModifyNamespace', 'changShaSuperBrain+message-consumer+DEV', b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `Permission` VALUES (182, 'ReleaseNamespace', 'changShaSuperBrain+message-consumer+DEV', b'0', 'admin', '2020-05-11 14:12:35', 'admin', '2020-05-11 14:12:35');
INSERT INTO `Permission` VALUES (183, 'ModifyNamespace', 'changShaSuperBrain+message-schedule', b'0', 'admin', '2020-05-11 14:13:21', 'admin', '2020-05-11 14:13:21');
INSERT INTO `Permission` VALUES (184, 'ReleaseNamespace', 'changShaSuperBrain+message-schedule', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Permission` VALUES (185, 'ModifyNamespace', 'changShaSuperBrain+message-schedule+DEV', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Permission` VALUES (186, 'ReleaseNamespace', 'changShaSuperBrain+message-schedule+DEV', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Permission` VALUES (187, 'ModifyNamespace', 'changShaSuperBrain+agency-consumer', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Permission` VALUES (188, 'ReleaseNamespace', 'changShaSuperBrain+agency-consumer', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Permission` VALUES (189, 'ModifyNamespace', 'changShaSuperBrain+agency-consumer+DEV', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Permission` VALUES (190, 'ReleaseNamespace', 'changShaSuperBrain+agency-consumer+DEV', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Permission` VALUES (191, 'ModifyNamespace', 'changShaSuperBrain+do1cloud-usercenter', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Permission` VALUES (192, 'ReleaseNamespace', 'changShaSuperBrain+do1cloud-usercenter', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Permission` VALUES (193, 'ModifyNamespace', 'changShaSuperBrain+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Permission` VALUES (194, 'ReleaseNamespace', 'changShaSuperBrain+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Permission` VALUES (195, 'ModifyNamespace', 'changShaSuperBrain+biz-payment-center', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Permission` VALUES (196, 'ReleaseNamespace', 'changShaSuperBrain+biz-payment-center', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Permission` VALUES (197, 'ModifyNamespace', 'changShaSuperBrain+biz-payment-center+DEV', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Permission` VALUES (198, 'ReleaseNamespace', 'changShaSuperBrain+biz-payment-center+DEV', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Permission` VALUES (199, 'ModifyNamespace', 'changShaSuperBrain+impmanager', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Permission` VALUES (200, 'ReleaseNamespace', 'changShaSuperBrain+impmanager', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Permission` VALUES (201, 'ModifyNamespace', 'changShaSuperBrain+impmanager+DEV', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Permission` VALUES (202, 'ReleaseNamespace', 'changShaSuperBrain+impmanager+DEV', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Permission` VALUES (203, 'ModifyNamespace', 'changShaSuperBrain+message-common', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `Permission` VALUES (204, 'ReleaseNamespace', 'changShaSuperBrain+message-common', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `Permission` VALUES (205, 'ModifyNamespace', 'changShaSuperBrain+message-common+DEV', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `Permission` VALUES (206, 'ReleaseNamespace', 'changShaSuperBrain+message-common+DEV', b'0', 'admin', '2020-05-11 14:17:43', 'admin', '2020-05-11 14:17:43');
INSERT INTO `Permission` VALUES (207, 'ModifyNamespace', 'changShaSuperBrain+agency-schedule', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Permission` VALUES (208, 'ReleaseNamespace', 'changShaSuperBrain+agency-schedule', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Permission` VALUES (209, 'ModifyNamespace', 'changShaSuperBrain+agency-schedule+DEV', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Permission` VALUES (210, 'ReleaseNamespace', 'changShaSuperBrain+agency-schedule+DEV', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Permission` VALUES (211, 'CreateNamespace', 'changShaSuperBrain1', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Permission` VALUES (212, 'CreateCluster', 'changShaSuperBrain1', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Permission` VALUES (213, 'AssignRole', 'changShaSuperBrain1', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Permission` VALUES (214, 'ManageAppMaster', 'changShaSuperBrain1', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Permission` VALUES (215, 'ModifyNamespace', 'changShaSuperBrain1+application', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Permission` VALUES (216, 'ReleaseNamespace', 'changShaSuperBrain1+application', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Permission` VALUES (217, 'ModifyNamespace', 'changShaSuperBrain1+application+DEV', b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `Permission` VALUES (218, 'ReleaseNamespace', 'changShaSuperBrain1+application+DEV', b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `Permission` VALUES (219, 'ModifyNamespace', 'changShaSuperBrain1+TEST1.global', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Permission` VALUES (220, 'ReleaseNamespace', 'changShaSuperBrain1+TEST1.global', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Permission` VALUES (221, 'ModifyNamespace', 'changShaSuperBrain1+TEST1.global+DEV', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Permission` VALUES (222, 'ReleaseNamespace', 'changShaSuperBrain1+TEST1.global+DEV', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Permission` VALUES (223, 'ModifyNamespace', 'changShaSuperBrain1+global', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Permission` VALUES (224, 'ReleaseNamespace', 'changShaSuperBrain1+global', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Permission` VALUES (225, 'ModifyNamespace', 'changShaSuperBrain1+global+DEV', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Permission` VALUES (226, 'ReleaseNamespace', 'changShaSuperBrain1+global+DEV', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Permission` VALUES (227, 'ModifyNamespace', 'changShaSuperBrain1+mysql', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Permission` VALUES (228, 'ReleaseNamespace', 'changShaSuperBrain1+mysql', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Permission` VALUES (229, 'ModifyNamespace', 'changShaSuperBrain1+mysql+DEV', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Permission` VALUES (230, 'ReleaseNamespace', 'changShaSuperBrain1+mysql+DEV', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Permission` VALUES (231, 'ModifyNamespace', 'changShaSuperBrain1+redis', b'0', 'admin', '2020-05-20 11:43:14', 'admin', '2020-05-20 11:43:14');
INSERT INTO `Permission` VALUES (232, 'ReleaseNamespace', 'changShaSuperBrain1+redis', b'0', 'admin', '2020-05-20 11:43:15', 'admin', '2020-05-20 11:43:15');
INSERT INTO `Permission` VALUES (233, 'ModifyNamespace', 'changShaSuperBrain1+redis+DEV', b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `Permission` VALUES (234, 'ReleaseNamespace', 'changShaSuperBrain1+redis+DEV', b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `Permission` VALUES (235, 'ModifyNamespace', 'changShaSuperBrain1+rabbitmq', b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `Permission` VALUES (236, 'ReleaseNamespace', 'changShaSuperBrain1+rabbitmq', b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `Permission` VALUES (237, 'ModifyNamespace', 'changShaSuperBrain1+rabbitmq+DEV', b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `Permission` VALUES (238, 'ReleaseNamespace', 'changShaSuperBrain1+rabbitmq+DEV', b'0', 'admin', '2020-05-20 11:44:32', 'admin', '2020-05-20 11:44:32');
INSERT INTO `Permission` VALUES (239, 'ModifyNamespace', 'changShaSuperBrain1+elasticsearch', b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `Permission` VALUES (240, 'ReleaseNamespace', 'changShaSuperBrain1+elasticsearch', b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `Permission` VALUES (241, 'ModifyNamespace', 'changShaSuperBrain1+elasticsearch+DEV', b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `Permission` VALUES (242, 'ReleaseNamespace', 'changShaSuperBrain1+elasticsearch+DEV', b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `Permission` VALUES (243, 'ModifyNamespace', 'changShaSuperBrain1+do1cloud-usercenter', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Permission` VALUES (244, 'ReleaseNamespace', 'changShaSuperBrain1+do1cloud-usercenter', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Permission` VALUES (245, 'ModifyNamespace', 'changShaSuperBrain1+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Permission` VALUES (246, 'ReleaseNamespace', 'changShaSuperBrain1+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Permission` VALUES (247, 'ModifyNamespace', 'changShaSuperBrain1+zipkin', b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `Permission` VALUES (248, 'ReleaseNamespace', 'changShaSuperBrain1+zipkin', b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `Permission` VALUES (249, 'ModifyNamespace', 'changShaSuperBrain1+zipkin+DEV', b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `Permission` VALUES (250, 'ReleaseNamespace', 'changShaSuperBrain1+zipkin+DEV', b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `Permission` VALUES (251, 'ModifyNamespace', 'changShaSuperBrain1+zipkin_server', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Permission` VALUES (252, 'ReleaseNamespace', 'changShaSuperBrain1+zipkin_server', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Permission` VALUES (253, 'ModifyNamespace', 'changShaSuperBrain1+zipkin_server+DEV', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Permission` VALUES (254, 'ReleaseNamespace', 'changShaSuperBrain1+zipkin_server+DEV', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Permission` VALUES (255, 'CreateNamespace', 'taskCenter', b'0', 'admin', '2020-05-23 00:42:46', 'admin', '2020-05-23 00:42:46');
INSERT INTO `Permission` VALUES (256, 'CreateCluster', 'taskCenter', b'0', 'admin', '2020-05-23 00:42:47', 'admin', '2020-05-23 00:42:47');
INSERT INTO `Permission` VALUES (257, 'AssignRole', 'taskCenter', b'0', 'admin', '2020-05-23 00:42:47', 'admin', '2020-05-23 00:42:47');
INSERT INTO `Permission` VALUES (258, 'ManageAppMaster', 'taskCenter', b'0', 'admin', '2020-05-23 00:42:50', 'admin', '2020-05-23 00:42:50');
INSERT INTO `Permission` VALUES (259, 'ModifyNamespace', 'taskCenter+application', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Permission` VALUES (260, 'ReleaseNamespace', 'taskCenter+application', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Permission` VALUES (261, 'ModifyNamespace', 'taskCenter+application+DEV', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Permission` VALUES (262, 'ReleaseNamespace', 'taskCenter+application+DEV', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Permission` VALUES (263, 'ModifyNamespace', 'taskCenter+mysql', b'0', 'admin', '2020-05-23 00:50:10', 'admin', '2020-05-23 00:50:10');
INSERT INTO `Permission` VALUES (264, 'ReleaseNamespace', 'taskCenter+mysql', b'0', 'admin', '2020-05-23 00:50:36', 'admin', '2020-05-23 00:50:36');
INSERT INTO `Permission` VALUES (265, 'ModifyNamespace', 'taskCenter+mysql+DEV', b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `Permission` VALUES (266, 'ReleaseNamespace', 'taskCenter+mysql+DEV', b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `Permission` VALUES (267, 'ModifyNamespace', 'taskCenter+redis', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Permission` VALUES (268, 'ReleaseNamespace', 'taskCenter+redis', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Permission` VALUES (269, 'ModifyNamespace', 'taskCenter+redis+DEV', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Permission` VALUES (270, 'ReleaseNamespace', 'taskCenter+redis+DEV', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Permission` VALUES (271, 'ModifyNamespace', 'taskCenter+rabbitmq', b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `Permission` VALUES (272, 'ReleaseNamespace', 'taskCenter+rabbitmq', b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `Permission` VALUES (273, 'ModifyNamespace', 'taskCenter+rabbitmq+DEV', b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `Permission` VALUES (274, 'ReleaseNamespace', 'taskCenter+rabbitmq+DEV', b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `Permission` VALUES (275, 'ModifyNamespace', 'taskCenter+elasticsearch', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Permission` VALUES (276, 'ReleaseNamespace', 'taskCenter+elasticsearch', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Permission` VALUES (277, 'ModifyNamespace', 'taskCenter+elasticsearch+DEV', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Permission` VALUES (278, 'ReleaseNamespace', 'taskCenter+elasticsearch+DEV', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Permission` VALUES (279, 'ModifyNamespace', 'taskCenter+do1cloud-agency', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Permission` VALUES (280, 'ReleaseNamespace', 'taskCenter+do1cloud-agency', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Permission` VALUES (281, 'ModifyNamespace', 'taskCenter+do1cloud-agency+DEV', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Permission` VALUES (282, 'ReleaseNamespace', 'taskCenter+do1cloud-agency+DEV', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Permission` VALUES (283, 'ModifyNamespace', 'taskCenter+agency-consumer', b'0', 'admin', '2020-05-23 01:01:03', 'admin', '2020-05-23 01:01:03');
INSERT INTO `Permission` VALUES (284, 'ReleaseNamespace', 'taskCenter+agency-consumer', b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `Permission` VALUES (285, 'ModifyNamespace', 'taskCenter+agency-consumer+DEV', b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `Permission` VALUES (286, 'ReleaseNamespace', 'taskCenter+agency-consumer+DEV', b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `Permission` VALUES (287, 'ModifyNamespace', 'taskCenter+agency-schedule', b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `Permission` VALUES (288, 'ReleaseNamespace', 'taskCenter+agency-schedule', b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `Permission` VALUES (289, 'ModifyNamespace', 'taskCenter+agency-schedule+DEV', b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `Permission` VALUES (290, 'ReleaseNamespace', 'taskCenter+agency-schedule+DEV', b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `Permission` VALUES (291, 'ModifyNamespace', 'taskCenter+global', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Permission` VALUES (292, 'ReleaseNamespace', 'taskCenter+global', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Permission` VALUES (293, 'ModifyNamespace', 'taskCenter+global+DEV', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Permission` VALUES (294, 'ReleaseNamespace', 'taskCenter+global+DEV', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Permission` VALUES (295, 'ModifyNamespace', 'changShaSuperBrain1+sys-authorize', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Permission` VALUES (296, 'ReleaseNamespace', 'changShaSuperBrain1+sys-authorize', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Permission` VALUES (297, 'ModifyNamespace', 'changShaSuperBrain1+sys-authorize+DEV', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Permission` VALUES (298, 'ReleaseNamespace', 'changShaSuperBrain1+sys-authorize+DEV', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Permission` VALUES (299, 'ModifyNamespace', 'changShaSuperBrain+tanby', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Permission` VALUES (300, 'ReleaseNamespace', 'changShaSuperBrain+tanby', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Permission` VALUES (301, 'ModifyNamespace', 'changShaSuperBrain+tanby+DEV', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Permission` VALUES (302, 'ReleaseNamespace', 'changShaSuperBrain+tanby+DEV', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Permission` VALUES (303, 'CreateNamespace', 'appCenter', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (304, 'AssignRole', 'appCenter', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (305, 'CreateCluster', 'appCenter', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (306, 'ManageAppMaster', 'appCenter', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (307, 'ModifyNamespace', 'appCenter+application', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (308, 'ReleaseNamespace', 'appCenter+application', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (309, 'ModifyNamespace', 'appCenter+application+DEV', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (310, 'ReleaseNamespace', 'appCenter+application+DEV', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Permission` VALUES (311, 'ModifyNamespace', 'appCenter+mysql', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Permission` VALUES (312, 'ReleaseNamespace', 'appCenter+mysql', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Permission` VALUES (313, 'ModifyNamespace', 'appCenter+mysql+DEV', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Permission` VALUES (314, 'ReleaseNamespace', 'appCenter+mysql+DEV', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Permission` VALUES (315, 'ModifyNamespace', 'appCenter+mybatis', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Permission` VALUES (316, 'ReleaseNamespace', 'appCenter+mybatis', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Permission` VALUES (317, 'ModifyNamespace', 'appCenter+mybatis+DEV', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Permission` VALUES (318, 'ReleaseNamespace', 'appCenter+mybatis+DEV', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Permission` VALUES (319, 'ModifyNamespace', 'appCenter+redis', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Permission` VALUES (320, 'ReleaseNamespace', 'appCenter+redis', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Permission` VALUES (321, 'ModifyNamespace', 'appCenter+redis+DEV', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Permission` VALUES (322, 'ReleaseNamespace', 'appCenter+redis+DEV', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Permission` VALUES (323, 'ModifyNamespace', 'appCenter+rabbitmq', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Permission` VALUES (324, 'ReleaseNamespace', 'appCenter+rabbitmq', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Permission` VALUES (325, 'ModifyNamespace', 'appCenter+rabbitmq+DEV', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Permission` VALUES (326, 'ReleaseNamespace', 'appCenter+rabbitmq+DEV', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Permission` VALUES (327, 'ModifyNamespace', 'appCenter+fastdfs', b'0', 'admin', '2020-07-16 14:21:18', 'admin', '2020-07-16 14:21:18');
INSERT INTO `Permission` VALUES (328, 'ReleaseNamespace', 'appCenter+fastdfs', b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `Permission` VALUES (329, 'ModifyNamespace', 'appCenter+fastdfs+DEV', b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `Permission` VALUES (330, 'ReleaseNamespace', 'appCenter+fastdfs+DEV', b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `Permission` VALUES (331, 'ModifyNamespace', 'appCenter+manager-center', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `Permission` VALUES (332, 'ReleaseNamespace', 'appCenter+manager-center', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `Permission` VALUES (333, 'ModifyNamespace', 'appCenter+manager-center+DEV', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `Permission` VALUES (334, 'ReleaseNamespace', 'appCenter+manager-center+DEV', b'0', 'admin', '2020-07-20 14:10:02', 'admin', '2020-07-20 14:10:02');
INSERT INTO `Permission` VALUES (335, 'ModifyNamespace', 'appCenter+user-center', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Permission` VALUES (336, 'ReleaseNamespace', 'appCenter+user-center', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Permission` VALUES (337, 'ModifyNamespace', 'appCenter+user-center+DEV', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Permission` VALUES (338, 'ReleaseNamespace', 'appCenter+user-center+DEV', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Permission` VALUES (339, 'CreateCluster', 'Fund', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (340, 'AssignRole', 'Fund', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (341, 'CreateNamespace', 'Fund', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (342, 'ManageAppMaster', 'Fund', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (343, 'ModifyNamespace', 'Fund+application', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (344, 'ReleaseNamespace', 'Fund+application', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (345, 'ModifyNamespace', 'Fund+application+DEV', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (346, 'ReleaseNamespace', 'Fund+application+DEV', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Permission` VALUES (347, 'ModifyNamespace', 'Fund+mysql', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Permission` VALUES (348, 'ReleaseNamespace', 'Fund+mysql', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Permission` VALUES (349, 'ModifyNamespace', 'Fund+mysql+DEV', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Permission` VALUES (350, 'ReleaseNamespace', 'Fund+mysql+DEV', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Permission` VALUES (351, 'ModifyNamespace', 'Fund+mybatis', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `Permission` VALUES (352, 'ReleaseNamespace', 'Fund+mybatis', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `Permission` VALUES (353, 'ModifyNamespace', 'Fund+mybatis+DEV', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `Permission` VALUES (354, 'ReleaseNamespace', 'Fund+mybatis+DEV', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 335 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO `Role` VALUES (1, 'Master+SampleApp', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Role` VALUES (2, 'ModifyNamespace+SampleApp+application', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Role` VALUES (3, 'ReleaseNamespace+SampleApp+application', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `Role` VALUES (4, 'CreateApplication+SystemRole', b'0', 'apollo', '2019-11-05 23:09:23', 'apollo', '2019-11-05 23:09:23');
INSERT INTO `Role` VALUES (5, 'Master+CarCook', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (6, 'ManageAppMaster+CarCook', b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (7, 'ModifyNamespace+CarCook+application', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (8, 'ReleaseNamespace+CarCook+application', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (9, 'ModifyNamespace+CarCook+application+DEV', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (10, 'ReleaseNamespace+CarCook+application+DEV', b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (11, 'ModifyNamespace+CarCook+mysql', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (12, 'ReleaseNamespace+CarCook+mysql', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (13, 'ModifyNamespace+CarCook+mysql+DEV', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (14, 'ReleaseNamespace+CarCook+mysql+DEV', b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (15, 'ModifyNamespace+CarCook+rabbitmq', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (16, 'ReleaseNamespace+CarCook+rabbitmq', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (17, 'ModifyNamespace+CarCook+rabbitmq+DEV', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (18, 'ReleaseNamespace+CarCook+rabbitmq+DEV', b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (19, 'ModifyNamespace+CarCook+elasticsearch', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (20, 'ReleaseNamespace+CarCook+elasticsearch', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (21, 'ModifyNamespace+CarCook+elasticsearch+DEV', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (22, 'ReleaseNamespace+CarCook+elasticsearch+DEV', b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (23, 'ModifyNamespace+CarCook+redis', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (24, 'ReleaseNamespace+CarCook+redis', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (25, 'ModifyNamespace+CarCook+redis+DEV', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (26, 'ReleaseNamespace+CarCook+redis+DEV', b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (27, 'ModifyNamespace+CarCook+UserCenter', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (28, 'ReleaseNamespace+CarCook+UserCenter', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (29, 'ModifyNamespace+CarCook+UserCenter+DEV', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (30, 'ReleaseNamespace+CarCook+UserCenter+DEV', b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (31, 'ModifyNamespace+CarCook+zipkin', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (32, 'ReleaseNamespace+CarCook+zipkin', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (33, 'ModifyNamespace+CarCook+zipkin+DEV', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (34, 'ReleaseNamespace+CarCook+zipkin+DEV', b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `Role` VALUES (35, 'Master+CookCar', b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `Role` VALUES (36, 'ManageAppMaster+CookCar', b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `Role` VALUES (37, 'ModifyNamespace+CookCar+application', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Role` VALUES (38, 'ReleaseNamespace+CookCar+application', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Role` VALUES (39, 'ModifyNamespace+CookCar+application+DEV', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Role` VALUES (40, 'ReleaseNamespace+CookCar+application+DEV', b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `Role` VALUES (41, 'ModifyNamespace+CookCar+rabbitmq', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Role` VALUES (42, 'ReleaseNamespace+CookCar+rabbitmq', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Role` VALUES (43, 'ModifyNamespace+CookCar+rabbitmq+DEV', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Role` VALUES (44, 'ReleaseNamespace+CookCar+rabbitmq+DEV', b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `Role` VALUES (45, 'ModifyNamespace+CookCar+elasticsearch', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Role` VALUES (46, 'ReleaseNamespace+CookCar+elasticsearch', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Role` VALUES (47, 'ModifyNamespace+CookCar+elasticsearch+DEV', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Role` VALUES (48, 'ReleaseNamespace+CookCar+elasticsearch+DEV', b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `Role` VALUES (49, 'ModifyNamespace+CookCar+redis', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Role` VALUES (50, 'ReleaseNamespace+CookCar+redis', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Role` VALUES (51, 'ModifyNamespace+CookCar+redis+DEV', b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `Role` VALUES (52, 'ReleaseNamespace+CookCar+redis+DEV', b'0', 'apollo', '2019-12-02 12:02:08', 'apollo', '2019-12-02 12:02:08');
INSERT INTO `Role` VALUES (53, 'ModifyNamespace+CookCar+mysql', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Role` VALUES (54, 'ReleaseNamespace+CookCar+mysql', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Role` VALUES (55, 'ModifyNamespace+CookCar+mysql+DEV', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Role` VALUES (56, 'ReleaseNamespace+CookCar+mysql+DEV', b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `Role` VALUES (57, 'ModifyNamespace+CookCar+cookcar-user', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Role` VALUES (58, 'ReleaseNamespace+CookCar+cookcar-user', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Role` VALUES (59, 'ModifyNamespace+CookCar+cookcar-user+DEV', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Role` VALUES (60, 'ReleaseNamespace+CookCar+cookcar-user+DEV', b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `Role` VALUES (61, 'ModifyNamespace+CookCar+cookcar-order', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Role` VALUES (62, 'ReleaseNamespace+CookCar+cookcar-order', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Role` VALUES (63, 'ModifyNamespace+CookCar+cookcar-order+DEV', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Role` VALUES (64, 'ReleaseNamespace+CookCar+cookcar-order+DEV', b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `Role` VALUES (65, 'Master+CookCarDEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Role` VALUES (66, 'ManageAppMaster+CookCarDEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Role` VALUES (67, 'ModifyNamespace+CookCarDEV+application', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Role` VALUES (68, 'ReleaseNamespace+CookCarDEV+application', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Role` VALUES (69, 'ModifyNamespace+CookCarDEV+application+DEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Role` VALUES (70, 'ReleaseNamespace+CookCarDEV+application+DEV', b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `Role` VALUES (71, 'ModifyNamespace+CookCarDEV+rabbitmq', b'0', 'apollo', '2019-12-04 19:01:32', 'apollo', '2019-12-04 19:01:32');
INSERT INTO `Role` VALUES (72, 'ReleaseNamespace+CookCarDEV+rabbitmq', b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `Role` VALUES (73, 'ModifyNamespace+CookCarDEV+rabbitmq+DEV', b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `Role` VALUES (74, 'ReleaseNamespace+CookCarDEV+rabbitmq+DEV', b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `Role` VALUES (75, 'ModifyNamespace+CookCarDEV+elasticsearch', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Role` VALUES (76, 'ReleaseNamespace+CookCarDEV+elasticsearch', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Role` VALUES (77, 'ModifyNamespace+CookCarDEV+elasticsearch+DEV', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Role` VALUES (78, 'ReleaseNamespace+CookCarDEV+elasticsearch+DEV', b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `Role` VALUES (79, 'ModifyNamespace+CookCarDEV+redis', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Role` VALUES (80, 'ReleaseNamespace+CookCarDEV+redis', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Role` VALUES (81, 'ModifyNamespace+CookCarDEV+redis+DEV', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Role` VALUES (82, 'ReleaseNamespace+CookCarDEV+redis+DEV', b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `Role` VALUES (83, 'ModifyNamespace+CookCarDEV+mysql', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Role` VALUES (84, 'ReleaseNamespace+CookCarDEV+mysql', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Role` VALUES (85, 'ModifyNamespace+CookCarDEV+mysql+DEV', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Role` VALUES (86, 'ReleaseNamespace+CookCarDEV+mysql+DEV', b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `Role` VALUES (87, 'ModifyNamespace+CookCarDEV+cookcar-user', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Role` VALUES (88, 'ReleaseNamespace+CookCarDEV+cookcar-user', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Role` VALUES (89, 'ModifyNamespace+CookCarDEV+cookcar-user+DEV', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Role` VALUES (90, 'ReleaseNamespace+CookCarDEV+cookcar-user+DEV', b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `Role` VALUES (91, 'ModifyNamespace+CookCarDEV+cookcar-order', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Role` VALUES (92, 'ReleaseNamespace+CookCarDEV+cookcar-order', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Role` VALUES (93, 'ModifyNamespace+CookCarDEV+cookcar-order+DEV', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Role` VALUES (94, 'ReleaseNamespace+CookCarDEV+cookcar-order+DEV', b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `Role` VALUES (95, 'ModifyNamespace+CookCarDEV+cookcar-msg', b'0', 'apollo', '2019-12-24 15:39:14', 'apollo', '2019-12-24 15:39:14');
INSERT INTO `Role` VALUES (96, 'ReleaseNamespace+CookCarDEV+cookcar-msg', b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `Role` VALUES (97, 'ModifyNamespace+CookCarDEV+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `Role` VALUES (98, 'ReleaseNamespace+CookCarDEV+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `Role` VALUES (99, 'ModifyNamespace+CookCar+cookcar-msg', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Role` VALUES (100, 'ReleaseNamespace+CookCar+cookcar-msg', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Role` VALUES (101, 'ModifyNamespace+CookCar+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Role` VALUES (102, 'ReleaseNamespace+CookCar+cookcar-msg+DEV', b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `Role` VALUES (103, 'Master+epidemic-bg', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Role` VALUES (104, 'ManageAppMaster+epidemic-bg', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Role` VALUES (105, 'ModifyNamespace+epidemic-bg+application', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Role` VALUES (106, 'ReleaseNamespace+epidemic-bg+application', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Role` VALUES (107, 'ModifyNamespace+epidemic-bg+application+DEV', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Role` VALUES (108, 'ReleaseNamespace+epidemic-bg+application+DEV', b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `Role` VALUES (109, 'ModifyNamespace+epidemic-bg+TEST1.mybatis', b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:32');
INSERT INTO `Role` VALUES (110, 'ReleaseNamespace+epidemic-bg+TEST1.mybatis', b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:32');
INSERT INTO `Role` VALUES (111, 'ModifyNamespace+epidemic-bg+TEST1.mybatis+DEV', b'0', 'admin', '2020-03-04 15:21:36', 'admin', '2020-03-04 15:21:36');
INSERT INTO `Role` VALUES (112, 'ReleaseNamespace+epidemic-bg+TEST1.mybatis+DEV', b'0', 'admin', '2020-03-04 15:21:36', 'admin', '2020-03-04 15:21:36');
INSERT INTO `Role` VALUES (113, 'ModifyNamespace+epidemic-bg+mybatis', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Role` VALUES (114, 'ReleaseNamespace+epidemic-bg+mybatis', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Role` VALUES (115, 'ModifyNamespace+epidemic-bg+mybatis+DEV', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Role` VALUES (116, 'ReleaseNamespace+epidemic-bg+mybatis+DEV', b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `Role` VALUES (117, 'ModifyNamespace+epidemic-bg+mysql', b'0', 'admin', '2020-03-04 15:40:42', 'admin', '2020-03-04 15:40:42');
INSERT INTO `Role` VALUES (118, 'ReleaseNamespace+epidemic-bg+mysql', b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `Role` VALUES (119, 'ModifyNamespace+epidemic-bg+mysql+DEV', b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `Role` VALUES (120, 'ReleaseNamespace+epidemic-bg+mysql+DEV', b'0', 'admin', '2020-03-04 15:40:44', 'admin', '2020-03-04 15:40:44');
INSERT INTO `Role` VALUES (121, 'Master+changShaSuperBrain', b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `Role` VALUES (122, 'ManageAppMaster+changShaSuperBrain', b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `Role` VALUES (123, 'ModifyNamespace+changShaSuperBrain+application', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Role` VALUES (124, 'ReleaseNamespace+changShaSuperBrain+application', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Role` VALUES (125, 'ModifyNamespace+changShaSuperBrain+application+DEV', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Role` VALUES (126, 'ReleaseNamespace+changShaSuperBrain+application+DEV', b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `Role` VALUES (127, 'ModifyNamespace+changShaSuperBrain+global', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Role` VALUES (128, 'ReleaseNamespace+changShaSuperBrain+global', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Role` VALUES (129, 'ModifyNamespace+changShaSuperBrain+global+DEV', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Role` VALUES (130, 'ReleaseNamespace+changShaSuperBrain+global+DEV', b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `Role` VALUES (131, 'ModifyNamespace+changShaSuperBrain+mysql', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Role` VALUES (132, 'ReleaseNamespace+changShaSuperBrain+mysql', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Role` VALUES (133, 'ModifyNamespace+changShaSuperBrain+mysql+DEV', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Role` VALUES (134, 'ReleaseNamespace+changShaSuperBrain+mysql+DEV', b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `Role` VALUES (135, 'ModifyNamespace+changShaSuperBrain+redis', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Role` VALUES (136, 'ReleaseNamespace+changShaSuperBrain+redis', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Role` VALUES (137, 'ModifyNamespace+changShaSuperBrain+redis+DEV', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Role` VALUES (138, 'ReleaseNamespace+changShaSuperBrain+redis+DEV', b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `Role` VALUES (139, 'ModifyNamespace+changShaSuperBrain+rabbitmq', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Role` VALUES (140, 'ReleaseNamespace+changShaSuperBrain+rabbitmq', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Role` VALUES (141, 'ModifyNamespace+changShaSuperBrain+rabbitmq+DEV', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Role` VALUES (142, 'ReleaseNamespace+changShaSuperBrain+rabbitmq+DEV', b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `Role` VALUES (143, 'ModifyNamespace+changShaSuperBrain+sys-authorize', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Role` VALUES (144, 'ReleaseNamespace+changShaSuperBrain+sys-authorize', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Role` VALUES (145, 'ModifyNamespace+changShaSuperBrain+sys-authorize+DEV', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Role` VALUES (146, 'ReleaseNamespace+changShaSuperBrain+sys-authorize+DEV', b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `Role` VALUES (147, 'ModifyNamespace+changShaSuperBrain+zipkin_server', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Role` VALUES (148, 'ReleaseNamespace+changShaSuperBrain+zipkin_server', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Role` VALUES (149, 'ModifyNamespace+changShaSuperBrain+zipkin_server+DEV', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Role` VALUES (150, 'ReleaseNamespace+changShaSuperBrain+zipkin_server+DEV', b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `Role` VALUES (151, 'ModifyNamespace+changShaSuperBrain+zipkin', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Role` VALUES (152, 'ReleaseNamespace+changShaSuperBrain+zipkin', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Role` VALUES (153, 'ModifyNamespace+changShaSuperBrain+zipkin+DEV', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Role` VALUES (154, 'ReleaseNamespace+changShaSuperBrain+zipkin+DEV', b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `Role` VALUES (155, 'ModifyNamespace+changShaSuperBrain+sys-message', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Role` VALUES (156, 'ReleaseNamespace+changShaSuperBrain+sys-message', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Role` VALUES (157, 'ModifyNamespace+changShaSuperBrain+sys-message+DEV', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Role` VALUES (158, 'ReleaseNamespace+changShaSuperBrain+sys-message+DEV', b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `Role` VALUES (159, 'ModifyNamespace+changShaSuperBrain+elasticsearch', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Role` VALUES (160, 'ReleaseNamespace+changShaSuperBrain+elasticsearch', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Role` VALUES (161, 'ModifyNamespace+changShaSuperBrain+elasticsearch+DEV', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Role` VALUES (162, 'ReleaseNamespace+changShaSuperBrain+elasticsearch+DEV', b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `Role` VALUES (163, 'ModifyNamespace+changShaSuperBrain+do1cloud-agency', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Role` VALUES (164, 'ReleaseNamespace+changShaSuperBrain+do1cloud-agency', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Role` VALUES (165, 'ModifyNamespace+changShaSuperBrain+do1cloud-agency+DEV', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Role` VALUES (166, 'ReleaseNamespace+changShaSuperBrain+do1cloud-agency+DEV', b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `Role` VALUES (167, 'ModifyNamespace+changShaSuperBrain+message-consumer', b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `Role` VALUES (168, 'ReleaseNamespace+changShaSuperBrain+message-consumer', b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `Role` VALUES (169, 'ModifyNamespace+changShaSuperBrain+message-consumer+DEV', b'0', 'admin', '2020-05-11 14:12:35', 'admin', '2020-05-11 14:12:35');
INSERT INTO `Role` VALUES (170, 'ReleaseNamespace+changShaSuperBrain+message-consumer+DEV', b'0', 'admin', '2020-05-11 14:12:35', 'admin', '2020-05-11 14:12:35');
INSERT INTO `Role` VALUES (171, 'ModifyNamespace+changShaSuperBrain+message-schedule', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Role` VALUES (172, 'ReleaseNamespace+changShaSuperBrain+message-schedule', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Role` VALUES (173, 'ModifyNamespace+changShaSuperBrain+message-schedule+DEV', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Role` VALUES (174, 'ReleaseNamespace+changShaSuperBrain+message-schedule+DEV', b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `Role` VALUES (175, 'ModifyNamespace+changShaSuperBrain+agency-consumer', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Role` VALUES (176, 'ReleaseNamespace+changShaSuperBrain+agency-consumer', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Role` VALUES (177, 'ModifyNamespace+changShaSuperBrain+agency-consumer+DEV', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Role` VALUES (178, 'ReleaseNamespace+changShaSuperBrain+agency-consumer+DEV', b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `Role` VALUES (179, 'ModifyNamespace+changShaSuperBrain+do1cloud-usercenter', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Role` VALUES (180, 'ReleaseNamespace+changShaSuperBrain+do1cloud-usercenter', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Role` VALUES (181, 'ModifyNamespace+changShaSuperBrain+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Role` VALUES (182, 'ReleaseNamespace+changShaSuperBrain+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `Role` VALUES (183, 'ModifyNamespace+changShaSuperBrain+biz-payment-center', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Role` VALUES (184, 'ReleaseNamespace+changShaSuperBrain+biz-payment-center', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Role` VALUES (185, 'ModifyNamespace+changShaSuperBrain+biz-payment-center+DEV', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Role` VALUES (186, 'ReleaseNamespace+changShaSuperBrain+biz-payment-center+DEV', b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `Role` VALUES (187, 'ModifyNamespace+changShaSuperBrain+impmanager', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Role` VALUES (188, 'ReleaseNamespace+changShaSuperBrain+impmanager', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Role` VALUES (189, 'ModifyNamespace+changShaSuperBrain+impmanager+DEV', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Role` VALUES (190, 'ReleaseNamespace+changShaSuperBrain+impmanager+DEV', b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `Role` VALUES (191, 'ModifyNamespace+changShaSuperBrain+message-common', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `Role` VALUES (192, 'ReleaseNamespace+changShaSuperBrain+message-common', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `Role` VALUES (193, 'ModifyNamespace+changShaSuperBrain+message-common+DEV', b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `Role` VALUES (194, 'ReleaseNamespace+changShaSuperBrain+message-common+DEV', b'0', 'admin', '2020-05-11 14:17:43', 'admin', '2020-05-11 14:17:43');
INSERT INTO `Role` VALUES (195, 'ModifyNamespace+changShaSuperBrain+agency-schedule', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Role` VALUES (196, 'ReleaseNamespace+changShaSuperBrain+agency-schedule', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Role` VALUES (197, 'ModifyNamespace+changShaSuperBrain+agency-schedule+DEV', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Role` VALUES (198, 'ReleaseNamespace+changShaSuperBrain+agency-schedule+DEV', b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `Role` VALUES (199, 'Master+changShaSuperBrain1', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Role` VALUES (200, 'ManageAppMaster+changShaSuperBrain1', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Role` VALUES (201, 'ModifyNamespace+changShaSuperBrain1+application', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Role` VALUES (202, 'ReleaseNamespace+changShaSuperBrain1+application', b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `Role` VALUES (203, 'ModifyNamespace+changShaSuperBrain1+application+DEV', b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `Role` VALUES (204, 'ReleaseNamespace+changShaSuperBrain1+application+DEV', b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `Role` VALUES (205, 'ModifyNamespace+changShaSuperBrain1+TEST1.global', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Role` VALUES (206, 'ReleaseNamespace+changShaSuperBrain1+TEST1.global', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Role` VALUES (207, 'ModifyNamespace+changShaSuperBrain1+TEST1.global+DEV', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Role` VALUES (208, 'ReleaseNamespace+changShaSuperBrain1+TEST1.global+DEV', b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `Role` VALUES (209, 'ModifyNamespace+changShaSuperBrain1+global', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Role` VALUES (210, 'ReleaseNamespace+changShaSuperBrain1+global', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Role` VALUES (211, 'ModifyNamespace+changShaSuperBrain1+global+DEV', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Role` VALUES (212, 'ReleaseNamespace+changShaSuperBrain1+global+DEV', b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `Role` VALUES (213, 'ModifyNamespace+changShaSuperBrain1+mysql', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Role` VALUES (214, 'ReleaseNamespace+changShaSuperBrain1+mysql', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Role` VALUES (215, 'ModifyNamespace+changShaSuperBrain1+mysql+DEV', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Role` VALUES (216, 'ReleaseNamespace+changShaSuperBrain1+mysql+DEV', b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `Role` VALUES (217, 'ModifyNamespace+changShaSuperBrain1+redis', b'0', 'admin', '2020-05-20 11:43:15', 'admin', '2020-05-20 11:43:15');
INSERT INTO `Role` VALUES (218, 'ReleaseNamespace+changShaSuperBrain1+redis', b'0', 'admin', '2020-05-20 11:43:15', 'admin', '2020-05-20 11:43:15');
INSERT INTO `Role` VALUES (219, 'ModifyNamespace+changShaSuperBrain1+redis+DEV', b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `Role` VALUES (220, 'ReleaseNamespace+changShaSuperBrain1+redis+DEV', b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `Role` VALUES (221, 'ModifyNamespace+changShaSuperBrain1+rabbitmq', b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `Role` VALUES (222, 'ReleaseNamespace+changShaSuperBrain1+rabbitmq', b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `Role` VALUES (223, 'ModifyNamespace+changShaSuperBrain1+rabbitmq+DEV', b'0', 'admin', '2020-05-20 11:44:14', 'admin', '2020-05-20 11:44:14');
INSERT INTO `Role` VALUES (224, 'ReleaseNamespace+changShaSuperBrain1+rabbitmq+DEV', b'0', 'admin', '2020-05-20 11:44:32', 'admin', '2020-05-20 11:44:32');
INSERT INTO `Role` VALUES (225, 'ModifyNamespace+changShaSuperBrain1+elasticsearch', b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `Role` VALUES (226, 'ReleaseNamespace+changShaSuperBrain1+elasticsearch', b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `Role` VALUES (227, 'ModifyNamespace+changShaSuperBrain1+elasticsearch+DEV', b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `Role` VALUES (228, 'ReleaseNamespace+changShaSuperBrain1+elasticsearch+DEV', b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `Role` VALUES (229, 'ModifyNamespace+changShaSuperBrain1+do1cloud-usercenter', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Role` VALUES (230, 'ReleaseNamespace+changShaSuperBrain1+do1cloud-usercenter', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Role` VALUES (231, 'ModifyNamespace+changShaSuperBrain1+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Role` VALUES (232, 'ReleaseNamespace+changShaSuperBrain1+do1cloud-usercenter+DEV', b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `Role` VALUES (233, 'ModifyNamespace+changShaSuperBrain1+zipkin', b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `Role` VALUES (234, 'ReleaseNamespace+changShaSuperBrain1+zipkin', b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `Role` VALUES (235, 'ModifyNamespace+changShaSuperBrain1+zipkin+DEV', b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `Role` VALUES (236, 'ReleaseNamespace+changShaSuperBrain1+zipkin+DEV', b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `Role` VALUES (237, 'ModifyNamespace+changShaSuperBrain1+zipkin_server', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Role` VALUES (238, 'ReleaseNamespace+changShaSuperBrain1+zipkin_server', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Role` VALUES (239, 'ModifyNamespace+changShaSuperBrain1+zipkin_server+DEV', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Role` VALUES (240, 'ReleaseNamespace+changShaSuperBrain1+zipkin_server+DEV', b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `Role` VALUES (241, 'Master+taskCenter', b'0', 'admin', '2020-05-23 00:42:47', 'admin', '2020-05-23 00:42:47');
INSERT INTO `Role` VALUES (242, 'ManageAppMaster+taskCenter', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Role` VALUES (243, 'ModifyNamespace+taskCenter+application', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Role` VALUES (244, 'ReleaseNamespace+taskCenter+application', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Role` VALUES (245, 'ModifyNamespace+taskCenter+application+DEV', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Role` VALUES (246, 'ReleaseNamespace+taskCenter+application+DEV', b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `Role` VALUES (247, 'ModifyNamespace+taskCenter+mysql', b'0', 'admin', '2020-05-23 00:50:36', 'admin', '2020-05-23 00:50:36');
INSERT INTO `Role` VALUES (248, 'ReleaseNamespace+taskCenter+mysql', b'0', 'admin', '2020-05-23 00:50:36', 'admin', '2020-05-23 00:50:36');
INSERT INTO `Role` VALUES (249, 'ModifyNamespace+taskCenter+mysql+DEV', b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `Role` VALUES (250, 'ReleaseNamespace+taskCenter+mysql+DEV', b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `Role` VALUES (251, 'ModifyNamespace+taskCenter+redis', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Role` VALUES (252, 'ReleaseNamespace+taskCenter+redis', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Role` VALUES (253, 'ModifyNamespace+taskCenter+redis+DEV', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Role` VALUES (254, 'ReleaseNamespace+taskCenter+redis+DEV', b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `Role` VALUES (255, 'ModifyNamespace+taskCenter+rabbitmq', b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `Role` VALUES (256, 'ReleaseNamespace+taskCenter+rabbitmq', b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `Role` VALUES (257, 'ModifyNamespace+taskCenter+rabbitmq+DEV', b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `Role` VALUES (258, 'ReleaseNamespace+taskCenter+rabbitmq+DEV', b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `Role` VALUES (259, 'ModifyNamespace+taskCenter+elasticsearch', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Role` VALUES (260, 'ReleaseNamespace+taskCenter+elasticsearch', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Role` VALUES (261, 'ModifyNamespace+taskCenter+elasticsearch+DEV', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Role` VALUES (262, 'ReleaseNamespace+taskCenter+elasticsearch+DEV', b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `Role` VALUES (263, 'ModifyNamespace+taskCenter+do1cloud-agency', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Role` VALUES (264, 'ReleaseNamespace+taskCenter+do1cloud-agency', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Role` VALUES (265, 'ModifyNamespace+taskCenter+do1cloud-agency+DEV', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Role` VALUES (266, 'ReleaseNamespace+taskCenter+do1cloud-agency+DEV', b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `Role` VALUES (267, 'ModifyNamespace+taskCenter+agency-consumer', b'0', 'admin', '2020-05-23 01:01:03', 'admin', '2020-05-23 01:01:03');
INSERT INTO `Role` VALUES (268, 'ReleaseNamespace+taskCenter+agency-consumer', b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `Role` VALUES (269, 'ModifyNamespace+taskCenter+agency-consumer+DEV', b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `Role` VALUES (270, 'ReleaseNamespace+taskCenter+agency-consumer+DEV', b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `Role` VALUES (271, 'ModifyNamespace+taskCenter+agency-schedule', b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `Role` VALUES (272, 'ReleaseNamespace+taskCenter+agency-schedule', b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `Role` VALUES (273, 'ModifyNamespace+taskCenter+agency-schedule+DEV', b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `Role` VALUES (274, 'ReleaseNamespace+taskCenter+agency-schedule+DEV', b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `Role` VALUES (275, 'ModifyNamespace+taskCenter+global', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Role` VALUES (276, 'ReleaseNamespace+taskCenter+global', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Role` VALUES (277, 'ModifyNamespace+taskCenter+global+DEV', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Role` VALUES (278, 'ReleaseNamespace+taskCenter+global+DEV', b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `Role` VALUES (279, 'ModifyNamespace+changShaSuperBrain1+sys-authorize', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Role` VALUES (280, 'ReleaseNamespace+changShaSuperBrain1+sys-authorize', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Role` VALUES (281, 'ModifyNamespace+changShaSuperBrain1+sys-authorize+DEV', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Role` VALUES (282, 'ReleaseNamespace+changShaSuperBrain1+sys-authorize+DEV', b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `Role` VALUES (283, 'ModifyNamespace+changShaSuperBrain+tanby', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Role` VALUES (284, 'ReleaseNamespace+changShaSuperBrain+tanby', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Role` VALUES (285, 'ModifyNamespace+changShaSuperBrain+tanby+DEV', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Role` VALUES (286, 'ReleaseNamespace+changShaSuperBrain+tanby+DEV', b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `Role` VALUES (287, 'Master+appCenter', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Role` VALUES (288, 'ManageAppMaster+appCenter', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Role` VALUES (289, 'ModifyNamespace+appCenter+application', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Role` VALUES (290, 'ReleaseNamespace+appCenter+application', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Role` VALUES (291, 'ModifyNamespace+appCenter+application+DEV', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Role` VALUES (292, 'ReleaseNamespace+appCenter+application+DEV', b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `Role` VALUES (293, 'ModifyNamespace+appCenter+mysql', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Role` VALUES (294, 'ReleaseNamespace+appCenter+mysql', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Role` VALUES (295, 'ModifyNamespace+appCenter+mysql+DEV', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Role` VALUES (296, 'ReleaseNamespace+appCenter+mysql+DEV', b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `Role` VALUES (297, 'ModifyNamespace+appCenter+mybatis', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Role` VALUES (298, 'ReleaseNamespace+appCenter+mybatis', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Role` VALUES (299, 'ModifyNamespace+appCenter+mybatis+DEV', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Role` VALUES (300, 'ReleaseNamespace+appCenter+mybatis+DEV', b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `Role` VALUES (301, 'ModifyNamespace+appCenter+redis', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Role` VALUES (302, 'ReleaseNamespace+appCenter+redis', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Role` VALUES (303, 'ModifyNamespace+appCenter+redis+DEV', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Role` VALUES (304, 'ReleaseNamespace+appCenter+redis+DEV', b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `Role` VALUES (305, 'ModifyNamespace+appCenter+rabbitmq', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Role` VALUES (306, 'ReleaseNamespace+appCenter+rabbitmq', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Role` VALUES (307, 'ModifyNamespace+appCenter+rabbitmq+DEV', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Role` VALUES (308, 'ReleaseNamespace+appCenter+rabbitmq+DEV', b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `Role` VALUES (309, 'ModifyNamespace+appCenter+fastdfs', b'0', 'admin', '2020-07-16 14:21:18', 'admin', '2020-07-16 14:21:18');
INSERT INTO `Role` VALUES (310, 'ReleaseNamespace+appCenter+fastdfs', b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `Role` VALUES (311, 'ModifyNamespace+appCenter+fastdfs+DEV', b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `Role` VALUES (312, 'ReleaseNamespace+appCenter+fastdfs+DEV', b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `Role` VALUES (313, 'ModifyNamespace+appCenter+manager-center', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `Role` VALUES (314, 'ReleaseNamespace+appCenter+manager-center', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `Role` VALUES (315, 'ModifyNamespace+appCenter+manager-center+DEV', b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `Role` VALUES (316, 'ReleaseNamespace+appCenter+manager-center+DEV', b'0', 'admin', '2020-07-20 14:10:02', 'admin', '2020-07-20 14:10:02');
INSERT INTO `Role` VALUES (317, 'ModifyNamespace+appCenter+user-center', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Role` VALUES (318, 'ReleaseNamespace+appCenter+user-center', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Role` VALUES (319, 'ModifyNamespace+appCenter+user-center+DEV', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Role` VALUES (320, 'ReleaseNamespace+appCenter+user-center+DEV', b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `Role` VALUES (321, 'Master+Fund', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Role` VALUES (322, 'ManageAppMaster+Fund', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Role` VALUES (323, 'ModifyNamespace+Fund+application', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Role` VALUES (324, 'ReleaseNamespace+Fund+application', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Role` VALUES (325, 'ModifyNamespace+Fund+application+DEV', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Role` VALUES (326, 'ReleaseNamespace+Fund+application+DEV', b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `Role` VALUES (327, 'ModifyNamespace+Fund+mysql', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Role` VALUES (328, 'ReleaseNamespace+Fund+mysql', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Role` VALUES (329, 'ModifyNamespace+Fund+mysql+DEV', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Role` VALUES (330, 'ReleaseNamespace+Fund+mysql+DEV', b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `Role` VALUES (331, 'ModifyNamespace+Fund+mybatis', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `Role` VALUES (332, 'ReleaseNamespace+Fund+mybatis', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `Role` VALUES (333, 'ModifyNamespace+Fund+mybatis+DEV', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `Role` VALUES (334, 'ReleaseNamespace+Fund+mybatis+DEV', b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 355 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT INTO `RolePermission` VALUES (1, 1, 1, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `RolePermission` VALUES (2, 1, 2, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `RolePermission` VALUES (3, 1, 3, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `RolePermission` VALUES (4, 2, 4, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `RolePermission` VALUES (5, 3, 5, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `RolePermission` VALUES (6, 4, 6, b'0', 'apollo', '2019-11-05 23:09:23', 'apollo', '2019-11-05 23:09:23');
INSERT INTO `RolePermission` VALUES (7, 5, 7, b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (8, 5, 8, b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (9, 5, 9, b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (10, 6, 10, b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (11, 7, 11, b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (12, 8, 12, b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (13, 9, 13, b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (14, 10, 14, b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (15, 11, 15, b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (16, 12, 16, b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (17, 13, 17, b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (18, 14, 18, b'1', 'admin', '2019-11-05 23:43:25', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (19, 15, 19, b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (20, 16, 20, b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (21, 17, 21, b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (22, 18, 22, b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (23, 19, 23, b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (24, 20, 24, b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (25, 21, 25, b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (26, 22, 26, b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (27, 23, 27, b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (28, 24, 28, b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (29, 25, 29, b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (30, 26, 30, b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (31, 27, 31, b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (32, 28, 32, b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (33, 29, 33, b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (34, 30, 34, b'1', 'admin', '2019-11-05 23:45:32', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (35, 31, 35, b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (36, 32, 36, b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (37, 33, 37, b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (38, 34, 38, b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `RolePermission` VALUES (39, 35, 39, b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `RolePermission` VALUES (40, 35, 40, b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `RolePermission` VALUES (41, 35, 41, b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `RolePermission` VALUES (42, 36, 42, b'0', 'apollo', '2019-12-02 11:36:01', 'apollo', '2019-12-02 11:36:01');
INSERT INTO `RolePermission` VALUES (43, 37, 43, b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `RolePermission` VALUES (44, 38, 44, b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `RolePermission` VALUES (45, 39, 45, b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `RolePermission` VALUES (46, 40, 46, b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `RolePermission` VALUES (47, 41, 47, b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `RolePermission` VALUES (48, 42, 48, b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `RolePermission` VALUES (49, 43, 49, b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `RolePermission` VALUES (50, 44, 50, b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `RolePermission` VALUES (51, 45, 51, b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `RolePermission` VALUES (52, 46, 52, b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `RolePermission` VALUES (53, 47, 53, b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `RolePermission` VALUES (54, 48, 54, b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `RolePermission` VALUES (55, 49, 55, b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `RolePermission` VALUES (56, 50, 56, b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `RolePermission` VALUES (57, 51, 57, b'0', 'apollo', '2019-12-02 12:02:07', 'apollo', '2019-12-02 12:02:07');
INSERT INTO `RolePermission` VALUES (58, 52, 58, b'0', 'apollo', '2019-12-02 12:02:08', 'apollo', '2019-12-02 12:02:08');
INSERT INTO `RolePermission` VALUES (59, 53, 59, b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `RolePermission` VALUES (60, 54, 60, b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `RolePermission` VALUES (61, 55, 61, b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `RolePermission` VALUES (62, 56, 62, b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `RolePermission` VALUES (63, 57, 63, b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `RolePermission` VALUES (64, 58, 64, b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `RolePermission` VALUES (65, 59, 65, b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `RolePermission` VALUES (66, 60, 66, b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `RolePermission` VALUES (67, 61, 67, b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `RolePermission` VALUES (68, 62, 68, b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `RolePermission` VALUES (69, 63, 69, b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `RolePermission` VALUES (70, 64, 70, b'0', 'apollo', '2019-12-02 12:03:30', 'apollo', '2019-12-02 12:03:30');
INSERT INTO `RolePermission` VALUES (71, 65, 71, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (72, 65, 72, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (73, 65, 73, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (74, 66, 74, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (75, 67, 75, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (76, 68, 76, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (77, 69, 77, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (78, 70, 78, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `RolePermission` VALUES (79, 71, 79, b'0', 'apollo', '2019-12-04 19:01:32', 'apollo', '2019-12-04 19:01:32');
INSERT INTO `RolePermission` VALUES (80, 72, 80, b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `RolePermission` VALUES (81, 73, 81, b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `RolePermission` VALUES (82, 74, 82, b'0', 'apollo', '2019-12-04 19:01:33', 'apollo', '2019-12-04 19:01:33');
INSERT INTO `RolePermission` VALUES (83, 75, 83, b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `RolePermission` VALUES (84, 76, 84, b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `RolePermission` VALUES (85, 77, 85, b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `RolePermission` VALUES (86, 78, 86, b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `RolePermission` VALUES (87, 79, 87, b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `RolePermission` VALUES (88, 80, 88, b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `RolePermission` VALUES (89, 81, 89, b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `RolePermission` VALUES (90, 82, 90, b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `RolePermission` VALUES (91, 83, 91, b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `RolePermission` VALUES (92, 84, 92, b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `RolePermission` VALUES (93, 85, 93, b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `RolePermission` VALUES (94, 86, 94, b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `RolePermission` VALUES (95, 87, 95, b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `RolePermission` VALUES (96, 88, 96, b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `RolePermission` VALUES (97, 89, 97, b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `RolePermission` VALUES (98, 90, 98, b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `RolePermission` VALUES (99, 91, 99, b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `RolePermission` VALUES (100, 92, 100, b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `RolePermission` VALUES (101, 93, 101, b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `RolePermission` VALUES (102, 94, 102, b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `RolePermission` VALUES (103, 95, 103, b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `RolePermission` VALUES (104, 96, 104, b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `RolePermission` VALUES (105, 97, 105, b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `RolePermission` VALUES (106, 98, 106, b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `RolePermission` VALUES (107, 99, 107, b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `RolePermission` VALUES (108, 100, 108, b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `RolePermission` VALUES (109, 101, 109, b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `RolePermission` VALUES (110, 102, 110, b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `RolePermission` VALUES (111, 103, 112, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (112, 103, 113, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (113, 103, 111, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (114, 104, 114, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (115, 105, 115, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (116, 106, 116, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (117, 107, 117, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (118, 108, 118, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `RolePermission` VALUES (119, 109, 119, b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:32');
INSERT INTO `RolePermission` VALUES (120, 110, 120, b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:32');
INSERT INTO `RolePermission` VALUES (121, 111, 121, b'0', 'admin', '2020-03-04 15:21:36', 'admin', '2020-03-04 15:21:36');
INSERT INTO `RolePermission` VALUES (122, 112, 122, b'0', 'admin', '2020-03-04 15:21:36', 'admin', '2020-03-04 15:21:36');
INSERT INTO `RolePermission` VALUES (123, 113, 123, b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `RolePermission` VALUES (124, 114, 124, b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `RolePermission` VALUES (125, 115, 125, b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `RolePermission` VALUES (126, 116, 126, b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `RolePermission` VALUES (127, 117, 127, b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `RolePermission` VALUES (128, 118, 128, b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `RolePermission` VALUES (129, 119, 129, b'0', 'admin', '2020-03-04 15:40:43', 'admin', '2020-03-04 15:40:43');
INSERT INTO `RolePermission` VALUES (130, 120, 130, b'0', 'admin', '2020-03-04 15:40:44', 'admin', '2020-03-04 15:40:44');
INSERT INTO `RolePermission` VALUES (131, 121, 131, b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `RolePermission` VALUES (132, 121, 132, b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `RolePermission` VALUES (133, 121, 133, b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `RolePermission` VALUES (134, 122, 134, b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `RolePermission` VALUES (135, 123, 135, b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `RolePermission` VALUES (136, 124, 136, b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `RolePermission` VALUES (137, 125, 137, b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `RolePermission` VALUES (138, 126, 138, b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `RolePermission` VALUES (139, 127, 139, b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `RolePermission` VALUES (140, 128, 140, b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `RolePermission` VALUES (141, 129, 141, b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `RolePermission` VALUES (142, 130, 142, b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `RolePermission` VALUES (143, 131, 143, b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `RolePermission` VALUES (144, 132, 144, b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `RolePermission` VALUES (145, 133, 145, b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `RolePermission` VALUES (146, 134, 146, b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `RolePermission` VALUES (147, 135, 147, b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `RolePermission` VALUES (148, 136, 148, b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `RolePermission` VALUES (149, 137, 149, b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `RolePermission` VALUES (150, 138, 150, b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `RolePermission` VALUES (151, 139, 151, b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `RolePermission` VALUES (152, 140, 152, b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `RolePermission` VALUES (153, 141, 153, b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `RolePermission` VALUES (154, 142, 154, b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `RolePermission` VALUES (155, 143, 155, b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `RolePermission` VALUES (156, 144, 156, b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `RolePermission` VALUES (157, 145, 157, b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `RolePermission` VALUES (158, 146, 158, b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `RolePermission` VALUES (159, 147, 159, b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `RolePermission` VALUES (160, 148, 160, b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `RolePermission` VALUES (161, 149, 161, b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `RolePermission` VALUES (162, 150, 162, b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `RolePermission` VALUES (163, 151, 163, b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `RolePermission` VALUES (164, 152, 164, b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `RolePermission` VALUES (165, 153, 165, b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `RolePermission` VALUES (166, 154, 166, b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `RolePermission` VALUES (167, 155, 167, b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `RolePermission` VALUES (168, 156, 168, b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `RolePermission` VALUES (169, 157, 169, b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `RolePermission` VALUES (170, 158, 170, b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `RolePermission` VALUES (171, 159, 171, b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `RolePermission` VALUES (172, 160, 172, b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `RolePermission` VALUES (173, 161, 173, b'0', 'admin', '2020-05-11 14:10:32', 'admin', '2020-05-11 14:10:32');
INSERT INTO `RolePermission` VALUES (174, 162, 174, b'0', 'admin', '2020-05-11 14:10:33', 'admin', '2020-05-11 14:10:33');
INSERT INTO `RolePermission` VALUES (175, 163, 175, b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `RolePermission` VALUES (176, 164, 176, b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `RolePermission` VALUES (177, 165, 177, b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `RolePermission` VALUES (178, 166, 178, b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `RolePermission` VALUES (179, 167, 179, b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `RolePermission` VALUES (180, 168, 180, b'0', 'admin', '2020-05-11 14:12:34', 'admin', '2020-05-11 14:12:34');
INSERT INTO `RolePermission` VALUES (181, 169, 181, b'0', 'admin', '2020-05-11 14:12:35', 'admin', '2020-05-11 14:12:35');
INSERT INTO `RolePermission` VALUES (182, 170, 182, b'0', 'admin', '2020-05-11 14:12:35', 'admin', '2020-05-11 14:12:35');
INSERT INTO `RolePermission` VALUES (183, 171, 183, b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `RolePermission` VALUES (184, 172, 184, b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `RolePermission` VALUES (185, 173, 185, b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `RolePermission` VALUES (186, 174, 186, b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `RolePermission` VALUES (187, 175, 187, b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `RolePermission` VALUES (188, 176, 188, b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `RolePermission` VALUES (189, 177, 189, b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `RolePermission` VALUES (190, 178, 190, b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `RolePermission` VALUES (191, 179, 191, b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `RolePermission` VALUES (192, 180, 192, b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `RolePermission` VALUES (193, 181, 193, b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `RolePermission` VALUES (194, 182, 194, b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `RolePermission` VALUES (195, 183, 195, b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `RolePermission` VALUES (196, 184, 196, b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `RolePermission` VALUES (197, 185, 197, b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `RolePermission` VALUES (198, 186, 198, b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `RolePermission` VALUES (199, 187, 199, b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `RolePermission` VALUES (200, 188, 200, b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `RolePermission` VALUES (201, 189, 201, b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `RolePermission` VALUES (202, 190, 202, b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `RolePermission` VALUES (203, 191, 203, b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `RolePermission` VALUES (204, 192, 204, b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `RolePermission` VALUES (205, 193, 205, b'0', 'admin', '2020-05-11 14:17:42', 'admin', '2020-05-11 14:17:42');
INSERT INTO `RolePermission` VALUES (206, 194, 206, b'0', 'admin', '2020-05-11 14:17:43', 'admin', '2020-05-11 14:17:43');
INSERT INTO `RolePermission` VALUES (207, 195, 207, b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `RolePermission` VALUES (208, 196, 208, b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `RolePermission` VALUES (209, 197, 209, b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `RolePermission` VALUES (210, 198, 210, b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `RolePermission` VALUES (211, 199, 211, b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `RolePermission` VALUES (212, 199, 212, b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `RolePermission` VALUES (213, 199, 213, b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `RolePermission` VALUES (214, 200, 214, b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `RolePermission` VALUES (215, 201, 215, b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `RolePermission` VALUES (216, 202, 216, b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `RolePermission` VALUES (217, 203, 217, b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `RolePermission` VALUES (218, 204, 218, b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `RolePermission` VALUES (219, 205, 219, b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `RolePermission` VALUES (220, 206, 220, b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `RolePermission` VALUES (221, 207, 221, b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `RolePermission` VALUES (222, 208, 222, b'0', 'admin', '2020-05-20 11:40:36', 'admin', '2020-05-20 11:40:36');
INSERT INTO `RolePermission` VALUES (223, 209, 223, b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `RolePermission` VALUES (224, 210, 224, b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `RolePermission` VALUES (225, 211, 225, b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `RolePermission` VALUES (226, 212, 226, b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `RolePermission` VALUES (227, 213, 227, b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `RolePermission` VALUES (228, 214, 228, b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `RolePermission` VALUES (229, 215, 229, b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `RolePermission` VALUES (230, 216, 230, b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `RolePermission` VALUES (231, 217, 231, b'0', 'admin', '2020-05-20 11:43:15', 'admin', '2020-05-20 11:43:15');
INSERT INTO `RolePermission` VALUES (232, 218, 232, b'0', 'admin', '2020-05-20 11:43:15', 'admin', '2020-05-20 11:43:15');
INSERT INTO `RolePermission` VALUES (233, 219, 233, b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `RolePermission` VALUES (234, 220, 234, b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `RolePermission` VALUES (235, 221, 235, b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `RolePermission` VALUES (236, 222, 236, b'0', 'admin', '2020-05-20 11:44:13', 'admin', '2020-05-20 11:44:13');
INSERT INTO `RolePermission` VALUES (237, 223, 237, b'0', 'admin', '2020-05-20 11:44:30', 'admin', '2020-05-20 11:44:30');
INSERT INTO `RolePermission` VALUES (238, 224, 238, b'0', 'admin', '2020-05-20 11:44:32', 'admin', '2020-05-20 11:44:32');
INSERT INTO `RolePermission` VALUES (239, 225, 239, b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `RolePermission` VALUES (240, 226, 240, b'0', 'admin', '2020-05-20 11:45:54', 'admin', '2020-05-20 11:45:54');
INSERT INTO `RolePermission` VALUES (241, 227, 241, b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `RolePermission` VALUES (242, 228, 242, b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `RolePermission` VALUES (243, 229, 243, b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `RolePermission` VALUES (244, 230, 244, b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `RolePermission` VALUES (245, 231, 245, b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `RolePermission` VALUES (246, 232, 246, b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `RolePermission` VALUES (247, 233, 247, b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `RolePermission` VALUES (248, 234, 248, b'0', 'admin', '2020-05-20 11:53:45', 'admin', '2020-05-20 11:53:45');
INSERT INTO `RolePermission` VALUES (249, 235, 249, b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `RolePermission` VALUES (250, 236, 250, b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `RolePermission` VALUES (251, 237, 251, b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `RolePermission` VALUES (252, 238, 252, b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `RolePermission` VALUES (253, 239, 253, b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `RolePermission` VALUES (254, 240, 254, b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `RolePermission` VALUES (255, 241, 256, b'0', 'admin', '2020-05-23 00:42:47', 'admin', '2020-05-23 00:42:47');
INSERT INTO `RolePermission` VALUES (256, 241, 257, b'0', 'admin', '2020-05-23 00:42:50', 'admin', '2020-05-23 00:42:50');
INSERT INTO `RolePermission` VALUES (257, 241, 255, b'0', 'admin', '2020-05-23 00:42:50', 'admin', '2020-05-23 00:42:50');
INSERT INTO `RolePermission` VALUES (258, 242, 258, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `RolePermission` VALUES (259, 243, 259, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `RolePermission` VALUES (260, 244, 260, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `RolePermission` VALUES (261, 245, 261, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `RolePermission` VALUES (262, 246, 262, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `RolePermission` VALUES (263, 247, 263, b'0', 'admin', '2020-05-23 00:50:36', 'admin', '2020-05-23 00:50:36');
INSERT INTO `RolePermission` VALUES (264, 248, 264, b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `RolePermission` VALUES (265, 249, 265, b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `RolePermission` VALUES (266, 250, 266, b'0', 'admin', '2020-05-23 00:50:37', 'admin', '2020-05-23 00:50:37');
INSERT INTO `RolePermission` VALUES (267, 251, 267, b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `RolePermission` VALUES (268, 252, 268, b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `RolePermission` VALUES (269, 253, 269, b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `RolePermission` VALUES (270, 254, 270, b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `RolePermission` VALUES (271, 255, 271, b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `RolePermission` VALUES (272, 256, 272, b'0', 'admin', '2020-05-23 00:55:49', 'admin', '2020-05-23 00:55:49');
INSERT INTO `RolePermission` VALUES (273, 257, 273, b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `RolePermission` VALUES (274, 258, 274, b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `RolePermission` VALUES (275, 259, 275, b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `RolePermission` VALUES (276, 260, 276, b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `RolePermission` VALUES (277, 261, 277, b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `RolePermission` VALUES (278, 262, 278, b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `RolePermission` VALUES (279, 263, 279, b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `RolePermission` VALUES (280, 264, 280, b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `RolePermission` VALUES (281, 265, 281, b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `RolePermission` VALUES (282, 266, 282, b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `RolePermission` VALUES (283, 267, 283, b'0', 'admin', '2020-05-23 01:01:03', 'admin', '2020-05-23 01:01:03');
INSERT INTO `RolePermission` VALUES (284, 268, 284, b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `RolePermission` VALUES (285, 269, 285, b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `RolePermission` VALUES (286, 270, 286, b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `RolePermission` VALUES (287, 271, 287, b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `RolePermission` VALUES (288, 272, 288, b'0', 'admin', '2020-05-23 01:03:23', 'admin', '2020-05-23 01:03:23');
INSERT INTO `RolePermission` VALUES (289, 273, 289, b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `RolePermission` VALUES (290, 274, 290, b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `RolePermission` VALUES (291, 275, 291, b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `RolePermission` VALUES (292, 276, 292, b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `RolePermission` VALUES (293, 277, 293, b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `RolePermission` VALUES (294, 278, 294, b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `RolePermission` VALUES (295, 279, 295, b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `RolePermission` VALUES (296, 280, 296, b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `RolePermission` VALUES (297, 281, 297, b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `RolePermission` VALUES (298, 282, 298, b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `RolePermission` VALUES (299, 283, 299, b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `RolePermission` VALUES (300, 284, 300, b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `RolePermission` VALUES (301, 285, 301, b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `RolePermission` VALUES (302, 286, 302, b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `RolePermission` VALUES (303, 287, 304, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (304, 287, 305, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (305, 287, 303, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (306, 288, 306, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (307, 289, 307, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (308, 290, 308, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (309, 291, 309, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (310, 292, 310, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `RolePermission` VALUES (311, 293, 311, b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `RolePermission` VALUES (312, 294, 312, b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `RolePermission` VALUES (313, 295, 313, b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `RolePermission` VALUES (314, 296, 314, b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `RolePermission` VALUES (315, 297, 315, b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `RolePermission` VALUES (316, 298, 316, b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `RolePermission` VALUES (317, 299, 317, b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `RolePermission` VALUES (318, 300, 318, b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `RolePermission` VALUES (319, 301, 319, b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `RolePermission` VALUES (320, 302, 320, b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `RolePermission` VALUES (321, 303, 321, b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `RolePermission` VALUES (322, 304, 322, b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `RolePermission` VALUES (323, 305, 323, b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `RolePermission` VALUES (324, 306, 324, b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `RolePermission` VALUES (325, 307, 325, b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `RolePermission` VALUES (326, 308, 326, b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `RolePermission` VALUES (327, 309, 327, b'0', 'admin', '2020-07-16 14:21:18', 'admin', '2020-07-16 14:21:18');
INSERT INTO `RolePermission` VALUES (328, 310, 328, b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `RolePermission` VALUES (329, 311, 329, b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `RolePermission` VALUES (330, 312, 330, b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `RolePermission` VALUES (331, 313, 331, b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `RolePermission` VALUES (332, 314, 332, b'0', 'admin', '2020-07-20 14:10:01', 'admin', '2020-07-20 14:10:01');
INSERT INTO `RolePermission` VALUES (333, 315, 333, b'0', 'admin', '2020-07-20 14:10:02', 'admin', '2020-07-20 14:10:02');
INSERT INTO `RolePermission` VALUES (334, 316, 334, b'0', 'admin', '2020-07-20 14:10:02', 'admin', '2020-07-20 14:10:02');
INSERT INTO `RolePermission` VALUES (335, 317, 335, b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `RolePermission` VALUES (336, 318, 336, b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `RolePermission` VALUES (337, 319, 337, b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `RolePermission` VALUES (338, 320, 338, b'0', 'admin', '2020-07-23 15:49:45', 'admin', '2020-07-23 15:49:45');
INSERT INTO `RolePermission` VALUES (339, 321, 339, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (340, 321, 340, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (341, 321, 341, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (342, 322, 342, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (343, 323, 343, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (344, 324, 344, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (345, 325, 345, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (346, 326, 346, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `RolePermission` VALUES (347, 327, 347, b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `RolePermission` VALUES (348, 328, 348, b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `RolePermission` VALUES (349, 329, 349, b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `RolePermission` VALUES (350, 330, 350, b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `RolePermission` VALUES (351, 331, 351, b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `RolePermission` VALUES (352, 332, 352, b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `RolePermission` VALUES (353, 333, 353, b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `RolePermission` VALUES (354, 334, 354, b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `ServerConfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `ServerConfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `ServerConfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `ServerConfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `ServerConfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `ServerConfig` VALUES (7, 'configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO `UserRole` VALUES (1, 'apollo', 1, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `UserRole` VALUES (2, 'apollo', 2, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `UserRole` VALUES (3, 'apollo', 3, b'0', '', '2019-11-05 10:07:38', '', '2019-11-05 10:07:38');
INSERT INTO `UserRole` VALUES (4, 'admin', 5, b'1', 'admin', '2019-11-05 23:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (5, 'admin', 7, b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (6, 'admin', 8, b'1', 'admin', '2019-11-05 23:42:41', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (7, 'admin', 11, b'1', 'admin', '2019-11-05 23:43:26', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (8, 'admin', 12, b'1', 'admin', '2019-11-05 23:43:26', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (9, 'admin', 15, b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (10, 'admin', 16, b'1', 'admin', '2019-11-05 23:43:49', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (11, 'admin', 19, b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (12, 'admin', 20, b'1', 'admin', '2019-11-05 23:44:23', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (13, 'admin', 23, b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (14, 'admin', 24, b'1', 'admin', '2019-11-05 23:44:47', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (15, 'admin', 27, b'1', 'admin', '2019-11-05 23:45:33', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (16, 'admin', 28, b'1', 'admin', '2019-11-05 23:45:33', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (17, 'admin', 31, b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (18, 'admin', 32, b'1', 'admin', '2019-11-07 09:42:40', 'apollo', '2019-12-02 12:00:41');
INSERT INTO `UserRole` VALUES (19, 'apollo', 35, b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `UserRole` VALUES (20, 'apollo', 37, b'0', 'apollo', '2019-12-02 11:36:13', 'apollo', '2019-12-02 11:36:13');
INSERT INTO `UserRole` VALUES (21, 'apollo', 38, b'0', 'apollo', '2019-12-02 11:36:14', 'apollo', '2019-12-02 11:36:14');
INSERT INTO `UserRole` VALUES (22, 'apollo', 41, b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `UserRole` VALUES (23, 'apollo', 42, b'0', 'apollo', '2019-12-02 11:57:42', 'apollo', '2019-12-02 11:57:42');
INSERT INTO `UserRole` VALUES (24, 'admin', 41, b'0', 'apollo', '2019-12-02 11:57:58', 'apollo', '2019-12-02 11:57:58');
INSERT INTO `UserRole` VALUES (25, 'admin', 42, b'0', 'apollo', '2019-12-02 11:58:08', 'apollo', '2019-12-02 11:58:08');
INSERT INTO `UserRole` VALUES (26, 'apollo', 45, b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `UserRole` VALUES (27, 'apollo', 46, b'0', 'apollo', '2019-12-02 11:58:27', 'apollo', '2019-12-02 11:58:27');
INSERT INTO `UserRole` VALUES (28, 'admin', 45, b'0', 'apollo', '2019-12-02 11:59:00', 'apollo', '2019-12-02 11:59:00');
INSERT INTO `UserRole` VALUES (29, 'admin', 46, b'0', 'apollo', '2019-12-02 11:59:04', 'apollo', '2019-12-02 11:59:04');
INSERT INTO `UserRole` VALUES (30, 'apollo', 49, b'0', 'apollo', '2019-12-02 12:02:08', 'apollo', '2019-12-02 12:02:08');
INSERT INTO `UserRole` VALUES (31, 'apollo', 50, b'0', 'apollo', '2019-12-02 12:02:08', 'apollo', '2019-12-02 12:02:08');
INSERT INTO `UserRole` VALUES (32, 'admin', 49, b'0', 'apollo', '2019-12-02 12:02:13', 'apollo', '2019-12-02 12:02:13');
INSERT INTO `UserRole` VALUES (33, 'admin', 50, b'0', 'apollo', '2019-12-02 12:02:16', 'apollo', '2019-12-02 12:02:16');
INSERT INTO `UserRole` VALUES (34, 'apollo', 53, b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `UserRole` VALUES (35, 'apollo', 54, b'0', 'apollo', '2019-12-02 12:02:31', 'apollo', '2019-12-02 12:02:31');
INSERT INTO `UserRole` VALUES (36, 'admin', 53, b'0', 'apollo', '2019-12-02 12:02:35', 'apollo', '2019-12-02 12:02:35');
INSERT INTO `UserRole` VALUES (37, 'admin', 54, b'0', 'apollo', '2019-12-02 12:02:37', 'apollo', '2019-12-02 12:02:37');
INSERT INTO `UserRole` VALUES (38, 'apollo', 57, b'0', 'apollo', '2019-12-02 12:02:51', 'apollo', '2019-12-02 12:02:51');
INSERT INTO `UserRole` VALUES (39, 'apollo', 58, b'0', 'apollo', '2019-12-02 12:02:52', 'apollo', '2019-12-02 12:02:52');
INSERT INTO `UserRole` VALUES (40, 'admin', 57, b'0', 'apollo', '2019-12-02 12:02:56', 'apollo', '2019-12-02 12:02:56');
INSERT INTO `UserRole` VALUES (41, 'admin', 58, b'0', 'apollo', '2019-12-02 12:02:58', 'apollo', '2019-12-02 12:02:58');
INSERT INTO `UserRole` VALUES (42, 'apollo', 61, b'0', 'apollo', '2019-12-02 12:03:31', 'apollo', '2019-12-02 12:03:31');
INSERT INTO `UserRole` VALUES (43, 'apollo', 62, b'0', 'apollo', '2019-12-02 12:03:31', 'apollo', '2019-12-02 12:03:31');
INSERT INTO `UserRole` VALUES (44, 'admin', 61, b'0', 'apollo', '2019-12-02 12:03:39', 'apollo', '2019-12-02 12:03:39');
INSERT INTO `UserRole` VALUES (45, 'admin', 62, b'0', 'apollo', '2019-12-02 12:03:41', 'apollo', '2019-12-02 12:03:41');
INSERT INTO `UserRole` VALUES (46, 'apollo', 65, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `UserRole` VALUES (47, 'apollo', 67, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `UserRole` VALUES (48, 'apollo', 68, b'0', 'apollo', '2019-12-04 18:54:45', 'apollo', '2019-12-04 18:54:45');
INSERT INTO `UserRole` VALUES (49, 'apollo', 71, b'0', 'apollo', '2019-12-04 19:01:34', 'apollo', '2019-12-04 19:01:34');
INSERT INTO `UserRole` VALUES (50, 'apollo', 72, b'0', 'apollo', '2019-12-04 19:01:34', 'apollo', '2019-12-04 19:01:34');
INSERT INTO `UserRole` VALUES (51, 'apollo', 75, b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `UserRole` VALUES (52, 'apollo', 76, b'0', 'apollo', '2019-12-04 19:03:40', 'apollo', '2019-12-04 19:03:40');
INSERT INTO `UserRole` VALUES (53, 'apollo', 79, b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `UserRole` VALUES (54, 'apollo', 80, b'0', 'apollo', '2019-12-04 19:04:25', 'apollo', '2019-12-04 19:04:25');
INSERT INTO `UserRole` VALUES (55, 'apollo', 83, b'0', 'apollo', '2019-12-04 19:04:37', 'apollo', '2019-12-04 19:04:37');
INSERT INTO `UserRole` VALUES (56, 'apollo', 84, b'0', 'apollo', '2019-12-04 19:04:38', 'apollo', '2019-12-04 19:04:38');
INSERT INTO `UserRole` VALUES (57, 'apollo', 87, b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `UserRole` VALUES (58, 'apollo', 88, b'0', 'apollo', '2019-12-04 19:04:53', 'apollo', '2019-12-04 19:04:53');
INSERT INTO `UserRole` VALUES (59, 'apollo', 91, b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `UserRole` VALUES (60, 'apollo', 92, b'0', 'apollo', '2019-12-04 19:05:12', 'apollo', '2019-12-04 19:05:12');
INSERT INTO `UserRole` VALUES (61, 'apollo', 95, b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `UserRole` VALUES (62, 'apollo', 96, b'0', 'apollo', '2019-12-24 15:39:15', 'apollo', '2019-12-24 15:39:15');
INSERT INTO `UserRole` VALUES (63, 'apollo', 99, b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `UserRole` VALUES (64, 'apollo', 100, b'0', 'apollo', '2019-12-24 16:18:24', 'apollo', '2019-12-24 16:18:24');
INSERT INTO `UserRole` VALUES (65, 'admin', 103, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `UserRole` VALUES (66, 'admin', 105, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `UserRole` VALUES (67, 'admin', 106, b'0', 'admin', '2020-03-04 14:46:05', 'admin', '2020-03-04 14:46:05');
INSERT INTO `UserRole` VALUES (68, 'admin', 109, b'1', 'admin', '2020-03-04 15:21:36', 'apollo', '2020-03-04 07:37:32');
INSERT INTO `UserRole` VALUES (69, 'admin', 110, b'1', 'admin', '2020-03-04 15:21:37', 'apollo', '2020-03-04 07:37:32');
INSERT INTO `UserRole` VALUES (70, 'admin', 113, b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `UserRole` VALUES (71, 'admin', 114, b'0', 'admin', '2020-03-04 15:38:29', 'admin', '2020-03-04 15:38:29');
INSERT INTO `UserRole` VALUES (72, 'admin', 117, b'0', 'admin', '2020-03-04 15:40:44', 'admin', '2020-03-04 15:40:44');
INSERT INTO `UserRole` VALUES (73, 'admin', 118, b'0', 'admin', '2020-03-04 15:40:44', 'admin', '2020-03-04 15:40:44');
INSERT INTO `UserRole` VALUES (74, 'admin', 121, b'0', 'admin', '2020-05-11 13:55:45', 'admin', '2020-05-11 13:55:45');
INSERT INTO `UserRole` VALUES (75, 'admin', 123, b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `UserRole` VALUES (76, 'admin', 124, b'0', 'admin', '2020-05-11 13:55:46', 'admin', '2020-05-11 13:55:46');
INSERT INTO `UserRole` VALUES (77, 'admin', 127, b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `UserRole` VALUES (78, 'admin', 128, b'0', 'admin', '2020-05-11 14:02:40', 'admin', '2020-05-11 14:02:40');
INSERT INTO `UserRole` VALUES (79, 'admin', 131, b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `UserRole` VALUES (80, 'admin', 132, b'0', 'admin', '2020-05-11 14:03:30', 'admin', '2020-05-11 14:03:30');
INSERT INTO `UserRole` VALUES (81, 'admin', 135, b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `UserRole` VALUES (82, 'admin', 136, b'0', 'admin', '2020-05-11 14:04:53', 'admin', '2020-05-11 14:04:53');
INSERT INTO `UserRole` VALUES (83, 'admin', 139, b'0', 'admin', '2020-05-11 14:05:40', 'admin', '2020-05-11 14:05:40');
INSERT INTO `UserRole` VALUES (84, 'admin', 140, b'0', 'admin', '2020-05-11 14:05:41', 'admin', '2020-05-11 14:05:41');
INSERT INTO `UserRole` VALUES (85, 'admin', 143, b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `UserRole` VALUES (86, 'admin', 144, b'0', 'admin', '2020-05-11 14:06:53', 'admin', '2020-05-11 14:06:53');
INSERT INTO `UserRole` VALUES (87, 'admin', 147, b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `UserRole` VALUES (88, 'admin', 148, b'0', 'admin', '2020-05-11 14:07:35', 'admin', '2020-05-11 14:07:35');
INSERT INTO `UserRole` VALUES (89, 'admin', 151, b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `UserRole` VALUES (90, 'admin', 152, b'0', 'admin', '2020-05-11 14:08:31', 'admin', '2020-05-11 14:08:31');
INSERT INTO `UserRole` VALUES (91, 'admin', 155, b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `UserRole` VALUES (92, 'admin', 156, b'0', 'admin', '2020-05-11 14:09:42', 'admin', '2020-05-11 14:09:42');
INSERT INTO `UserRole` VALUES (93, 'admin', 159, b'0', 'admin', '2020-05-11 14:10:33', 'admin', '2020-05-11 14:10:33');
INSERT INTO `UserRole` VALUES (94, 'admin', 160, b'0', 'admin', '2020-05-11 14:10:33', 'admin', '2020-05-11 14:10:33');
INSERT INTO `UserRole` VALUES (95, 'admin', 163, b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `UserRole` VALUES (96, 'admin', 164, b'0', 'admin', '2020-05-11 14:11:20', 'admin', '2020-05-11 14:11:20');
INSERT INTO `UserRole` VALUES (97, 'admin', 167, b'0', 'admin', '2020-05-11 14:12:36', 'admin', '2020-05-11 14:12:36');
INSERT INTO `UserRole` VALUES (98, 'admin', 168, b'0', 'admin', '2020-05-11 14:12:36', 'admin', '2020-05-11 14:12:36');
INSERT INTO `UserRole` VALUES (99, 'admin', 171, b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `UserRole` VALUES (100, 'admin', 172, b'0', 'admin', '2020-05-11 14:13:22', 'admin', '2020-05-11 14:13:22');
INSERT INTO `UserRole` VALUES (101, 'admin', 175, b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `UserRole` VALUES (102, 'admin', 176, b'0', 'admin', '2020-05-11 14:13:57', 'admin', '2020-05-11 14:13:57');
INSERT INTO `UserRole` VALUES (103, 'admin', 179, b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `UserRole` VALUES (104, 'admin', 180, b'0', 'admin', '2020-05-11 14:14:48', 'admin', '2020-05-11 14:14:48');
INSERT INTO `UserRole` VALUES (105, 'admin', 183, b'0', 'admin', '2020-05-11 14:15:45', 'admin', '2020-05-11 14:15:45');
INSERT INTO `UserRole` VALUES (106, 'admin', 184, b'0', 'admin', '2020-05-11 14:15:46', 'admin', '2020-05-11 14:15:46');
INSERT INTO `UserRole` VALUES (107, 'admin', 187, b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `UserRole` VALUES (108, 'admin', 188, b'0', 'admin', '2020-05-11 14:16:46', 'admin', '2020-05-11 14:16:46');
INSERT INTO `UserRole` VALUES (109, 'admin', 191, b'0', 'admin', '2020-05-11 14:17:43', 'admin', '2020-05-11 14:17:43');
INSERT INTO `UserRole` VALUES (110, 'admin', 192, b'0', 'admin', '2020-05-11 14:17:43', 'admin', '2020-05-11 14:17:43');
INSERT INTO `UserRole` VALUES (111, 'admin', 195, b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `UserRole` VALUES (112, 'admin', 196, b'0', 'admin', '2020-05-11 14:18:37', 'admin', '2020-05-11 14:18:37');
INSERT INTO `UserRole` VALUES (113, 'admin', 199, b'0', 'admin', '2020-05-20 11:31:54', 'admin', '2020-05-20 11:31:54');
INSERT INTO `UserRole` VALUES (114, 'admin', 201, b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `UserRole` VALUES (115, 'admin', 202, b'0', 'admin', '2020-05-20 11:31:55', 'admin', '2020-05-20 11:31:55');
INSERT INTO `UserRole` VALUES (116, 'admin', 205, b'0', 'admin', '2020-05-20 11:40:37', 'admin', '2020-05-20 11:40:37');
INSERT INTO `UserRole` VALUES (117, 'admin', 206, b'0', 'admin', '2020-05-20 11:40:37', 'admin', '2020-05-20 11:40:37');
INSERT INTO `UserRole` VALUES (118, 'admin', 209, b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `UserRole` VALUES (119, 'admin', 210, b'0', 'admin', '2020-05-20 11:42:04', 'admin', '2020-05-20 11:42:04');
INSERT INTO `UserRole` VALUES (120, 'admin', 213, b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `UserRole` VALUES (121, 'admin', 214, b'0', 'admin', '2020-05-20 11:42:43', 'admin', '2020-05-20 11:42:43');
INSERT INTO `UserRole` VALUES (122, 'admin', 217, b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `UserRole` VALUES (123, 'admin', 218, b'0', 'admin', '2020-05-20 11:43:16', 'admin', '2020-05-20 11:43:16');
INSERT INTO `UserRole` VALUES (124, 'admin', 221, b'0', 'admin', '2020-05-20 11:44:33', 'admin', '2020-05-20 11:44:33');
INSERT INTO `UserRole` VALUES (125, 'admin', 222, b'0', 'admin', '2020-05-20 11:44:33', 'admin', '2020-05-20 11:44:33');
INSERT INTO `UserRole` VALUES (126, 'admin', 225, b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `UserRole` VALUES (127, 'admin', 226, b'0', 'admin', '2020-05-20 11:45:55', 'admin', '2020-05-20 11:45:55');
INSERT INTO `UserRole` VALUES (128, 'admin', 229, b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `UserRole` VALUES (129, 'admin', 230, b'0', 'admin', '2020-05-20 11:46:23', 'admin', '2020-05-20 11:46:23');
INSERT INTO `UserRole` VALUES (130, 'admin', 233, b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `UserRole` VALUES (131, 'admin', 234, b'0', 'admin', '2020-05-20 11:53:46', 'admin', '2020-05-20 11:53:46');
INSERT INTO `UserRole` VALUES (132, 'admin', 237, b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `UserRole` VALUES (133, 'admin', 238, b'0', 'admin', '2020-05-20 11:54:45', 'admin', '2020-05-20 11:54:45');
INSERT INTO `UserRole` VALUES (134, 'admin', 241, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `UserRole` VALUES (135, 'admin', 243, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `UserRole` VALUES (136, 'admin', 244, b'0', 'admin', '2020-05-23 00:42:51', 'admin', '2020-05-23 00:42:51');
INSERT INTO `UserRole` VALUES (137, 'admin', 247, b'0', 'admin', '2020-05-23 00:50:38', 'admin', '2020-05-23 00:50:38');
INSERT INTO `UserRole` VALUES (138, 'admin', 248, b'0', 'admin', '2020-05-23 00:50:39', 'admin', '2020-05-23 00:50:39');
INSERT INTO `UserRole` VALUES (139, 'admin', 251, b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `UserRole` VALUES (140, 'admin', 252, b'0', 'admin', '2020-05-23 00:55:04', 'admin', '2020-05-23 00:55:04');
INSERT INTO `UserRole` VALUES (141, 'admin', 255, b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `UserRole` VALUES (142, 'admin', 256, b'0', 'admin', '2020-05-23 00:55:50', 'admin', '2020-05-23 00:55:50');
INSERT INTO `UserRole` VALUES (143, 'admin', 259, b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `UserRole` VALUES (144, 'admin', 260, b'0', 'admin', '2020-05-23 00:57:41', 'admin', '2020-05-23 00:57:41');
INSERT INTO `UserRole` VALUES (145, 'admin', 263, b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `UserRole` VALUES (146, 'admin', 264, b'0', 'admin', '2020-05-23 00:59:17', 'admin', '2020-05-23 00:59:17');
INSERT INTO `UserRole` VALUES (147, 'admin', 267, b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `UserRole` VALUES (148, 'admin', 268, b'0', 'admin', '2020-05-23 01:01:04', 'admin', '2020-05-23 01:01:04');
INSERT INTO `UserRole` VALUES (149, 'admin', 271, b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `UserRole` VALUES (150, 'admin', 272, b'0', 'admin', '2020-05-23 01:03:24', 'admin', '2020-05-23 01:03:24');
INSERT INTO `UserRole` VALUES (151, 'admin', 275, b'0', 'admin', '2020-05-23 01:04:40', 'admin', '2020-05-23 01:04:40');
INSERT INTO `UserRole` VALUES (152, 'admin', 276, b'0', 'admin', '2020-05-23 01:04:41', 'admin', '2020-05-23 01:04:41');
INSERT INTO `UserRole` VALUES (153, 'admin', 279, b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `UserRole` VALUES (154, 'admin', 280, b'0', 'admin', '2020-05-25 15:18:31', 'admin', '2020-05-25 15:18:31');
INSERT INTO `UserRole` VALUES (155, 'admin', 283, b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `UserRole` VALUES (156, 'admin', 284, b'0', 'admin', '2020-05-25 16:29:13', 'admin', '2020-05-25 16:29:13');
INSERT INTO `UserRole` VALUES (157, 'admin', 287, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `UserRole` VALUES (158, 'admin', 289, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `UserRole` VALUES (159, 'admin', 290, b'0', 'admin', '2020-07-07 11:44:02', 'admin', '2020-07-07 11:44:02');
INSERT INTO `UserRole` VALUES (160, 'admin', 293, b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `UserRole` VALUES (161, 'admin', 294, b'0', 'admin', '2020-07-07 14:27:31', 'admin', '2020-07-07 14:27:31');
INSERT INTO `UserRole` VALUES (162, 'admin', 297, b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `UserRole` VALUES (163, 'admin', 298, b'0', 'admin', '2020-07-07 14:36:06', 'admin', '2020-07-07 14:36:06');
INSERT INTO `UserRole` VALUES (164, 'admin', 301, b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `UserRole` VALUES (165, 'admin', 302, b'0', 'admin', '2020-07-07 14:36:59', 'admin', '2020-07-07 14:36:59');
INSERT INTO `UserRole` VALUES (166, 'admin', 305, b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `UserRole` VALUES (167, 'admin', 306, b'0', 'admin', '2020-07-07 14:46:16', 'admin', '2020-07-07 14:46:16');
INSERT INTO `UserRole` VALUES (168, 'admin', 309, b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `UserRole` VALUES (169, 'admin', 310, b'0', 'admin', '2020-07-16 14:21:19', 'admin', '2020-07-16 14:21:19');
INSERT INTO `UserRole` VALUES (170, 'admin', 313, b'0', 'admin', '2020-07-20 14:10:02', 'admin', '2020-07-20 14:10:02');
INSERT INTO `UserRole` VALUES (171, 'admin', 314, b'0', 'admin', '2020-07-20 14:10:02', 'admin', '2020-07-20 14:10:02');
INSERT INTO `UserRole` VALUES (172, 'admin', 317, b'0', 'admin', '2020-07-23 15:49:46', 'admin', '2020-07-23 15:49:46');
INSERT INTO `UserRole` VALUES (173, 'admin', 318, b'0', 'admin', '2020-07-23 15:49:46', 'admin', '2020-07-23 15:49:46');
INSERT INTO `UserRole` VALUES (174, 'admin', 321, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `UserRole` VALUES (175, 'admin', 323, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `UserRole` VALUES (176, 'admin', 324, b'0', 'admin', '2020-12-12 02:36:11', 'admin', '2020-12-12 02:36:11');
INSERT INTO `UserRole` VALUES (177, 'admin', 327, b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `UserRole` VALUES (178, 'admin', 328, b'0', 'admin', '2020-12-12 02:40:08', 'admin', '2020-12-12 02:40:08');
INSERT INTO `UserRole` VALUES (179, 'admin', 331, b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');
INSERT INTO `UserRole` VALUES (180, 'admin', 332, b'0', 'admin', '2020-12-12 02:43:49', 'admin', '2020-12-12 02:43:49');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(0) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);
INSERT INTO `Users` VALUES (2, 'admin', '$2a$10$fuy.wqxFn8J.C8kKvaVnv.9UdB7FqEWq2l0D7olUpPwCdYeDxXRNG', 'tanbinyuan@do1.com.cn', 1);

SET FOREIGN_KEY_CHECKS = 1;
