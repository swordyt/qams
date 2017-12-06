/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:19:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_role_project
-- ----------------------------
DROP TABLE IF EXISTS `t_role_project`;
CREATE TABLE `t_role_project` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `roleId` int(32) NOT NULL,
  `projectId` int(32) NOT NULL,
  `status` int(32) NOT NULL DEFAULT '0',
  `creater` int(32) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tup_userid_idx` (`roleId`),
  KEY `tup_projectId_idx` (`projectId`),
  KEY `tup_creater_idx` (`creater`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
