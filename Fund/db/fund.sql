/*
 Navicat Premium Data Transfer

 Source Server         : 虚拟机mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 192.168.2.5:3306
 Source Schema         : fund

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 21/01/2021 03:23:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_fund
-- ----------------------------
DROP TABLE IF EXISTS `t_fund`;
CREATE TABLE `t_fund`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基金代码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基金名称',
  `type_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基金类型',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基金公司id',
  `org_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基金公司名称',
  `newnet` double NULL DEFAULT NULL COMMENT '最新市净值',
  `newtotalnet` double NULL DEFAULT NULL COMMENT '最新累计净值',
  `week` double NULL DEFAULT NULL COMMENT '近一周',
  `month` double NULL DEFAULT NULL COMMENT '近一月',
  `three_month` double NULL DEFAULT NULL COMMENT '近三个月',
  `six_month` double NULL DEFAULT NULL COMMENT '近6个月',
  `year` double NULL DEFAULT NULL COMMENT '近一年',
  `two_year` double NULL DEFAULT NULL COMMENT '近两年',
  `three_year` double NULL DEFAULT NULL COMMENT '近三年',
  `near_year` double NULL DEFAULT NULL COMMENT '近一年',
  `all_time` double NULL DEFAULT NULL COMMENT '成立以来',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE,
  INDEX `index_year`(`year`) USING BTREE,
  INDEX `index_week`(`week`) USING BTREE,
  INDEX `index_month`(`month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_fund_extend
-- ----------------------------
DROP TABLE IF EXISTS `t_fund_extend`;
CREATE TABLE `t_fund_extend`  (
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '基金编码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基金名称',
  `dwjz_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '历史净值',
  `ljjz_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '累积净值',
  `rise_week` smallint(0) NULL DEFAULT NULL COMMENT '连涨周数',
  `theme` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`code`) USING BTREE,
  INDEX `index_rise`(`rise_week`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `t_fund_new` (
  `id` bigint NOT NULL COMMENT '主键',
  `code` varchar(16) DEFAULT NULL COMMENT '基金代码',
  `name` varchar(128) DEFAULT NULL COMMENT '基金名称',
  `type` varchar(16) DEFAULT NULL COMMENT '基金类型',
  `net` double DEFAULT NULL COMMENT '最新市净值',
  `totalnet` double DEFAULT NULL COMMENT '最新累计净值',
  `week` double DEFAULT NULL COMMENT '近一周',
  `month` double DEFAULT NULL COMMENT '近一月',
  `three_month` double DEFAULT NULL COMMENT '近三个月',
  `six_month` double DEFAULT NULL COMMENT '近6个月',
  `year` double DEFAULT NULL COMMENT '近一年',
  `two_year` double DEFAULT NULL COMMENT '近两年',
  `three_year` double DEFAULT NULL COMMENT '近三年',
  `near_year` double DEFAULT NULL COMMENT '近一年',
  `all_time` double DEFAULT NULL COMMENT '成立以来',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`code`),
  KEY `index_year` (`year`) USING BTREE,
  KEY `index_week` (`week`) USING BTREE,
  KEY `index_month` (`month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
