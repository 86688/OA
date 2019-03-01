/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-18 16:21:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('account', '1', '1550477904');
INSERT INTO `auth_assignment` VALUES ('dept_aid', '5', '1550478038');
INSERT INTO `auth_assignment` VALUES ('gm', '1', '1550477904');
INSERT INTO `auth_assignment` VALUES ('hr_aid', '1', '1550477904');
INSERT INTO `auth_assignment` VALUES ('hr_head', '1', '1550477904');
INSERT INTO `auth_assignment` VALUES ('hr_head', '4', '1478063489');
INSERT INTO `auth_assignment` VALUES ('meet_aid', '1', '1550477904');
INSERT INTO `auth_assignment` VALUES ('pm', '2', '1478063489');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `type` int(2) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) unsigned DEFAULT NULL,
  `updated_at` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('1', 'account', '会计', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'approve_vac', '审批假期', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'backend', '后台登录', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'cco', '创意总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'cfo', '财务总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'clsh', '业务总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'clsh_etc', '业务副总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'del_emp', '删除人员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'dept_aid', '部门助理', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'dept_head', '部门长', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'gm', '总经理', null, null, null, null);
INSERT INTO `auth_item` VALUES ('1', 'gm_vice', '副经理', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'hr_aid', '人事助理', null, null, null, null);
INSERT INTO `auth_item` VALUES ('1', 'hr_head', '人事总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'meet_aid', '会务专员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'meet_head', '会务经理', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'modify_emp', '修改人员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'modify_pro', '修改项目', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'new_emp', '新增人员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'new_mess', '新建消息', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'new_pro', '新建项目', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'pm', '项目经理', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'view_emp', '查看人员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'view_pro', '查看项目', null, null, '1465177361', '1465177361');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('gm', 'hr_head');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'modify_emp');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'new_emp');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'view_emp');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) unsigned DEFAULT NULL,
  `updated_at` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `client_cmy_name` varchar(50) NOT NULL COMMENT '客户公司名字',
  `client_dept` varchar(15) DEFAULT NULL COMMENT '客户公司部门',
  `client_province` varchar(20) DEFAULT NULL COMMENT '客户公司省份',
  `client_city` varchar(10) DEFAULT NULL COMMENT '客户公司城市',
  `client_site` varchar(60) DEFAULT NULL COMMENT '客户公司地址',
  `client_linkman` varchar(20) DEFAULT NULL COMMENT '客户公司联系人',
  `client_man_title` varchar(10) DEFAULT NULL COMMENT '客户公司联系人职称',
  `client_linktel` varchar(15) NOT NULL COMMENT '客户公司联系电话',
  `client_email` varchar(30) DEFAULT NULL COMMENT '客户公司邮箱',
  `client_tax_num` varchar(50) DEFAULT NULL COMMENT '统一社会代码',
  `client_bank` varchar(50) DEFAULT NULL COMMENT '客户公司银行',
  `client_bank_num` varchar(20) DEFAULT NULL COMMENT '客户公司银行卡号码',
  `client_capital` varchar(20) DEFAULT '' COMMENT '客户公司注册资本',
  `coupon_rate` varchar(10) DEFAULT NULL COMMENT '票面税率',
  `is_taxpayer` tinyint(1) DEFAULT NULL COMMENT '是否一般纳税人',
  `client_remark` varchar(75) DEFAULT NULL COMMENT '客户公司备注信息',
  `invoice_id` int(1) unsigned DEFAULT NULL COMMENT '发票的ID',
  PRIMARY KEY (`client_id`),
  KEY `client_id` (`client_id`) USING BTREE,
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  CONSTRAINT `fk_client_project` FOREIGN KEY (`client_id`) REFERENCES `project` (`client_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client
-- ----------------------------

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `crt_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同编号',
  `crt_type` varchar(5) DEFAULT NULL COMMENT '合同类型',
  `crt_src` varchar(255) NOT NULL COMMENT '合同位置',
  `crt_remark` varchar(75) DEFAULT NULL COMMENT '合同备注信息',
  `crt_newtime` int(11) unsigned DEFAULT NULL COMMENT '合同新建时间',
  `crt_uptime` int(11) unsigned DEFAULT NULL COMMENT '合同修改时间',
  PRIMARY KEY (`crt_id`),
  KEY `client_id` (`crt_id`) USING BTREE,
  CONSTRAINT `fk_contract_contract_1` FOREIGN KEY (`crt_id`) REFERENCES `project` (`crt_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dept_name` varchar(15) NOT NULL COMMENT '部门名字',
  `dept_level` tinyint(1) unsigned NOT NULL COMMENT '部门级别',
  `dept_p_id` tinyint(1) unsigned NOT NULL COMMENT '上级部门编号',
  `dept_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '财务部', '0', '0', '0');
INSERT INTO `dept` VALUES ('2', '业务部', '0', '0', '0');
INSERT INTO `dept` VALUES ('3', '生产部', '0', '0', '0');
INSERT INTO `dept` VALUES ('5', '营业部', '1', '1', '1');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '发票编号',
  `client_id` int(1) unsigned NOT NULL COMMENT '客户公司ID',
  `self_cmy` varchar(50) NOT NULL COMMENT '自己公司的名字',
  `self_project` varchar(50) DEFAULT NULL COMMENT '自己公司项目',
  `invoice_type` varchar(10) DEFAULT NULL COMMENT '发票类型增专增普',
  `invoice_kind` varchar(60) DEFAULT NULL COMMENT '发票用途餐饮住宿类',
  `invoice_money` varchar(20) DEFAULT NULL COMMENT '发票金额',
  `invoice_status` varchar(50) DEFAULT NULL COMMENT '发票状态',
  `express_remark` varchar(75) DEFAULT NULL COMMENT '快递信息备注',
  `remark` varchar(75) DEFAULT NULL COMMENT '发票信息备注',
  PRIMARY KEY (`invoice_id`),
  KEY `client_id` (`invoice_id`) USING BTREE,
  CONSTRAINT `fk_invoice_client` FOREIGN KEY (`invoice_id`) REFERENCES `client` (`invoice_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migration
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '������',
  `type` varchar(4) NOT NULL COMMENT '��������',
  `content` text COMMENT '��������',
  `new_time` int(11) unsigned DEFAULT NULL COMMENT '���洴��ʱ��',
  PRIMARY KEY (`notice_id`),
  KEY `role_id` (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for notice_type
-- ----------------------------
DROP TABLE IF EXISTS `notice_type`;
CREATE TABLE `notice_type` (
  `notice_type_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '������',
  `type` varchar(4) NOT NULL COMMENT '��������',
  `type_new_time` int(11) unsigned DEFAULT NULL COMMENT '���ʹ���ʱ��',
  PRIMARY KEY (`notice_type_id`),
  KEY `role_id` (`notice_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of notice_type
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '��Ŀ���',
  `project_name` varchar(50) NOT NULL COMMENT '��Ŀ����',
  `depe_id` varchar(30) DEFAULT NULL,
  `new_time` int(11) unsigned DEFAULT NULL COMMENT '��Ŀ�½�ʱ��',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '��Ŀ����ʱ��',
  `confirm_time` int(11) unsigned DEFAULT NULL COMMENT '��Ŀȷ��ʱ��',
  `exec_time` int(11) unsigned DEFAULT NULL COMMENT '��Ŀִ��ʱ��',
  `end_time` int(11) unsigned DEFAULT NULL COMMENT '��Ŀ���ʱ��',
  `principal` varchar(10) DEFAULT NULL COMMENT '��Ŀ������',
  `assist` varchar(100) DEFAULT NULL COMMENT '��ĿЭ����',
  `city` varchar(20) DEFAULT NULL COMMENT '��Ŀ����',
  `address` varchar(100) DEFAULT NULL COMMENT '��Ŀ�ص�',
  `budget` varchar(30) DEFAULT NULL COMMENT '��ĿԤ��',
  `crt_id` int(1) unsigned DEFAULT NULL COMMENT '��ͬ���',
  `self_id` tinyint(3) unsigned DEFAULT NULL COMMENT '�Լ���˾���',
  `client_id` int(1) unsigned DEFAULT NULL COMMENT '�ͻ����',
  `project_remark` varchar(75) DEFAULT NULL COMMENT '��Ŀ��ע',
  `rating` varchar(10) DEFAULT NULL COMMENT '��Ŀ����',
  `phase` tinyint(1) NOT NULL COMMENT '�׶� 1-����2-δ��3-ȷ��4-ִ��5-����',
  `project_type` varchar(5) DEFAULT NULL COMMENT '��Ŀ����',
  PRIMARY KEY (`project_id`),
  KEY `project_id` (`project_id`) USING BTREE,
  KEY `client_id` (`client_id`) USING BTREE,
  KEY `self_id` (`self_id`) USING BTREE,
  KEY `crt_id` (`crt_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for self_cmy
-- ----------------------------
DROP TABLE IF EXISTS `self_cmy`;
CREATE TABLE `self_cmy` (
  `self_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '�ͻ����',
  `self_cmy` varchar(20) NOT NULL COMMENT '�ͻ���˾����',
  PRIMARY KEY (`self_id`),
  KEY `client_id` (`self_id`) USING BTREE,
  CONSTRAINT `fk_self_cmy_self_cmy_1` FOREIGN KEY (`self_id`) REFERENCES `project` (`self_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of self_cmy
-- ----------------------------

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` tinyint(1) unsigned NOT NULL COMMENT '状态编号',
  `status_name` varchar(2) NOT NULL COMMENT '状态注释',
  KEY `status_id` (`status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('0', '试用');
INSERT INTO `status` VALUES ('1', '正式');
INSERT INTO `status` VALUES ('2', '离职');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `title_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '职务编号',
  `title_name` varchar(10) NOT NULL COMMENT '职务名字',
  `title_p_id` tinyint(1) unsigned NOT NULL COMMENT '上级职务编号',
  PRIMARY KEY (`title_id`),
  KEY `role_id` (`title_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', '管理员', '0');
INSERT INTO `title` VALUES ('2', '操作员', '0');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `train_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '��ѵ���',
  `title` varchar(50) NOT NULL COMMENT '��ѵ����',
  `src` varchar(100) DEFAULT NULL COMMENT '�ļ���Դλ��',
  `tag` varchar(100) DEFAULT NULL COMMENT '��ѵ����',
  PRIMARY KEY (`train_id`),
  KEY `role_id` (`train_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of train
-- ----------------------------

-- ----------------------------
-- Table structure for train_tag
-- ----------------------------
DROP TABLE IF EXISTS `train_tag`;
CREATE TABLE `train_tag` (
  `tag_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '��ѵ���ͱ��',
  `tag_word` varchar(8) NOT NULL COMMENT '��ѵ��������',
  `frequency` int(2) DEFAULT NULL,
  `new_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `role_id` (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of train_tag
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` smallint(3) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '职员编号',
  `user_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '职员姓名',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '安全',
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '123456' COMMENT '职员密码',
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '重置密码',
  `sex` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '职员性别',
  `tel` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '职员电话',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '职员邮箱',
  `id_card` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '职员身份证',
  `school` varchar(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '职员院校',
  `major` varchar(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '职员专业',
  `crt_start` int(11) unsigned NOT NULL COMMENT '合同开始',
  `crt_end` int(11) unsigned NOT NULL COMMENT '合同结束',
  `ctr_num` tinyint(1) NOT NULL COMMENT '合同次数',
  `work_place` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '工作地点',
  `linkman` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人',
  `linktel` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人电话',
  `housing_fund` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '住房公积金',
  `vacation` tinyint(1) unsigned DEFAULT NULL COMMENT '年假',
  `status_id` tinyint(1) unsigned NOT NULL COMMENT '状态编号(外键)',
  `dept_id` tinyint(1) unsigned NOT NULL COMMENT '部门编号(外键)',
  `title_id` tinyint(1) unsigned NOT NULL COMMENT '角色编号（外键）',
  PRIMARY KEY (`user_id`),
  KEY `rolekey` (`title_id`) USING BTREE,
  KEY `deptkey` (`dept_id`) USING BTREE,
  KEY `statuskey` (`status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', 'test', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', '', '男', '18701558556', 'qq@qq.com', '125323232323222222', '黄埔军校', '计算机', '1548914453', '1548914453', '1', '上海', '张江', '11111111111', '18701558590', '2', '2', '1', '2');
INSERT INTO `user` VALUES ('002', '李明', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '18701558556', 'qq@qq.com', '13358616', '北京大学', '计算机', '1548914453', '1548914453', '1', '上海', '张江', '11111111111', '11111111111', '2', '1', '2', '1');
INSERT INTO `user` VALUES ('003', 'aa', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '18701558556', 'qq@qq.com', '13358616', '清华大学', '计算机', '1548914453', '1548914453', '1', '上海', '张江', '11111111111', '11111111111', '2', '2', '3', '0');
INSERT INTO `user` VALUES ('004', 'as', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '', '', '', '', '', '0', '0', '0', '', '', '', '', null, '0', '0', '0');
INSERT INTO `user` VALUES ('005', 'dd', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '', '', '', '', '', '0', '0', '0', '', '', '', '', null, '0', '0', '0');

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `vendor_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '��Ӧ�̱��',
  `vendor_name` varchar(50) NOT NULL COMMENT '��Ӧ������',
  `vendor_type` varchar(50) NOT NULL COMMENT '��Ӧ�����',
  `vendor_province` varchar(10) NOT NULL COMMENT '��Ӧ��ʡ��',
  `vendor_city` varchar(10) NOT NULL COMMENT '��Ӧ�̳���',
  `vendor_linkman` varchar(5) DEFAULT NULL COMMENT '��Ӧ����ϵ��',
  `vendor_linktel` varchar(15) DEFAULT NULL COMMENT '��Ӧ����ϵ�绰',
  `vendor_email` varchar(30) DEFAULT NULL COMMENT '��Ӧ������',
  `coupon_rate` varchar(10) DEFAULT NULL COMMENT 'Ʊ��˰��',
  `is_taxpayer` tinyint(1) DEFAULT NULL COMMENT '�Ƿ�һ����˰��',
  `vendor_address` varchar(50) DEFAULT NULL COMMENT '��˾��ַ',
  `social_code` varchar(50) DEFAULT NULL COMMENT 'ͳһ������',
  `deposit_bank` varchar(50) DEFAULT NULL COMMENT '��������',
  `bank_num` varchar(16) DEFAULT NULL COMMENT '���п�����',
  `register_capital` varchar(10) DEFAULT NULL COMMENT 'ע���ʱ�',
  PRIMARY KEY (`vendor_id`),
  KEY `role_id` (`vendor_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vendor
-- ----------------------------

-- ----------------------------
-- Table structure for vendor_type
-- ----------------------------
DROP TABLE IF EXISTS `vendor_type`;
CREATE TABLE `vendor_type` (
  `type_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '������',
  `type_name` varchar(10) NOT NULL COMMENT '��������',
  PRIMARY KEY (`type_id`),
  KEY `role_id` (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vendor_type
-- ----------------------------
