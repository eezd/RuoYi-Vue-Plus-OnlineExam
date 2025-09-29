/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : ruoyi_vue_plus_online_exam

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 29/09/2025 21:19:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `edu_question_bank`;
CREATE TABLE `edu_question_bank`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题库ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `bank_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题库名称',
  `bank_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题库描述',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1972218357127794690 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_question_bank
-- ----------------------------
INSERT INTO `edu_question_bank` VALUES (1972218357127794689, '000000', '测试题库', '123', 1, '0', NULL, 103, '2025-09-28 16:34:33', 1, '2025-09-29 21:04:39', 1);

-- ----------------------------
-- Table structure for edu_question_bank_category
-- ----------------------------
DROP TABLE IF EXISTS `edu_question_bank_category`;
CREATE TABLE `edu_question_bank_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级分类ID，根节点为0',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1972551817025511426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题库分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_question_bank_category
-- ----------------------------
INSERT INTO `edu_question_bank_category` VALUES (1, '000000', 0, '题库分类', NULL, 0, '0', NULL, 103, '2025-09-28 16:09:40', 1, '2025-09-28 16:09:40', 1);
INSERT INTO `edu_question_bank_category` VALUES (1972292834104664065, '000000', 0, '初一', NULL, 1, '0', NULL, 103, '2025-09-28 21:30:30', 1, '2025-09-28 21:46:02', 1);
INSERT INTO `edu_question_bank_category` VALUES (1972292862084866050, '000000', 1972292834104664065, '语文', NULL, 1, '0', NULL, 103, '2025-09-28 21:30:36', 1, '2025-09-28 21:49:49', 1);
INSERT INTO `edu_question_bank_category` VALUES (1972292880988594177, '000000', 1972292834104664065, '数学', NULL, 2, '0', NULL, 103, '2025-09-28 21:30:41', 1, '2025-09-28 21:49:38', 1);

SET FOREIGN_KEY_CHECKS = 1;
