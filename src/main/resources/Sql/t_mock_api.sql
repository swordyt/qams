/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:18:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_mock_api
-- ----------------------------
DROP TABLE IF EXISTS `t_mock_api`;
CREATE TABLE `t_mock_api` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `projectId` int(32) NOT NULL,
  `name` varchar(200) NOT NULL,
  `method` int(32) NOT NULL,
  `urlType` int(32) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `resultCode` varchar(45) DEFAULT '200',
  `resultType` int(32) NOT NULL,
  `resultValue` text NOT NULL,
  `headers` json NOT NULL,
  `status` int(32) DEFAULT '0',
  `creater` int(32) NOT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
