/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 30/05/2021 17:01:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rno` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房号（外键）',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修内容',
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修者',
  `repair_status` int(1) NOT NULL COMMENT '房间维修状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reapir_rno`(`rno`) USING BTREE,
  INDEX `name`(`user_name`) USING BTREE,
  INDEX `repair_status`(`repair_status`) USING BTREE,
  CONSTRAINT `name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reapir_rno` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `repair_status` FOREIGN KEY (`repair_status`) REFERENCES `room` (`repair_status`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES (1, '101', '陈彦圳', '马桶塞了', 0);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `rno` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房号',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房型',
  `status` int(1) NOT NULL COMMENT '房间居住状态： 0-空 1-正在使用',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '房价',
  `repair_status` int(1) NOT NULL COMMENT '房间维修状态 ： 0-维护完成 1-维护中 ',
  PRIMARY KEY (`rno`) USING BTREE,
  INDEX `repair_status`(`repair_status`) USING BTREE,
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`repair_status`) REFERENCES `repair` (`repair_status`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('101', 'big', 0, 30000.00, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `user_pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `power` int(1) NULL DEFAULT NULL COMMENT '权限：0-顾客 1-管理者 2-维护者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '11122288779', '445544666606789456', 1);
INSERT INTO `user` VALUES (2, 'worker1', 'worker1', '561351', '1216121', 2);
INSERT INTO `user` VALUES (3, '陈彦圳', '123', '15361389739', '440583200006261014', 0);
INSERT INTO `user` VALUES (4, '孔伟豪', '456', '13690642961', '440682199912171014', 0);
INSERT INTO `user` VALUES (5, '1', '2', '3', '4', 5);
INSERT INTO `user` VALUES (6, '1', '2', '3', '4', 5);

-- ----------------------------
-- Table structure for user_room
-- ----------------------------
DROP TABLE IF EXISTS `user_room`;
CREATE TABLE `user_room`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `rno` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房号（外键）',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字（外键）',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话（外键）',
  `time_start` date NOT NULL COMMENT '预订起始时间',
  `time_end` date NOT NULL COMMENT '预订结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rno`(`rno`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  CONSTRAINT `phone` FOREIGN KEY (`phone`) REFERENCES `user` (`phone`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rno` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_room
-- ----------------------------
INSERT INTO `user_room` VALUES (1, '101', '陈彦圳', '15361389739', '2021-05-29', '2021-05-30');
INSERT INTO `user_room` VALUES (3, '101', '孔伟豪', '13690642961', '2021-06-01', '2021-06-30');
INSERT INTO `user_room` VALUES (4, '101', '陈彦圳', '15361389739', '2021-07-01', '2021-07-20');

SET FOREIGN_KEY_CHECKS = 1;
