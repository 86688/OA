CREATE TABLE `auth_assignment` (
`item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`created_time` int(11) UNSIGNED NULL DEFAULT NULL,
PRIMARY KEY (`item_name`, `user_id`) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `auth_item` (
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`type` int(11) NOT NULL,
`description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
`rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
`created_time` int(11) UNSIGNED NULL DEFAULT NULL,
`updated_time` int(11) UNSIGNED NULL DEFAULT NULL,
PRIMARY KEY (`name`) ,
INDEX `rule_name` (`rule_name` ASC) USING BTREE,
INDEX `idx-auth_item-type` (`type` ASC) USING BTREE
)
ENGINE = InnoDB
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
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `auth_rule` (
`name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
`created_time` int(11) UNSIGNED NULL DEFAULT NULL,
`updated_time` int(11) UNSIGNED NULL DEFAULT NULL,
PRIMARY KEY (`name`) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
ROW_FORMAT = Compact;
CREATE TABLE `client` (
`client_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '�ͻ����',
`client_cmy_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '�ͻ���˾����',
`client_dept` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾����',
`client_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾ʡ��',
`client_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾����',
`client_site` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾��ַ',
`client_linkman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾��ϵ��',
`client_man_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾��ϵ��ְ��',
`client_linktel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '�ͻ���˾��ϵ�绰',
`client_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾����',
`client_tax_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ͳһ������',
`client_bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾��������',
`client_bank_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͻ���˾���п�����',
`client_capital` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '�ͻ���˾ע���ʱ�',
`coupon_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Ʊ��˰��',
`is_taxpayer` tinyint(1) NULL DEFAULT NULL COMMENT '�Ƿ�һ����˰��',
`client_remark` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע��Ϣ',
`invoice_id` int(1) UNSIGNED NULL DEFAULT NULL,
PRIMARY KEY (`client_id`) ,
INDEX `client_id` (`client_id` ASC) USING BTREE,
INDEX `invoice_id` (`invoice_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `contract` (
`crt_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ͬ���',
`crt_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ͬ����',
`crt_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��ͬλ��',
`crt_remark` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ͬ��ע��Ϣ',
`crt_newtime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��ͬʡ��',
`crt_uptime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��ͬ�ϴ�ʱ��',
PRIMARY KEY (`crt_id`) ,
INDEX `client_id` (`crt_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `dept` (
`dept_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '���ű��',
`dept_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��������',
`dept_level` tinyint(1) UNSIGNED NOT NULL COMMENT '���ż���',
`dept_p_id` tinyint(1) UNSIGNED NOT NULL COMMENT '�ϼ����ű��',
PRIMARY KEY (`dept_id`) ,
INDEX `dept_id` (`dept_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `invoice` (
`invoice_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��Ʊ���',
`client_id` int(1) UNSIGNED NOT NULL COMMENT '�ͻ���˾ID',
`self_cmy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '�Լ���˾������',
`self_project` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�Լ���˾��Ŀ',
`invoice_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʊ������ר����',
`invoice_kind` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʊ��;����ס����',
`invoice_money` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʊ���',
`invoice_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʊ״̬',
`express_remark` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�����Ϣ��ע',
`remark` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʊ��Ϣ��ע',
PRIMARY KEY (`invoice_id`) ,
INDEX `client_id` (`invoice_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `migration` (
`version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`apply_time` int(11) UNSIGNED NULL DEFAULT NULL,
PRIMARY KEY (`version`) 
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;
CREATE TABLE `notice` (
`notice_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '������',
`type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��������',
`content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '��������',
`new_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '���洴��ʱ��',
PRIMARY KEY (`notice_id`) ,
INDEX `role_id` (`notice_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `notice_type` (
`notice_type_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '������',
`type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��������',
`type_new_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '���ʹ���ʱ��',
PRIMARY KEY (`notice_type_id`) ,
INDEX `role_id` (`notice_type_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `project` (
`project_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��Ŀ���',
`project_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��Ŀ����',
`depe_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`new_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��Ŀ�½�ʱ��',
`update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��Ŀ����ʱ��',
`confirm_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��Ŀȷ��ʱ��',
`exec_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��Ŀִ��ʱ��',
`end_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '��Ŀ���ʱ��',
`principal` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ������',
`assist` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ĿЭ����',
`city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����',
`address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ�ص�',
`budget` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ĿԤ��',
`crt_id` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '��ͬ���',
`self_id` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '�Լ���˾���',
`client_id` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '�ͻ����',
`project_remark` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ��ע',
`rating` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����',
`phase` tinyint(1) NOT NULL COMMENT '�׶� 1-����2-δ��3-ȷ��4-ִ��5-����',
`project_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����',
PRIMARY KEY (`project_id`) ,
INDEX `project_id` (`project_id` ASC) USING BTREE,
INDEX `client_id` (`client_id` ASC) USING BTREE,
INDEX `self_id` (`self_id` ASC) USING BTREE,
INDEX `crt_id` (`crt_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `self_cmy` (
`self_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '�ͻ����',
`self_cmy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '�ͻ���˾����',
PRIMARY KEY (`self_id`) ,
INDEX `client_id` (`self_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `status` (
`status_id` tinyint(1) UNSIGNED NOT NULL COMMENT '״̬���',
`status_name` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '״̬ע��',
INDEX `status_id` (`status_id` ASC) USING BTREE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `title` (
`title_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ְ����',
`title_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ְ������',
`title_p_id` tinyint(1) UNSIGNED NOT NULL COMMENT '�ϼ�ְ����',
PRIMARY KEY (`title_id`) ,
INDEX `role_id` (`title_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `train` (
`train_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ѵ���',
`title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��ѵ����',
`src` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ļ���Դλ��',
`tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ѵ����',
PRIMARY KEY (`train_id`) ,
INDEX `role_id` (`train_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `train_tag` (
`tag_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ѵ���ͱ��',
`tag_word` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��ѵ��������',
`frequency` int(2) NULL DEFAULT NULL,
`new_time` int(11) UNSIGNED NULL DEFAULT NULL,
PRIMARY KEY (`tag_id`) ,
INDEX `role_id` (`tag_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `user` (
`user_id` smallint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ְԱ���',
`user_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ְԱ����',
`user_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ְԱ����',
`sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ְԱ�Ա�',
`tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ְԱ�绰',
`email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ְԱ����',
`id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ְԱ���֤',
`school` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ְԱԺУ',
`major` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ְԱרҵ',
`crt_start` int(11) UNSIGNED NOT NULL COMMENT '��ͬ��ʼ',
`crt_end` int(11) UNSIGNED NOT NULL COMMENT '��ͬ����',
`work_place` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '�����ص�',
`linkman` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '�����ϵ��',
`linktel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '�����ϵ�˵绰',
`housing_fund` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ס��������',
`vacation` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '���',
`status_id` tinyint(1) UNSIGNED NOT NULL COMMENT '״̬���(���)',
`dept_id` tinyint(1) UNSIGNED NOT NULL COMMENT '���ű��(���)',
`title_id` tinyint(1) UNSIGNED NOT NULL COMMENT '��ɫ��ţ������',
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
`vendor_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��Ӧ�̱��',
`vendor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��Ӧ������',
`vendor_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��Ӧ�����',
`vendor_province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��Ӧ��ʡ��',
`vendor_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��Ӧ�̳���',
`vendor_linkman` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ӧ����ϵ��',
`vendor_linktel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ӧ����ϵ�绰',
`vendor_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ӧ������',
`coupon_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Ʊ��˰��',
`is_taxpayer` tinyint(1) NULL DEFAULT NULL COMMENT '�Ƿ�һ����˰��',
`vendor_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��˾��ַ',
`social_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ͳһ������',
`deposit_bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��������',
`bank_num` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '���п�����',
`register_capital` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ע���ʱ�',
PRIMARY KEY (`vendor_id`) ,
INDEX `role_id` (`vendor_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;
CREATE TABLE `vendor_type` (
`type_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '������',
`type_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��������',
PRIMARY KEY (`type_id`) ,
INDEX `role_id` (`type_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Compact;

ALTER TABLE `auth_assignment` ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `auth_item` ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `auth_item_child` ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `auth_item_child` ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `client` ADD CONSTRAINT `fk_client_project` FOREIGN KEY (`client_id`) REFERENCES `project` (`client_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `contract` ADD CONSTRAINT `fk_contract_contract_1` FOREIGN KEY (`crt_id`) REFERENCES `project` (`crt_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `dept` ADD CONSTRAINT `fk_dept_dept_1` FOREIGN KEY (`dept_id`) REFERENCES `user` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `invoice` ADD CONSTRAINT `fk_invoice_client` FOREIGN KEY (`invoice_id`) REFERENCES `client` (`invoice_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `self_cmy` ADD CONSTRAINT `fk_self_cmy_self_cmy_1` FOREIGN KEY (`self_id`) REFERENCES `project` (`self_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `status` ADD CONSTRAINT `fk_status_status_1` FOREIGN KEY (`status_id`) REFERENCES `user` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `title` ADD CONSTRAINT `fk_title_title_1` FOREIGN KEY (`title_id`) REFERENCES `user` (`title_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

