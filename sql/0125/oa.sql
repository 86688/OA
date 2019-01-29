CREATE TABLE `dept` (
`dept_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门编号',
`dept_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名字',
`dept_level` tinyint(1) UNSIGNED NOT NULL COMMENT '部门级别',
`dept_p_id` tinyint(1) UNSIGNED NOT NULL COMMENT '上级部门编号',
PRIMARY KEY (`dept_id`) ,
INDEX `dept_id` (`dept_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `migration` (
`version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`apply_time` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`version`) 
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `title` (
`title_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '职务编号',
`title_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务名字',
`title_p_id` tinyint(1) UNSIGNED NOT NULL COMMENT '上级职务编号',
PRIMARY KEY (`title_id`) ,
INDEX `role_id` (`title_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `status` (
`status_id` tinyint(1) UNSIGNED NOT NULL COMMENT '状态编号',
`status_name` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态注释',
INDEX `status_id` (`status_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `user` (
`user_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '职员编号',
`user_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '职员姓名',
`user_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '职员密码',
`sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '职员性别',
`tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '职员电话',
`email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '职员邮箱',
`id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '职员身份证',
`school` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '职员院校',
`major` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '职员专业',
`crt_start` timestamp(8) NOT NULL COMMENT '合同开始',
`crt_end` timestamp(8) NOT NULL COMMENT '合同结束',
`work_place` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '工作地点',
`linkman` varchar(5) NULL COMMENT '紧急联系人',
`linktel` varchar(11) NULL COMMENT '紧急联系人电话',
`housing_fund` varchar(20) NULL COMMENT '住房公积金',
`vacation` tinyint(1) UNSIGNED NULL COMMENT '年假',
`status_id` tinyint(1) UNSIGNED NOT NULL COMMENT '状态编号(外键)',
`dept_id` tinyint(1) UNSIGNED NOT NULL COMMENT '部门编号(外键)',
`title_id` tinyint(1) UNSIGNED NOT NULL COMMENT '角色编号（外键）',
PRIMARY KEY (`user_id`) ,
INDEX `rolekey` (`title_id` ASC) USING BTREE,
INDEX `deptkey` (`dept_id` ASC) USING BTREE,
INDEX `statuskey` (`status_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `vendor` (
`vendor_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
`vendor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名字',
`vendor_type` varchar(50) NOT NULL COMMENT '供应商类别',
`vendor_province` varchar(10) NOT NULL COMMENT '供应商省份',
`vendor_city` varchar(10) NOT NULL COMMENT '供应商城市',
`vendor_linkman` varchar(5) NULL COMMENT '供应商联系人',
`vendor_linktel` varchar(15) NULL COMMENT '供应商联系电话',
`vendor_email` varchar(30) NULL COMMENT '供应商邮箱',
`coupon_rate` varchar(10) NULL COMMENT '票面税率',
`is_taxpayer` bool NULL COMMENT '是否一般纳税人',
`vendor_address` varchar(50) NULL COMMENT '公司地址',
`social_code` varchar(50) NULL COMMENT '统一社会代码',
`deposit_bank` varchar(50) NULL COMMENT '开户银行',
`bank_num` varchar(16) NULL COMMENT '银行卡号码',
`register_capital` varchar(10) NULL COMMENT '注册资本',
PRIMARY KEY (`vendor_id`) ,
INDEX `role_id` (`vendor_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `vendor_type` (
`type_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '种类编号',
`type_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类名字',
PRIMARY KEY (`type_id`) ,
INDEX `role_id` (`type_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `auth_assignment` (
`item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`created_time` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`item_name`, `user_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `auth_item` (
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`type` int(11) NOT NULL,
`description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
`rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
`created_time` int(11) NULL DEFAULT NULL,
`updated_time` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`name`) ,
INDEX `rule_name` (`rule_name` ASC) USING BTREE,
INDEX `idx-auth_item-type` (`type` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `auth_item_child` (
`parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`parent`, `child`) ,
INDEX `child` (`child` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `auth_rule` (
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
`created_time` int(11) NULL DEFAULT NULL,
`updated_time` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`name`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `train` (
`train_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '培训编号',
`title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '培训名字',
`src` varchar(100) NULL COMMENT '文件资源位置',
`tag` text NULL COMMENT '培训类型',
PRIMARY KEY (`train_id`) ,
INDEX `role_id` (`train_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `train_tag` (
`tag_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '培训类型编号',
`tag_word` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '培训类型名字',
`frequency` int(2) NULL,
`new_time` datetime NULL,
PRIMARY KEY (`tag_id`) ,
INDEX `role_id` (`tag_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `client` (
`client_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '客户编号',
`client_cmy_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户公司名字',
`client_dept` varchar(255) NULL,
`client_province` varchar(20) NULL DEFAULT NULL COMMENT '客户公司省份',
`client_city` varchar(10) NULL COMMENT '客户公司城市',
`client_site` varchar(60) NULL COMMENT '客户公司地址',
`client_linkman` varchar(20) NULL COMMENT '客户公司联系人',
`client_man_title` varchar(255) NULL,
`client_linktel` varchar(15) NOT NULL COMMENT '客户公司联系电话',
`client_email` varchar(30) NULL COMMENT '客户公司邮箱',
`client_tax_num` varchar(50) NULL COMMENT '统一社会代码',
`client_bank` varchar(50) NULL COMMENT '客户公司开户银行',
`client_bank_num` varchar(20) NULL COMMENT '客户公司银行卡号码',
`client_capital` varchar(20) NULL DEFAULT '' COMMENT '客户公司注册资本',
`coupon_rate` varchar(10) NULL COMMENT '票面税率',
`is_taxpayer` bool NULL COMMENT '是否一般纳税人',
`client_remark` varchar(75) NULL COMMENT '备注信息',
PRIMARY KEY (`client_id`) ,
INDEX `client_id` (`client_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `project` (
`project_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '项目编号',
`project_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名字',
`project_dept` varchar(255) NULL,
`new_time` datetime NULL COMMENT '项目新建时间',
`update_time` datetime NULL COMMENT '项目更新时间',
`confirm_time` datetime NULL COMMENT '项目确认时间',
`exec_time` datetime NULL DEFAULT 项目执行时间,
`end_time` datetime NULL COMMENT '项目完成时间',
`principal` varchar(10) NULL COMMENT '项目负责人',
`assist` varchar(100) NULL COMMENT '项目协助人',
`city` varchar(20) NULL COMMENT '项目城市',
`address` varchar(100) NULL COMMENT '项目地点',
`budget` varchar(30) NULL COMMENT '项目预算',
`crt_id` int(1) NULL,
`self_id` tinyint(1) NULL COMMENT '自己公司',
`client_id` varchar(30) NULL COMMENT '甲方公司',
`project_remark` varchar(75) NULL COMMENT '备注',
`rating` varchar(10) NULL COMMENT '评分',
`phase` tinyint(1) NOT NULL COMMENT '项目阶段 1-意向2-未成3-确认4-执行5-封账',
`project_type` bool NULL COMMENT '项目类型 外部0内部1',
PRIMARY KEY (`project_id`) ,
INDEX `project_id` (`project_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `notice` (
`notice_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告编号',
`type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型',
`content` text NULL COMMENT '公告内容',
`new_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '公告创建时间',
PRIMARY KEY (`notice_id`) ,
INDEX `role_id` (`notice_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `notice_type` (
`notice_type_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告编号',
`type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型',
`type_new_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '类型创建时间',
PRIMARY KEY (`notice_type_id`) ,
INDEX `role_id` (`notice_type_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `invoice` (
`invoice_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '发票编号',
`self_cmy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自己公司的名字',
`self_project` varchar(50) NULL DEFAULT NULL COMMENT '自己公司项目',
`invoice_type` varchar(10) NULL COMMENT '发票类型增专增普',
`invoice_kind` varchar(60) NULL COMMENT '发票用途餐饮住宿类',
`invoice_money` varchar(20) NULL COMMENT '发票金额',
`invoice_status` varchar(255) NULL COMMENT '发票状态',
`client_id` int(11) NULL,
`express_remark` varchar(255) NULL,
`remark` varchar(30) NULL COMMENT '客户公司邮箱',
PRIMARY KEY (`invoice_id`) ,
INDEX `client_id` (`invoice_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `contract` (
`crt_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '客户编号',
`crt_time` varchar(20) NULL DEFAULT NULL COMMENT '客户公司省份',
`crt_type` varchar(20) NULL COMMENT '客户公司联系人',
`crt_src` varchar(15) NOT NULL COMMENT '客户公司联系电话',
`crt_remark` varchar(75) NULL COMMENT '备注信息',
PRIMARY KEY (`crt_id`) ,
INDEX `client_id` (`crt_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `invoice_status` (
`type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型',
`type_new_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '类型创建时间',
`invoice_status` varchar(255) NULL,
INDEX `role_id` (`notice_type_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `self_cmy` (
`self_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '客户编号',
`self_cmy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户公司名字',
PRIMARY KEY (`self_id`) ,
INDEX `client_id` (`self_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;

ALTER TABLE `user` ADD CONSTRAINT `depekey` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `user` ADD CONSTRAINT `statuskey` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `user` ADD CONSTRAINT `titlekey` FOREIGN KEY (`title_id`) REFERENCES `title` (`title_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `auth_assignment` ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `auth_item` ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `auth_item_child` ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `auth_item_child` ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `client` ADD CONSTRAINT `fk_client_client_1` FOREIGN KEY (`client_id`) REFERENCES `invoice` (`client_id`);
ALTER TABLE `client` ADD CONSTRAINT `fk_client_client_2` FOREIGN KEY (`client_id`) REFERENCES `project` (`client_id`);
ALTER TABLE `self_cmy` ADD CONSTRAINT `fk_self_cmy_self_cmy_1` FOREIGN KEY (`self_id`) REFERENCES `project` (`self_id`);
ALTER TABLE `contract` ADD CONSTRAINT `fk_contract_contract_1` FOREIGN KEY (`crt_id`) REFERENCES `project` (`crt_id`);

