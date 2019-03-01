/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-26 15:54:32
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
INSERT INTO `auth_assignment` VALUES ('account', '1', '1551143502');
INSERT INTO `auth_assignment` VALUES ('hr_head', '1', '1551143502');
INSERT INTO `auth_assignment` VALUES ('hr_head', '4', '1478063489');
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
INSERT INTO `auth_item` VALUES ('1', 'cashier', '出纳', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'cco', '创意总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'cfo', '财务总监', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('2', 'del_emp', '删除人员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'dept_head', '部门长', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'gm', '总经理', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'hr_aid', '人事助理', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('1', 'hr_head', '人事总监', null, null, '1465177361', '1465177361');
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
INSERT INTO `auth_item_child` VALUES ('cfo', 'account');
INSERT INTO `auth_item_child` VALUES ('account', 'backend');
INSERT INTO `auth_item_child` VALUES ('cashier', 'backend');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'backend');
INSERT INTO `auth_item_child` VALUES ('cfo', 'cashier');
INSERT INTO `auth_item_child` VALUES ('gm', 'cfo');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'del_emp');
INSERT INTO `auth_item_child` VALUES ('gm', 'dept_head');
INSERT INTO `auth_item_child` VALUES ('hr_head', 'hr_aid');
INSERT INTO `auth_item_child` VALUES ('gm', 'hr_head');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'modify_emp');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'new_emp');
INSERT INTO `auth_item_child` VALUES ('account', 'new_mess');
INSERT INTO `auth_item_child` VALUES ('cco', 'new_mess');
INSERT INTO `auth_item_child` VALUES ('hr_aid', 'new_mess');
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
  KEY `invoice_id` (`invoice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '永诚财产保险股份有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('2', '国海富兰克林基金管理有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('3', '招商银行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('4', '太平养老保险股份有限公司', null, null, null, '中国（上海）自由贸易试验区银城中路488号25-26层021-61002888', null, null, '', null, '91310000710933163N', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('5', '招商银行股份有限公司信用卡中心', null, null, null, '上海市浦东新区来安路686号021-38834600', null, null, '', null, '91310000786713482M', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('6', '西姆流体技术(上海)有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('7', '深圳市星空广告有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('8', '兴业国际信托有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('9', '海口市贸促会', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('10', '中国电信股份有限公司培训事业部', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('11', '施乐辉医用产品国际贸易(上海)有限公司', null, null, null, '中国(上海)自由贸易试验区奥纳路188号通用厂房楼第四层B部位电话：23303000', null, null, '', null, '91310000607411498D', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('12', '中国工商银行金山支行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('13', '武汉苏泊尔炊具有限公司', null, null, null, '武汉市汉阳区彭佳岭368号电话027-84680245', null, null, '', null, '420105758155532 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('14', '上海帝泰发展有限公司', null, null, null, '陆家嘴西路168号B1层021-68877888', null, null, '', null, '310115607304334 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('15', '通标标准技术服务(上海)有限公司', null, null, null, '上海市徐汇区宜山路889号3幢电话：61402535', null, null, '', null, '310104685465707 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('16', '杭州腾飞汽车服务有限公司', null, null, null, '杭州市南山路218号0571-87088911', null, null, '', null, '330102762011240 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('17', '西盖米食品(上海)有限公司', null, null, null, '上海市闵行区江川路2285号C栋电话：54723140', null, null, '', null, '310112764270529 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('18', '屈臣氏酒窖(上海)有限公司', null, null, null, '上海市黄浦区黄陂南路333号企业天地3号楼1B&1D电话：63406988', null, null, '', null, '310101577408836 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('19', '上海明天广场有限公司金威万豪酒店', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('20', '康德乐(上海)医药有限公司', null, null, null, '上海市松江区九亭经济开发区伴亭路418号电话021-37610080', null, null, '', null, '913100007659709000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('21', '南方医科大学第三附属医院', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('22', '中汽中心盐城汽车试验场有限公司', null, null, null, '江苏省大丰市大丰港经济区电话：0515-69860882', null, null, '', null, '320982571427139 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('23', '上海城开集团晶实置业有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('24', '太平电子商务有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('25', '上海网之易网络科技发展有限公司', null, null, null, '上海市张江高科技园区碧波路690号5号楼电话：61947141', null, null, '', null, '31011566943760X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('26', '深圳市泛亚美国际旅行社有限公司', null, null, null, '深圳市福田区华强北路群星广场B座1901室电话：0755-83741929', null, null, '', null, '44030055211513X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('27', 'Greenland(Sydney)PacificHighwayDevelopmentPtyLtd', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('28', '上海农商银行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('29', 'Greenland(Sydney)GeorgeStreetDevelopmentPtyLtd', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('30', '北京源沁元会议服务有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('31', '舍弗勒贸易(上海)有限公司', null, null, null, '上海市嘉定区安亭镇安拓路1号电话：021-39576500', null, null, '', null, '91310000789570966J', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('32', '三亚盈湾酒店有限公司三亚喜来登度假酒店', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('33', '王府井饭店管理有限公司北京金茂万丽酒店', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('34', '上海百事可乐饮料有限公司', null, null, null, '上海市闵行区文井路288号电话021-64303280', null, null, '', null, '310112607230216 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('35', '科勒(中国)投资有限公司', null, null, null, '上海市闸北区市北工业园区江场三路158号26062000', null, null, '', null, '310108710920282 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('36', '舍弗勒(中国)有限公司', null, null, null, '江苏省太仓市舍弗勒路1-3路0512-53958000', null, null, '', null, '91320585608268371C', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('37', '健尔医疗设备(北京)有限公司', null, null, null, '北京市朝阳区东三环北路霞光里18号1号楼B座10层A单元电话：010-57643309', null, null, '', null, '110105563602857 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('38', '北京至诚中盈会议服务有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('39', '舍弗勒(南京)有限公司', null, null, null, '南京市江宁区东山街道天元东路118号(江宁科技园)025-68211203', null, null, '', null, '32012157591580X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('40', '深圳市时代华尔广告有限公司', null, null, null, '深圳市福田区泰然九路海松大厦B座901、902A，电话：0755-82714662', null, null, '', null, '440300775586246 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('41', '招银金融租赁有限公司', null, null, null, '上海市浦东新区陆家嘴环路1088号招商银行大厦21,22楼，6105999', null, null, '', null, '91310000672707244B', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('42', '北京市网力华泰科技有限公司', null, null, null, '北京市海淀区北四环中路229号海泰大厦1129室电话：010-52776998', null, null, '', null, '110108306632924 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('43', '中国建设银行上海长宁支行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('44', '椿本汽车发动机(上海)有限公司', null, null, null, '上海市嘉定工业北区兴贤路1151号4幢电话：5996555', null, null, '', null, '310114761155795 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('45', '上海币达信息技术有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('46', '舍弗勒投资(中国)有限公司', null, null, null, '上海市嘉定区安亭镇安拓路1号021-39576000', null, null, '', null, '91310000763334746L', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('47', '北京康拉德房地产开发有限公司康莱德酒店分公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('48', '招商银行温州分行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('49', '上海家化联合股份有限公司', null, null, null, '保定路527号65456400', null, null, '', null, '310229607334939 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('50', '北京天成鹰驰营销策划有限公司', null, null, null, '北京市朝阳区广渠东路唐家村12幢010-59796508', null, null, '', null, '110105795123679 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('51', '保时捷(中国)汽车销售有限公司', null, null, null, '东方路1215-1217号陆家嘴软件园11号楼B楼三层电话：61565911', null, null, '', null, '310115717859912 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('52', '康蒂思(上海)医疗器械有限公司', null, null, null, '上海市延安东路550号海洋大厦15楼53316433', null, null, '', null, '310141341997945 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('53', '北京世纪金阳文化传媒有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('54', '招商银行股份有限公司', null, null, null, '深圳市福田区深南大道7088号招商银行大厦0755-83198888', null, null, '', null, '9144030010001686XA', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('55', '艾沛克斯动力工具贸易(上海)有限公司', null, null, null, '中国(上海)自由贸易试验区富特东一路146号三幢一层B部位021-60880326', null, null, '', null, '310141563059532 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('56', '广东网金控股股份有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('57', '上海寰通商务科技有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('58', '太平养老保险股份有限公司工会委员会', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('59', '上海妙声科技有限公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('60', '太平养老保险股份有限公司上海分公司', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('61', '通标标准技术服务有限公司上海分公司', null, null, null, '上海市宜山路900号15楼B座', null, null, '', null, '310104X07218977', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('62', '招商银行香港分行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('63', '上海良信电器股份有限公司', null, null, null, '上海市浦东新区申江南路2000号电话：68586699', null, null, '', null, '91310000631324319E', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('64', '耐世特汽车系统（苏州）有限公司上海分公司', null, null, null, '上海市长宁区长宁路1018号2204-2206室021-22157188', null, null, '', null, '91310000669439306A', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('65', '特雷克斯（常州）机械有限公司', null, null, null, '常州市新北区汉江路139号0519-69882725', null, null, '', null, '91320411675465666U', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('66', '上海理工大学', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('67', '湖南芙蓉国酒店管理有限公司长沙芙蓉国温德姆至尊豪廷大酒店', null, null, null, '长沙市芙蓉区芙蓉中路二段106号0731-88688888', null, null, '', null, '430102696221310 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('68', '上海雅恒房地产开发有限公司', null, null, null, '上海黄浦区西藏中路525号021-23129888', null, null, '', null, '310101744941284 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('69', '招商银行股份有限公司重庆分行', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('70', '普洛斯投资管理（中国）有限公司', null, null, null, '上海市浦东新区陆家嘴环路1233号汇亚大厦2708室电话：61052781', null, null, '', null, '913100007655863000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('71', '河北省医师协会', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('72', '上海达食商贸有限公司', null, null, null, '上海市普陀区安远路518号宝华城市晶典大厦705室021-51083711', null, null, '', null, '91310000MA1G044MXH', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('73', '嘉里一酒香(上海)贸易有限公司', null, null, null, '上海市静安区天目西路128号企业中心1座1704室02160322999', null, null, '', null, '91310115580606366N', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('74', '武汉万达东湖置业有限公司万达瑞华酒店', null, null, null, '武汉市武昌区水果湖街东湖路138号027-59599999', null, null, '', null, '91420106081986122P', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('75', '大金(中国)投资有限公司上海分公司', null, null, null, '上海市静安区南京西路1468号6楼021-64660472', null, null, '', null, '310106741167174 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('76', '招商银行股份有限公司上海分行', null, null, null, '上海市浦东新区陆家嘴环路1088号021-58795555', null, null, '', null, '91310000832211775U', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('77', '招商银行股份有限公司北京分行', null, null, null, '北京市西城区复兴门内大街156号A座95555', null, null, '', null, '91110102801105478Y', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('78', '浙江外企德科人力资源服务有限公司', null, null, null, '浙江省杭州市拱墅区丰潭路380号城西银泰D座1101电话：0571-85059669', null, null, '', null, '91330100552660066F', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('79', '招商银行股份有限公司东莞分行', null, null, null, '东莞市南城区鸿福路200号第一国际招商银行大厦一至四层、二十三至二十五层0769-23362011', null, null, '', null, '9144190076159275XK', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('80', '招银国际金融有限公司', null, null, null, '香港中环夏悫道12号美国银行中心18楼1803-4室', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('81', '北京首页映像广告有限公司', null, null, null, '北京市朝阳区东大桥路8号院3号楼4层2438TEL:85988521', null, null, '', null, '11010569230926X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('82', '上海必胜客有限公司', null, null, null, '上海市浦东新区牡丹路60号801B室021-33398888', null, null, '', null, '913101156073309000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('83', '杉杉控股有限公司', null, null, null, '中国（上海）自由贸易试验区郭守敬路351号2号楼673-01室68823833', null, null, '', null, '913100007664793000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('84', '深圳市欧瑞博电子有限公司', null, null, null, '深圳市南山区学苑大道1001号南山智园A7栋7楼电话：0755-83256376', null, null, '', null, '440300574794639 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('85', '全球国际货运代理(中国)有限公司', null, null, null, '中国(上海)自由贸易试验区意威路266号021-61708888', null, null, '', null, '91310000717853035C', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('86', '上海海晏威固国际贸易有限公司', null, null, null, '上海市杨浦区黄兴路1599号1201室021-55128855', null, null, '', null, '913101157538493000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('87', '国金证券股份有限公司上海投资咨询分公司', null, null, null, '上海市浦东新区芳甸路1088号7层01-06单元021-60753909', null, null, '', null, '91310115093690820J', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('88', '国家电投集团保险经纪有限公司', null, null, null, '北京市西城区西直门外大街18号楼3单元17层1701010-56625668', null, null, '', null, '911101026705728000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('89', '太平养老保险股份有限公司四川分公司', null, null, null, '成都市青羊区顺城大街308号冠城广场1001、1002、1004、1009、1010号028-86527422', null, null, '', null, '915101056818478000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('90', '招行银行股份有限公司宁波分行', null, null, null, '宁波市江东区民安东路342号0574-87950011', null, null, '', null, '91330204717205038A', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('91', '中粮期货有限公司', null, null, null, '北京市东城区东直门南大街5号中青旅大厦15层、3层311-313室010-59137398', null, null, '', null, '11010510002304X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('92', '椿本汽车发动机（上海）有限公司', null, null, null, '嘉定工业区北区兴贤路1151号第四幢59968555', null, null, '', null, '91310000761155795U', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('93', '上海东证期货有限公司', null, null, null, '上海市浦电路500号上海期货大厦14层021-68400610', null, null, '', null, '91310000132110914L', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('94', '上海易兴会展服务有限公司', null, null, null, '上海市长宁区定西路1232号第4幢1号楼335室02162372135', null, null, '', null, '91310105060880476Q', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('95', '上海集希实业有限公司', null, null, null, '曹安公路1775号A座1103室TEL:021-64087932', null, null, '', null, '91310115761648944N', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('96', '太平养老保险股份有限公司北京分公司', null, null, null, '北京市西城区宣武门外大街6号庆胜广场写字楼东翼第一座16层101-59579000', null, null, '', null, '110108678221704 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('97', '中共上海东证期货有限公司委员会', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('98', '上海房金所金融信息服务有限公司', null, null, null, '中国（上海）自由贸易试验区杨高南路759号11层04单元021-60756822-8822', null, null, '', null, '9131000039876232XX', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('99', '圣皮尔精品酒业（上海）有限公司', null, null, null, '中国（上海）自由贸易实验区杨高北路2001号1幢4部位二层2-204室021-60561999', null, null, '', null, '91310000679375238F', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('100', '鹏卫齐商业(上海)有限公司', null, null, null, '中国上海市静安区安远路555号11楼、12楼、15楼(名义楼层)86-21-62322200', null, null, '', null, '913100006941762000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('101', '北京华宇兴泰科技有限公司', null, null, null, '北京市通州区次渠嘉创路5号1号楼新华联科技大厦813-1室010—67156858', null, null, '', null, '110105788954677 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('102', '上海长城电子信息网络有限公司', null, null, null, '天山路641号1号楼502室电话：52065968', null, null, '', null, '91310105134644653F', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('103', '上海积成慧集信息技术有限公司', null, null, null, '上海市松江区佘山镇天马东街88号202室021-32087310', null, null, '', null, '91310117672715922X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('104', '自动保存', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('105', '上海网波软件股份有限公司', null, null, null, '杨浦区隆昌路619号城市概念创意园2号楼A10-13021—31269900', null, null, '', null, '91310000568033067B', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('106', '上海必胜客有限公司工会委员会', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('107', '上海亿翰商务咨询股份有限公司', null, null, null, '崇明县潘园公路1800号2号楼1431室（上海泰和经济发展区）021-61553261', null, null, '', null, '91310000586828437P', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('108', '北京鑫星伊顿技术服务股份有限公司', null, null, null, '北京市海淀区万柳万全新新家园12号楼1单元901010-82552560', null, null, '', null, '110108590661916 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('109', '华润深国投信托有限公司', null, null, null, '深圳市福田区中心四路1-1号嘉里建设广场第三座第10层0755-33380655', null, null, '', null, '914403001921759000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('110', '珀金埃尔默企业管理（上海）有限公司', null, null, null, '中国(上海）自由贸易试验区希雅路33号14#楼第三层D部位021-60645888', null, null, '', null, '91310115746163324U', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('111', '银联国际有限公司', null, null, null, '上海市浦东新区东方路6号2-7楼021-20265666', null, null, '', null, '9131000005455878X6', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('112', '大连城堡酒店开发有限公司城堡酒店', null, null, null, '辽宁省大连市沙河口区滨海西路600号86560000', null, null, '', null, '912102040644083000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('113', '上海美邸艾广告有限公司', null, null, null, '上海市长安路1088号焊点公社302室021-62996785', null, null, '', null, '91310114783606294Q', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('114', '云南城投版纳投资开发有限公司', null, null, null, '云南省西双版纳旅游度假区二期曼弄枫片区西双版纳洲际度假酒店0691-2728888-6306', null, null, '', null, '91532800662640971C', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('115', '上海市期货同业工会', null, null, null, '', null, null, '', null, '513100005017789000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('116', '宾格瑞（上海）食品有限公司', null, null, null, '上海市闵行区宜山路1698号1304室021-61267256', null, null, '', null, '913100000885713000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('117', '上海蓝梦广告传播股份有限公司', null, null, null, '上海市大统路988号B座19楼56555666', null, null, '', null, '913100006303514000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('118', '穂甬控股有限公司', null, null, null, '广州市南沙区丰泽东路106号（自编1号楼）X1301-E1093020-23388280', null, null, '', null, '91440115MA59D26689', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('119', '上海农仁网络科技发展有限公司', null, null, null, '上海市浦东新区川沙路1098号8幢021-60726956', null, null, '', null, '91310115MA1H7TPP5R', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('120', '杉杉医疗投资管理（上海）有限公司', null, null, null, '中国（上海）自由贸易试验区乳山路227号3楼E-304室021-36696688', null, null, '', null, '913100003584789000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('121', '上海万堃文化传播有限公司', null, null, null, '上海市共和新路4995号1901室021-61551084', null, null, '', null, '91310115695787785G', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('122', '杉众投资管理（上海）有限公司', null, null, null, '上海市浦东新区世纪大道1128号3层021-60906135', null, null, '', null, '9131000035099923XE', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('123', '南通泓石投资有限公司', null, null, null, '南通市开发区苏通科技产业园江成路1088号江成研发园内3号楼2246室021-60726956', null, null, '', null, '913206913239795000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('124', '施乐辉医用产品（苏州）有限责任公司', null, null, null, '苏州工业园区综合保税区西区吴巷路12号0512-67333100', null, null, '', null, '91320594668991465H', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('125', '上海嘉纳丝食品有限公司', null, null, null, '中国（上海）自由贸易试验区金沪路1118号3幢1-3层T：021-60600188', null, null, '', null, '91310115MA1K3TYT6X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('126', '星展银行（中国）有限公司上海分行', null, null, null, '上海市浦东新区陆家嘴环路1318号电话：021-38968888', null, null, '', null, '91310000X07203855D', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('127', '上海杉杉贸易有限公司', null, null, null, '中国（上海）自由贸易试验区业盛路188号国贸大厦A801室电话：021-68765333', null, null, '', null, '913100000082039880N', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('128', '上海杉杉贸易有限公司', null, null, null, '中国（上海）自由贸易试验区业盛路188号国贸大厦A801室电话：021-68765333', null, null, '', null, '91310000082039880N', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('129', '北京鑫星伊顿技术服务股份有限公司', null, null, null, '北京市海淀区万柳万全新新家园12号楼1单元901010-82552560', null, null, '', null, '91110108590661916E', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('130', '泰康养老保险股份有限公司江西分公司', null, null, null, '南昌市红谷滩新区红谷中大道1326号江报传媒大厦12楼B区0791-82210224', null, null, '', null, '91360000596524576G', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('131', '百胜咨询（上海）有限公司', null, null, null, '上海市浦东新区牡丹路60号809A-1室021-24077777', null, null, '', null, '91310115607378376T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('132', '禧悦酒店投资管理顾问（南昌）有限公司', null, null, null, '南昌市红谷滩新区红谷中大道1366号0791-83853888', null, null, '', null, '91360100558497933C', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('133', '成都钕娲创造科技有限公司', null, null, null, '四川省成都市高新区天府五街200号2栋1005室', null, null, '', null, '91510100MA6DHNBPXT', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('134', '财新传媒有限公司', null, null, null, '北京市朝阳区工人体育场北路8号院5号楼4层6510号010-85905018', null, null, '', null, '911100006976705000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('135', '群光大陆实业（成都）有限公司酒店分公司', null, null, null, '四川成都市锦江区东大街城守东大街段一号028-66661234', null, null, '', null, '91510100086685871D', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('136', '平安健康保险股份有限公司', null, null, null, '上海市徐汇区凯滨路166号B座16楼4008866338', null, null, '', null, '913100007109334000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('137', '宁波亿翰商务咨询有限公司', null, null, null, '浙江省宁波市大榭开发区信开路111号1幢801-10室021-61553261', null, null, '', null, '91330201MA2AGPM99L', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('138', '曼迪投资（北京）有限公司', null, null, null, '', null, null, '', null, '911101057916407000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('139', '惠州华阳通用电子有限公司', null, null, null, '广东省惠州市东江高新科技产业园上霞北路1号华阳工业园A区2号0752-2618615', null, null, '', null, '91441300743666938D', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('140', '上海东方明珠国际旅行社有限公司', null, null, null, '上海浦东新区世纪大道1号2楼电话：4006885356', null, null, '', null, '913100001323688000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('141', '太平洋资产管理有限公司', null, null, null, '中国（上海）自由贸易试验区世纪大道100号39楼021-33968999', null, null, '', null, '91310115789549569U', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('142', '骊隆（上海）酒店管理有限公司', null, null, null, '上海市崇明县陈家镇揽海路799弄1号36幢、37幢021-67031234', null, null, '', null, '91310230093453067C', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('143', '太平洋资产管理有限责任公司', null, null, null, '中国（上海）自由贸易试验区世纪大道100号39楼021-33968999', null, null, '', null, '91310115789549569U', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('144', '中新保联股份有限公司', null, null, null, '中国(上海)自由贸易试验区鲁桥路39号7幢3层', null, null, '', null, '91310000MA1FL52W5J', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('145', '成都诚誉会展服务有限公司', null, null, null, '成都市青羊区鼓楼南街117号世界贸易中心B座2405室028-65884600', null, null, '', null, '91510105091262806H', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('146', '招商银行股份有限公司合肥分行', null, null, null, '合肥市庐阳区阜南路169号0551-65809581', null, null, '', null, '91340000733010177T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('147', '招商银行股份有限公司济南分行', null, null, null, '济南市筐市街8号0531-81776736', null, null, '', null, '91370105YA17565406', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('148', '招商银行股份有限公司兰州分行', null, null, null, '甘肃省兰州市城关区庆阳路9号0931-8729759', null, null, '', null, '91620000924337084D', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('149', '招商银行股份有限公司南京分行', null, null, null, '南京市汉中路1号025-84796549', null, null, '', null, '91320000834791179H', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('150', '招商银行股份有限公司苏州分行', null, null, null, '苏州市工业园区万盛街36号0512-69869087', null, null, '', null, '9132059471857525XK', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('151', '招商银行股份有限公司天津分行', null, null, null, '重庆市北部新区星光大道88号023-60363116', null, null, '', null, '91500000902911225T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('152', '招商银行股份有限公司重庆分行', null, null, null, '重庆市北部新区星光大道88号023-60363116', null, null, '', null, '91500000902911225T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('153', '招商银行股份有限公司天津分行', null, null, null, '天津市河西区广东路255号、前进道9号58880777', null, null, '', null, '911200007182722000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('154', '招商银行股份有限公司深圳分行', null, null, null, '深圳市福田区莲花街道深南大道2016号0755-88024001', null, null, '', null, '9144030078278219X2', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('155', '招商银行股份有限公司成都分行', null, null, null, '四川省成都市人民南路三段一号028-61816361', null, null, '', null, '91510100901926636L', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('156', '招商银行股份有限公司大连分行', null, null, null, '大连市中山区人民路17号0411-39853116', null, null, '', null, '91210200X049655044', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('157', '招商银行股份有限公司佛山分行', null, null, null, '佛山市南海区桂城街道灯湖东路12号0757-81999357（一至四层，七至九层）', null, null, '', null, '91440600778334079C', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('158', '招商银行股份有限公司福州分行', null, null, null, '福建省福州市台江区江滨中大道316号0591-87616496', null, null, '', null, '91350000705363039M', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('159', '招商银行股份有限公司哈尔滨分行', null, null, null, '黑龙江省哈尔滨市道里区中央大街3号0451-84665505', null, null, '', null, '912301007444080000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('160', '招商银行股份有限公司广州分行', null, null, null, '广州市天河区华穂路5号020-38992893', null, null, '', null, '914401018904730000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('161', '招商银行股份有限公司海口分行', null, null, null, '海南省海口市世贸北路一号海岸壹号C栋综合楼一至三层0898-68578147', null, null, '', null, '91460000589258863T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('162', '招商银行股份有限公司杭州分行', null, null, null, '杭州西湖区杭大路23号招商银行7楼0571-97395680', null, null, '', null, '91330000842921930P', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('163', '招商银行股份有限公司昆明分行', null, null, null, '云南省昆明市五华区崇仁街1号招银大厦1、2层101室以及6-15层601室0871-63182521', null, null, '', null, '91370105YA17565406', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('164', '招商银行股份有限公司南昌分行', null, null, null, '南昌市东湖区叠山路468号0791-86655758', null, null, '', null, '91360000705561465X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('165', '招商银行股份有限公司青岛分行', null, null, null, '青岛市崂山区海尔路65号0532-82939097', null, null, '', null, '913702007180645000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('166', '招商银行股份有限公司泉州分行', null, null, null, '福建省泉州市丰泽区丰泽街煌星大厦0595-28985926', null, null, '', null, '913505007729173000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('167', '招商银行股份有限公司沈阳分行', null, null, null, '沈阳市和平区十一纬路12号024-22811196', null, null, '', null, '912100008175814000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('168', '招商银行股份有限公司太原分行', null, null, null, '03山西太原小店区南中环街265号招商银行大楼二层私人银行中心0351-2777028', null, null, '', null, '91140000792245750E', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('169', '招商银行股份有限公司温州分行', null, null, null, '温州市鹿城区吴桥路鸿盛锦园2、4、5幢一、二、三层0577-88075010', null, null, '', null, '913303007200072000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('170', '招商银行股份有限公司乌鲁木齐分行', null, null, null, '乌鲁木齐市黄河路2号0991-5575087', null, null, '', null, '91650100731812731A', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('171', '招商银行股份有限公司无锡分行', null, null, null, '无锡市滨湖区金融一街6-107/6-108号0510-82756596', null, null, '', null, '91320200835946953D', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('172', '招商银行股份有限公司武汉分行', null, null, null, '武汉市汉口建设大道518号027-85495747', null, null, '', null, '91420000877585797Y', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('173', '招商银行股份有限公司西安分行', null, null, null, '西安市高新二路一号029-88895555', null, null, '', null, '9161000092055556XE', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('174', '招商银行股份有限公司长春分行', null, null, null, '吉林省长春市人民大街9999号0431-85580001', null, null, '', null, '912201016756422000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('175', '招商银行长沙分行股份有限公司', null, null, null, '长沙市芙蓉区五一大道766号中天广场1-7楼0731-84302965', null, null, '', null, '91430000X16772187M', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('176', '招商银行股份有限公司呼和浩特分行', null, null, null, '内蒙古自治区呼和浩特市赛罕区敕勒川大街9号0471-6256025', null, null, '', null, '91150100664096092X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('177', '招商银行股份有限公司厦门分行', null, null, null, '厦门市思明区湖滨东路309号宏泰工业园6号综合楼宏泰中心0592-5822077', null, null, '', null, '9135020073782460X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('178', '招商银行股份有限公司南通分行', null, null, null, '江苏省南通市崇川区工农路111号0755-83198888', null, null, '', null, '913206006739139000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('179', '招商银行股份有限公司郑州分行', null, null, null, '郑州市郑东新区农业东路96号招银大厦037167895888/037189967026', null, null, '', null, '914101007457612000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('180', '招商信诺人寿保险有限公司', null, null, null, '深圳市福田区深南大道7088号招商银行大厦3102号0755-83196209', null, null, '', null, '91440000710931571W', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('181', '招商银行股份有限公司昆明分行', null, null, null, '云南省昆明市五华区崇仁街1号招银大厦1、2层101室以及6-15层601室0871-63182521', null, null, '', null, '915300007312304000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('182', '上海微创医疗器械（集团）有限公司', null, null, null, '上海市浦东新区张江高科技园区牛顿路501号86-21-39954600', null, null, '', null, '9131000060738978T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('183', '上海微创医疗器械（集团）有限公司', null, null, null, '上海市浦东新区张江高科技园区牛顿路501号86-21-38954600', null, null, '', null, '91310000607389788T', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('184', '保利（佛上）酒店有限公司', null, null, null, '佛山市南海区桂城街道灯湖东路20号075786268888', null, null, '', null, '91440605688680357M', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('185', '上海汽车集团股份有限公司', null, null, null, '上海嘉定区安研路201号021-61389987', null, null, '', null, '91310000132260250X', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('186', '苏州赛琅泰克高技术陶瓷有限公司', null, null, null, '苏州工业园区钟南街428号62740788', null, null, '', null, '913205947301356000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('187', '上海雅恒房地产开发有限公司', null, null, null, '上海黄浦区西藏中路525号021-23129888', null, null, '', null, '91310000744941284R', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('188', '福建世茂新里程投资发展有限公司厦门世茂康莱德酒店', null, null, null, '福建厦门市思明区演武西路184号0592-2586666', null, null, '', null, '91350203303092299B', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('189', '上海名特国际贸易有限公司', null, null, null, '中国（上海）自由贸易试验区奥纳路185号1层021-58665251', null, null, '', null, '91310115703263624L', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('190', '上海睿路文化传播股份有限公司', null, null, null, '上海市长宁区万航渡路2452号A座5楼', null, null, '', null, '91310230672709338K', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('191', '陕西省交通运输厅', null, null, null, '', null, null, '', null, '116100000160001000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('192', '陕西省高速公路建设集团公司', null, null, null, '西安市太白南路9号02987893030', null, null, '', null, '91610000623110222Q', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('193', '陕西省铁路集团有限公司', null, null, null, '西安市长安区长安街420号029-82257059', null, null, '', null, '91610000MA6TG43NXM', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('194', '西安地下铁道有限责任公司', null, null, null, '西安市经开区凤城八路126号89615638', null, null, '', null, '916101327759392000 ', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('195', '陕西省交通建设集团公司', null, null, null, '陕西省西安市雁塔区唐延路6号88869425', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('196', '南宁市财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('197', '招商银行股份有限公司南宁分行', null, null, null, '南宁市青秀区民族大道92-1号新城国际1-6号商业裙楼0771-5513413', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('198', '佛山市机场建设开发有限公司', null, null, null, '佛山市禅城区季华五路20号兴业银行大厦17/18楼', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('199', '江西省高速公路投资集团有限责任公司', null, null, null, '江西省南昌市西湖区朝阳洲中路367号0791-86243795', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('200', '兰州新区财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('201', '兰州市财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('202', '同瞬贸易（上海）有限公司', null, null, null, '上海市普陀区中江路118弄22号301室021-62309838-816', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('203', '招商银行股份有限公司烟台分行', null, null, null, '山东省烟台市莱山区迎春大街133号招商银行0535-6636031', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('204', '青岛市黄岛财政局', null, null, null, '武夷山路302号86895183', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('205', '青岛市黄岛区城市开发局', null, null, null, '电话：85172907', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('206', '青岛市黄岛区财政局', null, null, null, '武夷山路302号86895183', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('207', '银川市土地储备局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('208', '云南财经大学', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('209', '内蒙古自治区财政厅', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('210', '内蒙古自治区财政国库收付中心', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('211', '安徽省财政厅', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('212', '招商银行股份有限公司银川分行', null, null, null, '宁夏银川市金凤区北京中路138号新材富汇大厦0951-5156734', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('213', '招商银行股份有限公司西宁分行', null, null, null, '青海省西宁市城西区新宁路4号0971-6230398', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('214', '招商银行股份有限公司贵阳分行', null, null, null, '贵州省贵阳市云岩区中华北路284号0851-86918140', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('215', '招商银行股份有限公司石家庄分行', null, null, null, '石家庄市桥西区中华南大街172号泰丰大厦0311-66696131', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('216', '遵义市财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('217', '遵义市红花岗区财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('218', '遵义市南部新区财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('219', '贵州省财政厅', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('220', '河北省财政厅', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('221', '滦南县财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('222', '石家庄市财政局', null, null, null, '', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('223', '招商银行股份有限公司厦门分行', null, null, null, '厦门市思明区湖滨东路309号宏泰工业园6号综合楼宏泰中心0592-5822077', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('224', '招商银行股份有限公司长沙分行', null, null, null, '长沙市芙蓉区五一大道766号中天广场1-7楼0731-84302965', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('225', '北京鑫星伊顿技术服务股份有限公司', null, null, null, '北京市海淀区万柳万全新新家园12号楼1单元901010-82552560', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('226', '泰凌（中国）投资有限公司', null, null, null, '浦东新区浦东南路2250号2幢20823159999', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('227', '宁波市星通投资管理有限公司', null, null, null, '北仑区梅山大道商务中心九号办公楼419室021-61657288', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('228', '上海杉杉实业有限公司', null, null, null, '上海浦东新区东方路一百杉杉大厦25楼021-60875902', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('229', '宁波杉杉物产有限公司', null, null, null, '宁波海曙区聚才路99号0574-28903365', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('230', '宁波炬泰投资管理有限公司', null, null, null, '上海市虹口区东大名路1604室（新华保险大厦）021-65687875', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('231', '上海杉杉创晖创业投资管理有限公司', null, null, null, '上海市东方路985号一百杉杉大厦7楼021-68765333', null, null, '', null, '', null, null, '', null, null, null, null);
INSERT INTO `client` VALUES ('232', '耐世特汽车系统（苏州）有限公司', null, null, null, '苏州工业园区凤里街72号0512-62838868', null, null, '', null, '', null, null, '', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '总办业务部', '0', '0', '0');
INSERT INTO `dept` VALUES ('2', '财务部', '0', '0', '0');
INSERT INTO `dept` VALUES ('3', '设计部', '0', '0', '0');
INSERT INTO `dept` VALUES ('4', 'cason事业部', '0', '0', '0');
INSERT INTO `dept` VALUES ('5', 'IT事业部', '0', '0', '0');
INSERT INTO `dept` VALUES ('6', 'Fay事业部', '0', '0', '0');
INSERT INTO `dept` VALUES ('9', 'Richard事业部', '0', '0', null);
INSERT INTO `dept` VALUES ('10', 'Vison事业部', '0', '0', null);
INSERT INTO `dept` VALUES ('11', 'Edwin事业部', '0', '0', null);
INSERT INTO `dept` VALUES ('12', 'Chris事业部', '0', '0', null);
INSERT INTO `dept` VALUES ('13', 'Stanley事业部', '0', '0', null);
INSERT INTO `dept` VALUES ('14', '人事部', '0', '0', null);

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
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place` (
  `place_id` int(1) NOT NULL,
  `place` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES ('1', '上海浦东');
INSERT INTO `place` VALUES ('2', '上海浦西');
INSERT INTO `place` VALUES ('3', '深圳');
INSERT INTO `place` VALUES ('4', '海南');

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
  PRIMARY KEY (`status_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', '会务专员', '0');
INSERT INTO `title` VALUES ('2', '会务经理', '0');
INSERT INTO `title` VALUES ('3', '项目经理', '0');
INSERT INTO `title` VALUES ('4', '创意总监', '0');
INSERT INTO `title` VALUES ('5', '业务总监', '0');
INSERT INTO `title` VALUES ('6', '业务副总监', '0');
INSERT INTO `title` VALUES ('7', '总经理', '0');
INSERT INTO `title` VALUES ('8', '副总经理', '0');
INSERT INTO `title` VALUES ('9', '部门长', '0');
INSERT INTO `title` VALUES ('10', '财务总监', '0');
INSERT INTO `title` VALUES ('11', '人事总监', '0');
INSERT INTO `title` VALUES ('12', '设计师', '0');
INSERT INTO `title` VALUES ('13', '人事助理', '0');
INSERT INTO `title` VALUES ('14', '职员', '0');

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
  `crt_start` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '合同开始',
  `crt_end` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '合同结束',
  `ctr_num` tinyint(1) NOT NULL COMMENT '合同次数',
  `linkman` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人',
  `linktel` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人电话',
  `housing_fund` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '住房公积金',
  `vacation` tinyint(1) unsigned DEFAULT NULL COMMENT '年假',
  `status_id` tinyint(1) unsigned NOT NULL COMMENT '状态编号(外键)',
  `dept_id` tinyint(1) unsigned NOT NULL COMMENT '部门编号(外键)',
  `title_id` tinyint(1) unsigned NOT NULL COMMENT '角色编号（外键）',
  `place_id` tinyint(1) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '文件图片路径',
  `show` smallint(1) unsigned DEFAULT '1' COMMENT '离职在职',
  `in_time` int(11) DEFAULT NULL COMMENT '入职时间',
  `out_time` int(11) DEFAULT NULL COMMENT '离职时间',
  `sal_time` int(11) DEFAULT NULL,
  `salary` float DEFAULT NULL COMMENT '薪资',
  `mark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`),
  KEY `rolekey` (`title_id`) USING BTREE,
  KEY `deptkey` (`dept_id`) USING BTREE,
  KEY `statuskey` (`status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', '许飞', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '18616997314', '', '340221197703140000', '', '', '2012/3/1', '2023/9/30', '2', '余洁红', '13917094445', '118668031', '5', '1', '3', '12', '1', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('002', '邹召龙', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13816022190', '', '430602198505080000', '', '', '2018/3/15', '2019/3/14', '1', '宋晓成', '13816022190', '111842402205 ', '5', '1', '3', '12', '2', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('003', '邓雨青', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13661966357', '', '310109198807012000', '上海理工大学', '艺术设计', '2018/3/1', '2020/2/28', '1', '李美兰', '13661966357', '132877818205 ', '5', '1', '3', '3', '1', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('004', '胡晓寒', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '18616165181', '', '310101198503140000', '上海拓普信息技术职业学校', '计算机动画制作', '2018/5/2', '2019/5/1', '1', '王盛', '18616165181', '103257238205 ', '5', '1', '3', '3', '2', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('005', '马晓宇', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13816962161', '', '310104198211092000', '上海行健职业学院', '装潢艺术设计', '2017/8/9', '2019/8/8', '2', '马强', '13816962161', '137448946205 ', '5', '1', '3', '3', '1', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('006', '陈佳雯', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13764234569', '', '310104199006060000', '上海电影艺术职业学校', '会展策划与管理', '2017/7/1', '2018/6/30', '1', '陈飞', '13764234569', '154026426205 ', '5', '1', '3', '3', '1', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('007', '朱琼新', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '15120767752', '', '', '', '', '', '', '1', '', '15120767752', '', '5', '1', '3', '12', '4', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('008', '于振', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '18621581209', '', '310108198309120000', '', '', '2016/11/1', '2019/11/30', '1', '王程程', '18621581209', '147873680205 ', '5', '1', '1', '3', '1', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('009', '周大韦', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13701796320', '', '210102196809235000', '', '', '2018/10/1', '2018/10/31', '1', '董丽', '13701796320', '153367222 ', '5', '1', '1', '9', '1', '0', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('010', '李慧洁', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13122612360', '', '310115198006243000', '上海财经大学', '会计学', '2017/3/27', '2019/3/31', '2', '李克锐', '13122612360', '061006129205', '5', '1', '2', '14', '1', '1', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('011', '吴佳稚', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13482322825', '', '31011519851020322X', '上海师范大学', '经济管理', '2018/9/1', '2020/8/31', '1', '龚燕', '13482322825', '82602864 ', '5', '1', '2', '14', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('012', '于振', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '', '', '', '', '', '', '', '0', '', '', '', '5', '1', '1', '14', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('013', '张洁', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13818886641', '', '510781198806147000', '四川师范大学电影电视学院', '戏剧影视美术设计', '2017/1/3', '2020/1/2', '2', '周莉', '13818886641', '163619578205 ', '5', '1', '1', '3', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('014', '陈思思', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '15867787704', '', '330328199506235000', '上海旅游高等专科学校', '旅游管理', '2017/10/9', '2020/10/8', '2', '陈仁会', '15867787704', '193779626205 ', '5', '1', '1', '2', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('015', '凌青青', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '18321172616', '', '342623199312282000', '安徽经济管理干部学院', '旅游管理', '2018/4/16', '2019/4/15', '1', '凌勇', '18321172616', '170945819205 ', '5', '1', '1', '3', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('016', '张瑞笑', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13661915560', '', '31011519891127044x', '', '', '2018/12/1', '2019/11/30', '1', '张小红', '13661915560', '147504351205 ', '5', '1', '10', '3', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('017', '李书明', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '15602960067', '', '', '', '', '', '', '1', '', '15602960067', '', '5', '1', '1', '14', '3', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('018', '周印芳', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '15216778370', '', '371525199002233000', '', '', '2014/12/1', '2021/11/30', '2', '', '15216778370', '160983289 ', '5', '1', '1', '3', '3', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('019', '肖哲浩', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '13922805863', '', '43098119920602463X', '', '', '2018/6/1', '2019/5/31', '1', '', '13922805863', '', '5', '1', '1', '1', '3', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('020', '孙霏', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13818818941', '', '321283198408110000', '', '', '2014/4/1', '2018/9/30', '1', '孙路根', '13818818941', '85926644 ', '5', '1', '6', '9', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('021', '方凌君', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13701614928', '', '310107198411113000', '', '', '2017/3/30', '2021/3/31', '2', '丁寅', '13701614928', '060027666205', '5', '1', '6', '3', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('022', '徐波', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '15202101595', '', '341226199304010000', '', '', '2017/11/13', '2020/11/12', '1', '徐国平', '15202101595', '183406564205 ', '5', '1', '6', '1', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('023', '沈静', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '15949517631', '', '360429199207151000', '上海工会管理职业学院', '会展策划与管理', '2018/5/2', '2019/5/1', '1', '殷挺挺', '15949517631', '179611951205 ', '5', '1', '6', '1', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('024', '宋晓成', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13636433543', '', '310107198512233000', '', '', '2017/8/1', '2021/7/31', '1', '沈燕敏', '13636433543', '103998779205 ', null, '1', '10', '9', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('025', '尹丽雯', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '', '', '', '', '', '', '', '0', '', '', '', null, '1', '10', '0', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('026', '马俊', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13918589391', '', '310104198706012000', '', '', '2017/9/7', '2021/9/6', '1', '张佳璐', '13918589391', '100658933 ', null, '1', '10', '3', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('027', '曾炜', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13761566655', '', '320106197801281000', '', '', '2008/1/20', '2018/9/30', '1', '黄月爱', '13761566655', '153367325 ', null, '1', '9', '9', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('028', '张玉京', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '18516186429', '', '230102199108060000', '', '', '2014/9/20', '2019/2/28', '1', '王菁', '18516186429', '156608091 ', null, '1', '9', '2', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('029', '施义佳', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13817102344', '', '310102198904044000', '', '', '2016/6/1', '2019/5/31', '2', '胡雪丽', '13817102344', '126666222 ', null, '1', '9', '3', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('030', '王珏', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '15000520377', '', '310101198108261000', '', '', '2014/10/1', '2018/9/30', '1', '王封昌', '15000520377', '53133390 ', null, '1', '13', '9', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('031', '王丽婧', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13918734942', '', '310101198501060000', '', '', '2015/7/1', '2020/9/30', '2', '华书昀', '13918734942', '125340667 ', null, '1', '13', '3', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('032', '王轶彬', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13661433338', '', '310105198806140000', '', '', '2014/12/1', '2020/11/4', '2', '袁雯雅\r\n', '13661433338', '111078532 ', null, '1', '13', '3', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('033', '虞疆', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13817986840', '', '', '', '', '2018/9/30', '2018/11/30', '1', '张菲颖', '13817986840', '28655461 ', null, '1', '11', '9', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('034', '史杨勤', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13512143731', '', '310115198308230000', '', '', '2012/2/20', '2019/9/30', '2', '李震宇', '13512143731', '103408976 ', null, '1', '11', '3', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('035', '周大海', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13391234545', '', '460100197603182000', '', '', '2012/5/1', '2018/9/30', '1', '高瑜', '13391234545', '153370300 ', null, '1', '4', '9', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('036', '杨阳', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '15821258735', '', '371083198205278000', '山东市事业技术教育学校', '微机', '2017/10/9', '2021/10/8', '2', '杨翠英', '15821258735', '165288668205 ', null, '1', '6', '2', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('037', '孟宇恒', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '13818985596', '', '370481198106290000', '', '', '2012/2/20', '2020/12/31', '2', '', '13818985596', '153370403 ', null, '1', '4', '11', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('038', '张婷婷', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '15601760960', '', '321323199406184000', '南京信息职业技术学院', '影视多媒体技术', '2017/3/1', '2021/12/31', '2', '张毛画', '15601760960', '176084149 ', null, '1', '4', '12', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('039', '吴帆', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '18202166904', '', '321101199306082000', '南开大学滨海学院', '计算机科学与技术', '2017/3/1', '2021/12/31', '2', '吴胜万', '18202166904', '180879145205 ', null, '1', '4', '12', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('040', '陈敏', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '18382438513', '', '510525199502156000', '', '', '2017/11/1', '2021/10/31', '2', '唐杰', '18382438513', '194476285205 ', null, '1', '4', '12', '1', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('041', '周峥宇', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '15921820290', '', '310101199003091000', '', '', '2018/6/1', '2019/5/31', '1', '闵雅骅', '15921820290', '138105110205 ', null, '1', '5', '9', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('042', '寇奇', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '15001989716', '', '310105199208205000', '', '', '2018/9/7', '2019/5/31', '2', '张文菊', '15001989716', '19920 ', null, '1', '5', '9', '2', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('043', '周迎', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '18117708085', '', '', '', '', '', '', '3', '', '18117708085', '', null, '1', '2', '3', '4', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('044', '尹毅龙', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '13707579128', '', '', '', '', '', '', '1', '', '13707579128', '', null, '1', '12', '9', '4', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('045', '金聪', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '13807637718', '', '', '', '', '', '', '2', '', '13807637718', '', null, '1', '12', '2', '4', '0', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('046', '司志广', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '', '', '', '', '', '', '', '', '0', '', '', '', null, '1', '12', '14', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('050', '许君', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '18621814602', '', '341124199201055000', '', '', '2018/6/25', '2019/6/24', '1', '许勋章', '18621814602', '171802159205 ', null, '1', '4', '12', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('051', '尹丽雯', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13916764879', '', '310109198502081000', '', '', '2017/8/1', '2021/7/31', '1', '王铭华', '13916764879', '60946489 ', null, '1', '10', '3', '2', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('056', '冷金峰', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13167001016', '', '370305198805093000', '上海师范大学', '艺术设计', '2018/6/21', '2019/6/20', '1', '李闯', '13167001016', '139458815205 ', null, '1', '3', '12', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('057', '刘哲圣', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '13089671456', '', '230804199505170000', '黑龙江财经学院', '环境设计', '2018/10/12', '2019/10/11', '1', '张秀芹', '13089671456', '206300750205 ', null, '1', '1', '1', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('058', '余艳', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '18356082127', '', '342422199510294000', '安徽三联学院', '商务英语', '2018/10/15', '2019/10/14', '1', '汪传永', '18356082127', '205543080205 ', null, '1', '13', '1', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('061', '陈璐璐', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13918828386', '', '31010919890207452X', '上海大学', '人力资源', '2018/11/1', '2019/10/31', '1', '刘爱华', '13918828386', '115006965205 ', null, '1', '14', '13', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('068', '张婷婷2', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '女', '13581733896', '', '410821199303152000', '洛阳师范学院', '动漫设计与制作', '2018/11/26', '2019/11/25', '1', '武爱荣', '13581733896', '', null, '1', '4', '12', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('069', '王俊卜', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '15088760602', '', '41132419940123551X', '', '', '2018/12/3', '2019/12/2', '1', '', '15088760602', '', null, '1', '4', '12', '1', '', '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('070', '孙潇', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', null, '男', '', '', '', '', '', '', '', '1', '', '', '', null, '1', '1', '12', '0', '', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `vendor_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `vendor_name` varchar(50) NOT NULL COMMENT '姓名',
  `vendor_type` varchar(50) NOT NULL COMMENT '类型',
  `vendor_province` varchar(10) NOT NULL COMMENT '省份',
  `vendor_city` varchar(10) NOT NULL COMMENT '城市',
  `vendor_linkman` varchar(5) DEFAULT NULL COMMENT '联系人',
  `vendor_linktel` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `vendor_email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `coupon_rate` varchar(10) DEFAULT NULL COMMENT '票面税率',
  `is_taxpayer` varchar(2) DEFAULT NULL COMMENT '是否一般纳税人',
  `vendor_address` varchar(50) DEFAULT NULL COMMENT '地址',
  `social_code` varchar(50) DEFAULT NULL COMMENT '代码',
  `deposit_bank` varchar(50) DEFAULT NULL COMMENT '银行',
  `bank_num` varchar(50) DEFAULT NULL COMMENT '号码',
  `register_capital` varchar(10) DEFAULT NULL COMMENT '注册资本',
  `volume` int(2) DEFAULT NULL COMMENT '总交易量',
  `times` int(2) DEFAULT NULL COMMENT '总交易次数',
  `service` varchar(10) DEFAULT NULL COMMENT '服务配合度',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `info` varchar(50) DEFAULT NULL COMMENT '信息来源',
  `grade` varchar(5) DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`vendor_id`),
  KEY `role_id` (`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO `vendor` VALUES ('1', '上海广业展示设计有限公司', '搭建', '上海', '上海', '李峻', '13301839836', '670982132@qq.com', '6%', '是', '上海市嘉定区黄渡镇新黄西路356号', '91310118786282643A', '农行上海宝山支行', '033445-00040225044', '50万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('2', '上海满誉文化传播有限公司', '搭建 AV设备', '上海', '上海', '史玉晓', '15801622285', '511729646@qq.com', '3%', '否', '上海市嘉定区众仁路399号1幢2层J2855室', '91310114MA1GT4G200', '中国建设银行股份有限公司 上海曹行支行', '3105-0178-4900-0000-0095', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('3', '上海扬彩会展服务有限公司', 'AV设备', '上海', '上海', '李龙', '13611758920', 'shycav@126.com', '6%', '是', '上海市闵行区沈杜公路3355号', '91310114685465563N', '工行漕河泾开发区支行', '1001 2663 0920 0222 703', '10万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('4', '上海精羽视听设备有限公司', 'AV设备', '上海', '上海', '姚志光', '18621918638', '714499826@qq.com', '3%', '是', '上海市闵行区银都路1078号1号库', '', '中国建设银行股份有限公司上海长桥支行', '', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('5', '上海向峰办公设备有限公司', '设备租赁', '上海', '上海', '廖向平', '13020162777', '705092388@qq.com', '3%', '否', '上海市闵行区浦雪路351弄27号1001', '91310116084074989T', '上海银行浦江高科技园区支行', '31598503002240400 ', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('6', '上海励致商业道具有限公司', '搭建 道具租赁', '上海', '上海', '王怀朗', '13816861350', 'whl-9601@126.com', '5%', '否', '上海市浦东新区老芦公路1157号', '三证合一办理中', '中国建设银行股份有限公司上海浦江支行', '3100 1589 2190 5000 3983', '50万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('7', '上海步频电子科技有限公司', '设备 打分器', '上海', '上海', '夏庆军', '18964607538', '', '17%', '是', '上海市闵行区泰虹路168弄T1幢202', '91310118769406819p', '工商银行上海市康健支行', '100116060 90069 41455', '600万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('8', '上海翼之城信息科技有限公司', '现场wifi', '上海', '上海', '戚喆毅', '18918000930', '', '6%', '是', '上海市江宁路1207号2楼', '91310115323134775N', '平安银行-上海静安支行', '11014700000000 ', '200万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('9', '南京金宇轩文化传媒有限公司', '搭建', '江苏', '南京', '陈明波', '18795867550', '2108458828@qq.com', '6%', '否', '南京市鼓楼区建宁路16-1号', '91320192MA1MNWUM2N', '中国农业银行股份有限公司南京虎踞北路支行', '10115501040006200 ', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('10', '北京银影之声文化传播有限公司', '搭建 AV设备', '北京', '北京', '张宇', '13911251237', 'zhangv24@126.com', '5%', '否', '北京市朝阳区区三间房乡西柳中街', '91110105699558701J', '工商银行北京马莲道茶城支行', '0200 0921 0910 0020 539', '10万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('11', '上海璞真文化传播有限公司', '演出', '上海', '上海', '佳佳', '18916548465', '532295707@qq.com', '6%', '是', '上海市闵行区莘凌路211号1号楼107', '913101125708183000 ', '上海农村商业银行莘庄分理处', '50131000465397129', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('12', '上海市弦韵文化传播有限责任公司', '演出', '上海', '上海', '赵璐', '18121219333', '497091946@qq.com', '3%', '否', '上海市杨浦区国宾路18号B座1209室', '91310110MA1G81AU9Q', '中国工商银行', '1001220000000000000 ', '50万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('13', '深圳市龙飞艺术团', '演出', '广东', '深圳', '秦月', '13823291431', '595797736@qq.com', '6%', '', '深圳市罗湖区沿河北路1002号瑞思国际B座6b', '', '中国工商银行深东支行', '4000 0210 3920 0342 152', '10万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('14', '中国国旅（武汉）国际旅行社有限公司', '车队', '湖北', '武汉', '严环', '13476229781', '755652112@qq.com', '7%', '是', '湖北省武汉市硚口区宝丰路6号香溢大酒店5楼', '91420100771387688B', '交通银行武汉古田三路支行', '421867309018800000000 ', '500万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('15', '西安翼翔会展服务有限公司', '车队', '陕西', '西安', '李书砚', '13892855960', '190441786@qq.com', '3%', '否', '西安市莲湖区团结南路融侨城2幢1单元10804室', '9161010459633094XF', '陕西秦农农村商业银行股份有限公司长安路支行', '2701010301201000000000 ', '300万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('16', '河北蓝鲸国际旅行社有限公司', '车队', '河北', '张家口', '李亮', '13722555898', '3125197284@qq.com', '3%', '否', '河北省张家口市桥东区胜利中路12号', 'G1013070200072770N', '中国建设银行股份有限公司张家口分公司西河沿支行', '13050167540900000000 ', '300万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('17', '贵阳中国旅行社', '车队', '贵州', '贵阳', '蒋泽俊', '15085945673', 'zejun_jiangmice@163.com', '6%', '是', '贵州省贵阳市南明区瑞金南路2号', '91520100214481276Q', '中国工商银行贵阳中西支行', '2402 0026 0900 4606 307', '150万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('18', '青海途易国际旅行社有限公司', '车队', '青海', '西宁', '冯磊', '18697123531', 'insunfl@163.com  ', '3%', '否', '青海省西宁市城中区长江路7号青海湖大厦1207室', '91630103MA7525ATX5（1-1）', '中国建设银行股份有限公司西宁和政支行', '63050151363700000000 ', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('19', '港中旅国际成都旅行社有限公司', '车队', '四川', '成都', '余琪坤', '13648003442', '1764799250@qq.com', '6.72%', '是', '四川成都锦江区静渝路48号索尔龙舟30楼', '915101047403377000 ', '农业银行成都锦江支行营业部', '22802401040003500 ', '422万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('20', '大连北方假日国际旅行社有限公司', '车队', '辽宁', '大连', '张琨鹏', '13998580482', 'dlzkp@vip.qq.com', '3%', '否', '大连市甘井子区迎客路五号，北方假日大厦', '91210200756072936U', '交通银行大连分行营业部', '212060010018001000000 ', '500万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('21', '大连中国青年旅行社', '车队', '辽宁', '大连', '邓润萍', '18640809148', 'drp@micedaliantravel.com', '6%', '是', '辽宁省大连市西岗区沈阳路94号大连中国青年旅行社', '11848216-4', '中国银行中山广场支行', '316856317884 ', '237万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('22', '延边白山国际旅行社股份有限公司', '车队', '吉林', '延吉市', '许均', '13916935120', '1106062135@qq.com', '6%', '是', '延吉市局子街191号', '9122240012633070XU', '交通银行股份有限公司延边分行', '271211601010252000000 ', '2000万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('23', '内蒙古中国国际旅行社有限责任公司', '车队', '内蒙', '呼和浩特', '陈妍', '15047833233', '130395055@qq.com', '7%', '是', '内蒙古呼和浩特市新城区艺术厅南街95号旅游大厦三楼', '911501007332694000 ', '中行呼和浩特市新华支行', '155606248030 ', '150万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('24', '内蒙古和平旅行社有限责任公司', '车队', '内蒙', '呼和浩特', '吕非', '13804715990', 'peace_tour@sina.com', '3%', '否', '呼和浩特市中山西路1号海亮誉峰2号楼1单元602室', '91150103761085264H', '内蒙古银行呼和浩特呼伦南路支行', '109701201020116000 ', '30万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('25', '呼伦贝尔运通旅行社有限公司', '车队', '内蒙', '呼伦贝尔', '拓宇', '13947098975', 'tuoyu@etstour.cn', '3%', '是', '呼伦贝尔市海拉尔区学府路龙凤丽苑D栋2012室', '911507006706605000 ', '中国银行呼伦贝尔市分行', '152403763721 ', '120万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('26', '昆明博旭会展服务有限公司', '车队', '云南', '昆明', '吴坚', '15559877888', '27825187＠qq.com', '3%', '否', '云南昆明市盘龙区北辰财富中心商住楼B幢2单元0302室', '530103100074857 ', '富滇银行股份有限公司昆明金实支行', '915021010000552000 ', '3万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('27', '新疆西域国际旅行社有限责任公司', '车队', '新疆', '乌鲁木齐', '杨利东', '13809912253', '6030577@qq.com', '15%', '是', '新疆乌鲁木齐市天山区大湾北路876号西域国际酒店15楼', '91650102228673324R', '招商银行乌鲁木齐解放北路支行', '853080171710001 ', '1700万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('28', '上海汉驰汽车租赁有限公司', '车队', '上海', '上海', '米伟青', '15900812345', '793167114@qq.com', '17%', '是', '上海市浦东新区浦东大道2742弄中环滨江大厦1号楼505室', '913101107776480000 ', '中信银行上海金桥支行', '7312110182600020000 ', '1000万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('29', '上海百赢汽车租赁有限公司', '车队', '上海', '上海', '陆建华', '13818416810', 'baiyingzulin@hotmail', '3%', '是', '上海市共和新路5308弄32号4楼C座', '91310230660712943X', '中国建设银行上海高境支行', '31001618926050000000 ', '110万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('30', '北京唐人祥业商务服务有限公司', '车队', '北京', '北京', '曹国飞', '13910836779', 'caofei_1981@126.com', '3%', '否', '北京市朝阳区南新园西路6号17层20A9室', '68047195-6', '工商银行潘家园支行', '0200   0227  0902  0037  727', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('31', '北京新月联合汽车有限公司', '车队', '北京', '北京', '张学宝', '13801175611', 'zhangguijing0805@163.com', '3%', '是', '北京市朝阳区王四营乡马房寺368号', '110000005130977 ', '北京银行总行营业部', '01090520500120109103736', '1.313亿', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('32', '厦门美丞会易商务会展有限公司', '车队', '福建', '厦门', '杨明月', '13860189846', 'ymy@xmmchy.com', '3%', '否', '厦门市思明区厦禾路844号中厦国际大厦B座705', '91350203MA2XYH475W', '兴业银行厦门分行营业部', '129680100100725000 ', '1000万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('33', '上海藏谷纸业有限公司', '印刷', '上海', '上海', '郭翔欣', '15921373539', '1299051994@qq.com', '17%', '是', '上海市松江区九徐路109号', '9131012005932531X9', '中国工商银行上海市北蔡支行', '1001195209006870000 ', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('34', '上海彩曦印务有限公司', '印刷', '上海', '上海', '吕强', '13774458548', 'lq.qq@163.com', '3%', '否', '上海市宝山区共和新路4995号万达广场三号楼2202室', '91310113MA1GK7AG60', '交通银行上海长江西路支行', '310066784018800000000 ', '50万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('35', '上海怡行票务服务有限公司', '机票', '上海', '上海', '', '021-52918629', '825854465@QQ.COM', '3%', '否', '上海市普陀区中山北路2130号1906室', '91310114690141934C', '工商银行上海市中山支行', '1001240109006930000 ', '30万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('36', '上海堃臣文化传播有限公司', '摄影摄像', '上海', '上海', '', '18019439260', 'dwhhhh@163.com', '3%', '否', '上海闵行区中春路7628弄优房商务202室', '91310112088545805C', '上海农村商业银行股份有限公司漕河泾支行', '5013 1000 3569 40060', '100万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('37', '上海蕾菱文化传播有限公司', '服装租赁', '上海', '上海', '', '18918909520', '2311388196@qq.com', '3%', '是', '上海浦东向城路29号爵士大厦A栋6D室', '91310120582131683A', '中国银行上海市九江路支行', '444260400871 ', '10万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('38', '上海蓝森宴会餐饮有限公司', '餐饮', '上海', '上海', '', '13917768855', 'phile.guan@linesun.com', '6%', '是', '上海市教育路468-476号', '913101135587515000 ', '浙商银行上海松江支行', '2900000610120100000000 ', '1200万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('39', '逸琦（上海）文化传播股份有限公司', '花艺', '上海', '上海', '', '18621969000', null, '6%', '是', '上海市浦东新区金高路311号6幢166室', null, '中国工商银行上海市分行浦明路支行', '1001300209000010000 ', '500万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('40', '成都麦星科技有限公司', '兼职', '上海', '上海', '', '13916157900', null, '3%', null, '成都市高新区天府大道北段1480号1栋A座2层第2附4号', null, '成都银行天府新区支行', '1001  3000  0043  6938', '250万', null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('41', '华科数通（北京）科技有限公司', '电话会议', '上海', '上海', '', '18816633516', null, null, null, null, null, '', '', null, null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('42', '北京创世华信科技有限公司', '短信平台', '上海', '上海', null, null, null, null, null, null, null, null, '', null, null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('44', '京东', '企业邮箱', '上海', '上海', null, null, null, null, null, null, null, null, '', null, null, null, null, null, null, null);
INSERT INTO `vendor` VALUES ('52', '阿里云计算有限公司 ', '企业邮箱', '上海', '上海', null, null, null, null, null, null, null, null, '‘571905493610702006940157', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for vendor_type
-- ----------------------------
DROP TABLE IF EXISTS `vendor_type`;
CREATE TABLE `vendor_type` (
  `type_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '������',
  `type_name` varchar(10) NOT NULL COMMENT '��������',
  PRIMARY KEY (`type_id`),
  KEY `role_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vendor_type
-- ----------------------------
INSERT INTO `vendor_type` VALUES ('1', '搭建');
INSERT INTO `vendor_type` VALUES ('2', 'av设备');
INSERT INTO `vendor_type` VALUES ('3', '设备租赁');
INSERT INTO `vendor_type` VALUES ('4', 'wifi');
INSERT INTO `vendor_type` VALUES ('5', '演出');
INSERT INTO `vendor_type` VALUES ('6', '车队');
INSERT INTO `vendor_type` VALUES ('7', '印刷');
INSERT INTO `vendor_type` VALUES ('8', '机票');
INSERT INTO `vendor_type` VALUES ('9', '摄影摄像');
INSERT INTO `vendor_type` VALUES ('10', '服装租赁');
INSERT INTO `vendor_type` VALUES ('11', '餐饮');
INSERT INTO `vendor_type` VALUES ('12', '花艺');
INSERT INTO `vendor_type` VALUES ('13', '兼职');
INSERT INTO `vendor_type` VALUES ('14', '电话会议');
INSERT INTO `vendor_type` VALUES ('15', '短信平台');
INSERT INTO `vendor_type` VALUES ('16', '京东');
INSERT INTO `vendor_type` VALUES ('17', '企业邮箱');
INSERT INTO `vendor_type` VALUES ('18', '其他');
INSERT INTO `vendor_type` VALUES ('19', '');
INSERT INTO `vendor_type` VALUES ('20', '');
INSERT INTO `vendor_type` VALUES ('21', '');
INSERT INTO `vendor_type` VALUES ('22', '');
INSERT INTO `vendor_type` VALUES ('23', '');
INSERT INTO `vendor_type` VALUES ('24', '');
