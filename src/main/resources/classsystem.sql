/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : classsystem

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-05-22 12:00:14
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
  `boy_num` int(11) DEFAULT NULL,
  `girl_num` int(255) DEFAULT NULL,
  `average_score` double(255,2) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `flag` int(1) DEFAULT '1' COMMENT '分班起始标志',
  `belonging` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for followstudent
-- ----------------------------
DROP TABLE IF EXISTS `followstudent`;
CREATE TABLE `followstudent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_card` varchar(18) NOT NULL COMMENT '身份证',
  `sex` varchar(255) NOT NULL,
  `total_grade` double(11,0) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `patriarch` varchar(255) DEFAULT NULL COMMENT '家长',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followstudent
-- ----------------------------

-- ----------------------------
-- Table structure for lock_table
-- ----------------------------
DROP TABLE IF EXISTS `lock_table`;
CREATE TABLE `lock_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `is_lock` int(11) DEFAULT '0',
  `dsc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lock_table
-- ----------------------------
INSERT INTO `lock_table` VALUES ('1', '思明高中', '0', 'simingG');
INSERT INTO `lock_table` VALUES ('2', '思明初中', '0', 'simingC');
INSERT INTO `lock_table` VALUES ('3', '翔安高中', '0', 'xianganG');
INSERT INTO `lock_table` VALUES ('4', '翔安初中', '0', 'xianganC');

-- ----------------------------
-- Table structure for opera_record
-- ----------------------------
DROP TABLE IF EXISTS `opera_record`;
CREATE TABLE `opera_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `module` varchar(200) DEFAULT NULL,
  `discription` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `belonging` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opera_record
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '/addUser', 'addUser', '添加用户', '9');
INSERT INTO `permission` VALUES ('2', '/findAllUsers', 'findAllUsers', '查询所有用户', '9');
INSERT INTO `permission` VALUES ('3', '/updateUser', 'updateUser', '更新用户', '9');
INSERT INTO `permission` VALUES ('4', '/deleteUser/**', 'deleteUser', '删除用户', '9');
INSERT INTO `permission` VALUES ('5', '/main', 'simingG', '思明区高中', '0');
INSERT INTO `permission` VALUES ('6', '/main', 'simingC', '思明区初中', '0');
INSERT INTO `permission` VALUES ('7', '/main', 'xianganG', '翔安区高中', '0');
INSERT INTO `permission` VALUES ('8', '/main', 'xianganC', '翔安区初中', '0');
INSERT INTO `permission` VALUES ('9', '/main', 'manage', '系统管理', '0');
INSERT INTO `permission` VALUES ('10', '/showStudents/**', 'showStudents-simingG', '花名册', '5');
INSERT INTO `permission` VALUES ('11', '/addClass/**', 'addClass-simingG', '创建班级', '5');
INSERT INTO `permission` VALUES ('12', '/showClass/**', 'showClass-simingG', '班级列表', '5');
INSERT INTO `permission` VALUES ('13', '/devideClass/**', 'devideClass-simingG', '分班', '5');
INSERT INTO `permission` VALUES ('14', '/showQualityStudents/**', 'showQualityStudents-simingG', '优质生源导入', '5');
INSERT INTO `permission` VALUES ('15', '/showStudents/**', 'showStudents-simingC', '花名册', '6');
INSERT INTO `permission` VALUES ('16', '/addClass/**', 'addClass-simingC', '创建班级', '6');
INSERT INTO `permission` VALUES ('17', '/showClass/**', 'showClass-simingC', '班级列表', '6');
INSERT INTO `permission` VALUES ('18', '/devideClass/**', 'devideClass-simingC', '分班', '6');
INSERT INTO `permission` VALUES ('19', '/showQualityStudents/**', 'showQualityStudents-simingC', '优质生源导入', '6');
INSERT INTO `permission` VALUES ('20', '/showStudents/**', 'showStudents-xianganG', '花名册', '7');
INSERT INTO `permission` VALUES ('21', '/addClass/**', 'addClass-xianganG', '创建班级', '7');
INSERT INTO `permission` VALUES ('22', '/showClass/**', 'showClass-xianganG', '班级列表', '7');
INSERT INTO `permission` VALUES ('23', '/devideClass/**', 'devideClass-xianganG', '分班', '7');
INSERT INTO `permission` VALUES ('24', '/showQualityStudents/**', 'showQualityStudents-xianganG', '优质生源导入', '7');
INSERT INTO `permission` VALUES ('25', '/showStudents/**', 'showStudents-xianganC', '花名册', '8');
INSERT INTO `permission` VALUES ('26', '/addClass/**', 'addClass-xianganC', '创建班级', '8');
INSERT INTO `permission` VALUES ('27', '/showClass/**', 'showClass-xianganC', '班级列表', '8');
INSERT INTO `permission` VALUES ('28', '/devideClass/**', 'devideClass-xianganC', '分班', '8');
INSERT INTO `permission` VALUES ('29', '/showQualityStudents/**', 'showQualityStudents-xianganC', '优质生源导入', '8');
INSERT INTO `permission` VALUES ('35', '/importFile', 'importFile-simingC', '导入', '6');
INSERT INTO `permission` VALUES ('36', '/deleteAll/**', 'deleteAll-simingC', '清空学生', '6');
INSERT INTO `permission` VALUES ('37', '/importFile', 'importFile-simingG', '导入', '5');
INSERT INTO `permission` VALUES ('38', '/importFile', 'importFile-xianganG', '导入', '7');
INSERT INTO `permission` VALUES ('39', '/importFile', 'importFile-xianganC', '导入', '8');
INSERT INTO `permission` VALUES ('40', '/deleteAll', 'deleteAll-simingG', '清空学生', '5');
INSERT INTO `permission` VALUES ('41', '/deleteAll', 'deleteAll-xianganG', '清空学生', '7');
INSERT INTO `permission` VALUES ('42', '/deleteAll', 'deleteAll-xianganC', '清空学生', '8');
INSERT INTO `permission` VALUES ('43', '/main', 'log', '日志管理', '0');
INSERT INTO `permission` VALUES ('45', '/deleteClass', 'deleteClass-simingG', '清空班级', '5');
INSERT INTO `permission` VALUES ('46', '/deleteClass', 'deleteClass-xianganC', '清空班级', '6');
INSERT INTO `permission` VALUES ('47', '/deleteClass', 'deleteClass-xianganG', '清空班级', '7');
INSERT INTO `permission` VALUES ('48', '/deleteClass', 'deleteClass-xianganC', '清空班级', '8');
INSERT INTO `permission` VALUES ('49', '/updateStudent', 'updateStudent-simingG', '微调班级', '5');
INSERT INTO `permission` VALUES ('50', '/updateStudent', 'updateStudent-xianganC', '微调班级', '6');
INSERT INTO `permission` VALUES ('51', '/updateStudent', 'updateStudent-xianganG', '微调班级', '7');
INSERT INTO `permission` VALUES ('52', '/updateStudent', 'updateStudent-xianganC', '微调班级', '8');
INSERT INTO `permission` VALUES ('53', '/findAllRoles', 'findAllRoles', '添加角色', '9');
INSERT INTO `permission` VALUES ('54', '/toLockTable', 'toLockTable', '锁定表格管理', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系统管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '2');
INSERT INTO `role_permission` VALUES ('3', '1', '3');
INSERT INTO `role_permission` VALUES ('4', '1', '4');
INSERT INTO `role_permission` VALUES ('5', '1', '9');
INSERT INTO `role_permission` VALUES ('6', '1', '53');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_card` varchar(18) NOT NULL COMMENT '身份证',
  `sex` varchar(255) NOT NULL,
  `total_grade` double(255,0) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `tel` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `patriarch` varchar(255) DEFAULT NULL COMMENT '家长',
  `phone` varchar(255) DEFAULT NULL COMMENT '家长电话',
  `address` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `belonging` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
