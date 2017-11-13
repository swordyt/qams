/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-10 18:05:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_case
-- ----------------------------
DROP TABLE IF EXISTS `t_case`;
CREATE TABLE `t_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(32) NOT NULL COMMENT '创建用户id',
  `projectId` int(32) DEFAULT NULL,
  `pid` int(32) DEFAULT NULL COMMENT '父级id',
  `type` int(11) NOT NULL COMMENT '0:目录，1:用例',
  `name` varchar(500) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用例等级，0：无实际效用，供目录使用。1：最高，2：高，3：中，4：低，5：最低',
  `description` varchar(1000) DEFAULT NULL,
  `step` json DEFAULT NULL,
  `file` varchar(1000) DEFAULT NULL COMMENT '上传附件地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0:无效，1:有效',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `projectId` (`projectId`),
  CONSTRAINT `projectId` FOREIGN KEY (`projectId`) REFERENCES `t_project` (`id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
