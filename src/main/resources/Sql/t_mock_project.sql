/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:18:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_mock_project
-- ----------------------------
DROP TABLE IF EXISTS `t_mock_project`;
CREATE TABLE `t_mock_project` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '项目名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '项目描述',
  `projectLeader` varchar(45) NOT NULL COMMENT '项目负责人',
  `protocol` varchar(45) NOT NULL COMMENT '项目协议,http,https',
  `enabled` int(32) DEFAULT '0' COMMENT '启用1，关闭0',
  `status` int(32) DEFAULT '0' COMMENT '数据是否有效,1:有效,0:无效.',
  `creater` int(32) NOT NULL COMMENT '该条数据创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
