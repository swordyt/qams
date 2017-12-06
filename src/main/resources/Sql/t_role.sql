/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:18:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(100) NOT NULL,
  `auth` int(32) NOT NULL COMMENT '角色权限',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '角色状态',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色表';
