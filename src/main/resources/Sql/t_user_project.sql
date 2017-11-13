/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-10 18:06:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user_project
-- ----------------------------
DROP TABLE IF EXISTS `t_user_project`;
CREATE TABLE `t_user_project` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `userId` int(32) NOT NULL,
  `projectId` int(32) NOT NULL,
  `creater` int(32) NOT NULL,
  `status` int(32) NOT NULL DEFAULT '0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tup_userid_idx` (`userId`),
  KEY `tup_projectId_idx` (`projectId`),
  KEY `tup_creater_idx` (`creater`),
  CONSTRAINT `tup_creater` FOREIGN KEY (`creater`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tup_projectId` FOREIGN KEY (`projectId`) REFERENCES `t_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tup_userid` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
