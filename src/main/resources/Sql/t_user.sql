/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-03 11:22:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(32) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT '用户email',
  `name` varchar(45) NOT NULL COMMENT '用户昵称',
  `password` varchar(200) NOT NULL COMMENT '用户密码',
  `auth` int(32) NOT NULL COMMENT '权限  二进制权限位表示11111111.',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '当前数据状态，0数据无效，1数据有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';
