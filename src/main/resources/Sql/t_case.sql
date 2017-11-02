/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-01 11:34:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_case
-- ----------------------------
DROP TABLE IF EXISTS `t_case`;
CREATE TABLE `t_case` (
  `id` int(32) NOT NULL,
  `userId` int(32) NOT NULL COMMENT '创建用户id',
  `type` int(32) NOT NULL COMMENT '0:目录，1:用例',
  `pid` int(32) DEFAULT NULL COMMENT '父级id',
  `name` varchar(200) NOT NULL,
  `level` int(32) NOT NULL DEFAULT '0' COMMENT '用例等级，0：无实际效用，供目录使用。\n1：最高，2：高，3：中，4：低，5：最低',
  `description` varchar(1000) DEFAULT NULL,
  `step` json DEFAULT NULL COMMENT '用例步骤',
  `file` varchar(200) DEFAULT NULL COMMENT '上传附件地址',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '0:无效，1:有效',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `userId` FOREIGN KEY (`id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
