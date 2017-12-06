/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:18:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '项目名',
  `description` varchar(1000) DEFAULT NULL COMMENT '项目描述',
  `file` varchar(1000) DEFAULT NULL COMMENT '附件',
  `status` int(32) NOT NULL DEFAULT '0',
  `creater` int(32) NOT NULL COMMENT '创建用户id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
