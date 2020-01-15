/*
Navicat MySQL Data Transfer

Source Server         : 本地测试
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : gmanager

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-01-15 16:24:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `key` varchar(64) NOT NULL COMMENT '键',
  `value` varchar(4000) NOT NULL COMMENT '值',
  `code` varchar(256) DEFAULT NULL COMMENT '编码',
  `data_type` int(2) DEFAULT NULL COMMENT '数据类型//radio/1,KV,2,字典,3,数组',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '类型',
  `parent_key` varchar(64) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序号',
  `project_id` bigint(20) DEFAULT '1' COMMENT '项目ID',
  `copy_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '拷贝状态 1 拷贝  2  不拷贝',
  `change_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1 不可更改 2 可以更改',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用//radio/1,启用,2,禁用',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '更新人',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('24', '系统参数', 'system', '', '', null, '0', null, '15', '1', '1', '2', '1', '2017-09-15 17:02:30', '4', '2017-09-15 16:54:52', '4');
INSERT INTO `sys_config` VALUES ('46', '日志控制配置', 'system.debug', 'false', '', null, '24', 'system', '15', '1', '1', '1', '1', '2019-02-24 00:00:08', '0', '2017-09-15 17:06:21', '4');
INSERT INTO `sys_config` VALUES ('47', '短信配置', 'sms', '', '', null, '0', '', '15', '1', '1', '2', '1', '2019-02-20 22:45:41', '1', '2017-09-15 17:06:56', '4');
INSERT INTO `sys_config` VALUES ('50', '短信账号', 'sms.username', 'test', '', null, '47', 'sms', '10', '1', '1', '2', '1', '2019-02-20 22:26:29', '1', '2019-02-18 01:07:47', '1');
INSERT INTO `sys_config` VALUES ('51', '短信密码', 'sms.passwd', '111111', '', null, '47', 'sms', '10', '1', '1', '2', '1', '2019-02-18 01:08:16', '1', '2019-02-18 01:08:16', '1');
INSERT INTO `sys_config` VALUES ('52', '短信类型', 'sms.type', '阿里云', '', null, '47', 'sms', '10', '1', '1', '2', '1', '2019-02-20 22:26:21', '1', '2019-02-20 22:26:21', '1');
INSERT INTO `sys_config` VALUES ('53', '性别', 'sex', '', '', null, '0', null, '90', '1', '1', '2', '1', '2019-02-20 23:35:18', '1', '2019-02-20 23:35:18', '1');
INSERT INTO `sys_config` VALUES ('54', '性别男', 'sex.male', '男', '1', null, '53', 'sex', '91', '1', '1', '2', '1', '2019-02-20 23:40:19', '1', '2019-02-20 23:35:45', '1');
INSERT INTO `sys_config` VALUES ('55', '性别女', 'sex.female', '女', '2', null, '53', 'sex', '92', '1', '1', '2', '1', '2019-02-20 23:40:24', '1', '2019-02-20 23:36:12', '1');
INSERT INTO `sys_config` VALUES ('56', '性别未知', 'sex.unknown', '未知', '3', null, '53', 'sex', '93', '1', '1', '2', '1', '2019-02-20 23:40:29', '1', '2019-02-20 23:36:46', '1');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) DEFAULT '0' COMMENT '上级机构',
  `name` varchar(32) NOT NULL COMMENT '部门/11111',
  `code` varchar(128) DEFAULT NULL COMMENT '机构编码',
  `sort` int(11) DEFAULT '0' COMMENT '序号',
  `linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `linkman_no` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  `remark` varchar(128) DEFAULT NULL COMMENT '机构描述',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用//radio/1,启用,2,禁用',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '更新人',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_depart_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='组织机构';

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('10001', '0', 'FLY的狐狸', 'ABC000', '100', '', '', '', '1', '2017-04-28 01:16:43', '1', '2016-07-31 18:12:30', '1');
INSERT INTO `sys_department` VALUES ('10002', '10001', '开发组', 'ABC001', '101', null, null, null, '1', '2016-07-31 18:15:29', '1', '2016-07-31 18:15:29', '1');
INSERT INTO `sys_department` VALUES ('10003', '10001', '产品组', 'ABC003', '103', '', '', '', '1', '2017-04-28 00:58:41', '1', '2016-07-31 18:16:06', '1');
INSERT INTO `sys_department` VALUES ('10004', '10001', '运营组', 'ABC004', '104', null, null, null, '1', '2016-07-31 18:16:30', '1', '2016-07-31 18:16:30', '1');
INSERT INTO `sys_department` VALUES ('10005', '10001', '测试组', '12323', '10', '', '', '', '0', '2019-06-30 22:33:44', '1', '2017-10-18 18:13:09', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_type` int(11) NOT NULL COMMENT '类型',
  `oper_object` varchar(64) DEFAULT NULL COMMENT '操作对象',
  `oper_table` varchar(64) NOT NULL COMMENT '操作表',
  `oper_id` int(11) DEFAULT '0' COMMENT '操作主键',
  `oper_type` varchar(64) DEFAULT NULL COMMENT '操作类型',
  `oper_remark` varchar(2000) DEFAULT NULL COMMENT '操作备注',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用//radio/1,启用,2,禁用',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '更新人',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-30 14:13:41', '1', '2019-12-30 14:13:41', '1');
INSERT INTO `sys_log` VALUES ('2', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-30 14:14:28', '1', '2019-12-30 14:14:28', '1');
INSERT INTO `sys_log` VALUES ('3', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-30 14:14:30', '1', '2019-12-30 14:14:30', '1');
INSERT INTO `sys_log` VALUES ('4', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-30 14:18:10', '1', '2019-12-30 14:18:10', '1');
INSERT INTO `sys_log` VALUES ('5', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-30 14:22:56', '1', '2019-12-30 14:22:56', '1');
INSERT INTO `sys_log` VALUES ('6', '2', '角色', 'sys_role', '2', '插入', '{\"id\":2,\"name\":\"新来的\",\"status\":1,\"sort\":0,\"remark\":\"测试文本\",\"enable\":0,\"updateTime\":\"2019-12-30 14:48:09\",\"updateId\":1,\"createTime\":\"2019-12-30 14:48:09\",\"createId\":1}', '1', '2019-12-30 14:48:09', '1', '2019-12-30 14:48:09', '1');
INSERT INTO `sys_log` VALUES ('7', '2', '角色', 'sys_role', '1', '更新', '{\"id\":1,\"name\":\"测试角色\",\"status\":1,\"sort\":10,\"remark\":\"\",\"enable\":0,\"updateTime\":\"2019-12-30 15:14:39\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2019-12-30 15:14:39', '1', '2019-12-30 15:14:39', '1');
INSERT INTO `sys_log` VALUES ('8', '2', '角色', 'sys_role', '1', '更新', '{\"id\":1,\"name\":\"测试角色\",\"status\":1,\"sort\":10,\"remark\":\"\",\"enable\":0,\"updateTime\":\"2019-12-30 15:14:44\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2019-12-30 15:14:44', '1', '2019-12-30 15:14:44', '1');
INSERT INTO `sys_log` VALUES ('9', '2', '角色', 'sys_role', '1', '更新', '{\"id\":1,\"name\":\"测试角色\",\"status\":1,\"sort\":10,\"remark\":\"\",\"enable\":0,\"updateTime\":\"2019-12-30 15:14:57\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2019-12-30 15:14:57', '1', '2019-12-30 15:14:57', '1');
INSERT INTO `sys_log` VALUES ('10', '1', null, 'sys_user', '1', '登录', null, '1', '2019-12-31 08:04:17', '1', '2019-12-31 08:04:17', '1');
INSERT INTO `sys_log` VALUES ('11', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:24:36', '1', '2019-12-31 09:24:36', '1');
INSERT INTO `sys_log` VALUES ('12', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:25:08', '1', '2019-12-31 09:25:08', '1');
INSERT INTO `sys_log` VALUES ('13', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:25:22', '1', '2019-12-31 09:25:22', '1');
INSERT INTO `sys_log` VALUES ('14', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:25:26', '1', '2019-12-31 09:25:26', '1');
INSERT INTO `sys_log` VALUES ('15', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 09:27:27', '1', '2019-12-31 09:27:27', '1');
INSERT INTO `sys_log` VALUES ('16', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:27:42', '1', '2019-12-31 09:27:42', '1');
INSERT INTO `sys_log` VALUES ('17', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:28:02', '1', '2019-12-31 09:28:02', '1');
INSERT INTO `sys_log` VALUES ('18', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:28:08', '1', '2019-12-31 09:28:08', '1');
INSERT INTO `sys_log` VALUES ('19', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 09:28:56', '1', '2019-12-31 09:28:56', '1');
INSERT INTO `sys_log` VALUES ('20', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:30:06', '1', '2019-12-31 09:30:06', '1');
INSERT INTO `sys_log` VALUES ('21', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:32:23', '1', '2019-12-31 09:32:23', '1');
INSERT INTO `sys_log` VALUES ('22', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:34:01', '1', '2019-12-31 09:34:01', '1');
INSERT INTO `sys_log` VALUES ('23', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:34:17', '1', '2019-12-31 09:34:17', '1');
INSERT INTO `sys_log` VALUES ('24', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 09:49:50', '1', '2019-12-31 09:49:50', '1');
INSERT INTO `sys_log` VALUES ('25', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 10:08:19', '1', '2019-12-31 10:08:19', '1');
INSERT INTO `sys_log` VALUES ('26', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 10:24:47', '1', '2019-12-31 10:24:47', '1');
INSERT INTO `sys_log` VALUES ('27', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 10:25:38', '1', '2019-12-31 10:25:38', '1');
INSERT INTO `sys_log` VALUES ('28', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 10:26:01', '1', '2019-12-31 10:26:01', '1');
INSERT INTO `sys_log` VALUES ('29', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 10:26:35', '1', '2019-12-31 10:26:35', '1');
INSERT INTO `sys_log` VALUES ('30', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 10:56:16', '1', '2019-12-31 10:56:16', '1');
INSERT INTO `sys_log` VALUES ('31', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 11:12:54', '1', '2019-12-31 11:12:54', '1');
INSERT INTO `sys_log` VALUES ('32', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 11:12:56', '1', '2019-12-31 11:12:56', '1');
INSERT INTO `sys_log` VALUES ('33', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 11:14:33', '1', '2019-12-31 11:14:33', '1');
INSERT INTO `sys_log` VALUES ('34', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 13:23:29', '1', '2019-12-31 13:23:29', '1');
INSERT INTO `sys_log` VALUES ('35', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 13:42:57', '1', '2019-12-31 13:42:57', '1');
INSERT INTO `sys_log` VALUES ('36', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 13:44:04', '1', '2019-12-31 13:44:04', '1');
INSERT INTO `sys_log` VALUES ('37', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 13:46:38', '1', '2019-12-31 13:46:38', '1');
INSERT INTO `sys_log` VALUES ('38', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 13:46:41', '1', '2019-12-31 13:46:41', '1');
INSERT INTO `sys_log` VALUES ('39', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 13:46:50', '1', '2019-12-31 13:46:50', '1');
INSERT INTO `sys_log` VALUES ('40', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 13:46:57', '1', '2019-12-31 13:46:57', '1');
INSERT INTO `sys_log` VALUES ('41', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 14:30:54', '1', '2019-12-31 14:30:54', '1');
INSERT INTO `sys_log` VALUES ('42', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 14:31:42', '1', '2019-12-31 14:31:42', '1');
INSERT INTO `sys_log` VALUES ('43', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 14:33:28', '1', '2019-12-31 14:33:28', '1');
INSERT INTO `sys_log` VALUES ('44', '2', '用户', 'sys_user', '14', '插入', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"\",\"departId\":10002,\"userType\":1,\"status\":0,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"\",\"backSiteId\":0,\"createSiteId\":0,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2019-12-31 14:33:57\",\"updateId\":1,\"createTime\":\"2019-12-31 14:33:57\",\"createId\":1}', '1', '2019-12-31 14:33:57', '1', '2019-12-31 14:33:57', '1');
INSERT INTO `sys_log` VALUES ('45', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 14:34:24', '1', '2019-12-31 14:34:24', '1');
INSERT INTO `sys_log` VALUES ('46', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 14:34:32', '1', '2019-12-31 14:34:32', '1');
INSERT INTO `sys_log` VALUES ('47', '1', '用户', 'sys_user', '1', '登出', null, '1', '2019-12-31 14:35:17', '1', '2019-12-31 14:35:17', '1');
INSERT INTO `sys_log` VALUES ('48', '1', '用户', 'sys_user', '14', '登录', null, '1', '2019-12-31 14:35:55', '14', '2019-12-31 14:35:55', '14');
INSERT INTO `sys_log` VALUES ('49', '1', '用户', 'sys_user', '14', '登出', null, '1', '2019-12-31 14:36:03', '14', '2019-12-31 14:36:03', '14');
INSERT INTO `sys_log` VALUES ('50', '1', '用户', 'sys_user', '14', '登录', null, '1', '2019-12-31 14:36:19', '14', '2019-12-31 14:36:19', '14');
INSERT INTO `sys_log` VALUES ('51', '1', '用户', 'sys_user', '1', '登录', null, '1', '2019-12-31 15:01:01', '1', '2019-12-31 15:01:01', '1');
INSERT INTO `sys_log` VALUES ('54', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-03 08:57:44', '1', '2020-01-03 08:57:44', '1');
INSERT INTO `sys_log` VALUES ('55', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-03 10:31:34', '1', '2020-01-03 10:31:34', '1');
INSERT INTO `sys_log` VALUES ('56', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-03 11:09:37', '1', '2020-01-03 11:09:37', '1');
INSERT INTO `sys_log` VALUES ('57', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-03 15:07:50', '1', '2020-01-03 15:07:50', '1');
INSERT INTO `sys_log` VALUES ('58', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-03 15:24:56', '1', '2020-01-03 15:24:56', '1');
INSERT INTO `sys_log` VALUES ('59', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 10:42:09', '1', '2020-01-08 10:42:09', '1');
INSERT INTO `sys_log` VALUES ('60', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 10:57:29', '1', '2020-01-08 10:57:29', '1');
INSERT INTO `sys_log` VALUES ('61', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 11:01:24', '1', '2020-01-08 11:01:24', '1');
INSERT INTO `sys_log` VALUES ('62', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 11:17:22', '1', '2020-01-08 11:17:22', '1');
INSERT INTO `sys_log` VALUES ('63', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:12:41', '1', '2020-01-08 13:12:41', '1');
INSERT INTO `sys_log` VALUES ('64', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:27:52', '1', '2020-01-08 13:27:52', '1');
INSERT INTO `sys_log` VALUES ('65', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:36:47', '1', '2020-01-08 13:36:47', '1');
INSERT INTO `sys_log` VALUES ('66', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:43:41', '1', '2020-01-08 13:43:41', '1');
INSERT INTO `sys_log` VALUES ('67', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:45:28', '1', '2020-01-08 13:45:28', '1');
INSERT INTO `sys_log` VALUES ('68', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:54:47', '1', '2020-01-08 13:54:47', '1');
INSERT INTO `sys_log` VALUES ('69', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:56:00', '1', '2020-01-08 13:56:00', '1');
INSERT INTO `sys_log` VALUES ('70', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 13:56:29', '1', '2020-01-08 13:56:29', '1');
INSERT INTO `sys_log` VALUES ('71', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 14:08:34', '1', '2020-01-08 14:08:34', '1');
INSERT INTO `sys_log` VALUES ('72', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 14:14:49', '1', '2020-01-08 14:14:49', '1');
INSERT INTO `sys_log` VALUES ('73', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 14:23:50', '1', '2020-01-08 14:23:50', '1');
INSERT INTO `sys_log` VALUES ('74', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 14:26:43', '1', '2020-01-08 14:26:43', '1');
INSERT INTO `sys_log` VALUES ('75', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 15:29:03', '1', '2020-01-08 15:29:03', '1');
INSERT INTO `sys_log` VALUES ('76', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 15:40:27', '1', '2020-01-08 15:40:27', '1');
INSERT INTO `sys_log` VALUES ('77', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-08 16:33:47', '1', '2020-01-08 16:33:47', '1');
INSERT INTO `sys_log` VALUES ('78', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 09:54:22', '1', '2020-01-09 09:54:22', '1');
INSERT INTO `sys_log` VALUES ('79', '2', '菜单', 'sys_menu', '39', '插入', '{\"id\":39,\"parentId\":0,\"name\":\"微服务\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":0,\"type\":1,\"sort\":0,\"level\":1,\"enable\":0,\"updateTime\":\"2020-01-09 10:19:20\",\"updateId\":1,\"createTime\":\"2020-01-09 10:19:20\",\"createId\":1}', '1', '2020-01-09 10:19:20', '1', '2020-01-09 10:19:20', '1');
INSERT INTO `sys_log` VALUES ('80', '2', '菜单', 'sys_menu', '39', '更新', '{\"id\":39,\"parentId\":0,\"name\":\"微服务\",\"icon\":\"business\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":1,\"enable\":0,\"updateTime\":\"2020-01-09 10:19:49\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 10:19:49', '1', '2020-01-09 10:19:49', '1');
INSERT INTO `sys_log` VALUES ('81', '2', '菜单', 'sys_menu', '39', '更新', '{\"id\":39,\"parentId\":0,\"name\":\"微服务\",\"icon\":\"business\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":200,\"level\":1,\"enable\":0,\"updateTime\":\"2020-01-09 10:20:00\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 10:20:00', '1', '2020-01-09 10:20:00', '1');
INSERT INTO `sys_log` VALUES ('82', '2', '菜单', 'sys_menu', '40', '插入', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"system/ctx/index\",\"perms\":\"\",\"status\":0,\"type\":2,\"sort\":0,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 10:24:40\",\"updateId\":1,\"createTime\":\"2020-01-09 10:24:40\",\"createId\":1}', '1', '2020-01-09 10:24:40', '1', '2020-01-09 10:24:40', '1');
INSERT INTO `sys_log` VALUES ('83', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 14:25:18', '1', '2020-01-09 14:25:18', '1');
INSERT INTO `sys_log` VALUES ('84', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 14:27:05', '1', '2020-01-09 14:27:05', '1');
INSERT INTO `sys_log` VALUES ('85', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 14:30:44', '1', '2020-01-09 14:30:44', '1');
INSERT INTO `sys_log` VALUES ('86', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 14:32:22', '1', '2020-01-09 14:32:22', '1');
INSERT INTO `sys_log` VALUES ('87', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 14:35:14', '1', '2020-01-09 14:35:14', '1');
INSERT INTO `sys_log` VALUES ('88', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-09 14:51:25', '1', '2020-01-09 14:51:25', '1');
INSERT INTO `sys_log` VALUES ('89', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 14:52:51\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 14:52:51', '1', '2020-01-09 14:52:51', '1');
INSERT INTO `sys_log` VALUES ('90', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 14:53:57\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 14:53:57', '1', '2020-01-09 14:53:57', '1');
INSERT INTO `sys_log` VALUES ('91', '2', '菜单', 'sys_menu', '3', '更新', '{\"id\":3,\"parentId\":2,\"name\":\"组织机构\",\"icon\":\"depart\",\"urlkey\":\"department\",\"url\":\"/system/department/indexs\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":191,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 15:04:31\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 15:04:31', '1', '2020-01-09 15:04:31', '1');
INSERT INTO `sys_log` VALUES ('92', '2', '菜单', 'sys_menu', '3', '更新', '{\"id\":3,\"parentId\":2,\"name\":\"组织机构\",\"icon\":\"depart\",\"urlkey\":\"department\",\"url\":\"/system/department/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":191,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 15:04:46\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 15:04:46', '1', '2020-01-09 15:04:46', '1');
INSERT INTO `sys_log` VALUES ('93', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 15:12:30\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 15:12:30', '1', '2020-01-09 15:12:30', '1');
INSERT INTO `sys_log` VALUES ('94', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 15:12:45\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 15:12:45', '1', '2020-01-09 15:12:45', '1');
INSERT INTO `sys_log` VALUES ('95', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":2,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 15:28:06\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 15:28:06', '1', '2020-01-09 15:28:06', '1');
INSERT INTO `sys_log` VALUES ('96', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"log\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-09 15:30:57\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 15:30:57', '1', '2020-01-09 15:30:57', '1');
INSERT INTO `sys_log` VALUES ('97', '1', '用户', 'sys_user', '1', '登出', null, '1', '2020-01-09 16:12:34', '1', '2020-01-09 16:12:34', '1');
INSERT INTO `sys_log` VALUES ('98', '1', '用户', 'sys_user', '14', '登录', null, '1', '2020-01-09 16:12:39', '14', '2020-01-09 16:12:39', '14');
INSERT INTO `sys_log` VALUES ('99', '2', '用户', 'sys_user', '14', '更新', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"\",\"departId\":10002,\"userType\":3,\"status\":10,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"default\",\"backSiteId\":0,\"createSiteId\":1,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2020-01-09 16:12:50\",\"updateId\":14,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 16:12:50', '14', '2020-01-09 16:12:50', '14');
INSERT INTO `sys_log` VALUES ('100', '2', '用户', 'sys_user', '14', '更新', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"\",\"departId\":10002,\"userType\":2,\"status\":10,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"default\",\"backSiteId\":0,\"createSiteId\":1,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2020-01-09 16:13:13\",\"updateId\":14,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 16:13:13', '14', '2020-01-09 16:13:13', '14');
INSERT INTO `sys_log` VALUES ('101', '2', '用户', 'sys_user', '14', '更新', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"\",\"departId\":10002,\"userType\":1,\"status\":10,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"default\",\"backSiteId\":0,\"createSiteId\":1,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2020-01-09 16:13:20\",\"updateId\":14,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 16:13:20', '14', '2020-01-09 16:13:20', '14');
INSERT INTO `sys_log` VALUES ('102', '2', '用户', 'sys_user', '14', '更新', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"尘雨雾录\",\"departId\":10002,\"userType\":1,\"status\":10,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"17764566464\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"default\",\"backSiteId\":0,\"createSiteId\":1,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2020-01-09 16:13:52\",\"updateId\":14,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 16:13:52', '14', '2020-01-09 16:13:52', '14');
INSERT INTO `sys_log` VALUES ('103', '2', '用户', 'sys_user', '14', '更新', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"尘雨雾录\",\"departId\":10002,\"userType\":2,\"status\":10,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"17764566464\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"default\",\"backSiteId\":0,\"createSiteId\":1,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2020-01-09 16:15:07\",\"updateId\":14,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 16:15:07', '14', '2020-01-09 16:15:07', '14');
INSERT INTO `sys_log` VALUES ('104', '1', '用户', 'sys_user', '14', '登出', null, '1', '2020-01-09 16:15:10', '14', '2020-01-09 16:15:10', '14');
INSERT INTO `sys_log` VALUES ('105', '1', '用户', 'sys_user', '14', '登录', null, '1', '2020-01-09 16:15:16', '14', '2020-01-09 16:15:16', '14');
INSERT INTO `sys_log` VALUES ('106', '2', '用户', 'sys_user', '14', '更新', '{\"id\":14,\"uuid\":\"HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45\",\"username\":\"chenyu\",\"password\":\"70795e17df1c7751f38b91ef2174127d\",\"salt\":\"izRXW6\",\"realName\":\"尘雨雾录\",\"departId\":10002,\"userType\":3,\"status\":10,\"thirdid\":\"\",\"endtime\":\"\",\"email\":\"\",\"tel\":\"17764566464\",\"address\":\"\",\"titleUrl\":\"\",\"remark\":\"\",\"theme\":\"default\",\"backSiteId\":0,\"createSiteId\":1,\"projectId\":0,\"projectName\":\"\",\"departName\":\"\",\"enable\":0,\"updateTime\":\"2020-01-09 16:15:35\",\"updateId\":14,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-09 16:15:35', '14', '2020-01-09 16:15:35', '14');
INSERT INTO `sys_log` VALUES ('107', '1', null, 'sys_user', '1', '登录', null, '1', '2020-01-10 09:49:57', '1', '2020-01-10 09:49:57', '1');
INSERT INTO `sys_log` VALUES ('108', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-10 10:20:05', '1', '2020-01-10 10:20:05', '1');
INSERT INTO `sys_log` VALUES ('109', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-10 10:39:23', '1', '2020-01-10 10:39:23', '1');
INSERT INTO `sys_log` VALUES ('110', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-10 16:02:20', '1', '2020-01-10 16:02:20', '1');
INSERT INTO `sys_log` VALUES ('111', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-14 09:57:51', '1', '2020-01-14 09:57:51', '1');
INSERT INTO `sys_log` VALUES ('112', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 09:35:08', '1', '2020-01-15 09:35:08', '1');
INSERT INTO `sys_log` VALUES ('113', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 09:35:16', '1', '2020-01-15 09:35:16', '1');
INSERT INTO `sys_log` VALUES ('114', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"ctx\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 09:36:18\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 09:36:18', '1', '2020-01-15 09:36:18', '1');
INSERT INTO `sys_log` VALUES ('115', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 10:24:53', '1', '2020-01-15 10:24:53', '1');
INSERT INTO `sys_log` VALUES ('116', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"内容展示\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:32:43\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:32:43', '1', '2020-01-15 10:32:43', '1');
INSERT INTO `sys_log` VALUES ('117', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service/ctx/index\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:42:04\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:42:04', '1', '2020-01-15 10:42:04', '1');
INSERT INTO `sys_log` VALUES ('118', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:43:26\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:43:26', '1', '2020-01-15 10:43:26', '1');
INSERT INTO `sys_log` VALUES ('119', '2', '菜单', 'sys_menu', '41', '插入', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"article\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":0,\"type\":2,\"sort\":0,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 10:43:58\",\"updateId\":1,\"createTime\":\"2020-01-15 10:43:58\",\"createId\":1}', '1', '2020-01-15 10:43:58', '1', '2020-01-15 10:43:58', '1');
INSERT INTO `sys_log` VALUES ('120', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 10:45:38\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:45:38', '1', '2020-01-15 10:45:38', '1');
INSERT INTO `sys_log` VALUES ('121', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:53:55\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:53:55', '1', '2020-01-15 10:53:55', '1');
INSERT INTO `sys_log` VALUES ('122', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:54:34\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:54:34', '1', '2020-01-15 10:54:34', '1');
INSERT INTO `sys_log` VALUES ('123', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 10:54:42\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:54:42', '1', '2020-01-15 10:54:42', '1');
INSERT INTO `sys_log` VALUES ('124', '2', '菜单', 'sys_menu', '42', '插入', '{\"id\":42,\"parentId\":39,\"name\":\"a\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"a\",\"perms\":\"\",\"status\":0,\"type\":2,\"sort\":0,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:55:11\",\"updateId\":1,\"createTime\":\"2020-01-15 10:55:11\",\"createId\":1}', '1', '2020-01-15 10:55:11', '1', '2020-01-15 10:55:11', '1');
INSERT INTO `sys_log` VALUES ('125', '2', '菜单', 'sys_menu', '42', '更新', '{\"id\":42,\"parentId\":39,\"name\":\"aaaaaaa\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"a\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:55:19\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:55:19', '1', '2020-01-15 10:55:19', '1');
INSERT INTO `sys_log` VALUES ('126', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:56:08\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:56:08', '1', '2020-01-15 10:56:08', '1');
INSERT INTO `sys_log` VALUES ('127', '2', '菜单', 'sys_menu', '42', '删除', '{\"id\":42,\"parentId\":0,\"name\":\"\",\"icon\":\"\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":0,\"type\":0,\"sort\":0,\"level\":0,\"enable\":0,\"updateTime\":\"2020-01-15 10:56:11\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:56:11', '1', '2020-01-15 10:56:11', '1');
INSERT INTO `sys_log` VALUES ('128', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:57:56\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:57:56', '1', '2020-01-15 10:57:56', '1');
INSERT INTO `sys_log` VALUES ('129', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:58:09\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:58:09', '1', '2020-01-15 10:58:09', '1');
INSERT INTO `sys_log` VALUES ('130', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 10:58:28\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 10:58:28', '1', '2020-01-15 10:58:28', '1');
INSERT INTO `sys_log` VALUES ('131', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"/\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 11:00:14\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:00:14', '1', '2020-01-15 11:00:14', '1');
INSERT INTO `sys_log` VALUES ('132', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 11:00:57\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:00:57', '1', '2020-01-15 11:00:57', '1');
INSERT INTO `sys_log` VALUES ('133', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"\",\"url\":\"/article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 11:01:11\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:01:11', '1', '2020-01-15 11:01:11', '1');
INSERT INTO `sys_log` VALUES ('134', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"\",\"url\":\"we_service/article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 11:01:43\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:01:43', '1', '2020-01-15 11:01:43', '1');
INSERT INTO `sys_log` VALUES ('135', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"\",\"url\":\"article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 11:02:07\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:02:07', '1', '2020-01-15 11:02:07', '1');
INSERT INTO `sys_log` VALUES ('136', '2', '菜单', 'sys_menu', '43', '插入', '{\"id\":43,\"parentId\":40,\"name\":\"创建文章\",\"icon\":\"we_article_create\",\"urlkey\":\"\",\"url\":\"article/create\",\"perms\":\"\",\"status\":0,\"type\":2,\"sort\":2,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 11:16:36\",\"updateId\":1,\"createTime\":\"2020-01-15 11:16:36\",\"createId\":1}', '1', '2020-01-15 11:16:36', '1', '2020-01-15 11:16:36', '1');
INSERT INTO `sys_log` VALUES ('137', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 11:23:26', '1', '2020-01-15 11:23:26', '1');
INSERT INTO `sys_log` VALUES ('138', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service\",\"perms\":\"\",\"status\":1,\"type\":1,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 11:27:23\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:27:23', '1', '2020-01-15 11:27:23', '1');
INSERT INTO `sys_log` VALUES ('139', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 11:27:40\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 11:27:40', '1', '2020-01-15 11:27:40', '1');
INSERT INTO `sys_log` VALUES ('140', '1', '用户', 'sys_user', '1', '登出', null, '1', '2020-01-15 11:28:29', '1', '2020-01-15 11:28:29', '1');
INSERT INTO `sys_log` VALUES ('141', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 11:28:32', '1', '2020-01-15 11:28:32', '1');
INSERT INTO `sys_log` VALUES ('142', '1', '用户', 'sys_user', '1', '登出', null, '1', '2020-01-15 11:29:24', '1', '2020-01-15 11:29:24', '1');
INSERT INTO `sys_log` VALUES ('143', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 11:29:28', '1', '2020-01-15 11:29:28', '1');
INSERT INTO `sys_log` VALUES ('144', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"\",\"url\":\"we_service\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 13:03:57\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 13:03:57', '1', '2020-01-15 13:03:57', '1');
INSERT INTO `sys_log` VALUES ('145', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"\",\"url\":\"article/list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 13:04:04\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 13:04:04', '1', '2020-01-15 13:04:04', '1');
INSERT INTO `sys_log` VALUES ('146', '2', '菜单', 'sys_menu', '43', '更新', '{\"id\":43,\"parentId\":40,\"name\":\"创建文章\",\"icon\":\"we_article_create\",\"urlkey\":\"\",\"url\":\"article/create\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":2,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 13:04:07\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 13:04:07', '1', '2020-01-15 13:04:07', '1');
INSERT INTO `sys_log` VALUES ('147', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:11:28', '1', '2020-01-15 13:11:28', '1');
INSERT INTO `sys_log` VALUES ('148', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:11:42', '1', '2020-01-15 13:11:42', '1');
INSERT INTO `sys_log` VALUES ('149', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:17:56', '1', '2020-01-15 13:17:56', '1');
INSERT INTO `sys_log` VALUES ('150', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:19:04', '1', '2020-01-15 13:19:04', '1');
INSERT INTO `sys_log` VALUES ('151', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:23:17', '1', '2020-01-15 13:23:17', '1');
INSERT INTO `sys_log` VALUES ('152', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:25:39', '1', '2020-01-15 13:25:39', '1');
INSERT INTO `sys_log` VALUES ('153', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:26:17', '1', '2020-01-15 13:26:17', '1');
INSERT INTO `sys_log` VALUES ('154', '1', '用户', 'sys_user', '1', '登录', null, '1', '2020-01-15 13:29:17', '1', '2020-01-15 13:29:17', '1');
INSERT INTO `sys_log` VALUES ('155', '2', '菜单', 'sys_menu', '40', '更新', '{\"id\":40,\"parentId\":39,\"name\":\"文章\",\"icon\":\"we_article\",\"urlkey\":\"article\",\"url\":\"we_service/article\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":2,\"enable\":0,\"updateTime\":\"2020-01-15 13:34:48\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 13:34:48', '1', '2020-01-15 13:34:48', '1');
INSERT INTO `sys_log` VALUES ('156', '2', '菜单', 'sys_menu', '41', '更新', '{\"id\":41,\"parentId\":40,\"name\":\"文章列表\",\"icon\":\"we_article_list\",\"urlkey\":\"list\",\"url\":\"list\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":1,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 13:34:53\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 13:34:53', '1', '2020-01-15 13:34:53', '1');
INSERT INTO `sys_log` VALUES ('157', '2', '菜单', 'sys_menu', '43', '更新', '{\"id\":43,\"parentId\":40,\"name\":\"创建文章\",\"icon\":\"we_article_create\",\"urlkey\":\"create\",\"url\":\"create\",\"perms\":\"\",\"status\":1,\"type\":2,\"sort\":2,\"level\":3,\"enable\":0,\"updateTime\":\"2020-01-15 13:34:58\",\"updateId\":1,\"createTime\":\"\",\"createId\":0}', '1', '2020-01-15 13:34:58', '1', '2020-01-15 13:34:58', '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '名称/11111',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `urlkey` varchar(256) DEFAULT NULL COMMENT '菜单key',
  `url` varchar(256) DEFAULT NULL COMMENT '链接地址',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `type` int(11) DEFAULT '1' COMMENT '类型//select/1,目录,2,菜单,3,按钮',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `level` int(11) DEFAULT '1' COMMENT '级别',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用//radio/1,启用,2,禁用',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '更新人',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '20', '系统首页', 'welcome', 'home', '/welcome', '', '1', '2', '10', '2', '1', '2019-12-06 10:37:44', '1', '2015-04-27 17:28:06', '1');
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', 'settings', 'system_root', null, null, '1', '1', '190', '1', '1', '2019-12-04 14:18:23', '1', '2015-04-27 17:28:06', '1');
INSERT INTO `sys_menu` VALUES ('3', '2', '组织机构', 'depart', 'department', '/system/department/index', null, '1', '2', '191', '2', '1', '2020-01-09 15:04:46', '1', '2015-04-27 17:28:25', '1');
INSERT INTO `sys_menu` VALUES ('4', '2', '用户管理', 'user_1', 'user', '/system/user/index', null, '1', '2', '192', '2', '1', '2019-12-04 14:14:06', '1', '2015-04-27 17:28:46', '1');
INSERT INTO `sys_menu` VALUES ('5', '2', '角色管理', 'role', 'role', '/system/role/index', null, '1', '2', '194', '2', '1', '2019-12-04 14:14:12', '1', '2015-04-27 17:29:13', '1');
INSERT INTO `sys_menu` VALUES ('6', '2', '菜单管理', 'menu', 'menu', '/system/menu/index', null, '1', '2', '196', '2', '1', '2019-12-04 14:14:33', '1', '2015-04-27 17:29:43', '1');
INSERT INTO `sys_menu` VALUES ('20', '0', '业务处理', 'business', 'home', '', '', '1', '1', '10', '1', '1', '2019-12-04 14:14:55', '1', '2019-02-17 23:24:08', '1');
INSERT INTO `sys_menu` VALUES ('37', '2', '参数配置', 'config', null, 'system/config/index', null, '1', '2', '198', '2', '1', '2019-12-12 15:31:40', '1', '2019-12-10 14:51:29', '1');
INSERT INTO `sys_menu` VALUES ('38', '2', '日志管理', 'log', 'log', 'system/log/index', null, '1', '2', '199', '2', '1', '2019-12-12 15:31:24', '1', '2019-12-10 14:55:22', '1');
INSERT INTO `sys_menu` VALUES ('39', '0', '微服务', 'business', 'we_service', null, null, '1', '1', '200', '1', '1', '2020-01-09 10:20:00', '1', '2020-01-09 10:19:20', '1');
INSERT INTO `sys_menu` VALUES ('40', '39', '文章', 'we_article', 'article', 'we_service/article', null, '1', '2', '1', '2', '1', '2020-01-15 13:34:48', '1', '2020-01-09 10:24:40', '1');
INSERT INTO `sys_menu` VALUES ('41', '40', '文章列表', 'we_article_list', 'list', 'list', null, '1', '2', '1', '3', '1', '2020-01-15 13:34:53', '1', '2020-01-15 10:43:58', '1');
INSERT INTO `sys_menu` VALUES ('43', '40', '创建文章', 'we_article_create', 'create', 'create', null, '1', '2', '2', '3', '1', '2020-01-15 13:34:58', '1', '2020-01-15 11:16:36', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '名称/11111/',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `remark` text COMMENT '说明//textarea',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用//radio/1,启用,2,禁用',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '更新人',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '测试角色', '1', '10', '', '1', '2019-12-30 15:14:57', '1', '2017-09-15 14:54:26', '1');
INSERT INTO `sys_role` VALUES ('2', '新来的', '1', '1', '测试文本', '1', '2019-12-30 14:48:09', '1', '2019-12-30 14:48:09', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和菜单关联';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('50', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('51', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('52', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('53', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('54', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('55', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('56', '2', '6');
INSERT INTO `sys_role_menu` VALUES ('57', '2', '8');
INSERT INTO `sys_role_menu` VALUES ('58', '2', '9');
INSERT INTO `sys_role_menu` VALUES ('67', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('68', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('69', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('70', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('71', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('72', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('73', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('74', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('75', '1', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) DEFAULT NULL COMMENT 'UUID',
  `username` varchar(32) NOT NULL COMMENT '登录名/11111',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(16) NOT NULL DEFAULT '1111' COMMENT '密码盐',
  `real_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `depart_id` int(11) DEFAULT '0' COMMENT '部门/11111/dict',
  `user_type` int(11) DEFAULT '2' COMMENT '类型//select/1,管理员,2,普通用户,3,前台用户,4,第三方用户,5,API用户',
  `status` int(11) DEFAULT '10' COMMENT '状态',
  `thirdid` varchar(200) DEFAULT NULL COMMENT '第三方ID',
  `endtime` varchar(32) DEFAULT NULL COMMENT '结束时间',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `tel` varchar(32) DEFAULT NULL COMMENT '手机号',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `title_url` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `remark` varchar(1000) DEFAULT NULL COMMENT '说明',
  `theme` varchar(64) DEFAULT 'default' COMMENT '主题',
  `back_site_id` int(11) DEFAULT '0' COMMENT '后台选择站点ID',
  `create_site_id` int(11) DEFAULT '1' COMMENT '创建站点ID',
  `project_id` bigint(20) DEFAULT '0' COMMENT '项目ID',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用//radio/1,启用,2,禁用',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '更新人',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '94091b1fa6ac4a27a06c0b92155aea6a', 'admin', '9fb3dc842c899aa63d6944a55080b795', '1111', '系统管理员', '10001', '1', '10', '', '', 'zcool321@sina.com', '123', '', '', '时间是最好的老师，但遗憾的是&mdash;&mdash;最后他把所有的学生都弄死了', 'flat', '5', '1', '1', 'test', '1', '2019-07-08 18:12:28', '1', '2017-03-19 20:41:25', '1');
INSERT INTO `sys_user` VALUES ('9', 'xa5450ztN08S37tKj93ujhJ66069q92R', 'test', 'ea8207ee50ccf367e99c8444fda7da32', 'GM26Mq', 'test', '10002', '2', '10', null, null, null, null, null, null, null, 'default', '0', '1', '0', null, '1', '2019-11-12 15:31:31', '1', '2019-07-11 15:49:24', '1');
INSERT INTO `sys_user` VALUES ('12', '8609WdcTI1337Y7e5kQ94v872Z02mh24', 'testLogin', '7f4d0d8db5546f395e87dfd294608b9b', '3n7Ci8', 'testLogin', '10002', '2', '10', null, null, null, null, null, null, null, 'default', '0', '1', '0', null, '1', '2019-11-12 15:31:08', '1', '2019-11-12 15:31:08', '1');
INSERT INTO `sys_user` VALUES ('13', 'PTMB2mcqk87n1x15K84E56T75SY11Q5w', 'testLogout', '961c0645f7ae271d6e1fc1ff01e786d7', '0X6509', 'testLogout', '10002', '2', '10', null, null, null, null, null, null, null, 'default', '0', '1', '0', null, '1', '2019-11-12 15:31:19', '1', '2019-11-12 15:31:19', '1');
INSERT INTO `sys_user` VALUES ('14', 'HjTZB3l8TVC8yDdx7oIDNXGdCxqOrX45', 'chenyu', '70795e17df1c7751f38b91ef2174127d', 'izRXW6', '尘雨雾录', '10002', '1', '10', null, null, null, '17764566464', null, null, null, 'default', '0', '1', '0', null, '1', '2020-01-09 16:15:35', '14', '2019-12-31 14:33:57', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户和角色关联';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for waluduo_article
-- ----------------------------
DROP TABLE IF EXISTS `waluduo_article`;
CREATE TABLE `waluduo_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `publish_time` varchar(24) DEFAULT NULL COMMENT '发布时间',
  `ctx` text COMMENT '内容',
  `createtime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waluduo_article
-- ----------------------------

-- ----------------------------
-- Table structure for waluduo_user
-- ----------------------------
DROP TABLE IF EXISTS `waluduo_user`;
CREATE TABLE `waluduo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `kule` varchar(255) DEFAULT '' COMMENT '检测字符',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waluduo_user
-- ----------------------------
INSERT INTO `waluduo_user` VALUES ('1', 'dio', '是的', '1578029105');
INSERT INTO `waluduo_user` VALUES ('2', 'jojo', '没有', '1578029105');
