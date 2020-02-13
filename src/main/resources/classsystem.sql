/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : classsystem

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-02-13 16:33:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `max_num` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '实验1班', '3', '实验', '1');
INSERT INTO `class` VALUES ('2', '实验2班', '3', '实验', '1');
INSERT INTO `class` VALUES ('3', '创新1班', '5', '创新', '2');
INSERT INTO `class` VALUES ('4', '创新2班', '5', '创新', '2');
INSERT INTO `class` VALUES ('5', '普通1班', '6', '普通', '3');
INSERT INTO `class` VALUES ('6', '普通2班', '6', '普通', '3');
INSERT INTO `class` VALUES ('7', '普通3班', '6', '普通', '3');

-- ----------------------------
-- Table structure for classtype
-- ----------------------------
DROP TABLE IF EXISTS `classtype`;
CREATE TABLE `classtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classtype
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_card` varchar(18) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `total_grade` double DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '张三', '1', '男', '435', null, '保送', '1');
INSERT INTO `student` VALUES ('2', '李四', '2', '男', '400', null, '保送', '1');
INSERT INTO `student` VALUES ('3', '王五', '3', '男', '300', null, '保送', '1');
INSERT INTO `student` VALUES ('4', '陈六', '4', '男', '350', null, '统招', '2');
INSERT INTO `student` VALUES ('5', '女一', '5', '女', '258', null, '保送', '1');
INSERT INTO `student` VALUES ('6', '女二', '6', '女', '433', null, '统招', '2');
INSERT INTO `student` VALUES ('7', '女三', '7', '女', '366', null, '统招', '2');
INSERT INTO `student` VALUES ('8', '女四', '8', '女', '397', null, '保送', '1');
