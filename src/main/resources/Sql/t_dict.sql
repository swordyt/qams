/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:18:29
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
  `creater` int(32) NOT NULL COMMENT '创建用户id',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dictCreater_idx` (`creater`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('1', 'level', '最高', '1', 't_case', '1', '1000000000', '2017-11-07 17:45:19', '2017-11-15 15:35:23');
INSERT INTO `t_dict` VALUES ('2', 'level', '高', '2', 't_case', '1', '1000000000', '2017-11-07 17:48:20', '2017-11-15 15:35:24');
INSERT INTO `t_dict` VALUES ('3', 'level', '中', '3', 't_case', '1', '1000000000', '2017-11-07 17:48:56', '2017-11-15 15:35:24');
INSERT INTO `t_dict` VALUES ('4', 'level', '低', '4', 't_case', '1', '1000000000', '2017-11-07 17:49:14', '2017-11-15 15:35:25');
INSERT INTO `t_dict` VALUES ('5', 'level', '最低', '5', 't_case', '1', '1000000000', '2017-11-07 17:49:34', '2017-11-15 15:35:27');
INSERT INTO `t_dict` VALUES ('6', 'auth', '创建用例', '1', 't_role', '1', '1000000000', '2017-11-15 15:29:30', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('7', 'auth', '更新用例', '2', 't_role', '1', '1000000000', '2017-11-15 15:32:13', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('8', 'auth', '图片上传', '3', 't_role', '1', '1000000000', '2017-11-15 15:32:40', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('9', 'auth', '创建项目', '4', 't_role', '1', '1000000000', '2017-11-15 15:32:55', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('10', 'auth', '更新项目', '5', 't_role', '1', '1000000000', '2017-11-15 15:33:07', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('11', 'auth', '创建用户', '6', 't_role', '1', '1000000000', '2017-11-15 15:33:16', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('12', 'auth', '创建角色', '7', 't_role', '1', '1000000000', '2017-11-15 15:33:27', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('13', 'auth', '更新用户', '8', 't_role', '1', '1000000000', '2017-11-15 15:34:23', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('14', 'auth', '更新角色', '9', 't_role', '1', '1000000000', '2017-11-15 15:34:34', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('15', 'auth', '删除用例', '10', 't_role', '1', '1000000000', '2017-11-15 15:48:14', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('16', 'urlType', '普通', '1', 't_mock_api', '1', '1000000000', '2017-12-06 16:16:50', '2017-12-06 16:20:41');
INSERT INTO `t_dict` VALUES ('17', 'urlType', '正则', '2', 't_mock_api', '1', '1000000000', '2017-12-06 16:17:44', '2017-12-06 16:20:54');
INSERT INTO `t_dict` VALUES ('18', 'resultType', 'JSON', '1', 't_mock_api', '1', '1000000000', '2017-12-06 16:19:54', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('19', 'method', 'GET', '1', 't_mock_api', '1', '1000000000', '2017-12-06 16:21:32', '0000-00-00 00:00:00');
INSERT INTO `t_dict` VALUES ('20', 'method', 'POST', '2', 't_mock_api', '1', '1000000000', '2017-12-06 16:21:58', '0000-00-00 00:00:00');
