/*
Navicat MySQL Data Transfer

Source Server         : qams
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qams

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-13 17:57:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_case
-- ----------------------------
DROP TABLE IF EXISTS `t_case`;
CREATE TABLE `t_case` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `projectId` int(32) DEFAULT NULL COMMENT '关联项目ID',
  `pid` int(32) DEFAULT NULL COMMENT '父级id',
  `type` int(32) NOT NULL COMMENT '0:目录，1:用例',
  `name` varchar(500) NOT NULL COMMENT '用例名',
  `level` int(32) NOT NULL DEFAULT '0' COMMENT '用例等级，0：无实际效用，供目录使用。1：最高，2：高，3：中，4：低，5：最低',
  `description` varchar(1000) DEFAULT NULL COMMENT '用例描述',
  `step` json DEFAULT NULL COMMENT '用例步骤',
  `file` varchar(1000) DEFAULT NULL COMMENT '上传附件地址',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '0:无效，1:有效',
  `creater` int(32) NOT NULL COMMENT '创建用户id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `projectId` (`projectId`),
  KEY `caseCreater` (`creater`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_case
-- ----------------------------
INSERT INTO `t_case` VALUES ('159', '45', null, '0', '红高粱三号01Tree', '0', '', '[{\"step\": \"\", \"expect\": \"\"}]', '[]', '1', '1000000000', '2017-11-15 12:07:36', '2017-12-13 15:21:17');
INSERT INTO `t_case` VALUES ('160', '46', null, '0', '红高粱三号02Tree', '0', null, null, null, '1', '1000000000', '2017-11-15 12:11:40', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('161', '47', null, '0', '我在测试jQuery', '0', null, null, null, '1', '1000000000', '2017-11-15 16:17:17', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('162', '48', null, '0', '我在测试jQuery', '0', null, null, null, '1', '1000000000', '2017-11-15 16:20:14', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('163', '49', null, '0', '再穿件一个项目', '0', null, null, null, '1', '1000000000', '2017-11-15 16:31:54', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('164', '50', null, '0', '创建一个项目玩玩', '0', null, null, null, '1', '1000000000', '2017-11-15 16:36:40', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('165', '51', null, '0', '在创建一个项目', '0', null, null, null, '1', '1000000000', '2017-11-15 16:37:47', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('166', '52', null, '0', 'mock', '0', null, null, null, '1', '1000000000', '2017-12-05 16:37:56', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('167', '53', null, '0', 'mock项目01', '0', null, null, null, '1', '1000000000', '2017-12-05 16:38:09', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('168', '54', null, '0', 'mock项目02', '0', null, null, null, '1', '1000000000', '2017-12-05 16:38:22', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('169', '55', null, '0', 'mock项目03', '0', null, null, null, '1', '1000000000', '2017-12-05 16:38:32', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('170', '56', null, '0', 'mock项目04mock项目04', '0', null, null, null, '1', '1000000000', '2017-12-05 16:40:03', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('171', '57', null, '0', 'mock项目05', '0', null, null, null, '1', '1000000000', '2017-12-05 16:40:12', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('172', '58', null, '0', 'mock项目06', '0', null, null, null, '1', '1000000000', '2017-12-05 16:40:20', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('173', '59', null, '0', 'mock项目07', '0', null, null, null, '1', '1000000000', '2017-12-05 16:40:30', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('174', null, '159', '0', '红高粱目录一', '1', '', '[{\"step\": \"\", \"expect\": \"\"}]', '[]', '1', '1000000000', '2017-12-07 18:05:16', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('175', null, '174', '1', '红高粱第一条用例', '1', '', '[{\"step\": \"������������������������\", \"expect\": \"������������������������\"}]', '[]', '0', '1000000000', '2017-12-07 18:05:38', '2017-12-07 18:05:46');
INSERT INTO `t_case` VALUES ('176', '60', null, '0', 'rootTree', '0', null, null, null, '1', '1000000000', '2017-12-08 10:48:21', '0000-00-00 00:00:00');
INSERT INTO `t_case` VALUES ('177', '61', '0', '0', 'rootTree', '0', '', '[{\"step\": \"\", \"expect\": \"\"}]', '[]', '1', '1000000000', '2017-12-08 11:02:04', '2017-12-13 11:32:53');
INSERT INTO `t_case` VALUES ('178', null, '177', '1', '第一条用例', '1', '第一条用例第一条用例第一条用例', '[{\"step\": \"���������������\", \"expect\": \"���������������\"}]', '[{\"name\":\"微信图片_20171128115657.jpg\",\"type\":\"jpg\",\"key\":\"9d9897121cc584b3ab79d234ed41a02e\"}]', '0', '1000000011', '2017-12-13 11:24:44', '2017-12-13 11:25:28');
INSERT INTO `t_case` VALUES ('179', null, '177', '0', '首页', '1', '', '[{\"step\": \"\", \"expect\": \"\"}]', '[]', '0', '1000000011', '2017-12-13 11:25:02', '2017-12-13 11:25:19');
INSERT INTO `t_case` VALUES ('180', null, '174', '1', '我是一条用例', '1', '我是一条用例我是一条用例', '[{\"step\": \"������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\", \"expect\": \"������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\"}]', '[]', '1', '1000000000', '2017-12-13 14:52:56', '2017-12-13 16:14:08');

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

-- ----------------------------
-- Table structure for t_mock_api
-- ----------------------------
DROP TABLE IF EXISTS `t_mock_api`;
CREATE TABLE `t_mock_api` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `projectId` int(32) NOT NULL COMMENT 'mock_project表ID',
  `name` varchar(200) NOT NULL COMMENT 'api名称',
  `method` int(32) NOT NULL COMMENT 'api请求方法类型，GET,POST',
  `urlType` int(32) NOT NULL COMMENT 'URL是正则匹配，还是普通url',
  `url` varchar(1000) NOT NULL,
  `resultCode` varchar(45) DEFAULT '200' COMMENT '响应状态码，200',
  `resultType` int(32) NOT NULL COMMENT '响应类型，JSON',
  `resultValue` text NOT NULL COMMENT '响应值',
  `headers` json NOT NULL COMMENT '响应头信息',
  `status` int(32) DEFAULT '0',
  `creater` int(32) NOT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mock_api
-- ----------------------------
INSERT INTO `t_mock_api` VALUES ('1', '3', '购买仪器', '1', '2', 'token/login', '300', '1', '{}', '{}', '1', '1000000000', '2017-12-06 18:16:42', '2017-12-06 18:17:26');

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

-- ----------------------------
-- Records of t_mock_project
-- ----------------------------
INSERT INTO `t_mock_project` VALUES ('1', 'protocol', 'protocolprotocol', 'protocol', 'http', '0', '1', '1000000000', '2017-12-06 12:17:42', null);
INSERT INTO `t_mock_project` VALUES ('2', 'protocolprotocol', 'protocolprotocolprotocol', 'protocol', 'http', '1', '1', '1000000000', '2017-12-06 12:18:28', null);
INSERT INTO `t_mock_project` VALUES ('3', 'mock 项目', 'mock 项目', 'mock 项目', 'http', '1', '1', '1000000000', '2017-12-06 13:33:53', null);
INSERT INTO `t_mock_project` VALUES ('4', '末日mock', '末日mock', '末日mock', 'http', '1', '1', '1000000000', '2017-12-06 13:36:10', null);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '项目名',
  `description` varchar(1000) DEFAULT NULL COMMENT '项目描述',
  `file` varchar(1000) DEFAULT NULL COMMENT '附件',
  `status` int(32) NOT NULL DEFAULT '0',
  `creater` int(32) NOT NULL COMMENT '创建用户id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('45', '红高粱三号01', '红高粱三号01红高粱三号01', '[{\"key\":\"74b90764b75c335d3e26c5bd24d18ff5\",\"name\":\"123456.jpg\",\"type\":\"jpg\"}]', '1', '1000000000', '2017-11-15 12:07:36', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('46', '红高粱三号02', '红高粱三号02红高粱三号02红高粱三号02', '[{\"key\":\"7786ffed8cce758ba71c7d4da29504f0\",\"name\":\"77b8d7a03ec0248556dfc0ea25471f20.jpg\",\"type\":\"jpg\"}]', '1', '1000000000', '2017-11-15 12:11:40', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('47', '我在测试jQuery', '我在测试jQuery', '[]', '1', '1000000000', '2017-11-15 16:17:17', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('48', '我在测试jQuery', '我在测试jQuery', '[]', '1', '1000000000', '2017-11-15 16:20:14', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('49', '再穿件一个项目', '再穿件一个项目', '[]', '1', '1000000000', '2017-11-15 16:31:54', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('50', '创建一个项目玩玩', '创建一个项目玩玩', '[]', '1', '1000000000', '2017-11-15 16:36:40', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('51', '在创建一个项目', '在创建一个项目', '[]', '1', '1000000000', '2017-11-15 16:37:47', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('52', 'mock项目mock项目', 'mock项目mock项目mock项目', '[{\"key\":\"9d9897121cc584b3ab79d234ed41a02e\",\"name\":\"微信图片_20171128115657.jpg\",\"type\":\"jpg\"}]', '1', '1000000000', '2017-12-05 16:37:55', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('53', 'mock项目01', 'mock项目01mock项目01mock项目01', '[{\"key\":\"708ae93910574a0e4eac691b5b95b128\",\"name\":\"兼容用例-红高粱财富_定期_APP.xlsx\",\"type\":\"xlsx\"}]', '1', '1000000000', '2017-12-05 16:38:09', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('54', 'mock项目02', 'mock项目02mock项目02', '[{\"key\":\"9d9897121cc584b3ab79d234ed41a02e\",\"name\":\"微信图片_20171128115657.jpg\",\"type\":\"jpg\"}]', '1', '1000000000', '2017-12-05 16:38:21', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('55', 'mock项目03', 'mock项目03mock项目03', '[{\"key\":\"9d9897121cc584b3ab79d234ed41a02e\",\"name\":\"微信图片_20171128115657.jpg\",\"type\":\"jpg\"}]', '1', '1000000000', '2017-12-05 16:38:32', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('56', 'mock项目04', 'mock项目04mock项目04', '[]', '1', '1000000000', '2017-12-05 16:40:03', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('57', 'mock项目05', 'mock项目05mock项目05', '[]', '1', '1000000000', '2017-12-05 16:40:12', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('58', 'mock项目06', 'mock项目06mock项目06', '[]', '1', '1000000000', '2017-12-05 16:40:20', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('59', 'mock项目07', 'mock项目06mock项目06', '[]', '1', '1000000000', '2017-12-05 16:40:30', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('60', '这是一个测试小米', '这是一个测试小米这是一个测试小米', '[]', '1', '1000000000', '2017-12-08 10:48:21', '0000-00-00 00:00:00');
INSERT INTO `t_project` VALUES ('61', '这是第二个项目', '', '[]', '1', '1000000000', '2017-12-08 11:02:04', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(100) NOT NULL,
  `parentId` int(32) DEFAULT NULL COMMENT '父角色ID',
  `communal` int(32) NOT NULL DEFAULT '0' COMMENT '是否作为公共角色使用，0：私有，1：公共',
  `auth` int(32) NOT NULL DEFAULT '0' COMMENT '角色权限',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '角色状态',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'Administrator', null, '0', '255', '1', '2017-11-15 11:29:43', '2017-12-05 16:37:45');
INSERT INTO `t_role` VALUES ('2', '默认', null, '1', '0', '1', '2017-12-08 09:13:18', '2017-12-08 11:19:58');
INSERT INTO `t_role` VALUES ('4', 'roleTest', null, '0', '0', '1', '2017-12-13 10:42:16', null);
INSERT INTO `t_role` VALUES ('5', '基本用户', null, '0', '0', '1', '2017-12-13 11:20:28', null);
INSERT INTO `t_role` VALUES ('6', '测试员', null, '0', '0', '1', '2017-12-13 11:22:29', null);

-- ----------------------------
-- Table structure for t_role_project_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_role_project_relation`;
CREATE TABLE `t_role_project_relation` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `roleId` int(32) NOT NULL COMMENT '角色id',
  `projectId` int(32) NOT NULL COMMENT '项目id',
  `auth` int(32) DEFAULT NULL COMMENT '暂时预留',
  `status` int(32) NOT NULL DEFAULT '0',
  `creater` int(32) NOT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_project_relation
-- ----------------------------
INSERT INTO `t_role_project_relation` VALUES ('1', '1', '45', null, '1', '1000000000', '2017-12-07 17:53:44', null);
INSERT INTO `t_role_project_relation` VALUES ('2', '4', '61', null, '1', '1000000000', '2017-12-13 10:42:16', null);
INSERT INTO `t_role_project_relation` VALUES ('3', '5', '61', null, '1', '1000000000', '2017-12-13 11:20:29', null);
INSERT INTO `t_role_project_relation` VALUES ('4', '6', '61', null, '1', '1000000000', '2017-12-13 11:22:30', null);
INSERT INTO `t_role_project_relation` VALUES ('5', '1', '61', null, '1', '1000000000', '2017-12-13 15:02:05', null);

-- ----------------------------
-- Table structure for t_role_url_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_role_url_relation`;
CREATE TABLE `t_role_url_relation` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `roleId` int(32) NOT NULL COMMENT '角色id',
  `urlId` int(32) NOT NULL COMMENT 'url地址ID',
  `auth` int(32) NOT NULL DEFAULT '1' COMMENT 'url权限,15:1111对应增删改查',
  `status` int(32) NOT NULL DEFAULT '0',
  `creater` int(32) NOT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_url_relation
-- ----------------------------
INSERT INTO `t_role_url_relation` VALUES ('1', '1', '1', '1', '1', '1000000000', '2017-12-07 10:52:54', '2017-12-07 14:58:03');
INSERT INTO `t_role_url_relation` VALUES ('2', '1', '2', '1', '1', '1000000000', '2017-12-07 10:54:14', null);
INSERT INTO `t_role_url_relation` VALUES ('3', '1', '3', '1', '1', '1000000000', '2017-12-07 10:54:19', '2017-12-07 15:50:54');
INSERT INTO `t_role_url_relation` VALUES ('4', '1', '4', '1', '1', '1000000000', '2017-12-07 10:54:22', '2017-12-07 15:50:56');
INSERT INTO `t_role_url_relation` VALUES ('5', '1', '5', '1', '1', '1000000000', '2017-12-07 10:54:24', null);
INSERT INTO `t_role_url_relation` VALUES ('6', '1', '6', '1', '1', '1000000000', '2017-12-07 10:54:26', null);
INSERT INTO `t_role_url_relation` VALUES ('7', '1', '7', '1', '1', '1000000000', '2017-12-07 10:54:28', null);
INSERT INTO `t_role_url_relation` VALUES ('8', '1', '8', '1', '1', '1000000000', '2017-12-07 10:54:30', null);
INSERT INTO `t_role_url_relation` VALUES ('9', '1', '9', '1', '1', '1000000000', '2017-12-07 10:54:32', null);
INSERT INTO `t_role_url_relation` VALUES ('10', '1', '10', '1', '1', '1000000000', '2017-12-07 10:54:36', null);
INSERT INTO `t_role_url_relation` VALUES ('11', '1', '11', '1', '1', '1000000000', '2017-12-07 10:54:38', null);
INSERT INTO `t_role_url_relation` VALUES ('12', '1', '12', '1', '1', '1000000000', '2017-12-07 10:54:40', null);
INSERT INTO `t_role_url_relation` VALUES ('13', '1', '13', '1', '1', '1000000000', '2017-12-07 10:54:42', null);
INSERT INTO `t_role_url_relation` VALUES ('14', '1', '14', '1', '1', '1000000000', '2017-12-07 10:54:44', null);
INSERT INTO `t_role_url_relation` VALUES ('15', '1', '15', '1', '1', '1000000000', '2017-12-07 10:54:46', null);
INSERT INTO `t_role_url_relation` VALUES ('16', '1', '16', '1', '1', '1000000000', '2017-12-07 10:54:48', '2017-12-07 15:50:44');
INSERT INTO `t_role_url_relation` VALUES ('17', '1', '20', '1', '1', '1000000000', '2017-12-07 17:14:07', null);
INSERT INTO `t_role_url_relation` VALUES ('18', '1', '21', '1', '1', '1000000000', '2017-12-08 10:23:18', null);
INSERT INTO `t_role_url_relation` VALUES ('19', '1', '22', '1', '1', '1000000000', '2017-12-08 11:53:03', null);
INSERT INTO `t_role_url_relation` VALUES ('20', '2', '3', '1', '1', '1000000000', '2017-12-08 12:58:55', null);
INSERT INTO `t_role_url_relation` VALUES ('21', '2', '2', '1', '1', '1000000000', '2017-12-08 12:59:59', null);
INSERT INTO `t_role_url_relation` VALUES ('22', '1', '23', '1', '1', '1000000000', '2017-12-11 16:27:11', null);
INSERT INTO `t_role_url_relation` VALUES ('23', '1', '24', '1', '1', '1000000000', '2017-12-12 11:37:54', null);
INSERT INTO `t_role_url_relation` VALUES ('24', '1', '25', '1', '1', '1000000000', '2017-12-13 10:06:28', null);
INSERT INTO `t_role_url_relation` VALUES ('25', '1', '3', '1', '1', '1000000000', '2017-12-13 10:38:20', null);
INSERT INTO `t_role_url_relation` VALUES ('26', '1', '2', '1', '1', '1000000000', '2017-12-13 10:38:20', null);
INSERT INTO `t_role_url_relation` VALUES ('27', '4', '3', '1', '1', '1000000000', '2017-12-13 10:42:16', null);
INSERT INTO `t_role_url_relation` VALUES ('28', '4', '2', '1', '1', '1000000000', '2017-12-13 10:42:16', null);
INSERT INTO `t_role_url_relation` VALUES ('29', '1', '26', '1', '1', '1000000000', '2017-12-13 11:13:00', null);
INSERT INTO `t_role_url_relation` VALUES ('30', '5', '3', '1', '1', '1000000000', '2017-12-13 11:20:28', null);
INSERT INTO `t_role_url_relation` VALUES ('31', '5', '4', '1', '1', '1000000000', '2017-12-13 11:20:28', null);
INSERT INTO `t_role_url_relation` VALUES ('32', '5', '1', '1', '1', '1000000000', '2017-12-13 11:20:28', null);
INSERT INTO `t_role_url_relation` VALUES ('33', '5', '5', '1', '1', '1000000000', '2017-12-13 11:20:28', null);
INSERT INTO `t_role_url_relation` VALUES ('34', '5', '6', '1', '1', '1000000000', '2017-12-13 11:20:28', null);
INSERT INTO `t_role_url_relation` VALUES ('35', '5', '7', '1', '1', '1000000000', '2017-12-13 11:20:28', null);
INSERT INTO `t_role_url_relation` VALUES ('36', '5', '8', '1', '1', '1000000000', '2017-12-13 11:20:29', null);
INSERT INTO `t_role_url_relation` VALUES ('37', '5', '20', '1', '1', '1000000000', '2017-12-13 11:20:29', null);
INSERT INTO `t_role_url_relation` VALUES ('38', '6', '3', '1', '1', '1000000000', '2017-12-13 11:22:29', null);
INSERT INTO `t_role_url_relation` VALUES ('39', '6', '4', '1', '1', '1000000000', '2017-12-13 11:22:29', null);
INSERT INTO `t_role_url_relation` VALUES ('40', '6', '1', '1', '1', '1000000000', '2017-12-13 11:22:29', null);
INSERT INTO `t_role_url_relation` VALUES ('41', '6', '2', '1', '1', '1000000000', '2017-12-13 11:22:29', null);
INSERT INTO `t_role_url_relation` VALUES ('42', '6', '5', '1', '1', '1000000000', '2017-12-13 11:22:29', null);
INSERT INTO `t_role_url_relation` VALUES ('43', '6', '6', '1', '1', '1000000000', '2017-12-13 11:22:30', null);
INSERT INTO `t_role_url_relation` VALUES ('44', '6', '7', '1', '1', '1000000000', '2017-12-13 11:22:30', null);
INSERT INTO `t_role_url_relation` VALUES ('45', '6', '8', '1', '1', '1000000000', '2017-12-13 11:22:30', null);
INSERT INTO `t_role_url_relation` VALUES ('46', '6', '20', '1', '1', '1000000000', '2017-12-13 11:22:30', null);

-- ----------------------------
-- Table structure for t_url_mapping
-- ----------------------------
DROP TABLE IF EXISTS `t_url_mapping`;
CREATE TABLE `t_url_mapping` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'url名称',
  `url` varchar(1000) NOT NULL COMMENT 'url地址',
  `parentId` int(32) DEFAULT NULL COMMENT '父ID',
  `portal` int(32) NOT NULL DEFAULT '0' COMMENT '是否为页面展示地址1：是，0：否',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '数据有效性，1：有效，0：无效',
  `creater` int(32) NOT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_url_mapping
-- ----------------------------
INSERT INTO `t_url_mapping` VALUES ('1', '附件上传', '/token/upload', null, '0', '1', '1000000000', '2017-12-07 10:21:17', '2017-12-07 10:51:59');
INSERT INTO `t_url_mapping` VALUES ('2', '首页', '/token/cases/index', null, '0', '1', '1000000000', '2017-12-07 10:23:53', '2017-12-07 15:47:02');
INSERT INTO `t_url_mapping` VALUES ('3', 'QAMS', '/token/cases/home', null, '1', '1', '1000000000', '2017-12-07 10:25:08', '2017-12-11 17:08:52');
INSERT INTO `t_url_mapping` VALUES ('4', '用例管理', '/token/cases/case', null, '1', '1', '1000000000', '2017-12-07 10:26:22', '2017-12-07 15:49:04');
INSERT INTO `t_url_mapping` VALUES ('5', '新增用例', '/token/cases/addCase', null, '0', '1', '1000000000', '2017-12-07 10:27:56', '2017-12-07 10:52:04');
INSERT INTO `t_url_mapping` VALUES ('6', '更新用例', '/token/cases/updateCase', null, '0', '1', '1000000000', '2017-12-07 10:28:31', '2017-12-07 10:52:06');
INSERT INTO `t_url_mapping` VALUES ('7', '访问用例', '/token/cases/casesTree', null, '0', '1', '1000000000', '2017-12-07 10:29:10', '2017-12-07 10:52:07');
INSERT INTO `t_url_mapping` VALUES ('8', '删除用例', '/token/cases/delCase', null, '0', '1', '1000000000', '2017-12-07 10:31:32', '2017-12-07 10:52:09');
INSERT INTO `t_url_mapping` VALUES ('9', '查询词典', '/token/dict/getdicts', null, '0', '1', '1000000000', '2017-12-07 10:32:34', '2017-12-07 10:52:10');
INSERT INTO `t_url_mapping` VALUES ('10', '增加api', '/token/mock/addapi', null, '0', '1', '1000000000', '2017-12-07 10:33:17', '2017-12-07 10:52:13');
INSERT INTO `t_url_mapping` VALUES ('11', '获取apis', '/token/mock/getapis', null, '0', '1', '1000000000', '2017-12-07 10:34:00', '2017-12-07 10:52:15');
INSERT INTO `t_url_mapping` VALUES ('12', '增加mock项目', '/token/mockproject/add', null, '0', '1', '1000000000', '2017-12-07 10:35:15', '2017-12-07 10:52:17');
INSERT INTO `t_url_mapping` VALUES ('13', '获取mock项目', '/token/mockproject/getprojects', null, '0', '1', '1000000000', '2017-12-07 10:35:53', '2017-12-07 10:52:19');
INSERT INTO `t_url_mapping` VALUES ('14', '增加项目', '/token/project/addproject', null, '0', '1', '1000000000', '2017-12-07 10:37:03', '2017-12-07 10:52:21');
INSERT INTO `t_url_mapping` VALUES ('15', '获取项目', '/token/project/getprojects', null, '0', '1', '1000000000', '2017-12-07 10:37:36', '2017-12-07 10:52:22');
INSERT INTO `t_url_mapping` VALUES ('16', '系统管理', '/token/system/systemmange', null, '1', '1', '1000000000', '2017-12-07 10:40:56', '2017-12-07 15:49:06');
INSERT INTO `t_url_mapping` VALUES ('20', '获取用户所属项目', '/token/user/getprojects', null, '0', '1', '1000000000', '2017-12-07 17:13:42', null);
INSERT INTO `t_url_mapping` VALUES ('21', '添加用户', '/token/user/adduser', null, '0', '1', '1000000000', '2017-12-08 10:21:43', null);
INSERT INTO `t_url_mapping` VALUES ('22', '获取角色', '/token/role/getroles', null, '0', '1', '1000000000', '2017-12-08 11:52:20', null);
INSERT INTO `t_url_mapping` VALUES ('23', '获取功能列表', '/token/permission/getpermissions', null, '0', '1', '1000000000', '2017-12-11 16:26:21', null);
INSERT INTO `t_url_mapping` VALUES ('24', '获取角色对应的权限项目', '/token/role/getproandper', null, '0', '1', '1000000000', '2017-12-12 11:37:38', null);
INSERT INTO `t_url_mapping` VALUES ('25', '添加角色', '/token/role/addrole', null, '0', '1', '1000000000', '2017-12-13 10:06:12', null);
INSERT INTO `t_url_mapping` VALUES ('26', '获取用户', '/token/user/getusers', null, '0', '1', '1000000000', '2017-12-13 11:12:40', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '用户email',
  `name` varchar(45) NOT NULL COMMENT '用户昵称',
  `password` varchar(200) NOT NULL COMMENT '用户密码',
  `roleId` int(32) NOT NULL COMMENT '所属角色ID',
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '当前数据状态，0数据无效，1数据有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `id` (`id`),
  KEY `roleId_idx` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000012 DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1000000000', 'yinting@nonobank.com', 'yintings', '*043DD1611E292110A3592B210CE3AD3B31CA3F0B', '1', '1', '2017-11-02 14:18:59', '2017-11-15 11:30:40');
INSERT INTO `t_user` VALUES ('1000000005', 'yinting2@nonobank.com', '第二个角色', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2', '1', '2017-12-08 10:46:43', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('1000000007', 'yinting3@nonobank.com', 'protocol', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2', '1', '2017-12-08 11:18:56', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('1000000008', 'test@nonobank.com', 'test', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2', '1', '2017-12-08 12:56:23', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('1000000009', 'sword@163.com', 'sword', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '4', '1', '2017-12-13 10:47:57', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('1000000010', 'test01@163.com', '测试员01', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '5', '1', '2017-12-13 11:21:07', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('1000000011', 'test02@163.com', '测试员02', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '6', '1', '2017-12-13 11:23:12', '0000-00-00 00:00:00');
