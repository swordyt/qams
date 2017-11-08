/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-08 17:12:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL COMMENT '字典类型',
  `name` varchar(200) DEFAULT NULL COMMENT '数据描述',
  `value` varchar(255) NOT NULL COMMENT '字典字段对应数值',
  `table_name` varchar(200) NOT NULL COMMENT '字典数据所属表',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '0无效，1有效',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='字典表';
