/*
Navicat MySQL Data Transfer

Source Server         : 192.168.10.239
Source Server Version : 50722
Source Host           : 192.168.10.239:13307
Source Database       : houses_test

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-28 15:07:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_crm_customer_allot
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_customer_allot`;
CREATE TABLE `t_crm_customer_allot` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `houses_id` int(11) NOT NULL COMMENT '楼盘ID',
  `user_id` varchar(32) NOT NULL COMMENT '销售人员',
  `customer_id` int(11) NOT NULL COMMENT '客户',
  `want` varchar(255) DEFAULT NULL COMMENT '客户意向',
  `remove_flag` int(11) DEFAULT NULL COMMENT '拆迁',
  `follow_content` varchar(100) DEFAULT NULL COMMENT '客户关注内容',
  `current_house` int(11) DEFAULT NULL COMMENT '当前住房',
  `family` int(11) DEFAULT NULL COMMENT '家庭情况',
  `objective` int(11) DEFAULT NULL COMMENT '购房目的',
  `status` int(11) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `visit_cycle` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customer_user` (`customer_id`) USING BTREE,
  CONSTRAINT `t_crm_customer_allot_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_crm_customer_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='客户分配表';

-- ----------------------------
-- Records of t_crm_customer_allot
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_customer_flow_record
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_customer_flow_record`;
CREATE TABLE `t_crm_customer_flow_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `business_id` int(11) DEFAULT NULL COMMENT '业务id',
  `order_id` int(11) DEFAULT NULL COMMENT '客户关系id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '销售人员',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '当前状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `type` int(11) DEFAULT NULL COMMENT '流程类型。数据字典：1',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_12` (`business_id`) USING BTREE,
  KEY `t_crm_customer_flow_record_ibfk_2` (`order_id`) USING BTREE,
  CONSTRAINT `t_crm_customer_flow_record_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_crm_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='客户流程记录';

-- ----------------------------
-- Records of t_crm_customer_flow_record
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_customer_info
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_customer_info`;
CREATE TABLE `t_crm_customer_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(32) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `source` int(11) DEFAULT NULL COMMENT '来源',
  `live_area` varchar(255) DEFAULT NULL COMMENT '居住区域',
  `job` varchar(32) DEFAULT NULL COMMENT '职业',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `email` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='客户信息表';

-- ----------------------------
-- Records of t_crm_customer_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_discount
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_discount`;
CREATE TABLE `t_crm_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `order_flag` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_16` (`business_id`) USING BTREE,
  CONSTRAINT `t_crm_discount_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `t_crm_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='优惠折扣';

-- ----------------------------
-- Records of t_crm_discount
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_money
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_money`;
CREATE TABLE `t_crm_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL COMMENT '业务id',
  `lsh` varchar(32) DEFAULT NULL COMMENT '流水号',
  `price` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`business_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `t_crm_money_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_crm_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='资金流动表';

-- ----------------------------
-- Records of t_crm_money
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_msg`;
CREATE TABLE `t_crm_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allot_id` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `config` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `allot_id` (`allot_id`) USING BTREE,
  CONSTRAINT `t_crm_msg_ibfk_1` FOREIGN KEY (`allot_id`) REFERENCES `t_crm_customer_allot` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_crm_msg
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_order
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_order`;
CREATE TABLE `t_crm_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allot_id` int(11) NOT NULL COMMENT '客户分配id',
  `room_id` int(11) DEFAULT NULL,
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `node` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '191' COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `allot_id` (`allot_id`) USING BTREE,
  CONSTRAINT `t_crm_order_ibfk_1` FOREIGN KEY (`allot_id`) REFERENCES `t_crm_customer_allot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_crm_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_order_earnest
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_order_earnest`;
CREATE TABLE `t_crm_order_earnest` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) DEFAULT NULL COMMENT '客户分配id',
  `room_id` int(11) DEFAULT NULL COMMENT '房号',
  `area` decimal(10,2) DEFAULT NULL COMMENT '面积',
  `price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT '总价',
  `real_price` decimal(12,2) DEFAULT NULL COMMENT '实际价格',
  `money` decimal(12,2) DEFAULT NULL COMMENT '定金金额',
  `pay_date` date DEFAULT NULL COMMENT '缴纳日期',
  `earnest_deadline` datetime DEFAULT NULL COMMENT '认购期限',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `no` varchar(50) DEFAULT NULL COMMENT '认购单号',
  `pay_type` int(11) DEFAULT NULL COMMENT '付款方式',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `t_crm_order_earnest_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_crm_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=814 DEFAULT CHARSET=utf8 COMMENT='认购信息';

-- ----------------------------
-- Records of t_crm_order_earnest
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_order_signing
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_order_signing`;
CREATE TABLE `t_crm_order_signing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) DEFAULT NULL COMMENT '客户分配id',
  `room_id` int(11) DEFAULT NULL COMMENT '房号',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT '房款总额',
  `pay_type` int(11) DEFAULT NULL COMMENT '付款方式',
  `frist_money` decimal(12,2) DEFAULT NULL COMMENT '首付金额',
  `borrow_money` decimal(12,2) DEFAULT NULL COMMENT '贷款金额',
  `borrow_years` int(11) DEFAULT NULL COMMENT '贷款年限',
  `signing_date` date DEFAULT NULL COMMENT '签约时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_money` decimal(12,2) DEFAULT NULL COMMENT '实际付款',
  `price` decimal(12,2) DEFAULT NULL COMMENT '签约单价',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `t_crm_order_signing_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_crm_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='签约信息';

-- ----------------------------
-- Records of t_crm_order_signing
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_order_sincerity
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_order_sincerity`;
CREATE TABLE `t_crm_order_sincerity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) DEFAULT NULL COMMENT '客户分配id',
  `money` decimal(12,2) DEFAULT NULL COMMENT '诚意金',
  `pay_date` date DEFAULT NULL COMMENT '缴纳日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `t_crm_order_sincerity_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_crm_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='认筹信息';

-- ----------------------------
-- Records of t_crm_order_sincerity
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_sales_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_sales_plan`;
CREATE TABLE `t_crm_sales_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `plan_cycle` int(11) DEFAULT NULL COMMENT '计划粒度（月、季、年）',
  `plan_type` int(11) DEFAULT NULL COMMENT '计划分类(面积、金额、套)',
  `plan_num` decimal(12,2) DEFAULT NULL COMMENT '计划数量',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='销售计划表';

-- ----------------------------
-- Records of t_crm_sales_plan
-- ----------------------------

-- ----------------------------
-- Table structure for t_crm_visit
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_visit`;
CREATE TABLE `t_crm_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `allot_id` int(11) DEFAULT NULL COMMENT '客户关系id',
  `visit_time` datetime DEFAULT NULL COMMENT '拜访时间',
  `visit_objecctive` varchar(100) DEFAULT NULL COMMENT '拜访目的',
  `visit_result` varchar(100) DEFAULT NULL COMMENT '拜访结果',
  `next_visit` date DEFAULT NULL,
  `next_overd` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_visit_customer` (`allot_id`) USING BTREE,
  CONSTRAINT `t_crm_visit_ibfk_1` FOREIGN KEY (`allot_id`) REFERENCES `t_crm_customer_allot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='拜访记录表';

-- ----------------------------
-- Records of t_crm_visit
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_apartment_info
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_apartment_info`;
CREATE TABLE `t_houses_apartment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `unit_id` int(11) DEFAULT NULL COMMENT '所属单元',
  `name` varchar(50) DEFAULT NULL COMMENT '户型名称',
  `area` decimal(8,2) DEFAULT NULL COMMENT '户型面积',
  `remark` varchar(255) DEFAULT NULL COMMENT '户型解读',
  `shi` int(11) DEFAULT NULL COMMENT '室',
  `ting` int(11) DEFAULT NULL COMMENT '厅',
  `wei` int(11) DEFAULT NULL COMMENT '卫',
  `chu` int(11) DEFAULT NULL COMMENT '厨',
  `yt` int(11) DEFAULT NULL COMMENT '阳台',
  `type` int(11) DEFAULT NULL COMMENT '分离',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='户型信息';

-- ----------------------------
-- Records of t_houses_apartment_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_base_info
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_base_info`;
CREATE TABLE `t_houses_base_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `company_id` varchar(32) DEFAULT NULL COMMENT '销售公司',
  `developers` int(11) DEFAULT NULL COMMENT '开发商',
  `houses_address` varchar(100) DEFAULT NULL COMMENT '项目地址',
  `sales_address` varchar(100) DEFAULT NULL COMMENT '售楼处地址',
  `property` int(11) DEFAULT NULL COMMENT '物业公司',
  `open_time` date DEFAULT NULL COMMENT '最新开盘',
  `property_type` int(11) DEFAULT NULL COMMENT '物业类型',
  `give_time` date DEFAULT NULL COMMENT '交房时间',
  `plot_ratio` decimal(5,2) DEFAULT NULL COMMENT '容积率',
  `plan_num` int(11) DEFAULT NULL COMMENT '规划户数',
  `parking_lot` int(11) DEFAULT NULL COMMENT '车位情况',
  `water_supply` int(11) DEFAULT NULL COMMENT '供水方式',
  `build_type` int(11) DEFAULT NULL COMMENT '建筑类型',
  `coverd_area` decimal(10,2) DEFAULT NULL COMMENT '占地面积',
  `green_ratios` decimal(5,2) DEFAULT NULL COMMENT '绿化率',
  `property_cost` decimal(8,2) DEFAULT NULL COMMENT '物业费用',
  `heating_type` int(11) DEFAULT NULL COMMENT '供暖方式',
  `power_type` int(11) DEFAULT NULL COMMENT '供电方式',
  `loathing_build` varchar(50) DEFAULT NULL COMMENT '嫌恶设施',
  `build_area` decimal(10,2) DEFAULT NULL COMMENT '建筑面积',
  `public_area` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `cycle` varchar(50) DEFAULT '' COMMENT '签约周期',
  `province` varchar(6) DEFAULT '' COMMENT '省',
  `city` varchar(6) DEFAULT '' COMMENT '市',
  `area` varchar(6) DEFAULT '' COMMENT '区',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_name` (`name`) USING BTREE,
  KEY `FK_devp_houses` (`developers`) USING BTREE,
  KEY `FK_property_houses` (`property`) USING BTREE,
  KEY `FK_sales_houses` (`company_id`) USING BTREE,
  CONSTRAINT `t_houses_base_info_ibfk_1` FOREIGN KEY (`developers`) REFERENCES `t_houses_developers` (`id`),
  CONSTRAINT `t_houses_base_info_ibfk_2` FOREIGN KEY (`property`) REFERENCES `t_houses_property` (`id`),
  CONSTRAINT `t_houses_base_info_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `t_houses_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='楼盘信息';

-- ----------------------------
-- Records of t_houses_base_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_building_info
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_building_info`;
CREATE TABLE `t_houses_building_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `houses_id` int(11) DEFAULT NULL COMMENT '所属楼盘',
  `building_no` varchar(32) DEFAULT NULL COMMENT '楼栋编号',
  `unit_num` int(11) DEFAULT NULL COMMENT '单元数',
  `high` int(11) DEFAULT NULL COMMENT '最高层数',
  `low` int(11) DEFAULT NULL COMMENT '最低层数',
  `households_num` int(11) DEFAULT NULL COMMENT '总户数',
  `qs` int(11) DEFAULT NULL COMMENT '权属',
  `house_use_type` int(11) DEFAULT NULL COMMENT '房屋用途',
  `build_struct` int(11) DEFAULT NULL COMMENT '建筑结构',
  `build_type` int(11) DEFAULT NULL,
  `cq_years` int(11) DEFAULT NULL COMMENT '产权年限',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pre_sell_no` varchar(50) DEFAULT NULL COMMENT '预售证编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `houses_id` (`houses_id`,`building_no`) USING BTREE,
  KEY `build_struct` (`build_struct`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  CONSTRAINT `t_houses_building_info_ibfk_1` FOREIGN KEY (`houses_id`) REFERENCES `t_houses_base_info` (`id`),
  CONSTRAINT `t_houses_building_info_ibfk_2` FOREIGN KEY (`build_struct`) REFERENCES `t_sys_dict` (`code`),
  CONSTRAINT `t_houses_building_info_ibfk_3` FOREIGN KEY (`status`) REFERENCES `t_sys_dict` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='楼栋信息';

-- ----------------------------
-- Records of t_houses_building_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_company
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_company`;
CREATE TABLE `t_houses_company` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `org_code` varchar(18) DEFAULT NULL COMMENT '组织机构代码',
  `business_license` varchar(100) DEFAULT NULL COMMENT '营业执照',
  `register_date` date DEFAULT NULL COMMENT '注册时间',
  `logo` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `linkman` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产销售公司';

-- ----------------------------
-- Records of t_houses_company
-- ----------------------------
INSERT INTO `t_houses_company` VALUES ('-2', '房开公司', null, null, null, null, null, null, null, '2019-01-02 09:48:40');

-- ----------------------------
-- Table structure for t_houses_developers
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_developers`;
CREATE TABLE `t_houses_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) DEFAULT NULL COMMENT '开发商名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '开发商介绍',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='开发商';

-- ----------------------------
-- Records of t_houses_developers
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_label_base
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_label_base`;
CREATE TABLE `t_houses_label_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) DEFAULT NULL COMMENT '标签名称',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of t_houses_label_base
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_label_business
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_label_business`;
CREATE TABLE `t_houses_label_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `label_id` int(11) DEFAULT NULL COMMENT '标签id',
  `business_id` int(11) DEFAULT NULL COMMENT '业务id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `t_houses_label_business_ibfk_1` FOREIGN KEY (`id`) REFERENCES `t_houses_label_base` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务标签关联表';

-- ----------------------------
-- Records of t_houses_label_business
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_park
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_park`;
CREATE TABLE `t_houses_park` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) DEFAULT NULL,
  `no` varchar(32) DEFAULT NULL,
  `cq` int(11) DEFAULT NULL,
  `area` decimal(5,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `layer` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_17` (`house_id`) USING BTREE,
  CONSTRAINT `t_houses_park_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `t_houses_base_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车位信息表';

-- ----------------------------
-- Records of t_houses_park
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_property
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_property`;
CREATE TABLE `t_houses_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) NOT NULL COMMENT '物业名称',
  `remark` varchar(255) DEFAULT '' COMMENT '物业介绍',
  `contact` varchar(20) DEFAULT '' COMMENT '联系方式',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志(默认0是正常，-1是删除)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='物业公司';

-- ----------------------------
-- Records of t_houses_property
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_room_info
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_room_info`;
CREATE TABLE `t_houses_room_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `unit_id` int(11) DEFAULT NULL COMMENT '所属单元',
  `room_no` varchar(32) DEFAULT NULL COMMENT '房间号',
  `apartment_id` int(11) DEFAULT NULL COMMENT '户型',
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `low_price` decimal(12,2) DEFAULT NULL COMMENT '最低价格',
  `layer` int(11) DEFAULT NULL COMMENT '第几层',
  `public_area` varchar(50) DEFAULT NULL,
  `spring_layer` int(11) DEFAULT NULL COMMENT '是否跃层',
  `orientation` int(11) DEFAULT NULL COMMENT '朝向',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_id_room_no_layer` (`unit_id`,`room_no`,`layer`) USING BTREE,
  KEY `FK_room_apartment` (`apartment_id`) USING BTREE,
  CONSTRAINT `t_houses_room_info_ibfk_1` FOREIGN KEY (`apartment_id`) REFERENCES `t_houses_apartment_info` (`id`),
  CONSTRAINT `t_houses_room_info_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `t_houses_unit_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COMMENT='房间信息';

-- ----------------------------
-- Records of t_houses_room_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_houses_unit_info
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_unit_info`;
CREATE TABLE `t_houses_unit_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `building_id` int(11) DEFAULT NULL COMMENT '所属楼栋',
  `unit_no` varchar(50) DEFAULT NULL COMMENT '单元号',
  `layer_num` int(11) DEFAULT NULL COMMENT '总层数',
  `households` int(11) DEFAULT NULL COMMENT '总户数',
  `apartment_num` int(11) DEFAULT NULL COMMENT '户型数',
  `ti` int(11) DEFAULT NULL COMMENT '梯',
  `hu` int(11) DEFAULT NULL COMMENT '户',
  `disadvantage` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `building_id` (`building_id`,`unit_no`) USING BTREE,
  CONSTRAINT `t_houses_unit_info_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `t_houses_building_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='单元信息';

-- ----------------------------
-- Records of t_houses_unit_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_jcqx_department
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_department`;
CREATE TABLE `t_jcqx_department` (
  `DEPARTMENT_ID` varchar(32) NOT NULL COMMENT '主键',
  `DEPARTMENT_NAME` varchar(40) NOT NULL COMMENT '机构名称|部门名称',
  `DEPARTMENT_TYPE` varchar(32) NOT NULL COMMENT '机构类型(1：机构, 2：部门)',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '上级机构ID',
  `COMPANY_ID` varchar(32) DEFAULT NULL COMMENT '机构id',
  `PROJECT_ID` varchar(32) NOT NULL COMMENT '项目ID',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `REMARK` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_department
-- ----------------------------
INSERT INTO `t_jcqx_department` VALUES ('-1', '初始账号统一内置部门', '00009', null, '-1', '1', '2018-12-28 15:21:03', null, null);
INSERT INTO `t_jcqx_department` VALUES ('-2', '房开公司', '00009', null, '-2', '1', '2019-01-02 09:48:27', null, null);

-- ----------------------------
-- Table structure for t_jcqx_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_dict`;
CREATE TABLE `t_jcqx_dict` (
  `ID` varchar(6) NOT NULL,
  `SIGN` varchar(255) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `PARENT_ID` varchar(6) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务状态表';

-- ----------------------------
-- Records of t_jcqx_dict
-- ----------------------------

-- ----------------------------
-- Table structure for t_jcqx_examine
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_examine`;
CREATE TABLE `t_jcqx_examine` (
  `id` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  `examineId` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_examine
-- ----------------------------

-- ----------------------------
-- Table structure for t_jcqx_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_logs`;
CREATE TABLE `t_jcqx_logs` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `RE_IP` varchar(32) NOT NULL COMMENT '请求IP',
  `RE_URL` varchar(32) NOT NULL COMMENT '请求路径',
  `RS_JSON` text NOT NULL COMMENT '响应JSON',
  `CREATE_TIME` datetime NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_logs
-- ----------------------------

-- ----------------------------
-- Table structure for t_jcqx_project
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_project`;
CREATE TABLE `t_jcqx_project` (
  `PROJECT_ID` varchar(32) NOT NULL COMMENT '主键',
  `PROJECT_NAME` varchar(128) NOT NULL COMMENT '项目名称',
  `PROJECT_CODE` varchar(32) NOT NULL COMMENT '项目代码',
  PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_project
-- ----------------------------
INSERT INTO `t_jcqx_project` VALUES ('1', '房地产销售', '1');

-- ----------------------------
-- Table structure for t_jcqx_re_jurisdiction
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_re_jurisdiction`;
CREATE TABLE `t_jcqx_re_jurisdiction` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `RE_RESOURCE_ID` varchar(32) NOT NULL COMMENT '请求资源ID',
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `DEPARTMENT_ID` varchar(32) DEFAULT NULL COMMENT '部门ID',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `OPERATOR` varchar(32) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_re_jurisdiction
-- ----------------------------
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('1', '1', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('10', '124', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('11', '13', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('12', '131', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('13', '14', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('14', '141', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('15', '2', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('16', '3', '-1', '-1', '2019-01-21 15:59:21', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('2', '11', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('3', '111', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('4', '112', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('5', '113', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('6', '12', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('7', '121', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('8', '122', '-1', '-1', '2019-01-18 00:00:00', null);
INSERT INTO `t_jcqx_re_jurisdiction` VALUES ('9', '123', '-1', '-1', '2019-01-18 00:00:00', null);

-- ----------------------------
-- Table structure for t_jcqx_re_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_re_resource`;
CREATE TABLE `t_jcqx_re_resource` (
  `RE_RESOURCE_ID` varchar(32) NOT NULL COMMENT '主键',
  `RE_RESOURCE_NAME` varchar(64) NOT NULL COMMENT '请求资源名称',
  `RE_RESOURCE_TYPE` varchar(32) NOT NULL COMMENT '请求资源类型',
  `RE_PARENT_RESOURCE_ID` varchar(32) DEFAULT NULL COMMENT '父项菜单ID',
  `RE_URL` varchar(64) DEFAULT NULL COMMENT '请求资源链接地址',
  `RE_ICON` varchar(64) DEFAULT NULL COMMENT '请求资源图标',
  `PROJECT_ID` varchar(32) NOT NULL COMMENT '项目id',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `VISIT` bit(1) DEFAULT NULL,
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  `ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`RE_RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_re_resource
-- ----------------------------
INSERT INTO `t_jcqx_re_resource` VALUES ('1', '楼盘管理', '00015', null, 'village', 'icon-gongsimaoyifenxi', '1', '2018-03-19 17:08:02', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('11', '公司权限管理', '00015', '1', 'tools', 'icon-qiyeguanli', '1', '2018-03-19 17:08:02', '', null, '4');
INSERT INTO `t_jcqx_re_resource` VALUES ('111', '组织部门管理', '00015', '11', 'power/organization', '', '1', '2018-03-19 17:08:02', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('112', '角色管理', '00015', '11', 'power/role', '', '1', '2018-03-19 17:08:02', '', null, '2');
INSERT INTO `t_jcqx_re_resource` VALUES ('113', '员工管理', '00015', '11', 'power/staff', '', '1', '2018-03-19 17:08:02', '', null, '3');
INSERT INTO `t_jcqx_re_resource` VALUES ('12', '楼栋管理', '00015', '1', 'building', 'icon-shouye', '1', '2018-03-19 17:08:02', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('121', '楼栋管理', '00015', '12', 'building/list', '', '1', '2018-03-19 17:08:02', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('122', '单元管理', '00015', '12', 'building/unit', '', '1', '2018-03-19 17:08:02', '', null, '2');
INSERT INTO `t_jcqx_re_resource` VALUES ('123', '户型管理', '00015', '12', 'building/huxing', '', '1', '2018-03-19 17:08:02', '', null, '3');
INSERT INTO `t_jcqx_re_resource` VALUES ('124', '房间管理', '00015', '12', 'building/rooms', '', '1', '2018-03-19 17:08:02', '', null, '4');
INSERT INTO `t_jcqx_re_resource` VALUES ('13', '销控管理', '00015', '1', 'sales', 'icon-gongsimaoyifenxi', '1', '2018-03-19 17:08:02', '', null, '2');
INSERT INTO `t_jcqx_re_resource` VALUES ('131', '销售信息', '00015', '13', 'sales/info', '', '1', '2018-03-19 17:08:02', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('14', '销售客户管理', '00015', '1', '', 'icon-hezuoshangguanli', '1', '2018-03-19 17:08:02', '', null, '3');
INSERT INTO `t_jcqx_re_resource` VALUES ('141', '销售客户', '00015', '14', 'clients', '', '1', '2018-03-19 17:08:02', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('2', '客户管理', '00015', null, 'clients', null, '1', '2019-01-18 15:16:37', '', null, '2');
INSERT INTO `t_jcqx_re_resource` VALUES ('21', '客户管理', '00015', '2', 'clients/index', 'icon-hezuoshangguanli', '1', '2019-01-22 15:17:05', '', null, '1');
INSERT INTO `t_jcqx_re_resource` VALUES ('3', '单元房间销售详情', '00015', null, 'sales/rooms', null, '1', '2019-01-21 15:57:08', '', null, '3');

-- ----------------------------
-- Table structure for t_jcqx_role
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_role`;
CREATE TABLE `t_jcqx_role` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT '主键',
  `ROLE_NAME` varchar(64) NOT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTIONG` varchar(64) DEFAULT NULL COMMENT '角色描述',
  `INDEX_URL` varchar(64) DEFAULT NULL COMMENT '首页路径',
  `DEPARTMENT_ID` varchar(32) NOT NULL COMMENT '部门ID',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  `SHOW` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_role
-- ----------------------------
INSERT INTO `t_jcqx_role` VALUES ('-1', '初始管理员', null, null, '-1', '2018-12-28 15:20:06', null, null, '\0');

-- ----------------------------
-- Table structure for t_jcqx_rs_jurisdiction
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_rs_jurisdiction`;
CREATE TABLE `t_jcqx_rs_jurisdiction` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `RS_RESOURCE_ID` varchar(32) NOT NULL COMMENT '响应资源ID',
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `DEPARTMENT_ID` varchar(32) NOT NULL COMMENT '部门ID',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `SHOW` bit(1) NOT NULL,
  `OPERATOR` varchar(32) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_rs_jurisdiction
-- ----------------------------
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('0b18be82990d4da5bf17a29e09986478', '', 'befc5e26106444c8a2c23fa80df39ef3', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 14:45:11', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('0f59003d2ac949aaa82e442038fb2d04', '', 'befc5e26106444c8a2c23fa80df39ef3', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 14:45:11', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('10c0cbc923bd4b74b9bb81d16041fe73', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('13c5dbb6e2bd4c2f904cc361b849a7e2', '', 'befc5e26106444c8a2c23fa80df39ef3', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 14:45:11', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('21d9f6ab68c948ceb1c34e06cfc9b536', '', '4072c09384864bba80a4fa19501c0936', '8d6cf5381ffc40fdbbb89dbe5881ee75', '2019-01-21 08:58:41', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('21e1925ecb2a4707b20b943a7a900eff', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('2899dd999ac74ad6b4b306db36c187e7', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('28c8e994d0214e34b88806c6d75eb42a', '', '02b21da7ec9642b7a34e4c557f4dfb7b', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:05:12', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('2f37df122b3f497abc762cd7e0426f1f', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('3a1e85614f194ab193b210791f4b0488', '', 'ec58b1673dc34276b02bee0ca6a7b87c', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:08:48', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('3f889a13f48247d29847d5a17f40d0be', '', 'befc5e26106444c8a2c23fa80df39ef3', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 14:45:11', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('44a61ded93d345c89bc95169981ac400', '', 'befc5e26106444c8a2c23fa80df39ef3', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 14:45:11', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('44a8176510034344ab27a3ce6b720842', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('4a0c911541764495968d903dfefe1520', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('4d5354d0d2fb4039aeb4e5d672222fdb', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('54abca4da7dc48b7931da28938ae532f', '', 'eaaaab70048346659618878d8b8de0a4', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 08:57:35', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('55b447ac83e544aa98e16173b915471e', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('5ea00bdf48e34f1588e85544c6aca7ed', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('630037ff810946d7a61c5850c754fc3a', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('67d58c8bc6f94af89294c3d8903bf6c8', '', 'ec58b1673dc34276b02bee0ca6a7b87c', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:08:48', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('691e72f076b64fd39b7c5f6e1f5da493', '', 'ec58b1673dc34276b02bee0ca6a7b87c', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:08:48', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('6f3dd271a7d84eadbff824b0929f61c6', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('864a0b62a4244a9b8b498267f05306c9', '', '02b21da7ec9642b7a34e4c557f4dfb7b', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:05:12', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('86f410b67dcb4a4ab5ca7d0d4c410fdc', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('96a46aff065845ef8fc06f69b583e2a4', '', 'eaaaab70048346659618878d8b8de0a4', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 08:57:35', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('a9b6d0cc21094ff79dfa9f405b87c399', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('ac95bec603d84b2395a5c607c8c5a9d4', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('b6915f22b6384c2f9440fad154bc856e', '', '4072c09384864bba80a4fa19501c0936', '8d6cf5381ffc40fdbbb89dbe5881ee75', '2019-01-21 08:58:41', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('b715355298db481a80ecdb593518509c', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('bf4d786858944528ad448b7db7c56c05', '', '02b21da7ec9642b7a34e4c557f4dfb7b', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:05:12', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('c09bc4a7fb4d484482bd0c9ad8e36510', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('c7bc9911e94545808ef7018a94c9bc45', '', '02b21da7ec9642b7a34e4c557f4dfb7b', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:05:12', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('c98c0b5873714e4cbe94c73a319f1105', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('cd204b76994e43109d71a835cfe1f702', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('d110f001ec764cbc9a71566251110f33', '', 'befc5e26106444c8a2c23fa80df39ef3', '212f2f5f72f74fb981a55ca1614f5f1c', '2019-01-21 14:45:11', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('d6623788520e4ee2b11e2922e6699a5c', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('de19056173ca47f5a297fb1572ea8075', '', '2602259e92964e63a90abcd49a76ebf3', '5b4fab9032bb418e841b55334e069b62', '2019-01-21 16:10:26', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('fa0e2689b0be40a188fed36bc5205e33', '', 'ec58b1673dc34276b02bee0ca6a7b87c', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:08:48', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('fda74bc055dc43ae8f7ba39ff7f17430', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('fe7861f6e1674a9aa87e47c56f7485ff', '', '40fc7ce3659f443eabe0de2a2c553fe4', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 14:58:43', '\0', 'admin');
INSERT INTO `t_jcqx_rs_jurisdiction` VALUES ('ff5afbbe77e54b8bac2b68142821a7a2', '', 'ec58b1673dc34276b02bee0ca6a7b87c', '5b4fab9032bb418e841b55334e069b62', '2019-01-02 15:08:48', '\0', 'admin');

-- ----------------------------
-- Table structure for t_jcqx_rs_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_rs_resource`;
CREATE TABLE `t_jcqx_rs_resource` (
  `RS_RESOURCE_ID` varchar(32) NOT NULL COMMENT '主键',
  `RE_RESOURCE_ID` varchar(32) NOT NULL,
  `RS_RESOURCE_KEY` varchar(32) NOT NULL COMMENT '响应资源key',
  `RS_RESOURCE_NAME` varchar(64) DEFAULT NULL COMMENT '响应资源名称',
  `RS_RESOURCE_TYPE` varchar(32) NOT NULL COMMENT '响应资源类别',
  `PROJECT_ID` varchar(32) NOT NULL COMMENT '项目id',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`RS_RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_rs_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_jcqx_user
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_user`;
CREATE TABLE `t_jcqx_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USERNAME` varchar(32) NOT NULL COMMENT '账号',
  `FULL_NAME` varchar(16) DEFAULT NULL COMMENT '姓名',
  `PASSWORD` varchar(60) NOT NULL COMMENT '密码',
  `SEX` varchar(6) DEFAULT NULL COMMENT '性别',
  `PHONE` varchar(21) DEFAULT NULL COMMENT '电话',
  `ADDR` varchar(64) DEFAULT NULL COMMENT '地址',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `STATE` varchar(6) NOT NULL COMMENT '启用状态（0：停用,1：启用,2：超级管理员）',
  `PROJECT_ID` varchar(32) DEFAULT NULL COMMENT '项目id',
  `PROJECT_NAME` varchar(128) DEFAULT NULL COMMENT '项目名称',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `VALID_DATE` datetime NOT NULL COMMENT '有效期',
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '上次登陆时间',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_user
-- ----------------------------
INSERT INTO `t_jcqx_user` VALUES ('admin', 'admin', '管理员', '$2a$10$PiFRkdaiKUFE.Z7bN0m8cOlhR1okwYhfm7hDxibjFymTS93Iww0Vm', null, null, null, null, '00002', '1', null, '2019-01-02 09:49:56', null, '2050-01-02 09:50:03', null, '2019-01-21 16:29:20');

-- ----------------------------
-- Table structure for t_jcqx_user_dr
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_user_dr`;
CREATE TABLE `t_jcqx_user_dr` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `USER_ID` varchar(32) NOT NULL COMMENT '用户id',
  `DEPARTMENT_ID` varchar(32) NOT NULL DEFAULT '-1' COMMENT '部门id',
  `DEPARTMENT_NAME` varchar(40) NOT NULL DEFAULT '内置' COMMENT '部门名称',
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色id',
  `ROLE_NAME` varchar(40) NOT NULL COMMENT '部门名称',
  `USER_TYPE` varchar(32) NOT NULL COMMENT '用户类型（0：普通用户,1：项目管理员）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_user_dr
-- ----------------------------
INSERT INTO `t_jcqx_user_dr` VALUES ('admin', 'admin', '-2', '房开公司', '-1', '初始管理员', '00005');

-- ----------------------------
-- Table structure for t_jcqx_user_project_req
-- ----------------------------
DROP TABLE IF EXISTS `t_jcqx_user_project_req`;
CREATE TABLE `t_jcqx_user_project_req` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) NOT NULL COMMENT '用户id',
  `PROJECT_ID` varchar(32) NOT NULL COMMENT '项目id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jcqx_user_project_req
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '内码',
  `value` varchar(50) DEFAULT NULL COMMENT '对应值',
  `p_code` int(11) DEFAULT NULL COMMENT '父级内码',
  `edit_flag` int(11) DEFAULT NULL COMMENT '是否可编辑',
  `show_flag` int(11) DEFAULT NULL COMMENT '是否显示',
  `config` varchar(255) DEFAULT NULL COMMENT '其他配置项',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`,`p_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES ('1', '1', '资金流动类型', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('2', '11', '认筹', '1', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('3', '12', '认购', '1', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('4', '13', '签约', '1', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('5', '2', '房源状态类型', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('6', '21', '未售', '2', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('7', '22', '锁定', '2', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('8', '3', '付款方式', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('9', '31', '按揭', '3', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('10', '32', '全款', '3', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('11', '4', '客户状态', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('12', '41', '意向客户', '4', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('13', '42', '已认筹', '4', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('14', '43', '已认购', '4', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('15', '44', '已签约', '4', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('16', '5', '客户消息来源', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('17', '51', '电话', '5', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('18', '52', '网络', '5', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('19', '53', '广告', '5', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('20', '54', '其他', '5', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('21', '6', '居住区域', null, '1', '1', null);
INSERT INTO `t_sys_dict` VALUES ('22', '61', '江阳区', '6', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('23', '62', '纳溪区', '6', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('24', '7', '是否拆迁', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('25', '71', '是', '7', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('26', '72', '否', '7', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('27', '8', '当前住房', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('28', '81', '租房', '8', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('29', '82', '父母同住', '8', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('30', '9', '家庭情况', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('31', '91', '未婚', '9', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('32', '92', '已婚未生育', '9', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('33', '10', '购房目的', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('34', '101', '婚房', '10', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('35', '11', '性别', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('36', '111', '男', '11', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('37', '112', '女', '11', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('38', '12', '客户分配状态', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('39', '121', '已分配', '12', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('40', '122', '未分配', '12', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('41', '13', '折扣方式', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('42', '131', '直减', '13', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('43', '132', '总价打折', '13', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('44', '14', '付款方式', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('45', '141', '按揭', '14', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('46', '142', '全款', '14', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('47', '123', '已认购', '12', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('48', '124', '已认筹', '12', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('49', '125', '已签约', '12', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('50', '15', '楼盘状态', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('51', '151', '可售', '15', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('52', '152', '不可售', '15', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('53', '153', '已封盘', '15', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('54', '154', '已售罄', '15', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('55', '16', '附件类型', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('56', '161', '楼盘图片', '16', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('57', '162', '户型图片', '16', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('58', '163', '户型效果图', '16', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('60', '17', '楼栋状态', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('61', '171', '可售', '17', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('62', '172', '不可售', '17', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('63', '18', '楼栋结构', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('64', '181', '点式', '18', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('65', '182', '板式', '18', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('66', '183', '别墅', '18', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('67', '19', '通用状态', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('68', '191', '正常', '19', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('69', '192', '失效', '19', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('70', '20', '朝向', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('71', '201', '坐南朝北', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('72', '202', '坐北朝南', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('73', '203', '坐东朝西', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('74', '204', '坐西朝东', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('75', '205', '坐东南朝西北', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('76', '206', '坐西北朝东南', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('77', '207', '坐西南朝东北', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('78', '208', '坐东北朝西南', '20', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('79', '14', '追加付款', '1', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('80', '15', '退款', '1', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('81', '23', '已售', '2', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('82', '45', '已退房', '4', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('83', '21', '收款方式', null, '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('84', '211', '现金', '21', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('85', '212', '银行卡', '21', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('86', '213', '支付宝', '21', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('87', '214', '微信', '21', '0', '0', null);
INSERT INTO `t_sys_dict` VALUES ('88', '215', '其他', '21', '0', '0', null);

-- ----------------------------
-- Table structure for t_sys_division_coordinate
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_division_coordinate`;
CREATE TABLE `t_sys_division_coordinate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `p_code` int(11) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `p_id` (`p_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_division_coordinate
-- ----------------------------
INSERT INTO `t_sys_division_coordinate` VALUES ('1', '全国', '0', '0', '39.910925', '116.413384');
INSERT INTO `t_sys_division_coordinate` VALUES ('2', '北京市', '110000', '0', '39.910925', '116.413384');
INSERT INTO `t_sys_division_coordinate` VALUES ('3', '市辖区', '110100', '110000', '39.910925', '116.413384');
INSERT INTO `t_sys_division_coordinate` VALUES ('4', '东城区', '110101', '110100', '39.934827', '116.422401');
INSERT INTO `t_sys_division_coordinate` VALUES ('5', '西城区', '110102', '110100', '39.918124', '116.372514');
INSERT INTO `t_sys_division_coordinate` VALUES ('6', '朝阳区', '110105', '110100', '39.926375', '116.449559');
INSERT INTO `t_sys_division_coordinate` VALUES ('7', '丰台区', '110106', '110100', '39.864937', '116.292402');
INSERT INTO `t_sys_division_coordinate` VALUES ('8', '石景山区', '110107', '110100', '39.911354', '116.229613');
INSERT INTO `t_sys_division_coordinate` VALUES ('9', '海淀区', '110108', '110100', '39.96549', '116.305434');
INSERT INTO `t_sys_division_coordinate` VALUES ('10', '门头沟区', '110109', '110100', '39.946147', '116.107604');
INSERT INTO `t_sys_division_coordinate` VALUES ('11', '房山区', '110111', '110100', '39.754326', '116.149444');
INSERT INTO `t_sys_division_coordinate` VALUES ('12', '通州区', '110112', '110100', '39.916017', '116.663415');
INSERT INTO `t_sys_division_coordinate` VALUES ('13', '顺义区', '110113', '110100', '40.136351', '116.661424');
INSERT INTO `t_sys_division_coordinate` VALUES ('14', '昌平区', '110114', '110100', '40.226413', '116.237618');
INSERT INTO `t_sys_division_coordinate` VALUES ('15', '大兴区', '110115', '110100', '39.732555', '116.348625');
INSERT INTO `t_sys_division_coordinate` VALUES ('16', '怀柔区', '110116', '110100', '40.322618', '116.638386');
INSERT INTO `t_sys_division_coordinate` VALUES ('17', '平谷区', '110117', '110100', '40.146951', '117.127379');
INSERT INTO `t_sys_division_coordinate` VALUES ('18', '密云区', '110118', '110100', '40.382176', '116.849547');
INSERT INTO `t_sys_division_coordinate` VALUES ('19', '延庆区', '110119', '110100', '40.462169', '115.981632');
INSERT INTO `t_sys_division_coordinate` VALUES ('20', '天津市', '120000', '0', '39.093668', '117.209523');
INSERT INTO `t_sys_division_coordinate` VALUES ('21', '市辖区', '120100', '120000', '39.093668', '117.209523');
INSERT INTO `t_sys_division_coordinate` VALUES ('22', '和平区', '120101', '120100', '39.12339', '117.221467');
INSERT INTO `t_sys_division_coordinate` VALUES ('23', '河东区', '120102', '120100', '39.134487', '117.258413');
INSERT INTO `t_sys_division_coordinate` VALUES ('24', '河西区', '120103', '120100', '39.115718', '117.229416');
INSERT INTO `t_sys_division_coordinate` VALUES ('25', '南开区', '120104', '120100', '39.144105', '117.156515');
INSERT INTO `t_sys_division_coordinate` VALUES ('26', '河北区', '120105', '120100', '39.153485', '117.203593');
INSERT INTO `t_sys_division_coordinate` VALUES ('27', '红桥区', '120106', '120100', '39.173286', '117.157518');
INSERT INTO `t_sys_division_coordinate` VALUES ('28', '东丽区', '120110', '120100', '39.092332', '117.320569');
INSERT INTO `t_sys_division_coordinate` VALUES ('29', '西青区', '120111', '120100', '39.148727', '117.01441');
INSERT INTO `t_sys_division_coordinate` VALUES ('30', '津南区', '120112', '120100', '38.944148', '117.363387');
INSERT INTO `t_sys_division_coordinate` VALUES ('31', '北辰区', '120113', '120100', '39.230344', '117.141403');
INSERT INTO `t_sys_division_coordinate` VALUES ('32', '武清区', '120114', '120100', '39.389871', '117.050597');
INSERT INTO `t_sys_division_coordinate` VALUES ('33', '宝坻区', '120115', '120100', '39.723194', '117.316601');
INSERT INTO `t_sys_division_coordinate` VALUES ('34', '滨海新区', '120116', '120100', '39.009416', '117.717399');
INSERT INTO `t_sys_division_coordinate` VALUES ('35', '宁河区', '120117', '120100', '39.336956', '117.832393');
INSERT INTO `t_sys_division_coordinate` VALUES ('36', '静海区', '120118', '120100', '38.953371', '116.980469');
INSERT INTO `t_sys_division_coordinate` VALUES ('37', '蓟州区', '120119', '120100', '40.051509', '117.414579');
INSERT INTO `t_sys_division_coordinate` VALUES ('38', '河北省', '130000', '0', '38.043202', '114.536596');
INSERT INTO `t_sys_division_coordinate` VALUES ('39', '石家庄市', '130100', '130000', '38.048312', '114.521532');
INSERT INTO `t_sys_division_coordinate` VALUES ('40', '长安区', '130102', '130100', '38.043256', '114.545612');
INSERT INTO `t_sys_division_coordinate` VALUES ('41', '桥西区', '130104', '130100', '38.010381', '114.46742');
INSERT INTO `t_sys_division_coordinate` VALUES ('42', '新华区', '130105', '130100', '38.05712', '114.469438');
INSERT INTO `t_sys_division_coordinate` VALUES ('43', '井陉矿区', '130107', '130100', '38.070566', '114.068632');
INSERT INTO `t_sys_division_coordinate` VALUES ('44', '裕华区', '130108', '130100', '38.012088', '114.537583');
INSERT INTO `t_sys_division_coordinate` VALUES ('45', '藁城区', '130109', '130100', '38.027817', '114.853378');
INSERT INTO `t_sys_division_coordinate` VALUES ('46', '鹿泉区', '130110', '130100', '38.091749', '114.320598');
INSERT INTO `t_sys_division_coordinate` VALUES ('47', '栾城区', '130111', '130100', '37.905816', '114.654576');
INSERT INTO `t_sys_division_coordinate` VALUES ('48', '井陉县', '130121', '130100', '38.038386', '114.151463');
INSERT INTO `t_sys_division_coordinate` VALUES ('49', '正定县', '130123', '130100', '38.151714', '114.577481');
INSERT INTO `t_sys_division_coordinate` VALUES ('50', '行唐县', '130125', '130100', '38.444239', '114.559607');
INSERT INTO `t_sys_division_coordinate` VALUES ('51', '灵寿县', '130126', '130100', '38.314629', '114.389478');
INSERT INTO `t_sys_division_coordinate` VALUES ('52', '高邑县', '130127', '130100', '37.62188', '114.618413');
INSERT INTO `t_sys_division_coordinate` VALUES ('53', '深泽县', '130128', '130100', '38.190451', '115.207404');
INSERT INTO `t_sys_division_coordinate` VALUES ('54', '赞皇县', '130129', '130100', '37.671667', '114.392464');
INSERT INTO `t_sys_division_coordinate` VALUES ('55', '无极县', '130130', '130100', '38.185436', '114.982439');
INSERT INTO `t_sys_division_coordinate` VALUES ('56', '平山县', '130131', '130100', '38.271951', '113.985435');
INSERT INTO `t_sys_division_coordinate` VALUES ('57', '元氏县', '130132', '130100', '37.772339', '114.532566');
INSERT INTO `t_sys_division_coordinate` VALUES ('58', '赵县', '130133', '130100', '37.761859', '114.782597');
INSERT INTO `t_sys_division_coordinate` VALUES ('59', '晋州市', '130183', '130100', '38.039491', '115.050529');
INSERT INTO `t_sys_division_coordinate` VALUES ('60', '新乐市', '130184', '130100', '38.349293', '114.690532');
INSERT INTO `t_sys_division_coordinate` VALUES ('61', '唐山市', '130200', '130000', '39.636584', '118.186459');
INSERT INTO `t_sys_division_coordinate` VALUES ('62', '路南区', '130202', '130200', '39.631043', '118.160607');
INSERT INTO `t_sys_division_coordinate` VALUES ('63', '路北区', '130203', '130200', '39.630661', '118.206399');
INSERT INTO `t_sys_division_coordinate` VALUES ('64', '古冶区', '130204', '130200', '39.739736', '118.453401');
INSERT INTO `t_sys_division_coordinate` VALUES ('65', '开平区', '130205', '130200', '39.677144', '118.268608');
INSERT INTO `t_sys_division_coordinate` VALUES ('66', '丰南区', '130207', '130200', '39.58154', '118.090366');
INSERT INTO `t_sys_division_coordinate` VALUES ('67', '丰润区', '130208', '130200', '39.838353', '118.168541');
INSERT INTO `t_sys_division_coordinate` VALUES ('68', '曹妃甸区', '130209', '130200', '39.279284', '118.46646');
INSERT INTO `t_sys_division_coordinate` VALUES ('69', '滦县', '130223', '130200', '39.747116', '118.71048');
INSERT INTO `t_sys_division_coordinate` VALUES ('70', '滦南县', '130224', '130200', '39.510045', '118.680405');
INSERT INTO `t_sys_division_coordinate` VALUES ('71', '乐亭县', '130225', '130200', '39.431931', '118.919384');
INSERT INTO `t_sys_division_coordinate` VALUES ('72', '迁西县', '130227', '130200', '40.147837', '118.320384');
INSERT INTO `t_sys_division_coordinate` VALUES ('73', '玉田县', '130229', '130200', '39.906592', '117.745434');
INSERT INTO `t_sys_division_coordinate` VALUES ('74', '遵化市', '130281', '130200', '40.195533', '117.972375');
INSERT INTO `t_sys_division_coordinate` VALUES ('75', '迁安市', '130283', '130200', '40.004184', '118.706457');
INSERT INTO `t_sys_division_coordinate` VALUES ('76', '秦皇岛市', '130300', '130000', '39.941748', '119.608531');
INSERT INTO `t_sys_division_coordinate` VALUES ('77', '海港区', '130302', '130300', '39.940413', '119.617475');
INSERT INTO `t_sys_division_coordinate` VALUES ('78', '山海关区', '130303', '130300', '39.984446', '119.782435');
INSERT INTO `t_sys_division_coordinate` VALUES ('79', '北戴河区', '130304', '130300', '39.841006', '119.491526');
INSERT INTO `t_sys_division_coordinate` VALUES ('80', '抚宁区', '130306', '130300', '39.881414', '119.251549');
INSERT INTO `t_sys_division_coordinate` VALUES ('81', '青龙满族自治县', '130321', '130300', '40.412794', '118.956481');
INSERT INTO `t_sys_division_coordinate` VALUES ('82', '昌黎县', '130322', '130300', '39.719051', '119.169375');
INSERT INTO `t_sys_division_coordinate` VALUES ('83', '卢龙县', '130324', '130300', '39.897958', '118.899489');
INSERT INTO `t_sys_division_coordinate` VALUES ('84', '邯郸市', '130400', '130000', '36.631263', '114.545628');
INSERT INTO `t_sys_division_coordinate` VALUES ('85', '邯山区', '130402', '130400', '36.586692', '114.496389');
INSERT INTO `t_sys_division_coordinate` VALUES ('86', '丛台区', '130403', '130400', '36.642673', '114.499433');
INSERT INTO `t_sys_division_coordinate` VALUES ('87', '复兴区', '130404', '130400', '36.623325', '114.479412');
INSERT INTO `t_sys_division_coordinate` VALUES ('88', '峰峰矿区', '130406', '130400', '36.425654', '114.219483');
INSERT INTO `t_sys_division_coordinate` VALUES ('89', '邯郸县', '130421', '130400', '36.599675', '114.537309');
INSERT INTO `t_sys_division_coordinate` VALUES ('90', '临漳县', '130423', '130400', '36.340766', '114.626427');
INSERT INTO `t_sys_division_coordinate` VALUES ('91', '成安县', '130424', '130400', '36.449796', '114.676577');
INSERT INTO `t_sys_division_coordinate` VALUES ('92', '大名县', '130425', '130400', '36.291288', '115.154613');
INSERT INTO `t_sys_division_coordinate` VALUES ('93', '涉县', '130426', '130400', '36.590692', '113.697584');
INSERT INTO `t_sys_division_coordinate` VALUES ('94', '磁县', '130427', '130400', '36.380359', '114.380432');
INSERT INTO `t_sys_division_coordinate` VALUES ('95', '肥乡县', '130428', '130400', '36.553825', '114.806547');
INSERT INTO `t_sys_division_coordinate` VALUES ('96', '永年县', '130429', '130400', '36.747569', '114.550625');
INSERT INTO `t_sys_division_coordinate` VALUES ('97', '邱县', '130430', '130400', '36.817362', '115.193395');
INSERT INTO `t_sys_division_coordinate` VALUES ('98', '鸡泽县', '130431', '130400', '36.916398', '114.896586');
INSERT INTO `t_sys_division_coordinate` VALUES ('99', '广平县', '130432', '130400', '36.48978', '114.954415');
INSERT INTO `t_sys_division_coordinate` VALUES ('100', '馆陶县', '130433', '130400', '36.553957', '115.288537');
INSERT INTO `t_sys_division_coordinate` VALUES ('101', '魏县', '130434', '130400', '36.366156', '114.94545');
INSERT INTO `t_sys_division_coordinate` VALUES ('102', '曲周县', '130435', '130400', '36.771545', '114.963404');
INSERT INTO `t_sys_division_coordinate` VALUES ('103', '武安市', '130481', '130400', '36.702488', '114.210516');
INSERT INTO `t_sys_division_coordinate` VALUES ('104', '邢台市', '130500', '130000', '37.076686', '114.511462');
INSERT INTO `t_sys_division_coordinate` VALUES ('105', '桥东区', '130502', '130500', '37.07375', '114.513471');
INSERT INTO `t_sys_division_coordinate` VALUES ('106', '桥西区', '130503', '130500', '37.066172', '114.474393');
INSERT INTO `t_sys_division_coordinate` VALUES ('107', '邢台县', '130521', '130500', '37.177109', '114.143411');
INSERT INTO `t_sys_division_coordinate` VALUES ('108', '临城县', '130522', '130500', '37.450789', '114.505443');
INSERT INTO `t_sys_division_coordinate` VALUES ('109', '内丘县', '130523', '130500', '37.292858', '114.518493');
INSERT INTO `t_sys_division_coordinate` VALUES ('110', '柏乡县', '130524', '130500', '37.488759', '114.699497');
INSERT INTO `t_sys_division_coordinate` VALUES ('111', '隆尧县', '130525', '130500', '37.355908', '114.776616');
INSERT INTO `t_sys_division_coordinate` VALUES ('112', '任县', '130526', '130500', '37.126727', '114.678606');
INSERT INTO `t_sys_division_coordinate` VALUES ('113', '南和县', '130527', '130500', '37.010998', '114.690548');
INSERT INTO `t_sys_division_coordinate` VALUES ('114', '宁晋县', '130528', '130500', '37.625612', '114.925562');
INSERT INTO `t_sys_division_coordinate` VALUES ('115', '巨鹿县', '130529', '130500', '37.227088', '115.043587');
INSERT INTO `t_sys_division_coordinate` VALUES ('116', '新河县', '130530', '130500', '37.534591', '115.248547');
INSERT INTO `t_sys_division_coordinate` VALUES ('117', '广宗县', '130531', '130500', '37.080457', '115.149605');
INSERT INTO `t_sys_division_coordinate` VALUES ('118', '平乡县', '130532', '130500', '37.069096', '115.036582');
INSERT INTO `t_sys_division_coordinate` VALUES ('119', '威县', '130533', '130500', '36.981582', '115.273618');
INSERT INTO `t_sys_division_coordinate` VALUES ('120', '清河县', '130534', '130500', '37.046375', '115.674394');
INSERT INTO `t_sys_division_coordinate` VALUES ('121', '临西县', '130535', '130500', '36.87676', '115.507629');
INSERT INTO `t_sys_division_coordinate` VALUES ('122', '南宫市', '130581', '130500', '37.364069', '115.414529');
INSERT INTO `t_sys_division_coordinate` VALUES ('123', '沙河市', '130582', '130500', '36.861127', '114.509474');
INSERT INTO `t_sys_division_coordinate` VALUES ('124', '保定市', '130600', '130000', '38.879988', '115.471464');
INSERT INTO `t_sys_division_coordinate` VALUES ('125', '竞秀区', '130602', '130600', '38.883788', '115.465434');
INSERT INTO `t_sys_division_coordinate` VALUES ('126', '莲池区', '130606', '130600', '38.860676', '115.535488');
INSERT INTO `t_sys_division_coordinate` VALUES ('127', '满城区', '130607', '130600', '38.955441', '115.328375');
INSERT INTO `t_sys_division_coordinate` VALUES ('128', '清苑区', '130608', '130600', '38.771002', '115.496606');
INSERT INTO `t_sys_division_coordinate` VALUES ('129', '徐水区', '130609', '130600', '39.024713', '115.66248');
INSERT INTO `t_sys_division_coordinate` VALUES ('130', '涞水县', '130623', '130600', '39.400334', '115.720543');
INSERT INTO `t_sys_division_coordinate` VALUES ('131', '阜平县', '130624', '130600', '38.855351', '114.201563');
INSERT INTO `t_sys_division_coordinate` VALUES ('132', '定兴县', '130626', '130600', '39.269424', '115.81441');
INSERT INTO `t_sys_division_coordinate` VALUES ('133', '唐县', '130627', '130600', '38.75402', '114.989447');
INSERT INTO `t_sys_division_coordinate` VALUES ('134', '高阳县', '130628', '130600', '38.706258', '115.785447');
INSERT INTO `t_sys_division_coordinate` VALUES ('135', '容城县', '130629', '130600', '39.048559', '115.868631');
INSERT INTO `t_sys_division_coordinate` VALUES ('136', '涞源县', '130630', '130600', '39.366272', '114.700476');
INSERT INTO `t_sys_division_coordinate` VALUES ('137', '望都县', '130631', '130600', '38.700158', '115.161588');
INSERT INTO `t_sys_division_coordinate` VALUES ('138', '安新县', '130632', '130600', '38.941734', '115.942426');
INSERT INTO `t_sys_division_coordinate` VALUES ('139', '易县', '130633', '130600', '39.355054', '115.503607');
INSERT INTO `t_sys_division_coordinate` VALUES ('140', '曲阳县', '130634', '130600', '38.628384', '114.751455');
INSERT INTO `t_sys_division_coordinate` VALUES ('141', '蠡县', '130635', '130600', '38.494201', '115.590445');
INSERT INTO `t_sys_division_coordinate` VALUES ('142', '顺平县', '130636', '130600', '38.843261', '115.141597');
INSERT INTO `t_sys_division_coordinate` VALUES ('143', '博野县', '130637', '130600', '38.463408', '115.470467');
INSERT INTO `t_sys_division_coordinate` VALUES ('144', '雄县', '130638', '130600', '39.00018', '116.114601');
INSERT INTO `t_sys_division_coordinate` VALUES ('145', '涿州市', '130681', '130600', '39.491066', '115.98162');
INSERT INTO `t_sys_division_coordinate` VALUES ('146', '安国市', '130683', '130600', '38.424828', '115.333408');
INSERT INTO `t_sys_division_coordinate` VALUES ('147', '高碑店市', '130684', '130600', '39.332335', '115.880569');
INSERT INTO `t_sys_division_coordinate` VALUES ('148', '张家口市', '130700', '130000', '40.773237', '114.892572');
INSERT INTO `t_sys_division_coordinate` VALUES ('149', '桥东区', '130702', '130700', '40.794268', '114.900606');
INSERT INTO `t_sys_division_coordinate` VALUES ('150', '桥西区', '130703', '130700', '40.825606', '114.876516');
INSERT INTO `t_sys_division_coordinate` VALUES ('151', '宣化区', '130705', '130700', '40.614592', '115.105444');
INSERT INTO `t_sys_division_coordinate` VALUES ('152', '下花园区', '130706', '130700', '40.508145', '115.293517');
INSERT INTO `t_sys_division_coordinate` VALUES ('153', '万全区', '130708', '130700', '40.77315', '114.747426');
INSERT INTO `t_sys_division_coordinate` VALUES ('154', '崇礼区', '130709', '130700', '40.980478', '115.289549');
INSERT INTO `t_sys_division_coordinate` VALUES ('155', '张北县', '130722', '130700', '41.164944', '114.726375');
INSERT INTO `t_sys_division_coordinate` VALUES ('156', '康保县', '130723', '130700', '41.858637', '114.606356');
INSERT INTO `t_sys_division_coordinate` VALUES ('157', '沽源县', '130724', '130700', '41.676016', '115.695407');
INSERT INTO `t_sys_division_coordinate` VALUES ('158', '尚义县', '130725', '130700', '41.081888', '113.975524');
INSERT INTO `t_sys_division_coordinate` VALUES ('159', '蔚县', '130726', '130700', '39.847089', '114.595401');
INSERT INTO `t_sys_division_coordinate` VALUES ('160', '阳原县', '130727', '130700', '40.109588', '114.157524');
INSERT INTO `t_sys_division_coordinate` VALUES ('161', '怀安县', '130728', '130700', '40.680369', '114.392469');
INSERT INTO `t_sys_division_coordinate` VALUES ('162', '怀来县', '130730', '130700', '40.42029', '115.524553');
INSERT INTO `t_sys_division_coordinate` VALUES ('163', '涿鹿县', '130731', '130700', '40.385834', '115.211383');
INSERT INTO `t_sys_division_coordinate` VALUES ('164', '赤城县', '130732', '130700', '40.918761', '115.838506');
INSERT INTO `t_sys_division_coordinate` VALUES ('165', '承德市', '130800', '130000', '40.957856', '117.969398');
INSERT INTO `t_sys_division_coordinate` VALUES ('166', '双桥区', '130802', '130800', '40.980824', '117.949428');
INSERT INTO `t_sys_division_coordinate` VALUES ('167', '双滦区', '130803', '130800', '40.964729', '117.806578');
INSERT INTO `t_sys_division_coordinate` VALUES ('168', '鹰手营子矿区', '130804', '130800', '40.552043', '117.665609');
INSERT INTO `t_sys_division_coordinate` VALUES ('169', '承德县', '130821', '130800', '40.774367', '118.180456');
INSERT INTO `t_sys_division_coordinate` VALUES ('170', '兴隆县', '130822', '130800', '40.423454', '117.507427');
INSERT INTO `t_sys_division_coordinate` VALUES ('171', '平泉县', '130823', '130800', '41.023756', '118.707427');
INSERT INTO `t_sys_division_coordinate` VALUES ('172', '滦平县', '130824', '130800', '40.947561', '117.339498');
INSERT INTO `t_sys_division_coordinate` VALUES ('173', '隆化县', '130825', '130800', '41.319899', '117.745451');
INSERT INTO `t_sys_division_coordinate` VALUES ('174', '丰宁满族自治县', '130826', '130800', '41.215336', '116.652393');
INSERT INTO `t_sys_division_coordinate` VALUES ('175', '宽城满族自治县', '130827', '130800', '40.617152', '118.491594');
INSERT INTO `t_sys_division_coordinate` VALUES ('176', '围场满族蒙古族自治县', '130828', '130800', '41.944324', '117.766564');
INSERT INTO `t_sys_division_coordinate` VALUES ('177', '沧州市', '130900', '130000', '38.310215', '116.845581');
INSERT INTO `t_sys_division_coordinate` VALUES ('178', '新华区', '130902', '130900', '38.320367', '116.872433');
INSERT INTO `t_sys_division_coordinate` VALUES ('179', '运河区', '130903', '130900', '38.316523', '116.838612');
INSERT INTO `t_sys_division_coordinate` VALUES ('180', '沧县', '130921', '130900', '38.299453', '116.884398');
INSERT INTO `t_sys_division_coordinate` VALUES ('181', '青县', '130922', '130900', '38.588465', '116.810575');
INSERT INTO `t_sys_division_coordinate` VALUES ('182', '东光县', '130923', '130900', '37.894514', '116.54341');
INSERT INTO `t_sys_division_coordinate` VALUES ('183', '海兴县', '130924', '130900', '38.149402', '117.504418');
INSERT INTO `t_sys_division_coordinate` VALUES ('184', '盐山县', '130925', '130900', '38.064318', '117.237414');
INSERT INTO `t_sys_division_coordinate` VALUES ('185', '肃宁县', '130926', '130900', '38.428906', '115.836518');
INSERT INTO `t_sys_division_coordinate` VALUES ('186', '南皮县', '130927', '130900', '38.045188', '116.715601');
INSERT INTO `t_sys_division_coordinate` VALUES ('187', '吴桥县', '130928', '130900', '37.633909', '116.397392');
INSERT INTO `t_sys_division_coordinate` VALUES ('188', '献县', '130929', '130900', '38.195981', '116.12956');
INSERT INTO `t_sys_division_coordinate` VALUES ('189', '孟村回族自治县', '130930', '130900', '38.059839', '117.110436');
INSERT INTO `t_sys_division_coordinate` VALUES ('190', '泊头市', '130981', '130900', '38.089257', '116.584628');
INSERT INTO `t_sys_division_coordinate` VALUES ('191', '任丘市', '130982', '130900', '38.717349', '116.105605');
INSERT INTO `t_sys_division_coordinate` VALUES ('192', '黄骅市', '130983', '130900', '38.377494', '117.336481');
INSERT INTO `t_sys_division_coordinate` VALUES ('193', '河间市', '130984', '130900', '38.451357', '116.105628');
INSERT INTO `t_sys_division_coordinate` VALUES ('194', '廊坊市', '131000', '130000', '39.543367', '116.690582');
INSERT INTO `t_sys_division_coordinate` VALUES ('195', '安次区', '131002', '131000', '39.52616', '116.709633');
INSERT INTO `t_sys_division_coordinate` VALUES ('196', '广阳区', '131003', '131000', '39.528611', '116.717614');
INSERT INTO `t_sys_division_coordinate` VALUES ('197', '固安县', '131022', '131000', '39.444485', '116.30542');
INSERT INTO `t_sys_division_coordinate` VALUES ('198', '永清县', '131023', '131000', '39.327853', '116.505429');
INSERT INTO `t_sys_division_coordinate` VALUES ('199', '香河县', '131024', '131000', '39.767939', '117.012402');
INSERT INTO `t_sys_division_coordinate` VALUES ('200', '大城县', '131025', '131000', '38.710859', '116.660409');
INSERT INTO `t_sys_division_coordinate` VALUES ('201', '文安县', '131026', '131000', '38.87895', '116.464609');
INSERT INTO `t_sys_division_coordinate` VALUES ('202', '大厂回族自治县', '131028', '131000', '39.892208', '116.996409');
INSERT INTO `t_sys_division_coordinate` VALUES ('203', '霸州市', '131081', '131000', '39.130921', '116.398397');
INSERT INTO `t_sys_division_coordinate` VALUES ('204', '三河市', '131082', '131000', '39.9881', '117.084588');
INSERT INTO `t_sys_division_coordinate` VALUES ('205', '衡水市', '131100', '130000', '37.745191', '115.675406');
INSERT INTO `t_sys_division_coordinate` VALUES ('206', '桃城区', '131102', '131100', '37.741637', '115.681395');
INSERT INTO `t_sys_division_coordinate` VALUES ('207', '冀州区', '131103', '131100', '37.557086', '115.58543');
INSERT INTO `t_sys_division_coordinate` VALUES ('208', '枣强县', '131121', '131100', '37.519364', '115.730563');
INSERT INTO `t_sys_division_coordinate` VALUES ('209', '武邑县', '131122', '131100', '37.807764', '115.894514');
INSERT INTO `t_sys_division_coordinate` VALUES ('210', '武强县', '131123', '131100', '38.046857', '115.989614');
INSERT INTO `t_sys_division_coordinate` VALUES ('211', '饶阳县', '131124', '131100', '38.241038', '115.732572');
INSERT INTO `t_sys_division_coordinate` VALUES ('212', '安平县', '131125', '131100', '38.240507', '115.525549');
INSERT INTO `t_sys_division_coordinate` VALUES ('213', '故城县', '131126', '131100', '37.353348', '115.972602');
INSERT INTO `t_sys_division_coordinate` VALUES ('214', '景县', '131127', '131100', '37.698815', '116.277411');
INSERT INTO `t_sys_division_coordinate` VALUES ('215', '阜城县', '131128', '131100', '37.868732', '116.182422');
INSERT INTO `t_sys_division_coordinate` VALUES ('216', '深州市', '131182', '131100', '38.006941', '115.566369');
INSERT INTO `t_sys_division_coordinate` VALUES ('217', '定州市', '130682', '130000', '38.522199', '114.996496');
INSERT INTO `t_sys_division_coordinate` VALUES ('218', '辛集市', '130181', '130000', '37.949309', '115.224451');
INSERT INTO `t_sys_division_coordinate` VALUES ('219', '山西省', '140000', '0', '37.879829', '112.569376');
INSERT INTO `t_sys_division_coordinate` VALUES ('220', '太原市', '140100', '140000', '37.876989', '112.556391');
INSERT INTO `t_sys_division_coordinate` VALUES ('221', '小店区', '140105', '140100', '37.742323', '112.572396');
INSERT INTO `t_sys_division_coordinate` VALUES ('222', '迎泽区', '140106', '140100', '37.869532', '112.569385');
INSERT INTO `t_sys_division_coordinate` VALUES ('223', '杏花岭区', '140107', '140100', '37.900186', '112.576383');
INSERT INTO `t_sys_division_coordinate` VALUES ('224', '尖草坪区', '140108', '140100', '37.945943', '112.493605');
INSERT INTO `t_sys_division_coordinate` VALUES ('225', '万柏林区', '140109', '140100', '37.864974', '112.522577');
INSERT INTO `t_sys_division_coordinate` VALUES ('226', '晋源区', '140110', '140100', '37.721169', '112.484564');
INSERT INTO `t_sys_division_coordinate` VALUES ('227', '清徐县', '140121', '140100', '37.613067', '112.364558');
INSERT INTO `t_sys_division_coordinate` VALUES ('228', '阳曲县', '140122', '140100', '38.064621', '112.679409');
INSERT INTO `t_sys_division_coordinate` VALUES ('229', '娄烦县', '140123', '140100', '38.073195', '111.803591');
INSERT INTO `t_sys_division_coordinate` VALUES ('230', '古交市', '140181', '140100', '37.913', '112.182453');
INSERT INTO `t_sys_division_coordinate` VALUES ('231', '大同市', '140200', '140000', '40.082469', '113.306436');
INSERT INTO `t_sys_division_coordinate` VALUES ('232', '城区', '140202', '140200', '40.081998', '113.304425');
INSERT INTO `t_sys_division_coordinate` VALUES ('233', '矿区', '140203', '140200', '39.996839', '113.162402');
INSERT INTO `t_sys_division_coordinate` VALUES ('234', '南郊区', '140211', '140200', '39.996839', '113.162402');
INSERT INTO `t_sys_division_coordinate` VALUES ('235', '新荣区', '140212', '140200', '40.261971', '113.146444');
INSERT INTO `t_sys_division_coordinate` VALUES ('236', '阳高县', '140221', '140200', '40.367392', '113.755414');
INSERT INTO `t_sys_division_coordinate` VALUES ('237', '天镇县', '140222', '140200', '40.426412', '114.097478');
INSERT INTO `t_sys_division_coordinate` VALUES ('238', '广灵县', '140223', '140200', '39.766004', '114.288586');
INSERT INTO `t_sys_division_coordinate` VALUES ('239', '灵丘县', '140224', '140200', '39.448825', '114.241368');
INSERT INTO `t_sys_division_coordinate` VALUES ('240', '浑源县', '140225', '140200', '39.698953', '113.7056');
INSERT INTO `t_sys_division_coordinate` VALUES ('241', '左云县', '140226', '140200', '40.019623', '112.709463');
INSERT INTO `t_sys_division_coordinate` VALUES ('242', '大同县', '140227', '140200', '40.04623', '113.618471');
INSERT INTO `t_sys_division_coordinate` VALUES ('243', '阳泉市', '140300', '140000', '37.862361', '113.587617');
INSERT INTO `t_sys_division_coordinate` VALUES ('244', '城区', '140302', '140300', '37.853433', '113.606568');
INSERT INTO `t_sys_division_coordinate` VALUES ('245', '矿区', '140303', '140300', '37.874409', '113.561521');
INSERT INTO `t_sys_division_coordinate` VALUES ('246', '郊区', '140311', '140300', '37.950353', '113.600603');
INSERT INTO `t_sys_division_coordinate` VALUES ('247', '平定县', '140321', '140300', '37.792796', '113.664421');
INSERT INTO `t_sys_division_coordinate` VALUES ('248', '盂县', '140322', '140300', '38.09198', '113.41842');
INSERT INTO `t_sys_division_coordinate` VALUES ('249', '长治市', '140400', '140000', '36.201268', '113.122559');
INSERT INTO `t_sys_division_coordinate` VALUES ('250', '城区', '140402', '140400', '36.209472', '113.129521');
INSERT INTO `t_sys_division_coordinate` VALUES ('251', '郊区', '140411', '140400', '36.261066', '113.105622');
INSERT INTO `t_sys_division_coordinate` VALUES ('252', '长治县', '140421', '140400', '36.059286', '113.057416');
INSERT INTO `t_sys_division_coordinate` VALUES ('253', '襄垣县', '140423', '140400', '36.541686', '113.057413');
INSERT INTO `t_sys_division_coordinate` VALUES ('254', '屯留县', '140424', '140400', '36.321631', '112.898475');
INSERT INTO `t_sys_division_coordinate` VALUES ('255', '平顺县', '140425', '140400', '36.205989', '113.442517');
INSERT INTO `t_sys_division_coordinate` VALUES ('256', '黎城县', '140426', '140400', '36.50867', '113.393432');
INSERT INTO `t_sys_division_coordinate` VALUES ('257', '壶关县', '140427', '140400', '36.121335', '113.21358');
INSERT INTO `t_sys_division_coordinate` VALUES ('258', '长子县', '140428', '140400', '36.128002', '112.884566');
INSERT INTO `t_sys_division_coordinate` VALUES ('259', '武乡县', '140429', '140400', '36.843168', '112.870606');
INSERT INTO `t_sys_division_coordinate` VALUES ('260', '沁县', '140430', '140400', '36.76219', '112.705458');
INSERT INTO `t_sys_division_coordinate` VALUES ('261', '沁源县', '140431', '140400', '36.506103', '112.344452');
INSERT INTO `t_sys_division_coordinate` VALUES ('262', '潞城市', '140481', '140400', '36.339691', '113.235578');
INSERT INTO `t_sys_division_coordinate` VALUES ('263', '晋城市', '140500', '140000', '35.496285', '112.858578');
INSERT INTO `t_sys_division_coordinate` VALUES ('264', '城区', '140502', '140500', '35.520559', '112.855303');
INSERT INTO `t_sys_division_coordinate` VALUES ('265', '沁水县', '140521', '140500', '35.696364', '112.193426');
INSERT INTO `t_sys_division_coordinate` VALUES ('266', '阳城县', '140522', '140500', '35.492181', '112.421454');
INSERT INTO `t_sys_division_coordinate` VALUES ('267', '陵川县', '140524', '140500', '35.781744', '113.287407');
INSERT INTO `t_sys_division_coordinate` VALUES ('268', '泽州县', '140525', '140500', '35.59977', '112.794401');
INSERT INTO `t_sys_division_coordinate` VALUES ('269', '高平市', '140581', '140500', '35.804337', '112.930412');
INSERT INTO `t_sys_division_coordinate` VALUES ('270', '朔州市', '140600', '140000', '39.337108', '112.439371');
INSERT INTO `t_sys_division_coordinate` VALUES ('271', '朔城区', '140602', '140600', '39.325303', '112.438376');
INSERT INTO `t_sys_division_coordinate` VALUES ('272', '平鲁区', '140603', '140600', '39.517389', '112.295525');
INSERT INTO `t_sys_division_coordinate` VALUES ('273', '山阴县', '140621', '140600', '39.53403', '112.822432');
INSERT INTO `t_sys_division_coordinate` VALUES ('274', '应县', '140622', '140600', '39.560078', '113.197494');
INSERT INTO `t_sys_division_coordinate` VALUES ('275', '右玉县', '140623', '140600', '39.99486', '112.4735');
INSERT INTO `t_sys_division_coordinate` VALUES ('276', '怀仁县', '140624', '140600', '39.833757', '113.106608');
INSERT INTO `t_sys_division_coordinate` VALUES ('277', '晋中市', '140700', '140000', '37.692839', '112.759595');
INSERT INTO `t_sys_division_coordinate` VALUES ('278', '榆次区', '140702', '140700', '37.70394', '112.714504');
INSERT INTO `t_sys_division_coordinate` VALUES ('279', '榆社县', '140721', '140700', '37.07637', '112.981599');
INSERT INTO `t_sys_division_coordinate` VALUES ('280', '左权县', '140722', '140700', '37.088555', '113.385452');
INSERT INTO `t_sys_division_coordinate` VALUES ('281', '和顺县', '140723', '140700', '37.334808', '113.576606');
INSERT INTO `t_sys_division_coordinate` VALUES ('282', '昔阳县', '140724', '140700', '37.617884', '113.713613');
INSERT INTO `t_sys_division_coordinate` VALUES ('283', '寿阳县', '140725', '140700', '37.901308', '113.18341');
INSERT INTO `t_sys_division_coordinate` VALUES ('284', '太谷县', '140726', '140700', '37.427396', '112.557384');
INSERT INTO `t_sys_division_coordinate` VALUES ('285', '祁县', '140727', '140700', '37.364131', '112.342442');
INSERT INTO `t_sys_division_coordinate` VALUES ('286', '平遥县', '140728', '140700', '37.195601', '112.182456');
INSERT INTO `t_sys_division_coordinate` VALUES ('287', '灵石县', '140729', '140700', '36.853368', '111.785618');
INSERT INTO `t_sys_division_coordinate` VALUES ('288', '介休市', '140781', '140700', '37.032686', '111.923563');
INSERT INTO `t_sys_division_coordinate` VALUES ('289', '运城市', '140800', '140000', '35.032707', '111.013389');
INSERT INTO `t_sys_division_coordinate` VALUES ('290', '盐湖区', '140802', '140800', '35.021425', '111.004377');
INSERT INTO `t_sys_division_coordinate` VALUES ('291', '临猗县', '140821', '140800', '35.149542', '110.780407');
INSERT INTO `t_sys_division_coordinate` VALUES ('292', '万荣县', '140822', '140800', '35.421109', '110.844576');
INSERT INTO `t_sys_division_coordinate` VALUES ('293', '闻喜县', '140823', '140800', '35.362931', '111.23141');
INSERT INTO `t_sys_division_coordinate` VALUES ('294', '稷山县', '140824', '140800', '35.610403', '110.989415');
INSERT INTO `t_sys_division_coordinate` VALUES ('295', '新绛县', '140825', '140800', '35.62263', '111.231406');
INSERT INTO `t_sys_division_coordinate` VALUES ('296', '绛县', '140826', '140800', '35.497276', '111.575487');
INSERT INTO `t_sys_division_coordinate` VALUES ('297', '垣曲县', '140827', '140800', '35.303015', '111.676607');
INSERT INTO `t_sys_division_coordinate` VALUES ('298', '夏县', '140828', '140800', '35.147462', '111.226431');
INSERT INTO `t_sys_division_coordinate` VALUES ('299', '平陆县', '140829', '140800', '34.842925', '111.22348');
INSERT INTO `t_sys_division_coordinate` VALUES ('300', '芮城县', '140830', '140800', '34.699388', '110.700612');
INSERT INTO `t_sys_division_coordinate` VALUES ('301', '永济市', '140881', '140800', '34.87283', '110.454578');
INSERT INTO `t_sys_division_coordinate` VALUES ('302', '河津市', '140882', '140800', '35.601927', '110.718572');
INSERT INTO `t_sys_division_coordinate` VALUES ('303', '忻州市', '140900', '140000', '38.422383', '112.740624');
INSERT INTO `t_sys_division_coordinate` VALUES ('304', '忻府区', '140902', '140900', '38.40988', '112.752614');
INSERT INTO `t_sys_division_coordinate` VALUES ('305', '定襄县', '140921', '140900', '38.479974', '112.963529');
INSERT INTO `t_sys_division_coordinate` VALUES ('306', '五台县', '140922', '140900', '38.734182', '113.261451');
INSERT INTO `t_sys_division_coordinate` VALUES ('307', '代县', '140923', '140900', '39.072728', '112.966552');
INSERT INTO `t_sys_division_coordinate` VALUES ('308', '繁峙县', '140924', '140900', '39.195237', '113.271408');
INSERT INTO `t_sys_division_coordinate` VALUES ('309', '宁武县', '140925', '140900', '39.024342', '112.326398');
INSERT INTO `t_sys_division_coordinate` VALUES ('310', '静乐县', '140926', '140900', '38.365147', '111.945432');
INSERT INTO `t_sys_division_coordinate` VALUES ('311', '神池县', '140927', '140900', '39.096876', '112.217383');
INSERT INTO `t_sys_division_coordinate` VALUES ('312', '五寨县', '140928', '140900', '38.91702', '111.85341');
INSERT INTO `t_sys_division_coordinate` VALUES ('313', '岢岚县', '140929', '140900', '38.710151', '111.579478');
INSERT INTO `t_sys_division_coordinate` VALUES ('314', '河曲县', '140930', '140900', '39.390702', '111.144449');
INSERT INTO `t_sys_division_coordinate` VALUES ('315', '保德县', '140931', '140900', '39.028337', '111.092542');
INSERT INTO `t_sys_division_coordinate` VALUES ('316', '偏关县', '140932', '140900', '39.44223', '111.514474');
INSERT INTO `t_sys_division_coordinate` VALUES ('317', '原平市', '140981', '140900', '38.736476', '112.717487');
INSERT INTO `t_sys_division_coordinate` VALUES ('318', '临汾市', '141000', '140000', '36.093742', '111.52553');
INSERT INTO `t_sys_division_coordinate` VALUES ('319', '尧都区', '141002', '141000', '36.084562', '111.58643');
INSERT INTO `t_sys_division_coordinate` VALUES ('320', '曲沃县', '141021', '141000', '35.647327', '111.482396');
INSERT INTO `t_sys_division_coordinate` VALUES ('321', '翼城县', '141022', '141000', '35.744429', '111.725376');
INSERT INTO `t_sys_division_coordinate` VALUES ('322', '襄汾县', '141023', '141000', '35.882063', '111.44854');
INSERT INTO `t_sys_division_coordinate` VALUES ('323', '洪洞县', '141024', '141000', '36.259467', '111.681589');
INSERT INTO `t_sys_division_coordinate` VALUES ('324', '古县', '141025', '141000', '36.272338', '111.926573');
INSERT INTO `t_sys_division_coordinate` VALUES ('325', '安泽县', '141026', '141000', '36.153514', '112.256613');
INSERT INTO `t_sys_division_coordinate` VALUES ('326', '浮山县', '141027', '141000', '35.974393', '111.855385');
INSERT INTO `t_sys_division_coordinate` VALUES ('327', '吉县', '141028', '141000', '36.103999', '110.688546');
INSERT INTO `t_sys_division_coordinate` VALUES ('328', '乡宁县', '141029', '141000', '35.976442', '110.853498');
INSERT INTO `t_sys_division_coordinate` VALUES ('329', '大宁县', '141030', '141000', '36.471306', '110.759384');
INSERT INTO `t_sys_division_coordinate` VALUES ('330', '隰县', '141031', '141000', '36.699061', '110.947591');
INSERT INTO `t_sys_division_coordinate` VALUES ('331', '永和县', '141032', '141000', '36.765909', '110.638416');
INSERT INTO `t_sys_division_coordinate` VALUES ('332', '蒲县', '141033', '141000', '36.418005', '111.102474');
INSERT INTO `t_sys_division_coordinate` VALUES ('333', '汾西县', '141034', '141000', '36.658782', '111.569546');
INSERT INTO `t_sys_division_coordinate` VALUES ('334', '侯马市', '141081', '141000', '35.625365', '111.378397');
INSERT INTO `t_sys_division_coordinate` VALUES ('335', '霍州市', '141082', '141000', '36.574607', '111.761509');
INSERT INTO `t_sys_division_coordinate` VALUES ('336', '吕梁市', '141100', '140000', '37.524498', '111.15045');
INSERT INTO `t_sys_division_coordinate` VALUES ('337', '离石区', '141102', '141100', '37.523577', '111.157491');
INSERT INTO `t_sys_division_coordinate` VALUES ('338', '文水县', '141121', '141100', '37.4443', '112.035599');
INSERT INTO `t_sys_division_coordinate` VALUES ('339', '交城县', '141122', '141100', '37.557772', '112.162568');
INSERT INTO `t_sys_division_coordinate` VALUES ('340', '兴县', '141123', '141100', '38.468804', '111.134392');
INSERT INTO `t_sys_division_coordinate` VALUES ('341', '临县', '141124', '141100', '37.957211', '110.998415');
INSERT INTO `t_sys_division_coordinate` VALUES ('342', '柳林县', '141125', '141100', '37.435493', '110.89539');
INSERT INTO `t_sys_division_coordinate` VALUES ('343', '石楼县', '141126', '141100', '37.004471', '110.841596');
INSERT INTO `t_sys_division_coordinate` VALUES ('344', '岚县', '141127', '141100', '38.285029', '111.678592');
INSERT INTO `t_sys_division_coordinate` VALUES ('345', '方山县', '141128', '141100', '37.90102', '111.25037');
INSERT INTO `t_sys_division_coordinate` VALUES ('346', '中阳县', '141129', '141100', '37.362873', '111.18563');
INSERT INTO `t_sys_division_coordinate` VALUES ('347', '交口县', '141130', '141100', '36.987873', '111.187628');
INSERT INTO `t_sys_division_coordinate` VALUES ('348', '孝义市', '141181', '141100', '37.151063', '111.785606');
INSERT INTO `t_sys_division_coordinate` VALUES ('349', '汾阳市', '141182', '141100', '37.271292', '111.794597');
INSERT INTO `t_sys_division_coordinate` VALUES ('350', '内蒙古自治区', '150000', '0', '40.823156', '111.772606');
INSERT INTO `t_sys_division_coordinate` VALUES ('351', '呼和浩特市', '150100', '150000', '40.848423', '111.755509');
INSERT INTO `t_sys_division_coordinate` VALUES ('352', '新城区', '150102', '150100', '40.863877', '111.67162');
INSERT INTO `t_sys_division_coordinate` VALUES ('353', '回民区', '150103', '150100', '40.814506', '111.63047');
INSERT INTO `t_sys_division_coordinate` VALUES ('354', '玉泉区', '150104', '150100', '40.758059', '111.681575');
INSERT INTO `t_sys_division_coordinate` VALUES ('355', '赛罕区', '150105', '150100', '40.798394', '111.708421');
INSERT INTO `t_sys_division_coordinate` VALUES ('356', '土默特左旗', '150121', '150100', '40.735294', '111.169587');
INSERT INTO `t_sys_division_coordinate` VALUES ('357', '托克托县', '150122', '150100', '40.283147', '111.200575');
INSERT INTO `t_sys_division_coordinate` VALUES ('358', '和林格尔县', '150123', '150100', '40.384798', '111.82843');
INSERT INTO `t_sys_division_coordinate` VALUES ('359', '清水河县', '150124', '150100', '39.926334', '111.653576');
INSERT INTO `t_sys_division_coordinate` VALUES ('360', '武川县', '150125', '150100', '41.102419', '111.457497');
INSERT INTO `t_sys_division_coordinate` VALUES ('361', '包头市', '150200', '150000', '40.662929', '109.846544');
INSERT INTO `t_sys_division_coordinate` VALUES ('362', '东河区', '150202', '150200', '40.582228', '110.050395');
INSERT INTO `t_sys_division_coordinate` VALUES ('363', '昆都仑区', '150203', '150200', '40.647644', '109.845538');
INSERT INTO `t_sys_division_coordinate` VALUES ('364', '青山区', '150204', '150200', '40.649473', '109.907416');
INSERT INTO `t_sys_division_coordinate` VALUES ('365', '石拐区', '150205', '150200', '40.678299', '110.278381');
INSERT INTO `t_sys_division_coordinate` VALUES ('366', '白云鄂博矿区', '150206', '150200', '41.774995', '109.979626');
INSERT INTO `t_sys_division_coordinate` VALUES ('367', '九原区', '150207', '150200', '40.613397', '109.969588');
INSERT INTO `t_sys_division_coordinate` VALUES ('368', '土默特右旗', '150221', '150200', '40.575127', '110.530389');
INSERT INTO `t_sys_division_coordinate` VALUES ('369', '固阳县', '150222', '150200', '41.040163', '110.066433');
INSERT INTO `t_sys_division_coordinate` VALUES ('370', '达尔罕茂明安联合旗', '150223', '150200', '41.704549', '110.439521');
INSERT INTO `t_sys_division_coordinate` VALUES ('371', '乌海市', '150300', '150000', '39.662006', '106.800391');
INSERT INTO `t_sys_division_coordinate` VALUES ('372', '海勃湾区', '150302', '150300', '39.696908', '106.829439');
INSERT INTO `t_sys_division_coordinate` VALUES ('373', '海南区', '150303', '150300', '39.446828', '106.898471');
INSERT INTO `t_sys_division_coordinate` VALUES ('374', '乌达区', '150304', '150300', '39.511469', '106.732606');
INSERT INTO `t_sys_division_coordinate` VALUES ('375', '赤峰市', '150400', '150000', '42.261686', '118.89552');
INSERT INTO `t_sys_division_coordinate` VALUES ('376', '红山区', '150402', '150400', '42.270478', '118.963564');
INSERT INTO `t_sys_division_coordinate` VALUES ('377', '元宝山区', '150403', '150400', '42.045125', '119.295405');
INSERT INTO `t_sys_division_coordinate` VALUES ('378', '松山区', '150404', '150400', '42.292482', '118.939414');
INSERT INTO `t_sys_division_coordinate` VALUES ('379', '阿鲁科尔沁旗', '150421', '150400', '43.877953', '120.072614');
INSERT INTO `t_sys_division_coordinate` VALUES ('380', '巴林左旗', '150422', '150400', '43.976383', '119.386443');
INSERT INTO `t_sys_division_coordinate` VALUES ('381', '巴林右旗', '150423', '150400', '43.540132', '118.670394');
INSERT INTO `t_sys_division_coordinate` VALUES ('382', '林西县', '150424', '150400', '43.62421', '118.062461');
INSERT INTO `t_sys_division_coordinate` VALUES ('383', '克什克腾旗', '150425', '150400', '43.270758', '117.55162');
INSERT INTO `t_sys_division_coordinate` VALUES ('384', '翁牛特旗', '150426', '150400', '42.942019', '119.012509');
INSERT INTO `t_sys_division_coordinate` VALUES ('385', '喀喇沁旗', '150428', '150400', '41.932214', '118.710474');
INSERT INTO `t_sys_division_coordinate` VALUES ('386', '宁城县', '150429', '150400', '41.600245', '119.350609');
INSERT INTO `t_sys_division_coordinate` VALUES ('387', '敖汉旗', '150430', '150400', '42.296507', '119.927578');
INSERT INTO `t_sys_division_coordinate` VALUES ('388', '通辽市', '150500', '150000', '43.65798', '122.250522');
INSERT INTO `t_sys_division_coordinate` VALUES ('389', '科尔沁区', '150502', '150500', '43.628712', '122.262457');
INSERT INTO `t_sys_division_coordinate` VALUES ('390', '科尔沁左翼中旗', '150521', '150500', '44.132294', '123.318589');
INSERT INTO `t_sys_division_coordinate` VALUES ('391', '科尔沁左翼后旗', '150522', '150500', '42.939562', '122.363563');
INSERT INTO `t_sys_division_coordinate` VALUES ('392', '开鲁县', '150523', '150500', '43.606369', '121.325386');
INSERT INTO `t_sys_division_coordinate` VALUES ('393', '库伦旗', '150524', '150500', '42.741211', '121.817406');
INSERT INTO `t_sys_division_coordinate` VALUES ('394', '奈曼旗', '150525', '150500', '42.871846', '120.664646');
INSERT INTO `t_sys_division_coordinate` VALUES ('395', '扎鲁特旗', '150526', '150500', '44.562213', '120.918626');
INSERT INTO `t_sys_division_coordinate` VALUES ('396', '霍林郭勒市', '150581', '150500', '45.537513', '119.670466');
INSERT INTO `t_sys_division_coordinate` VALUES ('397', '鄂尔多斯市', '150600', '150000', '39.614482', '109.787443');
INSERT INTO `t_sys_division_coordinate` VALUES ('398', '东胜区', '150602', '150600', '39.827987', '109.96956');
INSERT INTO `t_sys_division_coordinate` VALUES ('399', '康巴什区', '150603', '150600', '39.616378', '109.869627');
INSERT INTO `t_sys_division_coordinate` VALUES ('400', '达拉特旗', '150621', '150600', '40.418907', '110.040366');
INSERT INTO `t_sys_division_coordinate` VALUES ('401', '准格尔旗', '150622', '150600', '39.87054', '111.246398');
INSERT INTO `t_sys_division_coordinate` VALUES ('402', '鄂托克前旗', '150623', '150600', '38.188217', '107.484585');
INSERT INTO `t_sys_division_coordinate` VALUES ('403', '鄂托克旗', '150624', '150600', '39.095293', '107.982445');
INSERT INTO `t_sys_division_coordinate` VALUES ('404', '杭锦旗', '150625', '150600', '39.838816', '108.742413');
INSERT INTO `t_sys_division_coordinate` VALUES ('405', '乌审旗', '150626', '150600', '38.610027', '108.824435');
INSERT INTO `t_sys_division_coordinate` VALUES ('406', '伊金霍洛旗', '150627', '150600', '39.570093', '109.75459');
INSERT INTO `t_sys_division_coordinate` VALUES ('407', '呼伦贝尔市', '150700', '150000', '49.218446', '119.77237');
INSERT INTO `t_sys_division_coordinate` VALUES ('408', '海拉尔区', '150702', '150700', '49.218216', '119.742465');
INSERT INTO `t_sys_division_coordinate` VALUES ('409', '扎赉诺尔区', '150703', '150700', '49.604099', '117.385436');
INSERT INTO `t_sys_division_coordinate` VALUES ('410', '阿荣旗', '150721', '150700', '48.131971', '123.46544');
INSERT INTO `t_sys_division_coordinate` VALUES ('411', '莫力达瓦达斡尔族自治旗', '150722', '150700', '48.482896', '124.525576');
INSERT INTO `t_sys_division_coordinate` VALUES ('412', '鄂伦春自治旗', '150723', '150700', '50.597948', '123.732345');
INSERT INTO `t_sys_division_coordinate` VALUES ('413', '鄂温克族自治旗', '150724', '150700', '49.153045', '119.761351');
INSERT INTO `t_sys_division_coordinate` VALUES ('414', '陈巴尔虎旗', '150725', '150700', '49.334914', '119.430462');
INSERT INTO `t_sys_division_coordinate` VALUES ('415', '新巴尔虎左旗', '150726', '150700', '48.223787', '118.276608');
INSERT INTO `t_sys_division_coordinate` VALUES ('416', '新巴尔虎右旗', '150727', '150700', '48.677054', '116.830632');
INSERT INTO `t_sys_division_coordinate` VALUES ('417', '满洲里市', '150781', '150700', '49.604099', '117.385436');
INSERT INTO `t_sys_division_coordinate` VALUES ('418', '牙克石市', '150782', '150700', '49.292024', '120.718347');
INSERT INTO `t_sys_division_coordinate` VALUES ('419', '扎兰屯市', '150783', '150700', '48.019956', '122.744454');
INSERT INTO `t_sys_division_coordinate` VALUES ('420', '额尔古纳市', '150784', '150700', '50.248132', '120.186634');
INSERT INTO `t_sys_division_coordinate` VALUES ('421', '根河市', '150785', '150700', '50.78614', '121.527585');
INSERT INTO `t_sys_division_coordinate` VALUES ('422', '巴彦淖尔市', '150800', '150000', '40.749359', '107.394398');
INSERT INTO `t_sys_division_coordinate` VALUES ('423', '临河区', '150802', '150800', '40.756681', '107.369534');
INSERT INTO `t_sys_division_coordinate` VALUES ('424', '五原县', '150821', '150800', '41.094455', '108.273491');
INSERT INTO `t_sys_division_coordinate` VALUES ('425', '磴口县', '150822', '150800', '40.33647', '107.014522');
INSERT INTO `t_sys_division_coordinate` VALUES ('426', '乌拉特前旗', '150823', '150800', '40.742104', '108.658615');
INSERT INTO `t_sys_division_coordinate` VALUES ('427', '乌拉特中旗', '150824', '150800', '41.593346', '108.519512');
INSERT INTO `t_sys_division_coordinate` VALUES ('428', '乌拉特后旗', '150825', '150800', '41.089422', '107.081546');
INSERT INTO `t_sys_division_coordinate` VALUES ('429', '杭锦后旗', '150826', '150800', '40.892179', '107.157372');
INSERT INTO `t_sys_division_coordinate` VALUES ('430', '乌兰察布市', '150900', '150000', '41.000748', '113.139468');
INSERT INTO `t_sys_division_coordinate` VALUES ('431', '集宁区', '150902', '150900', '41.041146', '113.120587');
INSERT INTO `t_sys_division_coordinate` VALUES ('432', '卓资县', '150921', '150900', '40.900292', '112.58441');
INSERT INTO `t_sys_division_coordinate` VALUES ('433', '化德县', '150922', '150900', '41.909603', '114.016409');
INSERT INTO `t_sys_division_coordinate` VALUES ('434', '商都县', '150923', '150900', '41.567567', '113.584639');
INSERT INTO `t_sys_division_coordinate` VALUES ('435', '兴和县', '150924', '150900', '40.879342', '113.840579');
INSERT INTO `t_sys_division_coordinate` VALUES ('436', '凉城县', '150925', '150900', '40.537163', '112.5106');
INSERT INTO `t_sys_division_coordinate` VALUES ('437', '察哈尔右翼前旗', '150926', '150900', '40.791267', '113.221605');
INSERT INTO `t_sys_division_coordinate` VALUES ('438', '察哈尔右翼中旗', '150927', '150900', '41.283273', '112.64258');
INSERT INTO `t_sys_division_coordinate` VALUES ('439', '察哈尔右翼后旗', '150928', '150900', '41.441771', '113.198531');
INSERT INTO `t_sys_division_coordinate` VALUES ('440', '四子王旗', '150929', '150900', '41.539353', '111.712419');
INSERT INTO `t_sys_division_coordinate` VALUES ('441', '丰镇市', '150981', '150900', '40.441805', '113.116601');
INSERT INTO `t_sys_division_coordinate` VALUES ('442', '兴安盟', '152200', '150000', '46.088464', '122.044365');
INSERT INTO `t_sys_division_coordinate` VALUES ('443', '乌兰浩特市', '152201', '152200', '46.078654', '122.099622');
INSERT INTO `t_sys_division_coordinate` VALUES ('444', '阿尔山市', '152202', '152200', '47.183054', '119.950653');
INSERT INTO `t_sys_division_coordinate` VALUES ('445', '科尔沁右翼前旗', '152221', '152200', '46.082649', '121.964553');
INSERT INTO `t_sys_division_coordinate` VALUES ('446', '科尔沁右翼中旗', '152222', '152200', '45.066471', '121.483548');
INSERT INTO `t_sys_division_coordinate` VALUES ('447', '扎赉特旗', '152223', '152200', '46.72919', '122.906444');
INSERT INTO `t_sys_division_coordinate` VALUES ('448', '突泉县', '152224', '152200', '45.38783', '121.600545');
INSERT INTO `t_sys_division_coordinate` VALUES ('449', '锡林郭勒盟', '152500', '150000', '43.939423', '116.054391');
INSERT INTO `t_sys_division_coordinate` VALUES ('450', '二连浩特市', '152501', '152500', '43.6488', '111.958363');
INSERT INTO `t_sys_division_coordinate` VALUES ('451', '锡林浩特市', '152502', '152500', '43.938334', '116.093614');
INSERT INTO `t_sys_division_coordinate` VALUES ('452', '阿巴嘎旗', '152522', '152500', '44.028102', '114.957367');
INSERT INTO `t_sys_division_coordinate` VALUES ('453', '苏尼特左旗', '152523', '152500', '43.865554', '113.67348');
INSERT INTO `t_sys_division_coordinate` VALUES ('454', '苏尼特右旗', '152524', '152500', '42.747369', '112.648569');
INSERT INTO `t_sys_division_coordinate` VALUES ('455', '东乌珠穆沁旗', '152525', '152500', '45.515743', '116.978504');
INSERT INTO `t_sys_division_coordinate` VALUES ('456', '西乌珠穆沁旗', '152526', '152500', '44.593803', '117.616377');
INSERT INTO `t_sys_division_coordinate` VALUES ('457', '太仆寺旗', '152527', '152500', '41.882292', '115.290535');
INSERT INTO `t_sys_division_coordinate` VALUES ('458', '镶黄旗', '152528', '152500', '42.237661', '113.854505');
INSERT INTO `t_sys_division_coordinate` VALUES ('459', '正镶白旗', '152529', '152500', '42.292605', '115.036622');
INSERT INTO `t_sys_division_coordinate` VALUES ('460', '正蓝旗', '152530', '152500', '42.247119', '115.998604');
INSERT INTO `t_sys_division_coordinate` VALUES ('461', '多伦县', '152531', '152500', '42.208921', '116.492509');
INSERT INTO `t_sys_division_coordinate` VALUES ('462', '阿拉善盟', '152900', '150000', '38.858276', '105.735377');
INSERT INTO `t_sys_division_coordinate` VALUES ('463', '阿拉善左旗', '152921', '152900', '38.839094', '105.672599');
INSERT INTO `t_sys_division_coordinate` VALUES ('464', '阿拉善右旗', '152922', '152900', '39.222241', '101.673464');
INSERT INTO `t_sys_division_coordinate` VALUES ('465', '额济纳旗', '152923', '152900', '41.960298', '101.062403');
INSERT INTO `t_sys_division_coordinate` VALUES ('466', '辽宁省', '210000', '0', '41.841465', '123.435598');
INSERT INTO `t_sys_division_coordinate` VALUES ('467', '沈阳市', '210100', '210000', '41.68879', '123.466452');
INSERT INTO `t_sys_division_coordinate` VALUES ('468', '和平区', '210102', '210100', '41.795236', '123.426644');
INSERT INTO `t_sys_division_coordinate` VALUES ('469', '沈河区', '210103', '210100', '41.802274', '123.465461');
INSERT INTO `t_sys_division_coordinate` VALUES ('470', '大东区', '210104', '210100', '41.811425', '123.476405');
INSERT INTO `t_sys_division_coordinate` VALUES ('471', '皇姑区', '210105', '210100', '41.826042', '123.431621');
INSERT INTO `t_sys_division_coordinate` VALUES ('472', '铁西区', '210106', '210100', '41.809038', '123.383436');
INSERT INTO `t_sys_division_coordinate` VALUES ('473', '苏家屯区', '210111', '210100', '41.671254', '123.350435');
INSERT INTO `t_sys_division_coordinate` VALUES ('474', '浑南区', '210112', '210100', '41.849226', '123.567539');
INSERT INTO `t_sys_division_coordinate` VALUES ('475', '沈北新区', '210113', '210100', '42.058914', '123.533605');
INSERT INTO `t_sys_division_coordinate` VALUES ('476', '于洪区', '210114', '210100', '41.799668', '123.314633');
INSERT INTO `t_sys_division_coordinate` VALUES ('477', '辽中区', '210115', '210100', '41.523149', '122.772378');
INSERT INTO `t_sys_division_coordinate` VALUES ('478', '康平县', '210123', '210100', '42.749925', '123.337511');
INSERT INTO `t_sys_division_coordinate` VALUES ('479', '法库县', '210124', '210100', '42.509607', '123.414621');
INSERT INTO `t_sys_division_coordinate` VALUES ('480', '新民市', '210181', '210100', '42.007109', '122.875395');
INSERT INTO `t_sys_division_coordinate` VALUES ('481', '大连市', '210200', '210000', '38.918954', '121.621631');
INSERT INTO `t_sys_division_coordinate` VALUES ('482', '中山区', '210202', '210200', '38.924511', '121.651547');
INSERT INTO `t_sys_division_coordinate` VALUES ('483', '西岗区', '210203', '210200', '38.920473', '121.618625');
INSERT INTO `t_sys_division_coordinate` VALUES ('484', '沙河口区', '210204', '210200', '38.913544', '121.594507');
INSERT INTO `t_sys_division_coordinate` VALUES ('485', '甘井子区', '210211', '210200', '38.958002', '121.531519');
INSERT INTO `t_sys_division_coordinate` VALUES ('486', '旅顺口区', '210212', '210200', '38.856832', '121.268597');
INSERT INTO `t_sys_division_coordinate` VALUES ('487', '金州区', '210213', '210200', '39.056433', '121.789436');
INSERT INTO `t_sys_division_coordinate` VALUES ('488', '普兰店区', '210214', '210200', '39.398089', '121.94646');
INSERT INTO `t_sys_division_coordinate` VALUES ('489', '长海县', '210224', '210200', '39.27827', '122.594627');
INSERT INTO `t_sys_division_coordinate` VALUES ('490', '瓦房店市', '210281', '210200', '39.632741', '121.985638');
INSERT INTO `t_sys_division_coordinate` VALUES ('491', '庄河市', '210283', '210200', '39.686956', '122.974495');
INSERT INTO `t_sys_division_coordinate` VALUES ('492', '鞍山市', '210300', '210000', '41.115054', '123.001373');
INSERT INTO `t_sys_division_coordinate` VALUES ('493', '铁东区', '210302', '210300', '41.096332', '122.9974');
INSERT INTO `t_sys_division_coordinate` VALUES ('494', '铁西区', '210303', '210300', '41.125475', '122.97549');
INSERT INTO `t_sys_division_coordinate` VALUES ('495', '立山区', '210304', '210300', '41.156116', '123.035484');
INSERT INTO `t_sys_division_coordinate` VALUES ('496', '千山区', '210311', '210300', '41.080939', '122.967574');
INSERT INTO `t_sys_division_coordinate` VALUES ('497', '台安县', '210321', '210300', '41.41859', '122.44255');
INSERT INTO `t_sys_division_coordinate` VALUES ('498', '岫岩满族自治县', '210323', '210300', '40.295892', '123.287547');
INSERT INTO `t_sys_division_coordinate` VALUES ('499', '海城市', '210381', '210300', '40.887634', '122.691569');
INSERT INTO `t_sys_division_coordinate` VALUES ('500', '抚顺市', '210400', '210000', '41.88597', '123.964375');
INSERT INTO `t_sys_division_coordinate` VALUES ('501', '新抚区', '210402', '210400', '41.867806', '123.919582');
INSERT INTO `t_sys_division_coordinate` VALUES ('502', '东洲区', '210403', '210400', '41.859191', '124.04555');
INSERT INTO `t_sys_division_coordinate` VALUES ('503', '望花区', '210404', '210400', '41.85903', '123.790604');
INSERT INTO `t_sys_division_coordinate` VALUES ('504', '顺城区', '210411', '210400', '41.889164', '123.951414');
INSERT INTO `t_sys_division_coordinate` VALUES ('505', '抚顺县', '210421', '210400', '41.887037', '123.92159');
INSERT INTO `t_sys_division_coordinate` VALUES ('506', '新宾满族自治县', '210422', '210400', '41.739969', '125.046356');
INSERT INTO `t_sys_division_coordinate` VALUES ('507', '清原满族自治县', '210423', '210400', '42.106761', '124.93036');
INSERT INTO `t_sys_division_coordinate` VALUES ('508', '本溪市', '210500', '210000', '41.492916', '123.692507');
INSERT INTO `t_sys_division_coordinate` VALUES ('509', '平山区', '210502', '210500', '41.301604', '123.774614');
INSERT INTO `t_sys_division_coordinate` VALUES ('510', '溪湖区', '210503', '210500', '41.334803', '123.774611');
INSERT INTO `t_sys_division_coordinate` VALUES ('511', '明山区', '210504', '210500', '41.314939', '123.823474');
INSERT INTO `t_sys_division_coordinate` VALUES ('512', '南芬区', '210505', '210500', '41.107096', '123.751467');
INSERT INTO `t_sys_division_coordinate` VALUES ('513', '本溪满族自治县', '210521', '210500', '41.307903', '124.127585');
INSERT INTO `t_sys_division_coordinate` VALUES ('514', '桓仁满族自治县', '210522', '210500', '41.272925', '125.367544');
INSERT INTO `t_sys_division_coordinate` VALUES ('515', '丹东市', '210600', '210000', '40.006409', '124.361547');
INSERT INTO `t_sys_division_coordinate` VALUES ('516', '元宝区', '210602', '210600', '40.142251', '124.402584');
INSERT INTO `t_sys_division_coordinate` VALUES ('517', '振兴区', '210603', '210600', '40.110719', '124.366579');
INSERT INTO `t_sys_division_coordinate` VALUES ('518', '振安区', '210604', '210600', '40.164697', '124.434387');
INSERT INTO `t_sys_division_coordinate` VALUES ('519', '宽甸满族自治县', '210624', '210600', '40.737553', '124.790427');
INSERT INTO `t_sys_division_coordinate` VALUES ('520', '东港市', '210681', '210600', '39.867716', '124.15961');
INSERT INTO `t_sys_division_coordinate` VALUES ('521', '凤城市', '210682', '210600', '40.45918', '124.072422');
INSERT INTO `t_sys_division_coordinate` VALUES ('522', '锦州市', '210700', '210000', '41.100931', '121.132596');
INSERT INTO `t_sys_division_coordinate` VALUES ('523', '古塔区', '210702', '210700', '41.122901', '121.134585');
INSERT INTO `t_sys_division_coordinate` VALUES ('524', '凌河区', '210703', '210700', '41.120691', '121.15759');
INSERT INTO `t_sys_division_coordinate` VALUES ('525', '太和区', '210711', '210700', '41.115109', '121.110453');
INSERT INTO `t_sys_division_coordinate` VALUES ('526', '黑山县', '210726', '210700', '41.671593', '122.130557');
INSERT INTO `t_sys_division_coordinate` VALUES ('527', '义县', '210727', '210700', '41.538939', '121.245569');
INSERT INTO `t_sys_division_coordinate` VALUES ('528', '凌海市', '210781', '210700', '41.166488', '121.362539');
INSERT INTO `t_sys_division_coordinate` VALUES ('529', '北镇市', '210782', '210700', '41.594428', '121.783447');
INSERT INTO `t_sys_division_coordinate` VALUES ('530', '营口市', '210800', '210000', '40.673137', '122.241575');
INSERT INTO `t_sys_division_coordinate` VALUES ('531', '站前区', '210802', '210800', '40.678764', '122.265437');
INSERT INTO `t_sys_division_coordinate` VALUES ('532', '西市区', '210803', '210800', '40.672111', '122.213582');
INSERT INTO `t_sys_division_coordinate` VALUES ('533', '鲅鱼圈区', '210804', '210800', '40.23234', '122.127573');
INSERT INTO `t_sys_division_coordinate` VALUES ('534', '老边区', '210811', '210800', '40.686384', '122.386439');
INSERT INTO `t_sys_division_coordinate` VALUES ('535', '盖州市', '210881', '210800', '40.406167', '122.355591');
INSERT INTO `t_sys_division_coordinate` VALUES ('536', '大石桥市', '210882', '210800', '40.650802', '122.51538');
INSERT INTO `t_sys_division_coordinate` VALUES ('537', '阜新市', '210900', '210000', '42.028022', '121.676408');
INSERT INTO `t_sys_division_coordinate` VALUES ('538', '海州区', '210902', '210900', '42.023735', '121.669436');
INSERT INTO `t_sys_division_coordinate` VALUES ('539', '新邱区', '210903', '210900', '42.093935', '121.799363');
INSERT INTO `t_sys_division_coordinate` VALUES ('540', '太平区', '210904', '210900', '42.016968', '121.685384');
INSERT INTO `t_sys_division_coordinate` VALUES ('541', '清河门区', '210905', '210900', '41.789319', '121.422479');
INSERT INTO `t_sys_division_coordinate` VALUES ('542', '细河区', '210911', '210900', '42.031871', '121.686392');
INSERT INTO `t_sys_division_coordinate` VALUES ('543', '阜新蒙古族自治县', '210921', '210900', '42.071368', '121.763574');
INSERT INTO `t_sys_division_coordinate` VALUES ('544', '彰武县', '210922', '210900', '42.392707', '122.545449');
INSERT INTO `t_sys_division_coordinate` VALUES ('545', '辽阳市', '211000', '210000', '41.274161', '123.243366');
INSERT INTO `t_sys_division_coordinate` VALUES ('546', '白塔区', '211002', '211000', '41.275845', '123.180608');
INSERT INTO `t_sys_division_coordinate` VALUES ('547', '文圣区', '211003', '211000', '41.268438', '123.191605');
INSERT INTO `t_sys_division_coordinate` VALUES ('548', '宏伟区', '211004', '211000', '41.223368', '123.20358');
INSERT INTO `t_sys_division_coordinate` VALUES ('549', '弓长岭区', '211005', '211000', '41.157327', '123.426615');
INSERT INTO `t_sys_division_coordinate` VALUES ('550', '太子河区', '211011', '211000', '41.259226', '123.188604');
INSERT INTO `t_sys_division_coordinate` VALUES ('551', '辽阳县', '211021', '211000', '41.211679', '123.112421');
INSERT INTO `t_sys_division_coordinate` VALUES ('552', '灯塔市', '211081', '211000', '41.432474', '123.345462');
INSERT INTO `t_sys_division_coordinate` VALUES ('553', '盘锦市', '211100', '210000', '41.125875', '122.07749');
INSERT INTO `t_sys_division_coordinate` VALUES ('554', '双台子区', '211102', '211100', '41.206072', '122.046393');
INSERT INTO `t_sys_division_coordinate` VALUES ('555', '兴隆台区', '211103', '211100', '41.164499', '122.076499');
INSERT INTO `t_sys_division_coordinate` VALUES ('556', '大洼区', '211104', '211100', '41.008179', '122.088555');
INSERT INTO `t_sys_division_coordinate` VALUES ('557', '盘山县', '211122', '211100', '41.248264', '122.00356');
INSERT INTO `t_sys_division_coordinate` VALUES ('558', '铁岭市', '211200', '210000', '42.229948', '123.732365');
INSERT INTO `t_sys_division_coordinate` VALUES ('559', '银州区', '211202', '211200', '42.292574', '123.848386');
INSERT INTO `t_sys_division_coordinate` VALUES ('560', '清河区', '211204', '211200', '42.552495', '124.165563');
INSERT INTO `t_sys_division_coordinate` VALUES ('561', '铁岭县', '211221', '211200', '42.229226', '123.735372');
INSERT INTO `t_sys_division_coordinate` VALUES ('562', '西丰县', '211223', '211200', '42.744014', '124.733615');
INSERT INTO `t_sys_division_coordinate` VALUES ('563', '昌图县', '211224', '211200', '42.792178', '124.117501');
INSERT INTO `t_sys_division_coordinate` VALUES ('564', '调兵山市', '211281', '211200', '42.473738', '123.573509');
INSERT INTO `t_sys_division_coordinate` VALUES ('565', '开原市', '211282', '211200', '42.552079', '124.044569');
INSERT INTO `t_sys_division_coordinate` VALUES ('566', '朝阳市', '211300', '210000', '41.579821', '120.457499');
INSERT INTO `t_sys_division_coordinate` VALUES ('567', '双塔区', '211302', '211300', '41.571779', '120.460487');
INSERT INTO `t_sys_division_coordinate` VALUES ('568', '龙城区', '211303', '211300', '41.598469', '120.443567');
INSERT INTO `t_sys_division_coordinate` VALUES ('569', '朝阳县', '211321', '211300', '41.241076', '120.259391');
INSERT INTO `t_sys_division_coordinate` VALUES ('570', '建平县', '211322', '211300', '41.409456', '119.64938');
INSERT INTO `t_sys_division_coordinate` VALUES ('571', '喀喇沁左翼蒙古族自治县', '211324', '211300', '41.133689', '119.747414');
INSERT INTO `t_sys_division_coordinate` VALUES ('572', '北票市', '211381', '211300', '41.806483', '120.777628');
INSERT INTO `t_sys_division_coordinate` VALUES ('573', '凌源市', '211382', '211300', '41.251651', '119.407358');
INSERT INTO `t_sys_division_coordinate` VALUES ('574', '葫芦岛市', '211400', '210000', '40.717364', '120.843398');
INSERT INTO `t_sys_division_coordinate` VALUES ('575', '连山区', '211402', '211400', '40.780894', '120.876482');
INSERT INTO `t_sys_division_coordinate` VALUES ('576', '龙港区', '211403', '211400', '40.741057', '120.900621');
INSERT INTO `t_sys_division_coordinate` VALUES ('577', '南票区', '211404', '211400', '41.113098', '120.756493');
INSERT INTO `t_sys_division_coordinate` VALUES ('578', '绥中县', '211421', '211400', '40.331843', '120.350425');
INSERT INTO `t_sys_division_coordinate` VALUES ('579', '建昌县', '211422', '211400', '40.83038', '119.843595');
INSERT INTO `t_sys_division_coordinate` VALUES ('580', '兴城市', '211481', '211400', '40.616556', '120.764558');
INSERT INTO `t_sys_division_coordinate` VALUES ('581', '吉林省', '220000', '0', '43.901714', '125.33258');
INSERT INTO `t_sys_division_coordinate` VALUES ('582', '长春市', '220100', '220000', '43.821954', '125.330602');
INSERT INTO `t_sys_division_coordinate` VALUES ('583', '南关区', '220102', '220100', '43.869873', '125.35661');
INSERT INTO `t_sys_division_coordinate` VALUES ('584', '宽城区', '220103', '220100', '43.949502', '125.334625');
INSERT INTO `t_sys_division_coordinate` VALUES ('585', '朝阳区', '220104', '220100', '43.840641', '125.295401');
INSERT INTO `t_sys_division_coordinate` VALUES ('586', '二道区', '220105', '220100', '43.871277', '125.380468');
INSERT INTO `t_sys_division_coordinate` VALUES ('587', '绿园区', '220106', '220100', '43.88681', '125.262443');
INSERT INTO `t_sys_division_coordinate` VALUES ('588', '双阳区', '220112', '220100', '43.531091', '125.671448');
INSERT INTO `t_sys_division_coordinate` VALUES ('589', '九台区', '220113', '220100', '44.157792', '125.845564');
INSERT INTO `t_sys_division_coordinate` VALUES ('590', '农安县', '220122', '220100', '44.438904', '125.191484');
INSERT INTO `t_sys_division_coordinate` VALUES ('591', '榆树市', '220182', '220100', '44.84544', '126.539609');
INSERT INTO `t_sys_division_coordinate` VALUES ('592', '德惠市', '220183', '220100', '44.527161', '125.734515');
INSERT INTO `t_sys_division_coordinate` VALUES ('593', '吉林市', '220200', '220000', '43.843568', '126.555635');
INSERT INTO `t_sys_division_coordinate` VALUES ('594', '昌邑区', '220202', '220200', '43.887992', '126.581449');
INSERT INTO `t_sys_division_coordinate` VALUES ('595', '龙潭区', '220203', '220200', '43.916343', '126.568545');
INSERT INTO `t_sys_division_coordinate` VALUES ('596', '船营区', '220204', '220200', '43.839927', '126.54765');
INSERT INTO `t_sys_division_coordinate` VALUES ('597', '丰满区', '220211', '220200', '43.827152', '126.56857');
INSERT INTO `t_sys_division_coordinate` VALUES ('598', '永吉县', '220221', '220200', '43.678721', '126.504416');
INSERT INTO `t_sys_division_coordinate` VALUES ('599', '蛟河市', '220281', '220200', '43.730004', '127.35148');
INSERT INTO `t_sys_division_coordinate` VALUES ('600', '桦甸市', '220282', '220200', '42.977983', '126.752484');
INSERT INTO `t_sys_division_coordinate` VALUES ('601', '舒兰市', '220283', '220200', '44.41227', '126.971377');
INSERT INTO `t_sys_division_coordinate` VALUES ('602', '磐石市', '220284', '220200', '42.951817', '126.066616');
INSERT INTO `t_sys_division_coordinate` VALUES ('603', '四平市', '220300', '220000', '43.171994', '124.356482');
INSERT INTO `t_sys_division_coordinate` VALUES ('604', '铁西区', '220302', '220300', '43.152575', '124.352467');
INSERT INTO `t_sys_division_coordinate` VALUES ('605', '铁东区', '220303', '220300', '43.167994', '124.416483');
INSERT INTO `t_sys_division_coordinate` VALUES ('606', '梨树县', '220322', '220300', '43.313346', '124.342401');
INSERT INTO `t_sys_division_coordinate` VALUES ('607', '伊通满族自治县', '220323', '220300', '43.351104', '125.311485');
INSERT INTO `t_sys_division_coordinate` VALUES ('608', '公主岭市', '220381', '220300', '43.510833', '124.829449');
INSERT INTO `t_sys_division_coordinate` VALUES ('609', '双辽市', '220382', '220300', '43.524527', '123.509438');
INSERT INTO `t_sys_division_coordinate` VALUES ('610', '辽源市', '220400', '220000', '42.894055', '125.150425');
INSERT INTO `t_sys_division_coordinate` VALUES ('611', '龙山区', '220402', '220400', '42.907634', '125.143452');
INSERT INTO `t_sys_division_coordinate` VALUES ('612', '西安区', '220403', '220400', '42.933308', '125.155373');
INSERT INTO `t_sys_division_coordinate` VALUES ('613', '东丰县', '220421', '220400', '42.683311', '125.537378');
INSERT INTO `t_sys_division_coordinate` VALUES ('614', '东辽县', '220422', '220400', '42.931879', '124.997589');
INSERT INTO `t_sys_division_coordinate` VALUES ('615', '通化市', '220500', '220000', '41.733816', '125.946606');
INSERT INTO `t_sys_division_coordinate` VALUES ('616', '东昌区', '220502', '220500', '41.708405', '125.933595');
INSERT INTO `t_sys_division_coordinate` VALUES ('617', '二道江区', '220503', '220500', '41.779966', '126.049592');
INSERT INTO `t_sys_division_coordinate` VALUES ('618', '通化县', '220521', '220500', '41.685682', '125.765392');
INSERT INTO `t_sys_division_coordinate` VALUES ('619', '辉南县', '220523', '220500', '42.6907', '126.053581');
INSERT INTO `t_sys_division_coordinate` VALUES ('620', '柳河县', '220524', '220500', '42.290871', '125.751424');
INSERT INTO `t_sys_division_coordinate` VALUES ('621', '梅河口市', '220581', '220500', '42.544884', '125.717608');
INSERT INTO `t_sys_division_coordinate` VALUES ('622', '集安市', '220582', '220500', '41.1313', '126.199577');
INSERT INTO `t_sys_division_coordinate` VALUES ('623', '白山市', '220600', '220000', '41.939627', '126.42963');
INSERT INTO `t_sys_division_coordinate` VALUES ('624', '浑江区', '220602', '220600', '41.950424', '126.42362');
INSERT INTO `t_sys_division_coordinate` VALUES ('625', '江源区', '220605', '220600', '42.062939', '126.597391');
INSERT INTO `t_sys_division_coordinate` VALUES ('626', '抚松县', '220621', '220600', '42.227335', '127.455371');
INSERT INTO `t_sys_division_coordinate` VALUES ('627', '靖宇县', '220622', '220600', '42.394766', '126.819499');
INSERT INTO `t_sys_division_coordinate` VALUES ('628', '长白朝鲜族自治县', '220623', '220600', '41.425896', '128.207584');
INSERT INTO `t_sys_division_coordinate` VALUES ('629', '临江市', '220681', '220600', '41.817679', '126.924582');
INSERT INTO `t_sys_division_coordinate` VALUES ('630', '松原市', '220700', '220000', '45.147404', '124.831482');
INSERT INTO `t_sys_division_coordinate` VALUES ('631', '宁江区', '220702', '220700', '45.178039', '124.823423');
INSERT INTO `t_sys_division_coordinate` VALUES ('632', '前郭尔罗斯蒙古族自治县', '220721', '220700', '45.123416', '124.830456');
INSERT INTO `t_sys_division_coordinate` VALUES ('633', '长岭县', '220722', '220700', '44.281638', '123.974374');
INSERT INTO `t_sys_division_coordinate` VALUES ('634', '乾安县', '220723', '220700', '45.008434', '124.047564');
INSERT INTO `t_sys_division_coordinate` VALUES ('635', '扶余市', '220781', '220700', '44.994168', '126.056606');
INSERT INTO `t_sys_division_coordinate` VALUES ('636', '白城市', '220800', '220000', '45.625504', '122.845591');
INSERT INTO `t_sys_division_coordinate` VALUES ('637', '洮北区', '220802', '220800', '45.627525', '122.85751');
INSERT INTO `t_sys_division_coordinate` VALUES ('638', '镇赉县', '220821', '220800', '45.853117', '123.206576');
INSERT INTO `t_sys_division_coordinate` VALUES ('639', '通榆县', '220822', '220800', '44.818964', '123.094521');
INSERT INTO `t_sys_division_coordinate` VALUES ('640', '洮南市', '220881', '220800', '45.341132', '122.794468');
INSERT INTO `t_sys_division_coordinate` VALUES ('641', '大安市', '220882', '220800', '45.513045', '124.298504');
INSERT INTO `t_sys_division_coordinate` VALUES ('642', '延边朝鲜族自治州', '222400', '220000', '42.915743', '129.477376');
INSERT INTO `t_sys_division_coordinate` VALUES ('643', '延吉市', '222401', '222400', '42.912717', '129.52052');
INSERT INTO `t_sys_division_coordinate` VALUES ('644', '图们市', '222402', '222400', '42.974283', '129.850382');
INSERT INTO `t_sys_division_coordinate` VALUES ('645', '敦化市', '222403', '222400', '43.378291', '128.238612');
INSERT INTO `t_sys_division_coordinate` VALUES ('646', '珲春市', '222404', '222400', '42.868515', '130.372613');
INSERT INTO `t_sys_division_coordinate` VALUES ('647', '龙井市', '222405', '222400', '42.771535', '129.432635');
INSERT INTO `t_sys_division_coordinate` VALUES ('648', '和龙市', '222406', '222400', '42.552323', '129.017387');
INSERT INTO `t_sys_division_coordinate` VALUES ('649', '汪清县', '222424', '222400', '43.318451', '129.777609');
INSERT INTO `t_sys_division_coordinate` VALUES ('650', '安图县', '222426', '222400', '43.117917', '128.905448');
INSERT INTO `t_sys_division_coordinate` VALUES ('651', '黑龙江省', '230000', '0', '45.74793', '126.669653');
INSERT INTO `t_sys_division_coordinate` VALUES ('652', '哈尔滨市', '230100', '230000', '45.808826', '126.541615');
INSERT INTO `t_sys_division_coordinate` VALUES ('653', '道里区', '230102', '230100', '45.761844', '126.623432');
INSERT INTO `t_sys_division_coordinate` VALUES ('654', '南岗区', '230103', '230100', '45.765866', '126.675638');
INSERT INTO `t_sys_division_coordinate` VALUES ('655', '道外区', '230104', '230100', '45.797776', '126.655604');
INSERT INTO `t_sys_division_coordinate` VALUES ('656', '平房区', '230108', '230100', '45.603862', '126.643547');
INSERT INTO `t_sys_division_coordinate` VALUES ('657', '松北区', '230109', '230100', '45.808593', '126.516483');
INSERT INTO `t_sys_division_coordinate` VALUES ('658', '香坊区', '230110', '230100', '45.71362', '126.669624');
INSERT INTO `t_sys_division_coordinate` VALUES ('659', '呼兰区', '230111', '230100', '45.89521', '126.594399');
INSERT INTO `t_sys_division_coordinate` VALUES ('660', '阿城区', '230112', '230100', '45.554275', '126.964356');
INSERT INTO `t_sys_division_coordinate` VALUES ('661', '双城区', '230113', '230100', '45.388112', '126.319623');
INSERT INTO `t_sys_division_coordinate` VALUES ('662', '依兰县', '230123', '230100', '46.33126', '129.57452');
INSERT INTO `t_sys_division_coordinate` VALUES ('663', '方正县', '230124', '230100', '45.857758', '128.835634');
INSERT INTO `t_sys_division_coordinate` VALUES ('664', '宾县', '230125', '230100', '45.752465', '127.473497');
INSERT INTO `t_sys_division_coordinate` VALUES ('665', '巴彦县', '230126', '230100', '46.091283', '127.410548');
INSERT INTO `t_sys_division_coordinate` VALUES ('666', '木兰县', '230127', '230100', '45.956871', '128.050356');
INSERT INTO `t_sys_division_coordinate` VALUES ('667', '通河县', '230128', '230100', '45.996393', '128.752416');
INSERT INTO `t_sys_division_coordinate` VALUES ('668', '延寿县', '230129', '230100', '45.457641', '128.338606');
INSERT INTO `t_sys_division_coordinate` VALUES ('669', '尚志市', '230183', '230100', '45.215474', '128.015488');
INSERT INTO `t_sys_division_coordinate` VALUES ('670', '五常市', '230184', '230100', '44.937843', '127.173529');
INSERT INTO `t_sys_division_coordinate` VALUES ('671', '齐齐哈尔市', '230200', '230000', '47.359977', '123.924571');
INSERT INTO `t_sys_division_coordinate` VALUES ('672', '龙沙区', '230202', '230200', '47.323577', '123.964376');
INSERT INTO `t_sys_division_coordinate` VALUES ('673', '建华区', '230203', '230200', '47.360555', '123.96135');
INSERT INTO `t_sys_division_coordinate` VALUES ('674', '铁锋区', '230204', '230200', '47.347019', '123.984416');
INSERT INTO `t_sys_division_coordinate` VALUES ('675', '昂昂溪区', '230205', '230200', '47.161332', '123.829406');
INSERT INTO `t_sys_division_coordinate` VALUES ('676', '富拉尔基区', '230206', '230200', '47.215504', '123.63651');
INSERT INTO `t_sys_division_coordinate` VALUES ('677', '碾子山区', '230207', '230200', '47.523236', '122.894367');
INSERT INTO `t_sys_division_coordinate` VALUES ('678', '梅里斯达斡尔族区', '230208', '230200', '47.31555', '123.759541');
INSERT INTO `t_sys_division_coordinate` VALUES ('679', '龙江县', '230221', '230200', '47.343606', '123.211539');
INSERT INTO `t_sys_division_coordinate` VALUES ('680', '依安县', '230223', '230200', '47.899484', '125.312482');
INSERT INTO `t_sys_division_coordinate` VALUES ('681', '泰来县', '230224', '230200', '46.397829', '123.423626');
INSERT INTO `t_sys_division_coordinate` VALUES ('682', '甘南县', '230225', '230200', '47.926884', '123.512486');
INSERT INTO `t_sys_division_coordinate` VALUES ('683', '富裕县', '230227', '230200', '47.780228', '124.480542');
INSERT INTO `t_sys_division_coordinate` VALUES ('684', '克山县', '230229', '230200', '48.043172', '125.881378');
INSERT INTO `t_sys_division_coordinate` VALUES ('685', '克东县', '230230', '230200', '48.048244', '126.255387');
INSERT INTO `t_sys_division_coordinate` VALUES ('686', '拜泉县', '230231', '230200', '47.601867', '126.105421');
INSERT INTO `t_sys_division_coordinate` VALUES ('687', '讷河市', '230281', '230200', '48.490087', '124.890549');
INSERT INTO `t_sys_division_coordinate` VALUES ('688', '鸡西市', '230300', '230000', '45.300872', '130.975619');
INSERT INTO `t_sys_division_coordinate` VALUES ('689', '鸡冠区', '230302', '230300', '45.309806', '130.987632');
INSERT INTO `t_sys_division_coordinate` VALUES ('690', '恒山区', '230303', '230300', '45.216972', '130.911385');
INSERT INTO `t_sys_division_coordinate` VALUES ('691', '滴道区', '230304', '230300', '45.354434', '130.85058');
INSERT INTO `t_sys_division_coordinate` VALUES ('692', '梨树区', '230305', '230300', '45.098242', '130.703396');
INSERT INTO `t_sys_division_coordinate` VALUES ('693', '城子河区', '230306', '230300', '45.344435', '131.018469');
INSERT INTO `t_sys_division_coordinate` VALUES ('694', '麻山区', '230307', '230300', '45.217935', '130.484536');
INSERT INTO `t_sys_division_coordinate` VALUES ('695', '鸡东县', '230321', '230300', '45.266185', '131.130558');
INSERT INTO `t_sys_division_coordinate` VALUES ('696', '虎林市', '230381', '230300', '45.768947', '132.943466');
INSERT INTO `t_sys_division_coordinate` VALUES ('697', '密山市', '230382', '230300', '45.535641', '131.853531');
INSERT INTO `t_sys_division_coordinate` VALUES ('698', '鹤岗市', '230400', '230000', '47.356056', '130.304433');
INSERT INTO `t_sys_division_coordinate` VALUES ('699', '向阳区', '230402', '230400', '47.348581', '130.300468');
INSERT INTO `t_sys_division_coordinate` VALUES ('700', '工农区', '230403', '230400', '47.32443', '130.281617');
INSERT INTO `t_sys_division_coordinate` VALUES ('701', '南山区', '230404', '230400', '47.321246', '130.29354');
INSERT INTO `t_sys_division_coordinate` VALUES ('702', '兴安区', '230405', '230400', '47.258716', '130.245546');
INSERT INTO `t_sys_division_coordinate` VALUES ('703', '东山区', '230406', '230400', '47.344987', '130.323361');
INSERT INTO `t_sys_division_coordinate` VALUES ('704', '兴山区', '230407', '230400', '47.396045', '130.317364');
INSERT INTO `t_sys_division_coordinate` VALUES ('705', '萝北县', '230421', '230400', '47.583422', '130.835495');
INSERT INTO `t_sys_division_coordinate` VALUES ('706', '绥滨县', '230422', '230400', '47.295265', '131.859487');
INSERT INTO `t_sys_division_coordinate` VALUES ('707', '双鸭山市', '230500', '230000', '46.653186', '131.165342');
INSERT INTO `t_sys_division_coordinate` VALUES ('708', '尖山区', '230502', '230500', '46.652586', '131.165342');
INSERT INTO `t_sys_division_coordinate` VALUES ('709', '岭东区', '230503', '230500', '46.464596', '131.164377');
INSERT INTO `t_sys_division_coordinate` VALUES ('710', '四方台区', '230505', '230500', '46.602012', '131.345657');
INSERT INTO `t_sys_division_coordinate` VALUES ('711', '宝山区', '230506', '230500', '46.583598', '131.407375');
INSERT INTO `t_sys_division_coordinate` VALUES ('712', '集贤县', '230521', '230500', '46.734518', '131.147434');
INSERT INTO `t_sys_division_coordinate` VALUES ('713', '友谊县', '230522', '230500', '46.772973', '131.814595');
INSERT INTO `t_sys_division_coordinate` VALUES ('714', '宝清县', '230523', '230500', '46.332652', '132.203594');
INSERT INTO `t_sys_division_coordinate` VALUES ('715', '饶河县', '230524', '230500', '46.804183', '134.020469');
INSERT INTO `t_sys_division_coordinate` VALUES ('716', '大庆市', '230600', '230000', '46.593633', '125.108658');
INSERT INTO `t_sys_division_coordinate` VALUES ('717', '萨尔图区', '230602', '230600', '46.638936', '125.13351');
INSERT INTO `t_sys_division_coordinate` VALUES ('718', '龙凤区', '230603', '230600', '46.567678', '125.140473');
INSERT INTO `t_sys_division_coordinate` VALUES ('719', '让胡路区', '230604', '230600', '46.658078', '124.877599');
INSERT INTO `t_sys_division_coordinate` VALUES ('720', '红岗区', '230605', '230600', '46.404313', '124.897477');
INSERT INTO `t_sys_division_coordinate` VALUES ('721', '大同区', '230606', '230600', '46.045584', '124.819377');
INSERT INTO `t_sys_division_coordinate` VALUES ('722', '肇州县', '230621', '230600', '45.705108', '125.275368');
INSERT INTO `t_sys_division_coordinate` VALUES ('723', '肇源县', '230622', '230600', '45.524153', '125.084573');
INSERT INTO `t_sys_division_coordinate` VALUES ('724', '林甸县', '230623', '230600', '47.177234', '124.86965');
INSERT INTO `t_sys_division_coordinate` VALUES ('725', '杜尔伯特蒙古族自治县', '230624', '230600', '46.868768', '124.449359');
INSERT INTO `t_sys_division_coordinate` VALUES ('726', '伊春市', '230700', '230000', '47.733318', '128.847546');
INSERT INTO `t_sys_division_coordinate` VALUES ('727', '伊春区', '230702', '230700', '47.733954', '128.913459');
INSERT INTO `t_sys_division_coordinate` VALUES ('728', '南岔区', '230703', '230700', '47.14375', '129.289572');
INSERT INTO `t_sys_division_coordinate` VALUES ('729', '友好区', '230704', '230700', '47.846436', '128.842579');
INSERT INTO `t_sys_division_coordinate` VALUES ('730', '西林区', '230705', '230700', '47.486393', '129.319594');
INSERT INTO `t_sys_division_coordinate` VALUES ('731', '翠峦区', '230706', '230700', '47.732894', '128.676482');
INSERT INTO `t_sys_division_coordinate` VALUES ('732', '新青区', '230707', '230700', '48.296135', '129.540647');
INSERT INTO `t_sys_division_coordinate` VALUES ('733', '美溪区', '230708', '230700', '47.641344', '129.135368');
INSERT INTO `t_sys_division_coordinate` VALUES ('734', '金山屯区', '230709', '230700', '47.418759', '129.435639');
INSERT INTO `t_sys_division_coordinate` VALUES ('735', '五营区', '230710', '230700', '48.114271', '129.25135');
INSERT INTO `t_sys_division_coordinate` VALUES ('736', '乌马河区', '230711', '230700', '47.733619', '128.805546');
INSERT INTO `t_sys_division_coordinate` VALUES ('737', '汤旺河区', '230712', '230700', '48.460614', '129.577474');
INSERT INTO `t_sys_division_coordinate` VALUES ('738', '带岭区', '230713', '230700', '47.034572', '129.027425');
INSERT INTO `t_sys_division_coordinate` VALUES ('739', '乌伊岭区', '230714', '230700', '48.596169', '129.444577');
INSERT INTO `t_sys_division_coordinate` VALUES ('740', '红星区', '230715', '230700', '48.24548', '129.397507');
INSERT INTO `t_sys_division_coordinate` VALUES ('741', '上甘岭区', '230716', '230700', '47.980914', '129.030437');
INSERT INTO `t_sys_division_coordinate` VALUES ('742', '嘉荫县', '230722', '230700', '48.894983', '130.410555');
INSERT INTO `t_sys_division_coordinate` VALUES ('743', '铁力市', '230781', '230700', '46.992949', '128.038365');
INSERT INTO `t_sys_division_coordinate` VALUES ('744', '佳木斯市', '230800', '230000', '46.80569', '130.327359');
INSERT INTO `t_sys_division_coordinate` VALUES ('745', '向阳区', '230803', '230800', '46.813512', '130.372612');
INSERT INTO `t_sys_division_coordinate` VALUES ('746', '前进区', '230804', '230800', '46.813512', '130.372612');
INSERT INTO `t_sys_division_coordinate` VALUES ('747', '东风区', '230805', '230800', '46.813512', '130.372612');
INSERT INTO `t_sys_division_coordinate` VALUES ('748', '郊区', '230811', '230800', '46.816168', '130.333378');
INSERT INTO `t_sys_division_coordinate` VALUES ('749', '桦南县', '230822', '230800', '46.245077', '130.560385');
INSERT INTO `t_sys_division_coordinate` VALUES ('750', '桦川县', '230826', '230800', '47.028817', '130.725549');
INSERT INTO `t_sys_division_coordinate` VALUES ('751', '汤原县', '230828', '230800', '46.735327', '129.911645');
INSERT INTO `t_sys_division_coordinate` VALUES ('752', '同江市', '230881', '230800', '47.647981', '132.517509');
INSERT INTO `t_sys_division_coordinate` VALUES ('753', '富锦市', '230882', '230800', '47.255933', '132.044539');
INSERT INTO `t_sys_division_coordinate` VALUES ('754', '抚远市', '230883', '230800', '48.370945', '134.31449');
INSERT INTO `t_sys_division_coordinate` VALUES ('755', '七台河市', '230900', '230000', '45.7763', '131.011545');
INSERT INTO `t_sys_division_coordinate` VALUES ('756', '新兴区', '230902', '230900', '45.82231', '130.938371');
INSERT INTO `t_sys_division_coordinate` VALUES ('757', '桃山区', '230903', '230900', '45.7718', '131.026444');
INSERT INTO `t_sys_division_coordinate` VALUES ('758', '茄子河区', '230904', '230900', '45.791238', '131.074481');
INSERT INTO `t_sys_division_coordinate` VALUES ('759', '勃利县', '230921', '230900', '45.760964', '130.598533');
INSERT INTO `t_sys_division_coordinate` VALUES ('760', '牡丹江市', '231000', '230000', '44.556246', '129.63954');
INSERT INTO `t_sys_division_coordinate` VALUES ('761', '东安区', '231002', '231000', '44.58746', '129.633478');
INSERT INTO `t_sys_division_coordinate` VALUES ('762', '阳明区', '231003', '231000', '44.601775', '129.642527');
INSERT INTO `t_sys_division_coordinate` VALUES ('763', '爱民区', '231004', '231000', '44.60235', '129.598364');
INSERT INTO `t_sys_division_coordinate` VALUES ('764', '西安区', '231005', '231000', '44.583861', '129.622413');
INSERT INTO `t_sys_division_coordinate` VALUES ('765', '林口县', '231025', '231000', '45.284129', '130.287579');
INSERT INTO `t_sys_division_coordinate` VALUES ('766', '绥芬河市', '231081', '231000', '44.418154', '131.157392');
INSERT INTO `t_sys_division_coordinate` VALUES ('767', '海林市', '231083', '231000', '44.599872', '129.387427');
INSERT INTO `t_sys_division_coordinate` VALUES ('768', '宁安市', '231084', '231000', '44.346984', '129.489368');
INSERT INTO `t_sys_division_coordinate` VALUES ('769', '穆棱市', '231085', '231000', '44.924785', '130.530559');
INSERT INTO `t_sys_division_coordinate` VALUES ('770', '东宁市', '231086', '231000', '44.096101', '131.131544');
INSERT INTO `t_sys_division_coordinate` VALUES ('771', '黑河市', '231100', '230000', '50.251272', '127.53549');
INSERT INTO `t_sys_division_coordinate` VALUES ('772', '爱辉区', '231102', '231100', '50.25771', '127.506632');
INSERT INTO `t_sys_division_coordinate` VALUES ('773', '嫩江县', '231121', '231100', '49.19132', '125.227635');
INSERT INTO `t_sys_division_coordinate` VALUES ('774', '逊克县', '231123', '231100', '49.569491', '128.485585');
INSERT INTO `t_sys_division_coordinate` VALUES ('775', '孙吴县', '231124', '231100', '49.431451', '127.342388');
INSERT INTO `t_sys_division_coordinate` VALUES ('776', '北安市', '231181', '231100', '48.24742', '126.49738');
INSERT INTO `t_sys_division_coordinate` VALUES ('777', '五大连池市', '231182', '231100', '48.52261', '126.211555');
INSERT INTO `t_sys_division_coordinate` VALUES ('778', '绥化市', '231200', '230000', '46.660032', '126.975357');
INSERT INTO `t_sys_division_coordinate` VALUES ('779', '北林区', '231202', '231200', '46.643493', '126.991449');
INSERT INTO `t_sys_division_coordinate` VALUES ('780', '望奎县', '231221', '231200', '46.839168', '126.492385');
INSERT INTO `t_sys_division_coordinate` VALUES ('781', '兰西县', '231222', '231200', '46.258095', '126.29462');
INSERT INTO `t_sys_division_coordinate` VALUES ('782', '青冈县', '231223', '231200', '46.710685', '126.100489');
INSERT INTO `t_sys_division_coordinate` VALUES ('783', '庆安县', '231224', '231200', '46.885744', '127.514612');
INSERT INTO `t_sys_division_coordinate` VALUES ('784', '明水县', '231225', '231200', '47.179483', '125.912483');
INSERT INTO `t_sys_division_coordinate` VALUES ('785', '绥棱县', '231226', '231200', '47.242516', '127.120515');
INSERT INTO `t_sys_division_coordinate` VALUES ('786', '安达市', '231281', '231200', '46.425719', '125.348622');
INSERT INTO `t_sys_division_coordinate` VALUES ('787', '肇东市', '231282', '231200', '46.056938', '125.968537');
INSERT INTO `t_sys_division_coordinate` VALUES ('788', '海伦市', '231283', '231200', '47.456904', '126.936509');
INSERT INTO `t_sys_division_coordinate` VALUES ('789', '大兴安岭地区', '232700', '230000', '52.510947', '123.644559');
INSERT INTO `t_sys_division_coordinate` VALUES ('790', '呼玛县', '232721', '232700', '51.730947', '126.65965');
INSERT INTO `t_sys_division_coordinate` VALUES ('791', '塔河县', '232722', '232700', '52.340305', '124.716513');
INSERT INTO `t_sys_division_coordinate` VALUES ('792', '漠河县', '232723', '232700', '52.978304', '122.545421');
INSERT INTO `t_sys_division_coordinate` VALUES ('793', '上海市', '310000', '0', '31.235929', '121.480539');
INSERT INTO `t_sys_division_coordinate` VALUES ('794', '市辖区', '310100', '310000', '31.235929', '121.480539');
INSERT INTO `t_sys_division_coordinate` VALUES ('795', '黄浦区', '310101', '310100', '31.237247', '121.491586');
INSERT INTO `t_sys_division_coordinate` VALUES ('796', '徐汇区', '310104', '310100', '31.194557', '121.443396');
INSERT INTO `t_sys_division_coordinate` VALUES ('797', '长宁区', '310105', '310100', '31.226848', '121.430454');
INSERT INTO `t_sys_division_coordinate` VALUES ('798', '静安区', '310106', '310100', '31.233845', '121.453432');
INSERT INTO `t_sys_division_coordinate` VALUES ('799', '普陀区', '310107', '310100', '31.254973', '121.403569');
INSERT INTO `t_sys_division_coordinate` VALUES ('800', '虹口区', '310109', '310100', '31.269747', '121.511586');
INSERT INTO `t_sys_division_coordinate` VALUES ('801', '杨浦区', '310110', '310100', '31.265524', '121.53252');
INSERT INTO `t_sys_division_coordinate` VALUES ('802', '闵行区', '310112', '310100', '31.118843', '121.388612');
INSERT INTO `t_sys_division_coordinate` VALUES ('803', '宝山区', '310000', '310100', '31.410279', '121.496563');
INSERT INTO `t_sys_division_coordinate` VALUES ('804', '嘉定区', '310114', '310100', '31.380155', '121.272595');
INSERT INTO `t_sys_division_coordinate` VALUES ('805', '浦东新区', '310115', '310100', '31.227348', '121.550455');
INSERT INTO `t_sys_division_coordinate` VALUES ('806', '金山区', '310116', '310100', '30.747852', '121.34848');
INSERT INTO `t_sys_division_coordinate` VALUES ('807', '松江区', '310117', '310100', '31.037135', '121.23448');
INSERT INTO `t_sys_division_coordinate` VALUES ('808', '青浦区', '310118', '310100', '31.155454', '121.130553');
INSERT INTO `t_sys_division_coordinate` VALUES ('809', '奉贤区', '310120', '310100', '30.92372', '121.480504');
INSERT INTO `t_sys_division_coordinate` VALUES ('810', '崇明区', '310151', '310100', '31.62857', '121.403557');
INSERT INTO `t_sys_division_coordinate` VALUES ('811', '江苏省', '320000', '0', '32.066777', '118.769552');
INSERT INTO `t_sys_division_coordinate` VALUES ('812', '南京市', '320100', '320000', '32.064653', '118.802422');
INSERT INTO `t_sys_division_coordinate` VALUES ('813', '玄武区', '320102', '320100', '32.054757', '118.804413');
INSERT INTO `t_sys_division_coordinate` VALUES ('814', '秦淮区', '320104', '320100', '32.045139', '118.800407');
INSERT INTO `t_sys_division_coordinate` VALUES ('815', '建邺区', '320105', '320100', '32.00937', '118.738569');
INSERT INTO `t_sys_division_coordinate` VALUES ('816', '鼓楼区', '320106', '320100', '32.072405', '118.776519');
INSERT INTO `t_sys_division_coordinate` VALUES ('817', '浦口区', '320111', '320100', '32.064679', '118.634604');
INSERT INTO `t_sys_division_coordinate` VALUES ('818', '栖霞区', '320113', '320100', '32.1026', '118.915423');
INSERT INTO `t_sys_division_coordinate` VALUES ('819', '雨花台区', '320114', '320100', '31.997859', '118.785445');
INSERT INTO `t_sys_division_coordinate` VALUES ('820', '江宁区', '320115', '320100', '31.958527', '118.846567');
INSERT INTO `t_sys_division_coordinate` VALUES ('821', '六合区', '320116', '320100', '32.328666', '118.827471');
INSERT INTO `t_sys_division_coordinate` VALUES ('822', '溧水区', '320117', '320100', '31.657284', '119.034404');
INSERT INTO `t_sys_division_coordinate` VALUES ('823', '高淳区', '320118', '320100', '31.333639', '118.898498');
INSERT INTO `t_sys_division_coordinate` VALUES ('824', '无锡市', '320200', '320000', '31.49881', '120.318583');
INSERT INTO `t_sys_division_coordinate` VALUES ('825', '锡山区', '320205', '320200', '31.594762', '120.363426');
INSERT INTO `t_sys_division_coordinate` VALUES ('826', '惠山区', '320206', '320200', '31.686741', '120.304596');
INSERT INTO `t_sys_division_coordinate` VALUES ('827', '滨湖区', '320211', '320200', '31.53464', '120.291548');
INSERT INTO `t_sys_division_coordinate` VALUES ('828', '梁溪区', '320213', '320200', '31.571645', '120.3096');
INSERT INTO `t_sys_division_coordinate` VALUES ('829', '新吴区', '320214', '320200', '31.55485', '120.370396');
INSERT INTO `t_sys_division_coordinate` VALUES ('830', '江阴市', '320281', '320200', '31.55485', '120.370396');
INSERT INTO `t_sys_division_coordinate` VALUES ('831', '宜兴市', '320282', '320200', '31.342957', '119.831606');
INSERT INTO `t_sys_division_coordinate` VALUES ('832', '徐州市', '320300', '320000', '34.212667', '117.290575');
INSERT INTO `t_sys_division_coordinate` VALUES ('833', '鼓楼区', '320302', '320300', '34.29376', '117.192579');
INSERT INTO `t_sys_division_coordinate` VALUES ('834', '云龙区', '320303', '320300', '34.259087', '117.258424');
INSERT INTO `t_sys_division_coordinate` VALUES ('835', '贾汪区', '320305', '320300', '34.44162', '117.46943');
INSERT INTO `t_sys_division_coordinate` VALUES ('836', '泉山区', '320311', '320300', '34.249943', '117.20059');
INSERT INTO `t_sys_division_coordinate` VALUES ('837', '铜山区', '320312', '320300', '34.1861', '117.17557');
INSERT INTO `t_sys_division_coordinate` VALUES ('838', '丰县', '320321', '320300', '34.69977', '116.602582');
INSERT INTO `t_sys_division_coordinate` VALUES ('839', '沛县', '320322', '320300', '34.765152', '116.942586');
INSERT INTO `t_sys_division_coordinate` VALUES ('840', '睢宁县', '320324', '320300', '33.918789', '117.947433');
INSERT INTO `t_sys_division_coordinate` VALUES ('841', '新沂市', '320381', '320300', '34.375611', '118.361537');
INSERT INTO `t_sys_division_coordinate` VALUES ('842', '邳州市', '320382', '320300', '34.339753', '117.963411');
INSERT INTO `t_sys_division_coordinate` VALUES ('843', '常州市', '320400', '320000', '31.815796', '119.981485');
INSERT INTO `t_sys_division_coordinate` VALUES ('844', '天宁区', '320402', '320400', '31.78557', '119.980463');
INSERT INTO `t_sys_division_coordinate` VALUES ('845', '钟楼区', '320404', '320400', '31.807647', '119.908463');
INSERT INTO `t_sys_division_coordinate` VALUES ('846', '新北区', '320411', '320400', '31.836324', '119.977514');
INSERT INTO `t_sys_division_coordinate` VALUES ('847', '武进区', '320412', '320400', '31.706447', '119.948612');
INSERT INTO `t_sys_division_coordinate` VALUES ('848', '金坛区', '320413', '320400', '31.728893', '119.604571');
INSERT INTO `t_sys_division_coordinate` VALUES ('849', '溧阳市', '320481', '320400', '31.422102', '119.491506');
INSERT INTO `t_sys_division_coordinate` VALUES ('850', '苏州市', '320500', '320000', '31.303564', '120.592412');
INSERT INTO `t_sys_division_coordinate` VALUES ('851', '虎丘区', '320505', '320500', '31.301933', '120.578472');
INSERT INTO `t_sys_division_coordinate` VALUES ('852', '吴中区', '320506', '320500', '31.268261', '120.638508');
INSERT INTO `t_sys_division_coordinate` VALUES ('853', '相城区', '320507', '320500', '31.37469', '120.648566');
INSERT INTO `t_sys_division_coordinate` VALUES ('854', '姑苏区', '320508', '320500', '31.341831', '120.623455');
INSERT INTO `t_sys_division_coordinate` VALUES ('855', '吴江区', '320509', '320500', '31.144644', '120.651567');
INSERT INTO `t_sys_division_coordinate` VALUES ('856', '常熟市', '320581', '320500', '31.659538', '120.759496');
INSERT INTO `t_sys_division_coordinate` VALUES ('857', '张家港市', '320582', '320500', '31.881141', '120.561554');
INSERT INTO `t_sys_division_coordinate` VALUES ('858', '昆山市', '320583', '320500', '31.390863', '120.987452');
INSERT INTO `t_sys_division_coordinate` VALUES ('859', '太仓市', '320585', '320500', '31.464599', '121.135595');
INSERT INTO `t_sys_division_coordinate` VALUES ('860', '南通市', '320600', '320000', '31.986549', '120.901592');
INSERT INTO `t_sys_division_coordinate` VALUES ('861', '崇川区', '320602', '320600', '32.015923', '120.86342');
INSERT INTO `t_sys_division_coordinate` VALUES ('862', '港闸区', '320611', '320600', '32.037345', '120.824452');
INSERT INTO `t_sys_division_coordinate` VALUES ('863', '通州区', '320612', '320600', '32.070356', '121.081425');
INSERT INTO `t_sys_division_coordinate` VALUES ('864', '海安县', '320621', '320600', '32.539196', '120.474433');
INSERT INTO `t_sys_division_coordinate` VALUES ('865', '如东县', '320623', '320600', '32.335873', '121.192438');
INSERT INTO `t_sys_division_coordinate` VALUES ('866', '启东市', '320681', '320600', '31.814233', '121.663474');
INSERT INTO `t_sys_division_coordinate` VALUES ('867', '如皋市', '320682', '320600', '32.377851', '120.579466');
INSERT INTO `t_sys_division_coordinate` VALUES ('868', '海门市', '320684', '320600', '31.873612', '121.188436');
INSERT INTO `t_sys_division_coordinate` VALUES ('869', '连云港市', '320700', '320000', '34.60225', '119.228621');
INSERT INTO `t_sys_division_coordinate` VALUES ('870', '连云区', '320703', '320700', '34.765337', '119.346588');
INSERT INTO `t_sys_division_coordinate` VALUES ('871', '海州区', '320706', '320700', '34.577456', '119.169408');
INSERT INTO `t_sys_division_coordinate` VALUES ('872', '赣榆区', '320707', '320700', '34.847682', '119.179435');
INSERT INTO `t_sys_division_coordinate` VALUES ('873', '东海县', '320722', '320700', '34.547919', '118.759565');
INSERT INTO `t_sys_division_coordinate` VALUES ('874', '灌云县', '320723', '320700', '34.288616', '119.246534');
INSERT INTO `t_sys_division_coordinate` VALUES ('875', '灌南县', '320724', '320700', '34.092591', '119.322538');
INSERT INTO `t_sys_division_coordinate` VALUES ('876', '淮安市', '320800', '320000', '33.616295', '119.021484');
INSERT INTO `t_sys_division_coordinate` VALUES ('877', '淮安区', '320803', '320800', '33.509', '119.147463');
INSERT INTO `t_sys_division_coordinate` VALUES ('878', '淮阴区', '320804', '320800', '33.63815', '119.041422');
INSERT INTO `t_sys_division_coordinate` VALUES ('879', '清江浦区', '320812', '320800', '33.558562', '119.032414');
INSERT INTO `t_sys_division_coordinate` VALUES ('880', '洪泽区', '320813', '320800', '33.299625', '118.879584');
INSERT INTO `t_sys_division_coordinate` VALUES ('881', '涟水县', '320826', '320800', '33.787079', '119.266448');
INSERT INTO `t_sys_division_coordinate` VALUES ('882', '盱眙县', '320830', '320800', '33.018255', '118.551441');
INSERT INTO `t_sys_division_coordinate` VALUES ('883', '金湖县', '320831', '320800', '33.031284', '119.026469');
INSERT INTO `t_sys_division_coordinate` VALUES ('884', '盐城市', '320900', '320000', '33.355101', '120.167544');
INSERT INTO `t_sys_division_coordinate` VALUES ('885', '亭湖区', '320902', '320900', '33.395893', '120.204578');
INSERT INTO `t_sys_division_coordinate` VALUES ('886', '盐都区', '320903', '320900', '33.34402', '120.160503');
INSERT INTO `t_sys_division_coordinate` VALUES ('887', '大丰区', '320904', '320900', '33.20476', '120.507439');
INSERT INTO `t_sys_division_coordinate` VALUES ('888', '响水县', '320921', '320900', '34.204743', '119.584601');
INSERT INTO `t_sys_division_coordinate` VALUES ('889', '滨海县', '320922', '320900', '33.995647', '119.827621');
INSERT INTO `t_sys_division_coordinate` VALUES ('890', '阜宁县', '320923', '320900', '33.765079', '119.809581');
INSERT INTO `t_sys_division_coordinate` VALUES ('891', '射阳县', '320924', '320900', '33.781014', '120.264446');
INSERT INTO `t_sys_division_coordinate` VALUES ('892', '建湖县', '320925', '320900', '33.469833', '119.805531');
INSERT INTO `t_sys_division_coordinate` VALUES ('893', '东台市', '320981', '320900', '32.872716', '120.326537');
INSERT INTO `t_sys_division_coordinate` VALUES ('894', '扬州市', '321000', '320000', '32.400677', '119.419419');
INSERT INTO `t_sys_division_coordinate` VALUES ('895', '广陵区', '321002', '321000', '32.400661', '119.438505');
INSERT INTO `t_sys_division_coordinate` VALUES ('896', '邗江区', '321003', '321000', '32.382751', '119.404385');
INSERT INTO `t_sys_division_coordinate` VALUES ('897', '江都区', '321012', '321000', '32.440295', '119.576603');
INSERT INTO `t_sys_division_coordinate` VALUES ('898', '宝应县', '321023', '321000', '33.247205', '119.365556');
INSERT INTO `t_sys_division_coordinate` VALUES ('899', '仪征市', '321081', '321000', '32.27809', '119.191467');
INSERT INTO `t_sys_division_coordinate` VALUES ('900', '高邮市', '321084', '321000', '32.787147', '119.465616');
INSERT INTO `t_sys_division_coordinate` VALUES ('901', '镇江市', '321100', '320000', '32.194716', '119.430489');
INSERT INTO `t_sys_division_coordinate` VALUES ('902', '京口区', '321102', '321100', '32.203785', '119.475604');
INSERT INTO `t_sys_division_coordinate` VALUES ('903', '润州区', '321111', '321100', '32.201495', '119.41844');
INSERT INTO `t_sys_division_coordinate` VALUES ('904', '丹徒区', '321112', '321100', '32.13792', '119.440501');
INSERT INTO `t_sys_division_coordinate` VALUES ('905', '丹阳市', '321181', '321100', '32.01592', '119.612501');
INSERT INTO `t_sys_division_coordinate` VALUES ('906', '扬中市', '321182', '321100', '32.242967', '119.80352');
INSERT INTO `t_sys_division_coordinate` VALUES ('907', '句容市', '321183', '321100', '31.950923', '119.175433');
INSERT INTO `t_sys_division_coordinate` VALUES ('908', '泰州市', '321200', '320000', '32.460675', '119.929566');
INSERT INTO `t_sys_division_coordinate` VALUES ('909', '海陵区', '321202', '321200', '32.496732', '119.925525');
INSERT INTO `t_sys_division_coordinate` VALUES ('910', '高港区', '321203', '321200', '32.324862', '119.888421');
INSERT INTO `t_sys_division_coordinate` VALUES ('911', '姜堰区', '321204', '321200', '32.515234', '120.133398');
INSERT INTO `t_sys_division_coordinate` VALUES ('912', '兴化市', '321281', '321200', '32.917824', '119.857514');
INSERT INTO `t_sys_division_coordinate` VALUES ('913', '靖江市', '321282', '321200', '31.98817', '120.283532');
INSERT INTO `t_sys_division_coordinate` VALUES ('914', '泰兴市', '321283', '321200', '32.177474', '120.058599');
INSERT INTO `t_sys_division_coordinate` VALUES ('915', '宿迁市', '321300', '320000', '33.96775', '118.281574');
INSERT INTO `t_sys_division_coordinate` VALUES ('916', '宿城区', '321302', '321300', '33.968678', '118.249567');
INSERT INTO `t_sys_division_coordinate` VALUES ('917', '宿豫区', '321311', '321300', '33.954804', '118.336401');
INSERT INTO `t_sys_division_coordinate` VALUES ('918', '沭阳县', '321322', '321300', '34.117454', '118.810419');
INSERT INTO `t_sys_division_coordinate` VALUES ('919', '泗阳县', '321323', '321300', '33.728328', '118.709466');
INSERT INTO `t_sys_division_coordinate` VALUES ('920', '泗洪县', '321324', '321300', '33.465733', '118.222416');
INSERT INTO `t_sys_division_coordinate` VALUES ('921', '浙江省', '330000', '0', '30.271548', '120.159533');
INSERT INTO `t_sys_division_coordinate` VALUES ('922', '杭州市', '330100', '330000', '30.253083', '120.215512');
INSERT INTO `t_sys_division_coordinate` VALUES ('923', '上城区', '330102', '330100', '30.248398', '120.175579');
INSERT INTO `t_sys_division_coordinate` VALUES ('924', '下城区', '330103', '330100', '30.286744', '120.187607');
INSERT INTO `t_sys_division_coordinate` VALUES ('925', '江干区', '330104', '330100', '30.263311', '120.211539');
INSERT INTO `t_sys_division_coordinate` VALUES ('926', '拱墅区', '330105', '330100', '30.324643', '120.148447');
INSERT INTO `t_sys_division_coordinate` VALUES ('927', '西湖区', '330106', '330100', '30.265916', '120.136438');
INSERT INTO `t_sys_division_coordinate` VALUES ('928', '滨江区', '330108', '330100', '30.214333', '120.218471');
INSERT INTO `t_sys_division_coordinate` VALUES ('929', '萧山区', '330109', '330100', '30.214333', '120.218471');
INSERT INTO `t_sys_division_coordinate` VALUES ('930', '余杭区', '330110', '330100', '30.424739', '120.306592');
INSERT INTO `t_sys_division_coordinate` VALUES ('931', '富阳区', '330111', '330100', '30.054723', '119.966556');
INSERT INTO `t_sys_division_coordinate` VALUES ('932', '桐庐县', '330122', '330100', '29.798585', '119.697599');
INSERT INTO `t_sys_division_coordinate` VALUES ('933', '淳安县', '330127', '330100', '29.61495', '119.048392');
INSERT INTO `t_sys_division_coordinate` VALUES ('934', '建德市', '330182', '330100', '29.481154', '119.287398');
INSERT INTO `t_sys_division_coordinate` VALUES ('935', '临安市', '330185', '330100', '30.239806', '119.731517');
INSERT INTO `t_sys_division_coordinate` VALUES ('936', '宁波市', '330200', '330000', '29.866033', '121.628572');
INSERT INTO `t_sys_division_coordinate` VALUES ('937', '海曙区', '330203', '330200', '29.865721', '121.557403');
INSERT INTO `t_sys_division_coordinate` VALUES ('938', '江东区', '330204', '330200', '29.8733', '121.576533');
INSERT INTO `t_sys_division_coordinate` VALUES ('939', '江北区', '330205', '330200', '29.892948', '121.560421');
INSERT INTO `t_sys_division_coordinate` VALUES ('940', '北仑区', '330206', '330200', '29.904659', '121.850576');
INSERT INTO `t_sys_division_coordinate` VALUES ('941', '镇海区', '330211', '330200', '29.954885', '121.722519');
INSERT INTO `t_sys_division_coordinate` VALUES ('942', '鄞州区', '330212', '330200', '29.824206', '121.555427');
INSERT INTO `t_sys_division_coordinate` VALUES ('943', '象山县', '330225', '330200', '29.482271', '121.875564');
INSERT INTO `t_sys_division_coordinate` VALUES ('944', '宁海县', '330226', '330200', '29.294317', '121.436432');
INSERT INTO `t_sys_division_coordinate` VALUES ('945', '余姚市', '330281', '330200', '30.042735', '121.160585');
INSERT INTO `t_sys_division_coordinate` VALUES ('946', '慈溪市', '330282', '330200', '30.175257', '121.272596');
INSERT INTO `t_sys_division_coordinate` VALUES ('947', '奉化市', '330283', '330200', '29.661146', '121.413528');
INSERT INTO `t_sys_division_coordinate` VALUES ('948', '温州市', '330300', '330000', '28.001085', '120.706477');
INSERT INTO `t_sys_division_coordinate` VALUES ('949', '鹿城区', '330302', '330300', '28.020352', '120.661586');
INSERT INTO `t_sys_division_coordinate` VALUES ('950', '龙湾区', '330303', '330300', '27.938652', '120.819468');
INSERT INTO `t_sys_division_coordinate` VALUES ('951', '瓯海区', '330304', '330300', '27.972857', '120.621447');
INSERT INTO `t_sys_division_coordinate` VALUES ('952', '洞头区', '330305', '330300', '27.84187', '121.163549');
INSERT INTO `t_sys_division_coordinate` VALUES ('953', '永嘉县', '330324', '330300', '28.15645', '120.688524');
INSERT INTO `t_sys_division_coordinate` VALUES ('954', '平阳县', '330326', '330300', '27.667724', '120.572515');
INSERT INTO `t_sys_division_coordinate` VALUES ('955', '苍南县', '330327', '330300', '27.523067', '120.433595');
INSERT INTO `t_sys_division_coordinate` VALUES ('956', '文成县', '330328', '330300', '27.793217', '120.097488');
INSERT INTO `t_sys_division_coordinate` VALUES ('957', '泰顺县', '330329', '330300', '27.562171', '119.723537');
INSERT INTO `t_sys_division_coordinate` VALUES ('958', '瑞安市', '330381', '330300', '27.783951', '120.661582');
INSERT INTO `t_sys_division_coordinate` VALUES ('959', '乐清市', '330382', '330300', '28.11818', '120.992502');
INSERT INTO `t_sys_division_coordinate` VALUES ('960', '嘉兴市', '330400', '330000', '30.750975', '120.763552');
INSERT INTO `t_sys_division_coordinate` VALUES ('961', '南湖区', '330402', '330400', '30.751547', '120.78961');
INSERT INTO `t_sys_division_coordinate` VALUES ('962', '秀洲区', '330411', '330400', '30.770207', '120.715437');
INSERT INTO `t_sys_division_coordinate` VALUES ('963', '嘉善县', '330421', '330400', '30.837122', '120.932511');
INSERT INTO `t_sys_division_coordinate` VALUES ('964', '海盐县', '330424', '330400', '30.531873', '120.952445');
INSERT INTO `t_sys_division_coordinate` VALUES ('965', '海宁市', '330481', '330400', '30.517924', '120.686565');
INSERT INTO `t_sys_division_coordinate` VALUES ('966', '平湖市', '330482', '330400', '30.682241', '121.022575');
INSERT INTO `t_sys_division_coordinate` VALUES ('967', '桐乡市', '330483', '330400', '30.636311', '120.571543');
INSERT INTO `t_sys_division_coordinate` VALUES ('968', '湖州市', '330500', '330000', '30.898964', '120.094517');
INSERT INTO `t_sys_division_coordinate` VALUES ('969', '吴兴区', '330502', '330500', '30.862955', '120.191605');
INSERT INTO `t_sys_division_coordinate` VALUES ('970', '南浔区', '330503', '330500', '30.855243', '120.424601');
INSERT INTO `t_sys_division_coordinate` VALUES ('971', '德清县', '330521', '330500', '30.548628', '119.983465');
INSERT INTO `t_sys_division_coordinate` VALUES ('972', '长兴县', '330522', '330500', '31.032579', '119.917498');
INSERT INTO `t_sys_division_coordinate` VALUES ('973', '安吉县', '330523', '330500', '30.644425', '119.686563');
INSERT INTO `t_sys_division_coordinate` VALUES ('974', '绍兴市', '330600', '330000', '30.036369', '120.585478');
INSERT INTO `t_sys_division_coordinate` VALUES ('975', '越城区', '330602', '330600', '29.99531', '120.588437');
INSERT INTO `t_sys_division_coordinate` VALUES ('976', '柯桥区', '330603', '330600', '30.079004', '120.451511');
INSERT INTO `t_sys_division_coordinate` VALUES ('977', '上虞区', '330604', '330600', '30.038243', '120.87451');
INSERT INTO `t_sys_division_coordinate` VALUES ('978', '新昌县', '330624', '330600', '29.505541', '120.91057');
INSERT INTO `t_sys_division_coordinate` VALUES ('979', '诸暨市', '330681', '330600', '29.714935', '120.253408');
INSERT INTO `t_sys_division_coordinate` VALUES ('980', '嵊州市', '330683', '330600', '29.567327', '120.837437');
INSERT INTO `t_sys_division_coordinate` VALUES ('981', '金华市', '330700', '330000', '29.084639', '119.653436');
INSERT INTO `t_sys_division_coordinate` VALUES ('982', '婺城区', '330702', '330700', '29.091775', '119.578593');
INSERT INTO `t_sys_division_coordinate` VALUES ('983', '金东区', '330703', '330700', '29.104765', '119.699582');
INSERT INTO `t_sys_division_coordinate` VALUES ('984', '武义县', '330723', '330700', '28.898244', '119.822566');
INSERT INTO `t_sys_division_coordinate` VALUES ('985', '浦江县', '330726', '330700', '29.458693', '119.898436');
INSERT INTO `t_sys_division_coordinate` VALUES ('986', '磐安县', '330727', '330700', '29.060103', '120.456513');
INSERT INTO `t_sys_division_coordinate` VALUES ('987', '兰溪市', '330781', '330700', '29.214044', '119.466599');
INSERT INTO `t_sys_division_coordinate` VALUES ('988', '义乌市', '330782', '330700', '29.31115', '120.081581');
INSERT INTO `t_sys_division_coordinate` VALUES ('989', '东阳市', '330783', '330700', '29.295861', '120.248422');
INSERT INTO `t_sys_division_coordinate` VALUES ('990', '永康市', '330784', '330700', '28.894204', '120.054551');
INSERT INTO `t_sys_division_coordinate` VALUES ('991', '衢州市', '330800', '330000', '28.975546', '118.866597');
INSERT INTO `t_sys_division_coordinate` VALUES ('992', '柯城区', '330802', '330800', '28.974204', '118.877584');
INSERT INTO `t_sys_division_coordinate` VALUES ('993', '衢江区', '330803', '330800', '28.986238', '118.965539');
INSERT INTO `t_sys_division_coordinate` VALUES ('994', '常山县', '330822', '330800', '28.906998', '118.517557');
INSERT INTO `t_sys_division_coordinate` VALUES ('995', '开化县', '330824', '330800', '29.143188', '118.421459');
INSERT INTO `t_sys_division_coordinate` VALUES ('996', '龙游县', '330825', '330800', '29.034487', '119.178418');
INSERT INTO `t_sys_division_coordinate` VALUES ('997', '江山市', '330881', '330800', '28.742868', '118.633583');
INSERT INTO `t_sys_division_coordinate` VALUES ('998', '舟山市', '330900', '330000', '29.990912', '122.213556');
INSERT INTO `t_sys_division_coordinate` VALUES ('999', '定海区', '330902', '330900', '30.025462', '122.113601');
INSERT INTO `t_sys_division_coordinate` VALUES ('1000', '普陀区', '330903', '330900', '29.976836', '122.331544');
INSERT INTO `t_sys_division_coordinate` VALUES ('1001', '岱山县', '330921', '330900', '30.269656', '122.232605');
INSERT INTO `t_sys_division_coordinate` VALUES ('1002', '嵊泗县', '330922', '330900', '30.731274', '122.457588');
INSERT INTO `t_sys_division_coordinate` VALUES ('1003', '台州市', '331000', '330000', '28.662194', '121.427435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1004', '椒江区', '331002', '331000', '28.679258', '121.449408');
INSERT INTO `t_sys_division_coordinate` VALUES ('1005', '黄岩区', '331003', '331000', '28.655334', '121.268566');
INSERT INTO `t_sys_division_coordinate` VALUES ('1006', '路桥区', '331004', '331000', '28.586947', '121.371578');
INSERT INTO `t_sys_division_coordinate` VALUES ('1007', '玉环县', '331021', '331000', '28.141863', '121.238513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1008', '三门县', '331022', '331000', '29.110355', '121.402554');
INSERT INTO `t_sys_division_coordinate` VALUES ('1009', '天台县', '331023', '331000', '29.149514', '121.013553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1010', '仙居县', '331024', '331000', '28.853226', '120.735435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1011', '温岭市', '331081', '331000', '28.377655', '121.392589');
INSERT INTO `t_sys_division_coordinate` VALUES ('1012', '临海市', '331082', '331000', '28.864049', '121.151585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1013', '丽水市', '331100', '330000', '28.473278', '119.929573');
INSERT INTO `t_sys_division_coordinate` VALUES ('1014', '莲都区', '331102', '331100', '28.451745', '119.919519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1015', '青田县', '331121', '331100', '28.145488', '120.296573');
INSERT INTO `t_sys_division_coordinate` VALUES ('1016', '缙云县', '331122', '331100', '28.665215', '120.097478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1017', '遂昌县', '331123', '331100', '28.598455', '119.282435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1018', '松阳县', '331124', '331100', '28.455056', '119.488544');
INSERT INTO `t_sys_division_coordinate` VALUES ('1019', '云和县', '331125', '331100', '28.12147', '119.579597');
INSERT INTO `t_sys_division_coordinate` VALUES ('1020', '庆元县', '331126', '331100', '27.625432', '119.069487');
INSERT INTO `t_sys_division_coordinate` VALUES ('1021', '景宁畲族自治县', '331127', '331100', '27.979554', '119.64243');
INSERT INTO `t_sys_division_coordinate` VALUES ('1022', '龙泉市', '331181', '331100', '28.080509', '119.148445');
INSERT INTO `t_sys_division_coordinate` VALUES ('1023', '安徽省', '340000', '0', '31.734294', '117.33054');
INSERT INTO `t_sys_division_coordinate` VALUES ('1024', '合肥市', '340100', '340000', '31.826578', '117.233443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1025', '瑶海区', '340102', '340100', '31.863787', '117.315587');
INSERT INTO `t_sys_division_coordinate` VALUES ('1026', '庐阳区', '340103', '340100', '31.884887', '117.271459');
INSERT INTO `t_sys_division_coordinate` VALUES ('1027', '蜀山区', '340104', '340100', '31.857378', '117.266461');
INSERT INTO `t_sys_division_coordinate` VALUES ('1028', '包河区', '340111', '340100', '31.799293', '117.316576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1029', '长丰县', '340121', '340100', '32.483723', '117.17356');
INSERT INTO `t_sys_division_coordinate` VALUES ('1030', '肥东县', '340122', '340100', '31.89389', '117.475401');
INSERT INTO `t_sys_division_coordinate` VALUES ('1031', '肥西县', '340123', '340100', '31.712962', '117.164558');
INSERT INTO `t_sys_division_coordinate` VALUES ('1032', '庐江县', '340124', '340100', '31.261328', '117.293577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1033', '巢湖市', '340181', '340100', '31.629002', '117.895576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1034', '芜湖市', '340200', '340000', '31.358537', '118.439431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1035', '镜湖区', '340202', '340200', '31.345867', '118.392606');
INSERT INTO `t_sys_division_coordinate` VALUES ('1036', '弋江区', '340203', '340200', '31.317566', '118.37958');
INSERT INTO `t_sys_division_coordinate` VALUES ('1037', '鸠江区', '340207', '340200', '31.375805', '118.397588');
INSERT INTO `t_sys_division_coordinate` VALUES ('1038', '三山区', '340208', '340200', '31.22528', '118.274602');
INSERT INTO `t_sys_division_coordinate` VALUES ('1039', '芜湖县', '340221', '340200', '31.141239', '118.582443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1040', '繁昌县', '340222', '340200', '31.107959', '118.205424');
INSERT INTO `t_sys_division_coordinate` VALUES ('1041', '南陵县', '340223', '340200', '30.92026', '118.340418');
INSERT INTO `t_sys_division_coordinate` VALUES ('1042', '无为县', '340225', '340200', '31.340204', '118.071407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1043', '蚌埠市', '340300', '340000', '32.921524', '117.395513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1044', '龙子湖区', '340302', '340300', '32.948644', '117.399513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1045', '蚌山区', '340303', '340300', '32.923379', '117.379441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1046', '禹会区', '340304', '340300', '32.93531', '117.348452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1047', '淮上区', '340311', '340300', '32.970547', '117.366383');
INSERT INTO `t_sys_division_coordinate` VALUES ('1048', '怀远县', '340321', '340300', '32.976004', '117.211506');
INSERT INTO `t_sys_division_coordinate` VALUES ('1049', '五河县', '340322', '340300', '33.132709', '117.887561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1050', '固镇县', '340323', '340300', '33.323274', '117.323548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1051', '淮南市', '340400', '340000', '32.631847', '117.006389');
INSERT INTO `t_sys_division_coordinate` VALUES ('1052', '大通区', '340402', '340400', '32.63727', '117.059583');
INSERT INTO `t_sys_division_coordinate` VALUES ('1053', '田家庵区', '340403', '340400', '32.653323', '117.023445');
INSERT INTO `t_sys_division_coordinate` VALUES ('1054', '谢家集区', '340404', '340400', '32.606255', '116.865439');
INSERT INTO `t_sys_division_coordinate` VALUES ('1055', '八公山区', '340405', '340400', '32.637137', '116.840564');
INSERT INTO `t_sys_division_coordinate` VALUES ('1056', '潘集区', '340406', '340400', '32.777955', '116.841581');
INSERT INTO `t_sys_division_coordinate` VALUES ('1057', '凤台县', '340421', '340400', '32.715104', '116.717573');
INSERT INTO `t_sys_division_coordinate` VALUES ('1058', '寿县', '340422', '340400', '32.561546', '116.805563');
INSERT INTO `t_sys_division_coordinate` VALUES ('1059', '马鞍山市', '340500', '340000', '31.676266', '118.51358');
INSERT INTO `t_sys_division_coordinate` VALUES ('1060', '花山区', '340503', '340500', '31.725473', '118.499606');
INSERT INTO `t_sys_division_coordinate` VALUES ('1061', '雨山区', '340504', '340500', '31.687745', '118.505597');
INSERT INTO `t_sys_division_coordinate` VALUES ('1062', '博望区', '340506', '340500', '31.576649', '118.504605');
INSERT INTO `t_sys_division_coordinate` VALUES ('1063', '当涂县', '340521', '340500', '31.576649', '118.504605');
INSERT INTO `t_sys_division_coordinate` VALUES ('1064', '含山县', '340522', '340500', '31.740485', '118.129204');
INSERT INTO `t_sys_division_coordinate` VALUES ('1065', '和县', '340523', '340500', '31.748244', '118.359513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1066', '淮北市', '340600', '340000', '33.961656', '116.804537');
INSERT INTO `t_sys_division_coordinate` VALUES ('1067', '杜集区', '340602', '340600', '33.997285', '116.834612');
INSERT INTO `t_sys_division_coordinate` VALUES ('1068', '相山区', '340603', '340600', '33.965827', '116.800521');
INSERT INTO `t_sys_division_coordinate` VALUES ('1069', '烈山区', '340604', '340600', '33.901574', '116.819599');
INSERT INTO `t_sys_division_coordinate` VALUES ('1070', '濉溪县', '340621', '340600', '33.921629', '116.772389');
INSERT INTO `t_sys_division_coordinate` VALUES ('1071', '铜陵市', '340700', '340000', '30.951233', '117.818477');
INSERT INTO `t_sys_division_coordinate` VALUES ('1072', '铜官区', '340705', '340700', '30.940386', '117.821457');
INSERT INTO `t_sys_division_coordinate` VALUES ('1073', '义安区', '340706', '340700', '30.958512', '117.798568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1074', '郊区', '340711', '340700', '30.897741', '117.80755');
INSERT INTO `t_sys_division_coordinate` VALUES ('1075', '枞阳县', '340722', '340700', '30.705671', '117.226437');
INSERT INTO `t_sys_division_coordinate` VALUES ('1076', '安庆市', '340800', '340000', '30.530957', '117.063604');
INSERT INTO `t_sys_division_coordinate` VALUES ('1077', '迎江区', '340802', '340800', '30.517523', '117.097514');
INSERT INTO `t_sys_division_coordinate` VALUES ('1078', '大观区', '340803', '340800', '30.518232', '117.040538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1079', '宜秀区', '340811', '340800', '30.619676', '116.993441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1080', '怀宁县', '340822', '340800', '30.7394', '116.836593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1081', '潜山县', '340824', '340800', '30.636756', '116.587611');
INSERT INTO `t_sys_division_coordinate` VALUES ('1082', '太湖县', '340825', '340800', '30.460113', '116.315476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1083', '宿松县', '340826', '340800', '30.159787', '116.135524');
INSERT INTO `t_sys_division_coordinate` VALUES ('1084', '望江县', '340827', '340800', '30.129968', '116.70059');
INSERT INTO `t_sys_division_coordinate` VALUES ('1085', '岳西县', '340828', '340800', '30.855228', '116.366555');
INSERT INTO `t_sys_division_coordinate` VALUES ('1086', '桐城市', '340881', '340800', '31.041969', '116.980466');
INSERT INTO `t_sys_division_coordinate` VALUES ('1087', '黄山市', '341000', '340000', '29.72189', '118.345437');
INSERT INTO `t_sys_division_coordinate` VALUES ('1088', '屯溪区', '341002', '341000', '29.702144', '118.321418');
INSERT INTO `t_sys_division_coordinate` VALUES ('1089', '黄山区', '341003', '341000', '30.278651', '118.14761');
INSERT INTO `t_sys_division_coordinate` VALUES ('1090', '徽州区', '341004', '341000', '29.834221', '118.343436');
INSERT INTO `t_sys_division_coordinate` VALUES ('1091', '歙县', '341021', '341000', '29.866288', '118.42146');
INSERT INTO `t_sys_division_coordinate` VALUES ('1092', '休宁县', '341022', '341000', '29.795459', '118.20543');
INSERT INTO `t_sys_division_coordinate` VALUES ('1093', '黟县', '341023', '341000', '29.931047', '117.944477');
INSERT INTO `t_sys_division_coordinate` VALUES ('1094', '祁门县', '341024', '341000', '29.860344', '117.723393');
INSERT INTO `t_sys_division_coordinate` VALUES ('1095', '滁州市', '341100', '340000', '32.261271', '118.339406');
INSERT INTO `t_sys_division_coordinate` VALUES ('1096', '琅琊区', '341102', '341100', '32.300867', '118.312441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1097', '南谯区', '341103', '341100', '32.206132', '118.423482');
INSERT INTO `t_sys_division_coordinate` VALUES ('1098', '来安县', '341122', '341100', '32.45845', '118.442412');
INSERT INTO `t_sys_division_coordinate` VALUES ('1099', '全椒县', '341124', '341100', '32.09194', '118.280584');
INSERT INTO `t_sys_division_coordinate` VALUES ('1100', '定远县', '341125', '341100', '32.537047', '117.704471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1101', '凤阳县', '341126', '341100', '32.880977', '117.538585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1102', '天长市', '341181', '341100', '32.794116', '118.950489');
INSERT INTO `t_sys_division_coordinate` VALUES ('1103', '明光市', '341182', '341100', '32.783023', '117.99551');
INSERT INTO `t_sys_division_coordinate` VALUES ('1104', '阜阳市', '341200', '340000', '32.896061', '115.820436');
INSERT INTO `t_sys_division_coordinate` VALUES ('1105', '颍州区', '341202', '341200', '32.889625', '115.813411');
INSERT INTO `t_sys_division_coordinate` VALUES ('1106', '颍东区', '341203', '341200', '32.917362', '115.863617');
INSERT INTO `t_sys_division_coordinate` VALUES ('1107', '颍泉区', '341204', '341200', '32.931314', '115.815426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1108', '临泉县', '341221', '341200', '33.04596', '115.267616');
INSERT INTO `t_sys_division_coordinate` VALUES ('1109', '太和县', '341222', '341200', '33.16596', '115.628615');
INSERT INTO `t_sys_division_coordinate` VALUES ('1110', '阜南县', '341225', '341200', '32.664097', '115.602546');
INSERT INTO `t_sys_division_coordinate` VALUES ('1111', '颍上县', '341226', '341200', '32.659028', '116.263477');
INSERT INTO `t_sys_division_coordinate` VALUES ('1112', '界首市', '341282', '341200', '33.262775', '115.38061');
INSERT INTO `t_sys_division_coordinate` VALUES ('1113', '宿州市', '341300', '340000', '33.652095', '116.970544');
INSERT INTO `t_sys_division_coordinate` VALUES ('1114', '埇桥区', '341302', '341300', '33.646131', '116.98348');
INSERT INTO `t_sys_division_coordinate` VALUES ('1115', '砀山县', '341321', '341300', '34.448428', '116.372524');
INSERT INTO `t_sys_division_coordinate` VALUES ('1116', '萧县', '341322', '341300', '34.194269', '116.953585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1117', '灵璧县', '341323', '341300', '33.547892', '117.564557');
INSERT INTO `t_sys_division_coordinate` VALUES ('1118', '泗县', '341324', '341300', '33.488695', '117.91659');
INSERT INTO `t_sys_division_coordinate` VALUES ('1119', '六安市', '341500', '340000', '31.741451', '116.52641');
INSERT INTO `t_sys_division_coordinate` VALUES ('1120', '金安区', '341502', '341500', '31.756288', '116.545438');
INSERT INTO `t_sys_division_coordinate` VALUES ('1121', '裕安区', '341503', '341500', '31.743626', '116.48655');
INSERT INTO `t_sys_division_coordinate` VALUES ('1122', '叶集区', '341504', '341500', '31.835263', '115.947476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1123', '霍邱县', '341522', '341500', '31.835263', '115.947476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1124', '舒城县', '341523', '341500', '31.467692', '116.955602');
INSERT INTO `t_sys_division_coordinate` VALUES ('1125', '金寨县', '341524', '341500', '31.733462', '115.940441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1126', '霍山县', '341525', '341500', '31.398571', '116.339576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1127', '亳州市', '341600', '340000', '33.850643', '115.784463');
INSERT INTO `t_sys_division_coordinate` VALUES ('1128', '谯城区', '341602', '341600', '33.882663', '115.785472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1129', '涡阳县', '341621', '341600', '33.498567', '116.221609');
INSERT INTO `t_sys_division_coordinate` VALUES ('1130', '蒙城县', '341622', '341600', '33.271658', '116.571589');
INSERT INTO `t_sys_division_coordinate` VALUES ('1131', '利辛县', '341623', '341600', '33.155596', '116.191494');
INSERT INTO `t_sys_division_coordinate` VALUES ('1132', '池州市', '341700', '340000', '30.670884', '117.498421');
INSERT INTO `t_sys_division_coordinate` VALUES ('1133', '贵池区', '341702', '341700', '30.693858', '117.57449');
INSERT INTO `t_sys_division_coordinate` VALUES ('1134', '东至县', '341721', '341700', '30.116535', '117.034481');
INSERT INTO `t_sys_division_coordinate` VALUES ('1135', '石台县', '341722', '341700', '30.21653', '117.492394');
INSERT INTO `t_sys_division_coordinate` VALUES ('1136', '青阳县', '341723', '341700', '30.645634', '117.853431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1137', '宣城市', '341800', '340000', '30.946602', '118.765534');
INSERT INTO `t_sys_division_coordinate` VALUES ('1138', '宣州区', '341802', '341800', '30.952158', '118.762549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1139', '郎溪县', '341821', '341800', '31.132682', '119.186466');
INSERT INTO `t_sys_division_coordinate` VALUES ('1140', '广德县', '341822', '341800', '30.883667', '119.427476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1141', '泾县', '341823', '341800', '30.694672', '118.426435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1142', '绩溪县', '341824', '341800', '30.073292', '118.585444');
INSERT INTO `t_sys_division_coordinate` VALUES ('1143', '旌德县', '341825', '341800', '30.292481', '118.546467');
INSERT INTO `t_sys_division_coordinate` VALUES ('1144', '宁国市', '341881', '341800', '30.639352', '118.98961');
INSERT INTO `t_sys_division_coordinate` VALUES ('1145', '福建省', '350000', '0', '26.106339', '119.302447');
INSERT INTO `t_sys_division_coordinate` VALUES ('1146', '福州市', '350100', '350000', '26.080429', '119.30347');
INSERT INTO `t_sys_division_coordinate` VALUES ('1147', '鼓楼区', '350102', '350100', '26.088114', '119.310492');
INSERT INTO `t_sys_division_coordinate` VALUES ('1148', '台江区', '350103', '350100', '26.058528', '119.320528');
INSERT INTO `t_sys_division_coordinate` VALUES ('1149', '仓山区', '350104', '350100', '26.052842', '119.280432');
INSERT INTO `t_sys_division_coordinate` VALUES ('1150', '马尾区', '350105', '350100', '26.004534', '119.445519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1151', '晋安区', '350111', '350100', '26.087214', '119.334579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1152', '闽侯县', '350121', '350100', '26.156035', '119.138482');
INSERT INTO `t_sys_division_coordinate` VALUES ('1153', '连江县', '350122', '350100', '26.203583', '119.546479');
INSERT INTO `t_sys_division_coordinate` VALUES ('1154', '罗源县', '350123', '350100', '26.495496', '119.55648');
INSERT INTO `t_sys_division_coordinate` VALUES ('1155', '闽清县', '350124', '350100', '26.226848', '118.869577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1156', '永泰县', '350125', '350100', '25.872787', '118.938431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1157', '平潭县', '350128', '350100', '25.5047', '119.796501');
INSERT INTO `t_sys_division_coordinate` VALUES ('1158', '福清市', '350181', '350100', '25.726343', '119.390465');
INSERT INTO `t_sys_division_coordinate` VALUES ('1159', '长乐市', '350182', '350100', '25.969257', '119.529438');
INSERT INTO `t_sys_division_coordinate` VALUES ('1160', '厦门市', '350200', '350000', '24.485407', '118.096435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1161', '思明区', '350203', '350200', '24.451948', '118.088408');
INSERT INTO `t_sys_division_coordinate` VALUES ('1162', '海沧区', '350205', '350200', '24.490326', '118.039562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1163', '湖里区', '350206', '350200', '24.517573', '118.153588');
INSERT INTO `t_sys_division_coordinate` VALUES ('1164', '集美区', '350211', '350200', '24.582019', '118.103435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1165', '同安区', '350212', '350200', '24.729114', '118.158563');
INSERT INTO `t_sys_division_coordinate` VALUES ('1166', '翔安区', '350213', '350200', '24.624216', '118.254576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1167', '莆田市', '350300', '350000', '25.459865', '119.014521');
INSERT INTO `t_sys_division_coordinate` VALUES ('1168', '城厢区', '350302', '350300', '25.424344', '119.001536');
INSERT INTO `t_sys_division_coordinate` VALUES ('1169', '涵江区', '350303', '350300', '25.464464', '119.122567');
INSERT INTO `t_sys_division_coordinate` VALUES ('1170', '荔城区', '350304', '350300', '25.439754', '119.019482');
INSERT INTO `t_sys_division_coordinate` VALUES ('1171', '秀屿区', '350305', '350300', '25.323654', '119.111571');
INSERT INTO `t_sys_division_coordinate` VALUES ('1172', '仙游县', '350322', '350300', '25.368291', '118.698454');
INSERT INTO `t_sys_division_coordinate` VALUES ('1173', '三明市', '350400', '350000', '26.269737', '117.645521');
INSERT INTO `t_sys_division_coordinate` VALUES ('1174', '梅列区', '350402', '350400', '26.277336', '117.65255');
INSERT INTO `t_sys_division_coordinate` VALUES ('1175', '三元区', '350403', '350400', '26.240219', '117.614415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1176', '明溪县', '350421', '350400', '26.361854', '117.208518');
INSERT INTO `t_sys_division_coordinate` VALUES ('1177', '清流县', '350423', '350400', '26.183357', '116.823593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1178', '宁化县', '350424', '350400', '26.267956', '116.660426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1179', '大田县', '350425', '350400', '25.698933', '117.85344');
INSERT INTO `t_sys_division_coordinate` VALUES ('1180', '尤溪县', '350426', '350400', '26.176218', '118.19744');
INSERT INTO `t_sys_division_coordinate` VALUES ('1181', '沙县', '350427', '350400', '26.402813', '117.798561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1182', '将乐县', '350428', '350400', '26.73521', '117.477409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1183', '泰宁县', '350429', '350400', '26.90566', '117.182596');
INSERT INTO `t_sys_division_coordinate` VALUES ('1184', '建宁县', '350430', '350400', '26.836825', '116.852506');
INSERT INTO `t_sys_division_coordinate` VALUES ('1185', '永安市', '350481', '350400', '25.948144', '117.371443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1186', '泉州市', '350500', '350000', '24.879952', '118.682446');
INSERT INTO `t_sys_division_coordinate` VALUES ('1187', '鲤城区', '350502', '350500', '24.913354', '118.593481');
INSERT INTO `t_sys_division_coordinate` VALUES ('1188', '丰泽区', '350503', '350500', '24.89497', '118.61958');
INSERT INTO `t_sys_division_coordinate` VALUES ('1189', '洛江区', '350504', '350500', '24.946214', '118.677416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1190', '泉港区', '350505', '350500', '25.13965', '118.922433');
INSERT INTO `t_sys_division_coordinate` VALUES ('1191', '惠安县', '350521', '350500', '25.03695', '118.803416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1192', '安溪县', '350524', '350500', '25.06176', '118.192425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1193', '永春县', '350525', '350500', '25.327974', '118.300486');
INSERT INTO `t_sys_division_coordinate` VALUES ('1194', '德化县', '350526', '350500', '25.497309', '118.24755');
INSERT INTO `t_sys_division_coordinate` VALUES ('1195', '金门县', '350527', '350500', '24.440445', '118.330415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1196', '石狮市', '350581', '350500', '24.737665', '118.654519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1197', '晋江市', '350582', '350500', '24.787825', '118.558431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1198', '南安市', '350583', '350500', '24.966362', '118.392572');
INSERT INTO `t_sys_division_coordinate` VALUES ('1199', '漳州市', '350600', '350000', '24.51893', '117.653576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1200', '芗城区', '350602', '350600', '24.516268', '117.66059');
INSERT INTO `t_sys_division_coordinate` VALUES ('1201', '龙文区', '350603', '350600', '24.50951', '117.716455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1202', '云霄县', '350622', '350600', '23.964073', '117.346448');
INSERT INTO `t_sys_division_coordinate` VALUES ('1203', '漳浦县', '350623', '350600', '24.123462', '117.620443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1204', '诏安县', '350624', '350600', '23.717054', '117.182559');
INSERT INTO `t_sys_division_coordinate` VALUES ('1205', '长泰县', '350625', '350600', '24.631244', '117.765553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1206', '东山县', '350626', '350600', '23.706895', '117.43656');
INSERT INTO `t_sys_division_coordinate` VALUES ('1207', '南靖县', '350627', '350600', '24.520852', '117.363446');
INSERT INTO `t_sys_division_coordinate` VALUES ('1208', '平和县', '350628', '350600', '24.368365', '117.322552');
INSERT INTO `t_sys_division_coordinate` VALUES ('1209', '华安县', '350629', '350600', '25.010068', '117.540586');
INSERT INTO `t_sys_division_coordinate` VALUES ('1210', '龙海市', '350681', '350600', '24.45294', '117.824451');
INSERT INTO `t_sys_division_coordinate` VALUES ('1211', '南平市', '350700', '350000', '27.292158', '118.0595');
INSERT INTO `t_sys_division_coordinate` VALUES ('1212', '延平区', '350702', '350700', '26.643808', '118.188451');
INSERT INTO `t_sys_division_coordinate` VALUES ('1213', '建阳区', '350703', '350700', '27.337502', '118.127525');
INSERT INTO `t_sys_division_coordinate` VALUES ('1214', '顺昌县', '350721', '350700', '26.799104', '117.816519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1215', '浦城县', '350722', '350700', '27.92339', '118.547439');
INSERT INTO `t_sys_division_coordinate` VALUES ('1216', '光泽县', '350723', '350700', '27.547273', '117.340482');
INSERT INTO `t_sys_division_coordinate` VALUES ('1217', '松溪县', '350724', '350700', '27.532555', '118.791454');
INSERT INTO `t_sys_division_coordinate` VALUES ('1218', '政和县', '350725', '350700', '27.371749', '118.863587');
INSERT INTO `t_sys_division_coordinate` VALUES ('1219', '邵武市', '350781', '350700', '27.34647', '117.49942');
INSERT INTO `t_sys_division_coordinate` VALUES ('1220', '武夷山市', '350782', '350700', '27.762554', '118.041577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1221', '建瓯市', '350783', '350700', '27.028955', '118.311461');
INSERT INTO `t_sys_division_coordinate` VALUES ('1222', '龙岩市', '350800', '350000', '25.08122', '117.023448');
INSERT INTO `t_sys_division_coordinate` VALUES ('1223', '新罗区', '350802', '350800', '25.104078', '117.043543');
INSERT INTO `t_sys_division_coordinate` VALUES ('1224', '永定区', '350803', '350800', '24.869137', '116.892447');
INSERT INTO `t_sys_division_coordinate` VALUES ('1225', '长汀县', '350821', '350800', '25.839185', '116.363568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1226', '上杭县', '350823', '350800', '25.05557', '116.426443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1227', '武平县', '350824', '350800', '25.100855', '116.107589');
INSERT INTO `t_sys_division_coordinate` VALUES ('1228', '连城县', '350825', '350800', '25.716337', '116.760446');
INSERT INTO `t_sys_division_coordinate` VALUES ('1229', '漳平市', '350881', '350800', '25.295743', '117.426556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1230', '宁德市', '350900', '350000', '26.672242', '119.554511');
INSERT INTO `t_sys_division_coordinate` VALUES ('1231', '蕉城区', '350902', '350900', '26.666739', '119.533442');
INSERT INTO `t_sys_division_coordinate` VALUES ('1232', '霞浦县', '350921', '350900', '26.891349', '120.011427');
INSERT INTO `t_sys_division_coordinate` VALUES ('1233', '古田县', '350922', '350900', '26.583262', '118.752578');
INSERT INTO `t_sys_division_coordinate` VALUES ('1234', '屏南县', '350923', '350900', '26.914265', '118.992596');
INSERT INTO `t_sys_division_coordinate` VALUES ('1235', '寿宁县', '350924', '350900', '27.46665', '119.511425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1236', '周宁县', '350925', '350900', '27.110239', '119.345567');
INSERT INTO `t_sys_division_coordinate` VALUES ('1237', '柘荣县', '350926', '350900', '27.239962', '119.907457');
INSERT INTO `t_sys_division_coordinate` VALUES ('1238', '福安市', '350981', '350900', '27.094324', '119.654406');
INSERT INTO `t_sys_division_coordinate` VALUES ('1239', '福鼎市', '350982', '350900', '27.330525', '120.223452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1240', '江西省', '360000', '0', '28.681691', '115.915423');
INSERT INTO `t_sys_division_coordinate` VALUES ('1241', '南昌市', '360100', '360000', '28.689455', '115.864589');
INSERT INTO `t_sys_division_coordinate` VALUES ('1242', '东湖区', '360102', '360100', '28.691259', '115.905466');
INSERT INTO `t_sys_division_coordinate` VALUES ('1243', '西湖区', '360103', '360100', '28.661977', '115.883536');
INSERT INTO `t_sys_division_coordinate` VALUES ('1244', '青云谱区', '360104', '360100', '28.627236', '115.931416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1245', '湾里区', '360105', '360100', '28.720195', '115.737596');
INSERT INTO `t_sys_division_coordinate` VALUES ('1246', '青山湖区', '360111', '360100', '28.687596', '115.968552');
INSERT INTO `t_sys_division_coordinate` VALUES ('1247', '新建区', '360112', '360100', '28.698749', '115.821451');
INSERT INTO `t_sys_division_coordinate` VALUES ('1248', '南昌县', '360121', '360100', '28.551604', '115.95046');
INSERT INTO `t_sys_division_coordinate` VALUES ('1249', '安义县', '360123', '360100', '28.850794', '115.555441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1250', '进贤县', '360124', '360100', '28.382759', '116.248538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1251', '景德镇市', '360200', '360000', '29.274248', '117.184576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1252', '昌江区', '360202', '360200', '29.278854', '117.190579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1253', '珠山区', '360203', '360200', '29.305778', '117.209548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1254', '浮梁县', '360222', '360200', '29.357788', '117.221466');
INSERT INTO `t_sys_division_coordinate` VALUES ('1255', '乐平市', '360281', '360200', '28.984364', '117.158511');
INSERT INTO `t_sys_division_coordinate` VALUES ('1256', '萍乡市', '360300', '360000', '27.628393', '113.861496');
INSERT INTO `t_sys_division_coordinate` VALUES ('1257', '安源区', '360302', '360300', '27.621308', '113.87744');
INSERT INTO `t_sys_division_coordinate` VALUES ('1258', '湘东区', '360313', '360300', '27.645875', '113.7405');
INSERT INTO `t_sys_division_coordinate` VALUES ('1259', '莲花县', '360321', '360300', '27.133463', '113.968541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1260', '上栗县', '360322', '360300', '27.886416', '113.801538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1261', '芦溪县', '360323', '360300', '27.636605', '114.036519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1262', '九江市', '360400', '360000', '29.711341', '116.007535');
INSERT INTO `t_sys_division_coordinate` VALUES ('1263', '濂溪区', '360402', '360400', '29.677495', '115.995599');
INSERT INTO `t_sys_division_coordinate` VALUES ('1264', '浔阳区', '360403', '360400', '29.733094', '115.996558');
INSERT INTO `t_sys_division_coordinate` VALUES ('1265', '九江县', '360421', '360400', '29.614805', '115.917402');
INSERT INTO `t_sys_division_coordinate` VALUES ('1266', '武宁县', '360423', '360400', '29.262352', '115.107442');
INSERT INTO `t_sys_division_coordinate` VALUES ('1267', '修水县', '360424', '360400', '29.031176', '114.553568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1268', '永修县', '360425', '360400', '29.028006', '115.815407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1269', '德安县', '360426', '360400', '29.319172', '115.762578');
INSERT INTO `t_sys_division_coordinate` VALUES ('1270', '都昌县', '360428', '360400', '29.278965', '116.210552');
INSERT INTO `t_sys_division_coordinate` VALUES ('1271', '湖口县', '360429', '360400', '29.737132', '116.258471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1272', '彭泽县', '360430', '360400', '29.902122', '116.55551');
INSERT INTO `t_sys_division_coordinate` VALUES ('1273', '瑞昌市', '360481', '360400', '29.681951', '115.68743');
INSERT INTO `t_sys_division_coordinate` VALUES ('1274', '共青城市', '360482', '360400', '29.319172', '115.762578');
INSERT INTO `t_sys_division_coordinate` VALUES ('1275', '庐山市', '360483', '360400', '29.454539', '116.051426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1276', '新余市', '360500', '360000', '27.823579', '114.923535');
INSERT INTO `t_sys_division_coordinate` VALUES ('1277', '渝水区', '360502', '360500', '27.80684', '114.951424');
INSERT INTO `t_sys_division_coordinate` VALUES ('1278', '分宜县', '360521', '360500', '27.820731', '114.698472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1279', '鹰潭市', '360600', '360000', '28.265787', '117.075575');
INSERT INTO `t_sys_division_coordinate` VALUES ('1280', '月湖区', '360602', '360600', '28.245078', '117.043548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1281', '余江县', '360622', '360600', '28.215354', '116.824594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1282', '贵溪市', '360681', '360600', '28.298735', '117.251399');
INSERT INTO `t_sys_division_coordinate` VALUES ('1283', '赣州市', '360700', '360000', '25.835176', '114.940503');
INSERT INTO `t_sys_division_coordinate` VALUES ('1284', '章贡区', '360702', '360700', '25.823747', '114.927551');
INSERT INTO `t_sys_division_coordinate` VALUES ('1285', '南康区', '360703', '360700', '25.667053', '114.771538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1286', '赣县', '360721', '360700', '25.866385', '115.01857');
INSERT INTO `t_sys_division_coordinate` VALUES ('1287', '信丰县', '360722', '360700', '25.391975', '114.929521');
INSERT INTO `t_sys_division_coordinate` VALUES ('1288', '大余县', '360723', '360700', '25.407637', '114.368407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1289', '上犹县', '360724', '360700', '25.790519', '114.558549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1290', '崇义县', '360725', '360700', '25.687687', '114.314572');
INSERT INTO `t_sys_division_coordinate` VALUES ('1291', '安远县', '360726', '360700', '25.142743', '115.400559');
INSERT INTO `t_sys_division_coordinate` VALUES ('1292', '龙南县', '360727', '360700', '24.916599', '114.796554');
INSERT INTO `t_sys_division_coordinate` VALUES ('1293', '定南县', '360728', '360700', '24.789784', '115.034564');
INSERT INTO `t_sys_division_coordinate` VALUES ('1294', '全南县', '360729', '360700', '24.748206', '114.536582');
INSERT INTO `t_sys_division_coordinate` VALUES ('1295', '宁都县', '360730', '360700', '26.47598', '116.015494');
INSERT INTO `t_sys_division_coordinate` VALUES ('1296', '于都县', '360731', '360700', '25.957894', '115.421499');
INSERT INTO `t_sys_division_coordinate` VALUES ('1297', '兴国县', '360732', '360700', '26.343883', '115.369552');
INSERT INTO `t_sys_division_coordinate` VALUES ('1298', '会昌县', '360733', '360700', '25.606662', '115.79246');
INSERT INTO `t_sys_division_coordinate` VALUES ('1299', '寻乌县', '360734', '360700', '24.969447', '115.653515');
INSERT INTO `t_sys_division_coordinate` VALUES ('1300', '石城县', '360735', '360700', '26.318972', '116.352594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1301', '瑞金市', '360781', '360700', '25.891666', '116.033421');
INSERT INTO `t_sys_division_coordinate` VALUES ('1302', '吉安市', '360800', '360000', '27.119727', '115.000511');
INSERT INTO `t_sys_division_coordinate` VALUES ('1303', '吉州区', '360802', '360800', '27.149315', '115.001539');
INSERT INTO `t_sys_division_coordinate` VALUES ('1304', '青原区', '360803', '360800', '27.087663', '115.021561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1305', '吉安县', '360821', '360800', '27.044989', '114.914591');
INSERT INTO `t_sys_division_coordinate` VALUES ('1306', '吉水县', '360822', '360800', '27.23526', '115.14257');
INSERT INTO `t_sys_division_coordinate` VALUES ('1307', '峡江县', '360823', '360800', '27.588235', '115.322403');
INSERT INTO `t_sys_division_coordinate` VALUES ('1308', '新干县', '360824', '360800', '27.746081', '115.393595');
INSERT INTO `t_sys_division_coordinate` VALUES ('1309', '永丰县', '360825', '360800', '27.324342', '115.447402');
INSERT INTO `t_sys_division_coordinate` VALUES ('1310', '泰和县', '360826', '360800', '26.795697', '114.915591');
INSERT INTO `t_sys_division_coordinate` VALUES ('1311', '遂川县', '360827', '360800', '26.319517', '114.527562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1312', '万安县', '360828', '360800', '26.464073', '114.792577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1313', '安福县', '360829', '360800', '27.399076', '114.626478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1314', '永新县', '360830', '360800', '26.951537', '114.249415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1315', '井冈山市', '360881', '360800', '26.75371', '114.295556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1316', '宜春市', '360900', '360000', '27.820856', '114.423564');
INSERT INTO `t_sys_division_coordinate` VALUES ('1317', '袁州区', '360902', '360900', '27.802583', '114.434561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1318', '奉新县', '360921', '360900', '28.694029', '115.406551');
INSERT INTO `t_sys_division_coordinate` VALUES ('1319', '万载县', '360922', '360900', '28.112133', '114.452537');
INSERT INTO `t_sys_division_coordinate` VALUES ('1320', '上高县', '360923', '360900', '28.238815', '114.931541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1321', '宜丰县', '360924', '360900', '28.400373', '114.700858');
INSERT INTO `t_sys_division_coordinate` VALUES ('1322', '靖安县', '360925', '360900', '28.867082', '115.369553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1323', '铜鼓县', '360926', '360900', '28.527083', '114.377411');
INSERT INTO `t_sys_division_coordinate` VALUES ('1324', '丰城市', '360981', '360900', '28.166614', '115.777478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1325', '樟树市', '360982', '360900', '28.062153', '115.552419');
INSERT INTO `t_sys_division_coordinate` VALUES ('1326', '高安市', '360983', '360900', '28.422857', '115.382565');
INSERT INTO `t_sys_division_coordinate` VALUES ('1327', '抚州市', '361000', '360000', '27.954892', '116.364539');
INSERT INTO `t_sys_division_coordinate` VALUES ('1328', '临川区', '361002', '361000', '27.940459', '116.31849');
INSERT INTO `t_sys_division_coordinate` VALUES ('1329', '南城县', '361021', '361000', '27.576241', '116.643399');
INSERT INTO `t_sys_division_coordinate` VALUES ('1330', '黎川县', '361022', '361000', '27.28834', '116.914507');
INSERT INTO `t_sys_division_coordinate` VALUES ('1331', '南丰县', '361023', '361000', '27.224734', '116.531404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1332', '崇仁县', '361024', '361000', '27.75908', '116.083549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1333', '乐安县', '361025', '361000', '27.43408', '115.837496');
INSERT INTO `t_sys_division_coordinate` VALUES ('1334', '宜黄县', '361026', '361000', '27.560563', '116.242542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1335', '金溪县', '361027', '361000', '27.925329', '116.760404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1336', '资溪县', '361028', '361000', '27.711846', '117.06657');
INSERT INTO `t_sys_division_coordinate` VALUES ('1337', '东乡县', '361029', '361000', '28.253977', '116.609542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1338', '广昌县', '361030', '361000', '26.848454', '116.342561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1339', '上饶市', '361100', '360000', '28.460626', '117.94946');
INSERT INTO `t_sys_division_coordinate` VALUES ('1340', '信州区', '361102', '361100', '28.437628', '117.973412');
INSERT INTO `t_sys_division_coordinate` VALUES ('1341', '广丰区', '361103', '361100', '28.442615', '118.19742');
INSERT INTO `t_sys_division_coordinate` VALUES ('1342', '上饶县', '361121', '361100', '28.454187', '117.915584');
INSERT INTO `t_sys_division_coordinate` VALUES ('1343', '玉山县', '361123', '361100', '28.68775', '118.251563');
INSERT INTO `t_sys_division_coordinate` VALUES ('1344', '铅山县', '361124', '361100', '28.321505', '117.716422');
INSERT INTO `t_sys_division_coordinate` VALUES ('1345', '横峰县', '361125', '361100', '28.41344', '117.602397');
INSERT INTO `t_sys_division_coordinate` VALUES ('1346', '弋阳县', '361126', '361100', '28.384082', '117.455506');
INSERT INTO `t_sys_division_coordinate` VALUES ('1347', '余干县', '361127', '361100', '28.707866', '116.701601');
INSERT INTO `t_sys_division_coordinate` VALUES ('1348', '鄱阳县', '361128', '361100', '29.011453', '116.710566');
INSERT INTO `t_sys_division_coordinate` VALUES ('1349', '万年县', '361129', '361100', '28.700054', '117.064599');
INSERT INTO `t_sys_division_coordinate` VALUES ('1350', '婺源县', '361130', '361100', '29.254039', '117.868445');
INSERT INTO `t_sys_division_coordinate` VALUES ('1351', '德兴市', '361181', '361100', '28.952565', '117.58548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1352', '山东省', '370000', '0', '36.674857', '117.027442');
INSERT INTO `t_sys_division_coordinate` VALUES ('1353', '济南市', '370100', '370000', '36.656554', '117.126399');
INSERT INTO `t_sys_division_coordinate` VALUES ('1354', '历下区', '370102', '370100', '36.672163', '117.082567');
INSERT INTO `t_sys_division_coordinate` VALUES ('1355', '市中区', '370103', '370100', '36.657552', '117.004399');
INSERT INTO `t_sys_division_coordinate` VALUES ('1356', '槐荫区', '370104', '370100', '36.657562', '116.907458');
INSERT INTO `t_sys_division_coordinate` VALUES ('1357', '天桥区', '370105', '370100', '36.684068', '116.993399');
INSERT INTO `t_sys_division_coordinate` VALUES ('1358', '历城区', '370112', '370100', '36.685656', '117.07159');
INSERT INTO `t_sys_division_coordinate` VALUES ('1359', '长清区', '370113', '370100', '36.560216', '116.758387');
INSERT INTO `t_sys_division_coordinate` VALUES ('1360', '平阴县', '370124', '370100', '36.294861', '116.462617');
INSERT INTO `t_sys_division_coordinate` VALUES ('1361', '济阳县', '370125', '370100', '36.983971', '117.180621');
INSERT INTO `t_sys_division_coordinate` VALUES ('1362', '商河县', '370126', '370100', '37.314971', '117.16353');
INSERT INTO `t_sys_division_coordinate` VALUES ('1363', '章丘市', '370181', '370100', '36.685533', '117.532565');
INSERT INTO `t_sys_division_coordinate` VALUES ('1364', '青岛市', '370200', '370000', '36.072227', '120.389455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1365', '市南区', '370202', '370200', '36.081466', '120.418585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1366', '市北区', '370203', '370200', '36.09345', '120.381404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1367', '黄岛区', '370211', '370200', '35.966383', '120.204547');
INSERT INTO `t_sys_division_coordinate` VALUES ('1368', '崂山区', '370212', '370200', '36.113499', '120.475397');
INSERT INTO `t_sys_division_coordinate` VALUES ('1369', '李沧区', '370213', '370200', '36.151025', '120.439603');
INSERT INTO `t_sys_division_coordinate` VALUES ('1370', '城阳区', '370214', '370200', '36.312886', '120.402527');
INSERT INTO `t_sys_division_coordinate` VALUES ('1371', '胶州市', '370281', '370200', '36.270349', '120.039535');
INSERT INTO `t_sys_division_coordinate` VALUES ('1372', '即墨市', '370282', '370200', '36.394749', '120.453536');
INSERT INTO `t_sys_division_coordinate` VALUES ('1373', '平度市', '370283', '370200', '36.782692', '119.994414');
INSERT INTO `t_sys_division_coordinate` VALUES ('1374', '莱西市', '370285', '370200', '36.893956', '120.524556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1375', '淄博市', '370300', '370000', '36.819086', '118.061453');
INSERT INTO `t_sys_division_coordinate` VALUES ('1376', '淄川区', '370302', '370300', '36.649835', '117.973412');
INSERT INTO `t_sys_division_coordinate` VALUES ('1377', '张店区', '370303', '370300', '36.811942', '118.024591');
INSERT INTO `t_sys_division_coordinate` VALUES ('1378', '博山区', '370304', '370300', '36.500848', '117.868469');
INSERT INTO `t_sys_division_coordinate` VALUES ('1379', '临淄区', '370305', '370300', '36.832294', '118.315395');
INSERT INTO `t_sys_division_coordinate` VALUES ('1380', '周村区', '370306', '370300', '36.808994', '117.876482');
INSERT INTO `t_sys_division_coordinate` VALUES ('1381', '桓台县', '370321', '370300', '36.965608', '118.104434');
INSERT INTO `t_sys_division_coordinate` VALUES ('1382', '高青县', '370322', '370300', '37.177269', '117.833394');
INSERT INTO `t_sys_division_coordinate` VALUES ('1383', '沂源县', '370323', '370300', '36.190917', '118.177489');
INSERT INTO `t_sys_division_coordinate` VALUES ('1384', '枣庄市', '370400', '370000', '34.815994', '117.330542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1385', '市中区', '370402', '370400', '34.869963', '117.562566');
INSERT INTO `t_sys_division_coordinate` VALUES ('1386', '薛城区', '370403', '370400', '34.801125', '117.269458');
INSERT INTO `t_sys_division_coordinate` VALUES ('1387', '峄城区', '370404', '370400', '34.7786', '117.596391');
INSERT INTO `t_sys_division_coordinate` VALUES ('1388', '台儿庄区', '370405', '370400', '34.568763', '117.740425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1389', '山亭区', '370406', '370400', '35.105692', '117.467443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1390', '滕州市', '370481', '370400', '35.120035', '117.172565');
INSERT INTO `t_sys_division_coordinate` VALUES ('1391', '东营市', '370500', '370000', '37.439642', '118.681385');
INSERT INTO `t_sys_division_coordinate` VALUES ('1392', '东营区', '370502', '370500', '37.454847', '118.588463');
INSERT INTO `t_sys_division_coordinate` VALUES ('1393', '河口区', '370503', '370500', '37.89112', '118.532505');
INSERT INTO `t_sys_division_coordinate` VALUES ('1394', '垦利区', '370505', '370500', '37.578555', '118.581432');
INSERT INTO `t_sys_division_coordinate` VALUES ('1395', '利津县', '370522', '370500', '37.49586', '118.261618');
INSERT INTO `t_sys_division_coordinate` VALUES ('1396', '广饶县', '370523', '370500', '37.059638', '118.413499');
INSERT INTO `t_sys_division_coordinate` VALUES ('1397', '烟台市', '370600', '370000', '37.470038', '121.454415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1398', '芝罘区', '370602', '370600', '37.546313', '121.40654');
INSERT INTO `t_sys_division_coordinate` VALUES ('1399', '福山区', '370611', '370600', '37.503668', '121.274605');
INSERT INTO `t_sys_division_coordinate` VALUES ('1400', '牟平区', '370612', '370600', '37.392915', '121.606549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1401', '莱山区', '370613', '370600', '37.517649', '121.451381');
INSERT INTO `t_sys_division_coordinate` VALUES ('1402', '长岛县', '370634', '370600', '37.927628', '120.74343');
INSERT INTO `t_sys_division_coordinate` VALUES ('1403', '龙口市', '370681', '370600', '37.652555', '120.485369');
INSERT INTO `t_sys_division_coordinate` VALUES ('1404', '莱阳市', '370682', '370600', '36.984636', '120.718414');
INSERT INTO `t_sys_division_coordinate` VALUES ('1405', '莱州市', '370683', '370600', '37.182637', '119.948593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1406', '蓬莱市', '370684', '370600', '37.816439', '120.765562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1407', '招远市', '370685', '370600', '37.361137', '120.440602');
INSERT INTO `t_sys_division_coordinate` VALUES ('1408', '栖霞市', '370686', '370600', '37.341418', '120.856417');
INSERT INTO `t_sys_division_coordinate` VALUES ('1409', '海阳市', '370687', '370600', '36.69327', '121.180458');
INSERT INTO `t_sys_division_coordinate` VALUES ('1410', '潍坊市', '370700', '370000', '36.712652', '119.168378');
INSERT INTO `t_sys_division_coordinate` VALUES ('1411', '潍城区', '370702', '370700', '36.732854', '119.031429');
INSERT INTO `t_sys_division_coordinate` VALUES ('1412', '寒亭区', '370703', '370700', '36.780744', '119.226615');
INSERT INTO `t_sys_division_coordinate` VALUES ('1413', '坊子区', '370704', '370700', '36.660742', '119.172401');
INSERT INTO `t_sys_division_coordinate` VALUES ('1414', '奎文区', '370705', '370700', '36.712752', '119.139471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1415', '临朐县', '370724', '370700', '36.51913', '118.54945');
INSERT INTO `t_sys_division_coordinate` VALUES ('1416', '昌乐县', '370725', '370700', '36.712996', '118.836488');
INSERT INTO `t_sys_division_coordinate` VALUES ('1417', '青州市', '370781', '370700', '36.690417', '118.486537');
INSERT INTO `t_sys_division_coordinate` VALUES ('1418', '诸城市', '370782', '370700', '36.002009', '119.416402');
INSERT INTO `t_sys_division_coordinate` VALUES ('1419', '寿光市', '370783', '370700', '36.861922', '118.797415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1420', '安丘市', '370784', '370700', '36.483842', '119.225608');
INSERT INTO `t_sys_division_coordinate` VALUES ('1421', '高密市', '370785', '370700', '36.388957', '119.762411');
INSERT INTO `t_sys_division_coordinate` VALUES ('1422', '昌邑市', '370786', '370700', '36.865161', '119.404406');
INSERT INTO `t_sys_division_coordinate` VALUES ('1423', '济宁市', '370800', '370000', '35.420177', '116.593612');
INSERT INTO `t_sys_division_coordinate` VALUES ('1424', '任城区', '370811', '370800', '35.493731', '116.55447');
INSERT INTO `t_sys_division_coordinate` VALUES ('1425', '兖州区', '370812', '370800', '35.599737', '116.805536');
INSERT INTO `t_sys_division_coordinate` VALUES ('1426', '微山县', '370826', '370800', '34.813315', '117.135414');
INSERT INTO `t_sys_division_coordinate` VALUES ('1427', '鱼台县', '370827', '370800', '35.017888', '116.657393');
INSERT INTO `t_sys_division_coordinate` VALUES ('1428', '金乡县', '370828', '370800', '35.072569', '116.31853');
INSERT INTO `t_sys_division_coordinate` VALUES ('1429', '嘉祥县', '370829', '370800', '35.413255', '116.348613');
INSERT INTO `t_sys_division_coordinate` VALUES ('1430', '汶上县', '370830', '370800', '35.717055', '116.505441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1431', '泗水县', '370831', '370800', '35.6706', '117.257429');
INSERT INTO `t_sys_division_coordinate` VALUES ('1432', '梁山县', '370832', '370800', '35.808064', '116.10262');
INSERT INTO `t_sys_division_coordinate` VALUES ('1433', '曲阜市', '370881', '370800', '35.587372', '116.993416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1434', '邹城市', '370883', '370800', '35.407521', '117.014404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1435', '泰安市', '370900', '370000', '36.205858', '117.094495');
INSERT INTO `t_sys_division_coordinate` VALUES ('1436', '泰山区', '370902', '370900', '36.199445', '117.141411');
INSERT INTO `t_sys_division_coordinate` VALUES ('1437', '岱岳区', '370911', '370900', '36.193291', '117.048556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1438', '宁阳县', '370921', '370900', '35.764539', '116.812579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1439', '东平县', '370923', '370900', '35.941908', '116.477594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1440', '新泰市', '370982', '370900', '35.91462', '117.774606');
INSERT INTO `t_sys_division_coordinate` VALUES ('1441', '肥城市', '370983', '370900', '36.188811', '116.775401');
INSERT INTO `t_sys_division_coordinate` VALUES ('1442', '威海市', '371000', '370000', '37.516431', '122.127541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1443', '环翠区', '371002', '371000', '37.507968', '122.129538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1444', '文登区', '371003', '371000', '37.200113', '122.064428');
INSERT INTO `t_sys_division_coordinate` VALUES ('1445', '荣成市', '371082', '371000', '37.171318', '122.492505');
INSERT INTO `t_sys_division_coordinate` VALUES ('1446', '乳山市', '371083', '371000', '36.925177', '121.546429');
INSERT INTO `t_sys_division_coordinate` VALUES ('1447', '日照市', '371100', '370000', '35.422839', '119.533415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1448', '东港区', '371102', '371100', '35.431049', '119.468624');
INSERT INTO `t_sys_division_coordinate` VALUES ('1449', '岚山区', '371103', '371100', '35.127432', '119.32553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1450', '五莲县', '371121', '371100', '35.755697', '119.21558');
INSERT INTO `t_sys_division_coordinate` VALUES ('1451', '莒县', '371122', '371100', '35.585872', '118.843538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1452', '莱芜市', '371200', '370000', '36.219472', '117.68355');
INSERT INTO `t_sys_division_coordinate` VALUES ('1453', '莱城区', '371202', '371200', '36.208841', '117.666591');
INSERT INTO `t_sys_division_coordinate` VALUES ('1454', '钢城区', '371203', '371200', '36.064719', '117.817496');
INSERT INTO `t_sys_division_coordinate` VALUES ('1455', '临沂市', '371300', '370000', '35.110671', '118.363533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1456', '兰山区', '371302', '371300', '35.05734', '118.3545');
INSERT INTO `t_sys_division_coordinate` VALUES ('1457', '罗庄区', '371311', '371300', '35.002504', '118.291513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1458', '河东区', '371312', '371300', '35.095676', '118.409547');
INSERT INTO `t_sys_division_coordinate` VALUES ('1459', '沂南县', '371321', '371300', '35.556098', '118.471492');
INSERT INTO `t_sys_division_coordinate` VALUES ('1460', '郯城县', '371322', '371300', '34.619226', '118.373587');
INSERT INTO `t_sys_division_coordinate` VALUES ('1461', '沂水县', '371323', '371300', '35.796181', '118.634617');
INSERT INTO `t_sys_division_coordinate` VALUES ('1462', '兰陵县', '371324', '371300', '34.863616', '118.077409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1463', '费县', '371325', '371300', '35.272304', '117.984425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1464', '平邑县', '371326', '371300', '35.51202', '117.646541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1465', '莒南县', '371327', '371300', '35.180812', '118.841541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1466', '蒙阴县', '371328', '371300', '35.716347', '117.951415');
INSERT INTO `t_sys_division_coordinate` VALUES ('1467', '临沭县', '371329', '371300', '34.926019', '118.657495');
INSERT INTO `t_sys_division_coordinate` VALUES ('1468', '德州市', '371400', '370000', '37.441308', '116.365557');
INSERT INTO `t_sys_division_coordinate` VALUES ('1469', '德城区', '371402', '371400', '37.456993', '116.305449');
INSERT INTO `t_sys_division_coordinate` VALUES ('1470', '陵城区', '371403', '371400', '37.476844', '116.77141');
INSERT INTO `t_sys_division_coordinate` VALUES ('1471', '宁津县', '371422', '371400', '37.658019', '116.806538');
INSERT INTO `t_sys_division_coordinate` VALUES ('1472', '庆云县', '371423', '371400', '37.781585', '117.391452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1473', '临邑县', '371424', '371400', '37.196169', '116.873404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1474', '齐河县', '371425', '371400', '36.789945', '116.769387');
INSERT INTO `t_sys_division_coordinate` VALUES ('1475', '平原县', '371426', '371400', '37.171221', '116.440505');
INSERT INTO `t_sys_division_coordinate` VALUES ('1476', '夏津县', '371427', '371400', '36.954155', '116.008534');
INSERT INTO `t_sys_division_coordinate` VALUES ('1477', '武城县', '371428', '371400', '37.219222', '116.075506');
INSERT INTO `t_sys_division_coordinate` VALUES ('1478', '乐陵市', '371481', '371400', '37.735925', '117.238406');
INSERT INTO `t_sys_division_coordinate` VALUES ('1479', '禹城市', '371482', '371400', '36.940242', '116.644371');
INSERT INTO `t_sys_division_coordinate` VALUES ('1480', '聊城市', '371500', '370000', '36.462758', '115.991588');
INSERT INTO `t_sys_division_coordinate` VALUES ('1481', '东昌府区', '371502', '371500', '36.440378', '115.994587');
INSERT INTO `t_sys_division_coordinate` VALUES ('1482', '阳谷县', '371521', '371500', '36.120816', '115.798396');
INSERT INTO `t_sys_division_coordinate` VALUES ('1483', '莘县', '371522', '371500', '36.239907', '115.677397');
INSERT INTO `t_sys_division_coordinate` VALUES ('1484', '茌平县', '371523', '371500', '36.586785', '116.261455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1485', '东阿县', '371524', '371500', '36.340958', '116.254493');
INSERT INTO `t_sys_division_coordinate` VALUES ('1486', '冠县', '371525', '371500', '36.490243', '115.449396');
INSERT INTO `t_sys_division_coordinate` VALUES ('1487', '高唐县', '371526', '371500', '36.851591', '116.235604');
INSERT INTO `t_sys_division_coordinate` VALUES ('1488', '临清市', '371581', '371500', '36.844289', '115.71147');
INSERT INTO `t_sys_division_coordinate` VALUES ('1489', '滨州市', '371600', '370000', '37.388196', '117.977404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1490', '滨城区', '371602', '371600', '37.436843', '118.026604');
INSERT INTO `t_sys_division_coordinate` VALUES ('1491', '沾化区', '371603', '371600', '37.705298', '118.105454');
INSERT INTO `t_sys_division_coordinate` VALUES ('1492', '惠民县', '371621', '371600', '37.495803', '117.51651');
INSERT INTO `t_sys_division_coordinate` VALUES ('1493', '阳信县', '371622', '371600', '37.647338', '117.584437');
INSERT INTO `t_sys_division_coordinate` VALUES ('1494', '无棣县', '371623', '371600', '37.777567', '117.632457');
INSERT INTO `t_sys_division_coordinate` VALUES ('1495', '博兴县', '371625', '371600', '37.160477', '118.117493');
INSERT INTO `t_sys_division_coordinate` VALUES ('1496', '邹平县', '371626', '371600', '36.870032', '117.749478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1497', '菏泽市', '371700', '370000', '35.239407', '115.487545');
INSERT INTO `t_sys_division_coordinate` VALUES ('1498', '牡丹区', '371702', '371700', '35.257018', '115.423443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1499', '定陶区', '371703', '371700', '35.077275', '115.579437');
INSERT INTO `t_sys_division_coordinate` VALUES ('1500', '曹县', '371721', '371700', '34.831809', '115.548457');
INSERT INTO `t_sys_division_coordinate` VALUES ('1501', '单县', '371722', '371700', '34.784658', '116.111584');
INSERT INTO `t_sys_division_coordinate` VALUES ('1502', '成武县', '371723', '371700', '34.958606', '115.896519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1503', '巨野县', '371724', '371700', '35.402062', '116.210258');
INSERT INTO `t_sys_division_coordinate` VALUES ('1504', '郓城县', '371725', '371700', '35.605902', '115.950451');
INSERT INTO `t_sys_division_coordinate` VALUES ('1505', '鄄城县', '371726', '371700', '35.569204', '115.516607');
INSERT INTO `t_sys_division_coordinate` VALUES ('1506', '东明县', '371728', '371700', '35.295702', '115.096417');
INSERT INTO `t_sys_division_coordinate` VALUES ('1507', '河南省', '410000', '0', '34.771713', '113.759384');
INSERT INTO `t_sys_division_coordinate` VALUES ('1508', '郑州市', '410100', '410000', '34.753439', '113.631419');
INSERT INTO `t_sys_division_coordinate` VALUES ('1509', '中原区', '410102', '410100', '34.754451', '113.619476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1510', '二七区', '410103', '410100', '34.731045', '113.64641');
INSERT INTO `t_sys_division_coordinate` VALUES ('1511', '管城回族区', '410104', '410100', '34.759674', '113.683525');
INSERT INTO `t_sys_division_coordinate` VALUES ('1512', '金水区', '410105', '410100', '34.80607', '113.666448');
INSERT INTO `t_sys_division_coordinate` VALUES ('1513', '上街区', '410106', '410100', '34.808819', '113.315497');
INSERT INTO `t_sys_division_coordinate` VALUES ('1514', '惠济区', '410108', '410100', '34.87352', '113.623455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1515', '中牟县', '410122', '410100', '34.725011', '113.982485');
INSERT INTO `t_sys_division_coordinate` VALUES ('1516', '巩义市', '410181', '410100', '34.754097', '113.028431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1517', '荥阳市', '410182', '410100', '34.793811', '113.389423');
INSERT INTO `t_sys_division_coordinate` VALUES ('1518', '新密市', '410183', '410100', '34.545898', '113.397391');
INSERT INTO `t_sys_division_coordinate` VALUES ('1519', '新郑市', '410184', '410100', '34.401766', '113.746434');
INSERT INTO `t_sys_division_coordinate` VALUES ('1520', '登封市', '410185', '410100', '34.459697', '113.056423');
INSERT INTO `t_sys_division_coordinate` VALUES ('1521', '开封市', '410200', '410000', '34.802886', '114.314593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1522', '龙亭区', '410202', '410200', '34.822036', '114.361413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1523', '顺河回族区', '410203', '410200', '34.822036', '114.361413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1524', '鼓楼区', '410204', '410200', '34.822036', '114.361413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1525', '禹王台区', '410205', '410200', '34.822036', '114.361413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1526', '金明区', '410211', '410200', '34.798756', '114.229635');
INSERT INTO `t_sys_division_coordinate` VALUES ('1527', '祥符区', '410212', '410200', '34.726004', '114.452186');
INSERT INTO `t_sys_division_coordinate` VALUES ('1528', '杞县', '410221', '410200', '34.554857', '114.789592');
INSERT INTO `t_sys_division_coordinate` VALUES ('1529', '通许县', '410222', '410200', '34.486772', '114.473436');
INSERT INTO `t_sys_division_coordinate` VALUES ('1530', '尉氏县', '410223', '410200', '34.417228', '114.199561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1531', '兰考县', '410225', '410200', '34.828493', '114.827461');
INSERT INTO `t_sys_division_coordinate` VALUES ('1532', '洛阳市', '410300', '410000', '34.624263', '112.459421');
INSERT INTO `t_sys_division_coordinate` VALUES ('1533', '老城区', '410302', '410300', '34.689601', '112.476504');
INSERT INTO `t_sys_division_coordinate` VALUES ('1534', '西工区', '410303', '410300', '34.666768', '112.4344');
INSERT INTO `t_sys_division_coordinate` VALUES ('1535', '瀍河回族区', '410304', '410300', '34.685462', '112.506604');
INSERT INTO `t_sys_division_coordinate` VALUES ('1536', '涧西区', '410305', '410300', '34.663469', '112.402552');
INSERT INTO `t_sys_division_coordinate` VALUES ('1537', '吉利区', '410306', '410300', '34.907013', '112.595478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1538', '洛龙区', '410311', '410300', '34.624705', '112.470469');
INSERT INTO `t_sys_division_coordinate` VALUES ('1539', '孟津县', '410322', '410300', '34.831732', '112.451418');
INSERT INTO `t_sys_division_coordinate` VALUES ('1540', '新安县', '410323', '410300', '34.734383', '112.14061');
INSERT INTO `t_sys_division_coordinate` VALUES ('1541', '栾川县', '410324', '410300', '33.791822', '111.622427');
INSERT INTO `t_sys_division_coordinate` VALUES ('1542', '嵩县', '410325', '410300', '34.140722', '112.092408');
INSERT INTO `t_sys_division_coordinate` VALUES ('1543', '汝阳县', '410326', '410300', '34.159843', '112.479503');
INSERT INTO `t_sys_division_coordinate` VALUES ('1544', '宜阳县', '410327', '410300', '34.541047', '112.179465');
INSERT INTO `t_sys_division_coordinate` VALUES ('1545', '洛宁县', '410328', '410300', '34.394985', '111.659587');
INSERT INTO `t_sys_division_coordinate` VALUES ('1546', '伊川县', '410329', '410300', '34.427646', '112.432407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1547', '偃师市', '410381', '410300', '34.733797', '112.796421');
INSERT INTO `t_sys_division_coordinate` VALUES ('1548', '平顶山市', '410400', '410000', '33.772051', '113.199529');
INSERT INTO `t_sys_division_coordinate` VALUES ('1549', '新华区', '410402', '410400', '33.743657', '113.30044');
INSERT INTO `t_sys_division_coordinate` VALUES ('1550', '卫东区', '410403', '410400', '33.740376', '113.341611');
INSERT INTO `t_sys_division_coordinate` VALUES ('1551', '石龙区', '410404', '410400', '33.904754', '112.905455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1552', '湛河区', '410411', '410400', '33.68579', '113.250515');
INSERT INTO `t_sys_division_coordinate` VALUES ('1553', '宝丰县', '410421', '410400', '33.874746', '113.061447');
INSERT INTO `t_sys_division_coordinate` VALUES ('1554', '叶县', '410422', '410400', '33.632492', '113.363582');
INSERT INTO `t_sys_division_coordinate` VALUES ('1555', '鲁山县', '410423', '410400', '33.744879', '112.914434');
INSERT INTO `t_sys_division_coordinate` VALUES ('1556', '郏县', '410425', '410400', '33.977486', '113.219606');
INSERT INTO `t_sys_division_coordinate` VALUES ('1557', '舞钢市', '410481', '410400', '33.299431', '113.53141');
INSERT INTO `t_sys_division_coordinate` VALUES ('1558', '汝州市', '410482', '410400', '34.172768', '112.85055');
INSERT INTO `t_sys_division_coordinate` VALUES ('1559', '安阳市', '410500', '410000', '36.105941', '114.3995');
INSERT INTO `t_sys_division_coordinate` VALUES ('1560', '文峰区', '410502', '410500', '36.096833', '114.363374');
INSERT INTO `t_sys_division_coordinate` VALUES ('1561', '北关区', '410503', '410500', '36.113132', '114.362382');
INSERT INTO `t_sys_division_coordinate` VALUES ('1562', '殷都区', '410505', '410500', '36.115758', '114.309598');
INSERT INTO `t_sys_division_coordinate` VALUES ('1563', '龙安区', '410506', '410500', '36.082753', '114.307593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1564', '安阳县', '410522', '410500', '36.218907', '114.238382');
INSERT INTO `t_sys_division_coordinate` VALUES ('1565', '汤阴县', '410523', '410500', '35.927644', '114.363409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1566', '滑县', '410526', '410500', '35.581045', '114.525553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1567', '内黄县', '410527', '410500', '35.97695', '114.907589');
INSERT INTO `t_sys_division_coordinate` VALUES ('1568', '林州市', '410581', '410500', '36.088853', '113.82559');
INSERT INTO `t_sys_division_coordinate` VALUES ('1569', '鹤壁市', '410600', '410000', '35.752357', '114.303594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1570', '鹤山区', '410602', '410600', '35.96028', '114.169555');
INSERT INTO `t_sys_division_coordinate` VALUES ('1571', '山城区', '410603', '410600', '35.90337', '114.190621');
INSERT INTO `t_sys_division_coordinate` VALUES ('1572', '淇滨区', '410611', '410600', '35.746953', '114.305591');
INSERT INTO `t_sys_division_coordinate` VALUES ('1573', '浚县', '410621', '410600', '35.681917', '114.557608');
INSERT INTO `t_sys_division_coordinate` VALUES ('1574', '淇县', '410622', '410600', '35.627277', '114.21549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1575', '新乡市', '410700', '410000', '35.30964', '113.9336');
INSERT INTO `t_sys_division_coordinate` VALUES ('1576', '红旗区', '410702', '410700', '35.310136', '113.881416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1577', '卫滨区', '410703', '410700', '35.308459', '113.872439');
INSERT INTO `t_sys_division_coordinate` VALUES ('1578', '凤泉区', '410704', '410700', '35.375665', '113.912459');
INSERT INTO `t_sys_division_coordinate` VALUES ('1579', '牧野区', '410711', '410700', '35.321023', '113.915513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1580', '新乡县', '410721', '410700', '35.196564', '113.811594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1581', '获嘉县', '410724', '410700', '35.265809', '113.663417');
INSERT INTO `t_sys_division_coordinate` VALUES ('1582', '原阳县', '410725', '410700', '35.071164', '113.946624');
INSERT INTO `t_sys_division_coordinate` VALUES ('1583', '延津县', '410726', '410700', '35.147807', '114.211512');
INSERT INTO `t_sys_division_coordinate` VALUES ('1584', '封丘县', '410727', '410700', '35.046858', '114.425606');
INSERT INTO `t_sys_division_coordinate` VALUES ('1585', '长垣县', '410728', '410700', '35.207198', '114.67561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1586', '卫辉市', '410781', '410700', '35.404069', '114.071601');
INSERT INTO `t_sys_division_coordinate` VALUES ('1587', '辉县市', '410782', '410700', '35.467958', '113.811573');
INSERT INTO `t_sys_division_coordinate` VALUES ('1588', '焦作市', '410800', '410000', '35.220963', '113.248548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1589', '解放区', '410802', '410800', '35.24631', '113.237572');
INSERT INTO `t_sys_division_coordinate` VALUES ('1590', '中站区', '410803', '410800', '35.242617', '113.189448');
INSERT INTO `t_sys_division_coordinate` VALUES ('1591', '马村区', '410804', '410800', '35.261894', '113.328544');
INSERT INTO `t_sys_division_coordinate` VALUES ('1592', '山阳区', '410811', '410800', '35.220272', '113.260484');
INSERT INTO `t_sys_division_coordinate` VALUES ('1593', '修武县', '410821', '410800', '35.229323', '113.454582');
INSERT INTO `t_sys_division_coordinate` VALUES ('1594', '博爱县', '410822', '410800', '35.177308', '113.070478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1595', '武陟县', '410823', '410800', '35.105838', '113.408396');
INSERT INTO `t_sys_division_coordinate` VALUES ('1596', '温县', '410825', '410800', '34.946135', '113.086569');
INSERT INTO `t_sys_division_coordinate` VALUES ('1597', '沁阳市', '410882', '410800', '35.093786', '112.957517');
INSERT INTO `t_sys_division_coordinate` VALUES ('1598', '孟州市', '410883', '410800', '34.913598', '112.797395');
INSERT INTO `t_sys_division_coordinate` VALUES ('1599', '濮阳市', '410900', '410000', '35.767593', '115.035597');
INSERT INTO `t_sys_division_coordinate` VALUES ('1600', '华龙区', '410902', '410900', '35.783633', '115.080413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1601', '清丰县', '410922', '410900', '35.891308', '115.110472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1602', '南乐县', '410923', '410900', '36.076031', '115.211386');
INSERT INTO `t_sys_division_coordinate` VALUES ('1603', '范县', '410926', '410900', '35.857655', '115.510586');
INSERT INTO `t_sys_division_coordinate` VALUES ('1604', '台前县', '410927', '410900', '35.975013', '115.878568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1605', '濮阳县', '410928', '410900', '35.717889', '115.035584');
INSERT INTO `t_sys_division_coordinate` VALUES ('1606', '许昌市', '411000', '410000', '34.041432', '113.858476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1607', '魏都区', '411002', '411000', '34.030861', '113.829596');
INSERT INTO `t_sys_division_coordinate` VALUES ('1608', '许昌县', '411023', '411000', '34.129967', '113.829615');
INSERT INTO `t_sys_division_coordinate` VALUES ('1609', '鄢陵县', '411024', '411000', '34.107963', '114.18562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1610', '襄城县', '411025', '411000', '33.856968', '113.513431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1611', '禹州市', '411081', '411000', '34.146082', '113.495505');
INSERT INTO `t_sys_division_coordinate` VALUES ('1612', '长葛市', '411082', '411000', '34.223016', '113.774421');
INSERT INTO `t_sys_division_coordinate` VALUES ('1613', '漯河市', '411100', '410000', '33.587711', '114.023421');
INSERT INTO `t_sys_division_coordinate` VALUES ('1614', '源汇区', '411102', '411100', '33.578423', '113.990414');
INSERT INTO `t_sys_division_coordinate` VALUES ('1615', '郾城区', '411103', '411100', '33.593416', '114.013394');
INSERT INTO `t_sys_division_coordinate` VALUES ('1616', '召陵区', '411104', '411100', '33.592468', '114.100467');
INSERT INTO `t_sys_division_coordinate` VALUES ('1617', '舞阳县', '411121', '411100', '33.443578', '113.61549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1618', '临颍县', '411122', '411100', '33.832692', '113.937578');
INSERT INTO `t_sys_division_coordinate` VALUES ('1619', '三门峡市', '411200', '410000', '34.778327', '111.206533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1620', '湖滨区', '411202', '411200', '34.775997', '111.195574');
INSERT INTO `t_sys_division_coordinate` VALUES ('1621', '陕州区', '411203', '411200', '34.726915', '111.109451');
INSERT INTO `t_sys_division_coordinate` VALUES ('1622', '渑池县', '411221', '411200', '34.773197', '111.768542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1623', '卢氏县', '411224', '411200', '34.059925', '111.054564');
INSERT INTO `t_sys_division_coordinate` VALUES ('1624', '义马市', '411281', '411200', '34.753028', '111.880515');
INSERT INTO `t_sys_division_coordinate` VALUES ('1625', '灵宝市', '411282', '411200', '34.523143', '110.900408');
INSERT INTO `t_sys_division_coordinate` VALUES ('1626', '南阳市', '411300', '410000', '32.996562', '112.534501');
INSERT INTO `t_sys_division_coordinate` VALUES ('1627', '宛城区', '411302', '411300', '33.00987', '112.546454');
INSERT INTO `t_sys_division_coordinate` VALUES ('1628', '卧龙区', '411303', '411300', '32.992484', '112.541462');
INSERT INTO `t_sys_division_coordinate` VALUES ('1629', '南召县', '411321', '411300', '33.496186', '112.435425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1630', '方城县', '411322', '411300', '33.260539', '113.018503');
INSERT INTO `t_sys_division_coordinate` VALUES ('1631', '西峡县', '411323', '411300', '33.313316', '111.480398');
INSERT INTO `t_sys_division_coordinate` VALUES ('1632', '镇平县', '411324', '411300', '33.039719', '112.241544');
INSERT INTO `t_sys_division_coordinate` VALUES ('1633', '内乡县', '411325', '411300', '33.051203', '111.855425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1634', '淅川县', '411326', '411300', '33.144185', '111.497432');
INSERT INTO `t_sys_division_coordinate` VALUES ('1635', '社旗县', '411327', '411300', '33.062237', '112.954493');
INSERT INTO `t_sys_division_coordinate` VALUES ('1636', '唐河县', '411328', '411300', '32.687721', '112.813424');
INSERT INTO `t_sys_division_coordinate` VALUES ('1637', '新野县', '411329', '411300', '32.526632', '112.36655');
INSERT INTO `t_sys_division_coordinate` VALUES ('1638', '桐柏县', '411330', '411300', '32.385131', '113.434473');
INSERT INTO `t_sys_division_coordinate` VALUES ('1639', '邓州市', '411381', '411300', '32.693917', '112.09342');
INSERT INTO `t_sys_division_coordinate` VALUES ('1640', '商丘市', '411400', '410000', '34.420202', '115.662449');
INSERT INTO `t_sys_division_coordinate` VALUES ('1641', '梁园区', '411402', '411400', '34.449471', '115.620602');
INSERT INTO `t_sys_division_coordinate` VALUES ('1642', '睢阳区', '411403', '411400', '34.394152', '115.659476');
INSERT INTO `t_sys_division_coordinate` VALUES ('1643', '民权县', '411421', '411400', '34.652479', '115.154576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1644', '睢县', '411422', '411400', '34.451617', '115.078411');
INSERT INTO `t_sys_division_coordinate` VALUES ('1645', '宁陵县', '411423', '411400', '34.466634', '115.320418');
INSERT INTO `t_sys_division_coordinate` VALUES ('1646', '柘城县', '411424', '411400', '34.09736', '115.312435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1647', '虞城县', '411425', '411400', '34.405332', '115.834473');
INSERT INTO `t_sys_division_coordinate` VALUES ('1648', '夏邑县', '411426', '411400', '34.243523', '116.137512');
INSERT INTO `t_sys_division_coordinate` VALUES ('1649', '永城市', '411481', '411400', '33.934801', '116.455566');
INSERT INTO `t_sys_division_coordinate` VALUES ('1650', '信阳市', '411500', '410000', '32.153015', '114.097483');
INSERT INTO `t_sys_division_coordinate` VALUES ('1651', '浉河区', '411502', '411500', '32.122554', '114.065581');
INSERT INTO `t_sys_division_coordinate` VALUES ('1652', '平桥区', '411503', '411500', '32.107325', '114.132407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1653', '罗山县', '411521', '411500', '32.20915', '114.51953');
INSERT INTO `t_sys_division_coordinate` VALUES ('1654', '光山县', '411522', '411500', '32.015907', '114.925533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1655', '新县', '411523', '411500', '31.649738', '114.885525');
INSERT INTO `t_sys_division_coordinate` VALUES ('1656', '商城县', '411524', '411500', '31.804345', '115.413513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1657', '固始县', '411525', '411500', '32.174174', '115.660488');
INSERT INTO `t_sys_division_coordinate` VALUES ('1658', '潢川县', '411526', '411500', '32.137531', '115.058471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1659', '淮滨县', '411527', '411500', '32.47947', '115.426439');
INSERT INTO `t_sys_division_coordinate` VALUES ('1660', '息县', '411528', '411500', '32.348956', '114.747453');
INSERT INTO `t_sys_division_coordinate` VALUES ('1661', '周口市', '411600', '410000', '33.631829', '114.703483');
INSERT INTO `t_sys_division_coordinate` VALUES ('1662', '川汇区', '411602', '411600', '33.652997', '114.657602');
INSERT INTO `t_sys_division_coordinate` VALUES ('1663', '扶沟县', '411621', '411600', '34.065906', '114.40151');
INSERT INTO `t_sys_division_coordinate` VALUES ('1664', '西华县', '411622', '411600', '33.773215', '114.535597');
INSERT INTO `t_sys_division_coordinate` VALUES ('1665', '商水县', '411623', '411600', '33.548877', '114.618416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1666', '沈丘县', '411624', '411600', '33.415691', '115.105455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1667', '郸城县', '411625', '411600', '33.650828', '115.183478');
INSERT INTO `t_sys_division_coordinate` VALUES ('1668', '淮阳县', '411626', '411600', '33.737347', '114.892586');
INSERT INTO `t_sys_division_coordinate` VALUES ('1669', '太康县', '411627', '411600', '34.070038', '114.844384');
INSERT INTO `t_sys_division_coordinate` VALUES ('1670', '鹿邑县', '411628', '411600', '33.867173', '115.490585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1671', '项城市', '411681', '411600', '33.473007', '114.881514');
INSERT INTO `t_sys_division_coordinate` VALUES ('1672', '驻马店市', '411700', '410000', '33.017842', '114.028471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1673', '驿城区', '411702', '411700', '32.97952', '114.000387');
INSERT INTO `t_sys_division_coordinate` VALUES ('1674', '西平县', '411721', '411700', '33.393861', '114.027474');
INSERT INTO `t_sys_division_coordinate` VALUES ('1675', '上蔡县', '411722', '411700', '33.268511', '114.270487');
INSERT INTO `t_sys_division_coordinate` VALUES ('1676', '平舆县', '411723', '411700', '32.967982', '114.625429');
INSERT INTO `t_sys_division_coordinate` VALUES ('1677', '正阳县', '411724', '411700', '32.611641', '114.399497');
INSERT INTO `t_sys_division_coordinate` VALUES ('1678', '确山县', '411725', '411700', '32.808176', '114.032495');
INSERT INTO `t_sys_division_coordinate` VALUES ('1679', '泌阳县', '411726', '411700', '32.729731', '113.333558');
INSERT INTO `t_sys_division_coordinate` VALUES ('1680', '汝南县', '411727', '411700', '33.013141', '114.369409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1681', '遂平县', '411728', '411700', '33.151971', '114.019441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1682', '新蔡县', '411729', '411700', '32.755269', '114.992469');
INSERT INTO `t_sys_division_coordinate` VALUES ('1683', '济源市', '419001', '410000', '35.072907', '112.608581');
INSERT INTO `t_sys_division_coordinate` VALUES ('1684', '湖北省', '420000', '0', '30.5516', '114.348441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1685', '武汉市', '420100', '420000', '30.598467', '114.311582');
INSERT INTO `t_sys_division_coordinate` VALUES ('1686', '江岸区', '420102', '420100', '30.605403', '114.316579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1687', '江汉区', '420103', '420100', '30.607282', '114.277506');
INSERT INTO `t_sys_division_coordinate` VALUES ('1688', '硚口区', '420104', '420100', '30.587584', '114.22146');
INSERT INTO `t_sys_division_coordinate` VALUES ('1689', '汉阳区', '420105', '420100', '30.560052', '114.225446');
INSERT INTO `t_sys_division_coordinate` VALUES ('1690', '武昌区', '420106', '420100', '30.559567', '114.322549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1691', '青山区', '420107', '420100', '30.646593', '114.391493');
INSERT INTO `t_sys_division_coordinate` VALUES ('1692', '洪山区', '420111', '420100', '30.506334', '114.350456');
INSERT INTO `t_sys_division_coordinate` VALUES ('1693', '东西湖区', '420112', '420100', '30.62592', '114.143459');
INSERT INTO `t_sys_division_coordinate` VALUES ('1694', '汉南区', '420113', '420100', '30.314809', '114.091515');
INSERT INTO `t_sys_division_coordinate` VALUES ('1695', '蔡甸区', '420114', '420100', '30.588114', '114.03548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1696', '江夏区', '420115', '420100', '30.381564', '114.328551');
INSERT INTO `t_sys_division_coordinate` VALUES ('1697', '黄陂区', '420116', '420100', '30.887534', '114.382454');
INSERT INTO `t_sys_division_coordinate` VALUES ('1698', '新洲区', '420117', '420100', '30.847244', '114.807543');
INSERT INTO `t_sys_division_coordinate` VALUES ('1699', '黄石市', '420200', '420000', '30.205208', '115.045533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1700', '黄石港区', '420202', '420200', '30.229053', '115.072417');
INSERT INTO `t_sys_division_coordinate` VALUES ('1701', '西塞山区', '420203', '420200', '30.210695', '115.116481');
INSERT INTO `t_sys_division_coordinate` VALUES ('1702', '下陆区', '420204', '420200', '30.180046', '114.967416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1703', '铁山区', '420205', '420200', '30.212251', '114.907571');
INSERT INTO `t_sys_division_coordinate` VALUES ('1704', '阳新县', '420222', '420200', '29.836542', '115.221427');
INSERT INTO `t_sys_division_coordinate` VALUES ('1705', '大冶市', '420281', '420200', '30.101668', '114.986436');
INSERT INTO `t_sys_division_coordinate` VALUES ('1706', '十堰市', '420300', '420000', '32.635062', '110.80453');
INSERT INTO `t_sys_division_coordinate` VALUES ('1707', '茅箭区', '420302', '420300', '32.597287', '110.81958');
INSERT INTO `t_sys_division_coordinate` VALUES ('1708', '张湾区', '420303', '420300', '32.6584', '110.775424');
INSERT INTO `t_sys_division_coordinate` VALUES ('1709', '郧阳区', '420304', '420300', '32.840592', '110.818577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1710', '郧西县', '420322', '420300', '32.999167', '110.432473');
INSERT INTO `t_sys_division_coordinate` VALUES ('1711', '竹山县', '420323', '420300', '32.230304', '110.235582');
INSERT INTO `t_sys_division_coordinate` VALUES ('1712', '竹溪县', '420324', '420300', '32.32412', '109.721542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1713', '房县', '420325', '420300', '32.061685', '110.747462');
INSERT INTO `t_sys_division_coordinate` VALUES ('1714', '丹江口市', '420381', '420300', '32.546253', '111.519532');
INSERT INTO `t_sys_division_coordinate` VALUES ('1715', '宜昌市', '420500', '420000', '30.697446', '111.292549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1716', '西陵区', '420502', '420500', '30.716749', '111.29256');
INSERT INTO `t_sys_division_coordinate` VALUES ('1717', '伍家岗区', '420503', '420500', '30.650737', '111.367422');
INSERT INTO `t_sys_division_coordinate` VALUES ('1718', '点军区', '420504', '420500', '30.69933', '111.274471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1719', '猇亭区', '420505', '420500', '30.536466', '111.441574');
INSERT INTO `t_sys_division_coordinate` VALUES ('1720', '夷陵区', '420506', '420500', '30.774833', '111.33253');
INSERT INTO `t_sys_division_coordinate` VALUES ('1721', '远安县', '420525', '420500', '31.066628', '111.64653');
INSERT INTO `t_sys_division_coordinate` VALUES ('1722', '兴山县', '420526', '420500', '31.354464', '110.753446');
INSERT INTO `t_sys_division_coordinate` VALUES ('1723', '秭归县', '420527', '420500', '30.831932', '110.984449');
INSERT INTO `t_sys_division_coordinate` VALUES ('1724', '长阳土家族自治县', '420528', '420500', '30.478646', '111.213507');
INSERT INTO `t_sys_division_coordinate` VALUES ('1725', '五峰土家族自治县', '420529', '420500', '30.171156', '111.052581');
INSERT INTO `t_sys_division_coordinate` VALUES ('1726', '宜都市', '420581', '420500', '30.384404', '111.456516');
INSERT INTO `t_sys_division_coordinate` VALUES ('1727', '当阳市', '420582', '420500', '30.826989', '111.794569');
INSERT INTO `t_sys_division_coordinate` VALUES ('1728', '枝江市', '420583', '420500', '30.431731', '111.76654');
INSERT INTO `t_sys_division_coordinate` VALUES ('1729', '襄阳市', '420600', '420000', '32.014797', '112.128537');
INSERT INTO `t_sys_division_coordinate` VALUES ('1730', '襄城区', '420602', '420600', '32.016175', '112.140572');
INSERT INTO `t_sys_division_coordinate` VALUES ('1731', '樊城区', '420606', '420600', '32.050572', '112.142599');
INSERT INTO `t_sys_division_coordinate` VALUES ('1732', '襄州区', '420607', '420600', '32.093376', '112.218434');
INSERT INTO `t_sys_division_coordinate` VALUES ('1733', '南漳县', '420624', '420600', '31.78113', '111.845386');
INSERT INTO `t_sys_division_coordinate` VALUES ('1734', '谷城县', '420625', '420600', '32.268983', '111.659576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1735', '保康县', '420626', '420600', '31.883847', '111.267441');
INSERT INTO `t_sys_division_coordinate` VALUES ('1736', '老河口市', '420682', '420600', '32.39246', '111.681556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1737', '枣阳市', '420683', '420600', '32.13473', '112.778471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1738', '宜城市', '420684', '420600', '31.72547', '112.264611');
INSERT INTO `t_sys_division_coordinate` VALUES ('1739', '鄂州市', '420700', '420000', '30.396572', '114.901607');
INSERT INTO `t_sys_division_coordinate` VALUES ('1740', '梁子湖区', '420702', '420700', '30.105907', '114.691507');
INSERT INTO `t_sys_division_coordinate` VALUES ('1741', '华容区', '420703', '420700', '30.5406', '114.736426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1742', '鄂城区', '420704', '420700', '30.406389', '114.8986');
INSERT INTO `t_sys_division_coordinate` VALUES ('1743', '荆门市', '420800', '420000', '31.041733', '112.206393');
INSERT INTO `t_sys_division_coordinate` VALUES ('1744', '东宝区', '420802', '420800', '31.058429', '112.208388');
INSERT INTO `t_sys_division_coordinate` VALUES ('1745', '掇刀区', '420804', '420800', '30.979911', '112.214428');
INSERT INTO `t_sys_division_coordinate` VALUES ('1746', '京山县', '420821', '420800', '31.024331', '113.126548');
INSERT INTO `t_sys_division_coordinate` VALUES ('1747', '沙洋县', '420822', '420800', '30.715315', '112.595485');
INSERT INTO `t_sys_division_coordinate` VALUES ('1748', '钟祥市', '420881', '420800', '31.17403', '112.594471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1749', '孝感市', '420900', '420000', '30.930689', '113.92251');
INSERT INTO `t_sys_division_coordinate` VALUES ('1750', '孝南区', '420902', '420900', '30.922978', '113.91749');
INSERT INTO `t_sys_division_coordinate` VALUES ('1751', '孝昌县', '420921', '420900', '31.26454', '114.004409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1752', '大悟县', '420922', '420900', '31.56722', '114.133413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1753', '云梦县', '420923', '420900', '31.027218', '113.759412');
INSERT INTO `t_sys_division_coordinate` VALUES ('1754', '应城市', '420981', '420900', '30.933977', '113.579567');
INSERT INTO `t_sys_division_coordinate` VALUES ('1755', '安陆市', '420982', '420900', '31.261415', '113.695583');
INSERT INTO `t_sys_division_coordinate` VALUES ('1756', '汉川市', '420984', '420900', '30.666914', '113.845549');
INSERT INTO `t_sys_division_coordinate` VALUES ('1757', '荆州市', '421000', '420000', '30.340842', '112.245523');
INSERT INTO `t_sys_division_coordinate` VALUES ('1758', '沙市区', '421002', '421000', '30.316572', '112.261577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1759', '荆州区', '421003', '421000', '30.358989', '112.196414');
INSERT INTO `t_sys_division_coordinate` VALUES ('1760', '公安县', '421022', '421000', '30.064401', '112.236502');
INSERT INTO `t_sys_division_coordinate` VALUES ('1761', '监利县', '421023', '421000', '29.845735', '112.91142');
INSERT INTO `t_sys_division_coordinate` VALUES ('1762', '江陵县', '421024', '421000', '30.048043', '112.431452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1763', '石首市', '421081', '421000', '29.727034', '112.43142');
INSERT INTO `t_sys_division_coordinate` VALUES ('1764', '洪湖市', '421083', '421000', '29.83277', '113.482553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1765', '松滋市', '421087', '421000', '30.175342', '111.77358');
INSERT INTO `t_sys_division_coordinate` VALUES ('1766', '黄冈市', '421100', '420000', '30.459359', '114.87849');
INSERT INTO `t_sys_division_coordinate` VALUES ('1767', '黄州区', '421102', '421100', '30.440224', '114.886532');
INSERT INTO `t_sys_division_coordinate` VALUES ('1768', '团风县', '421121', '421100', '30.649368', '114.878524');
INSERT INTO `t_sys_division_coordinate` VALUES ('1769', '红安县', '421122', '421100', '31.294297', '114.624426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1770', '罗田县', '421123', '421100', '30.78891', '115.405547');
INSERT INTO `t_sys_division_coordinate` VALUES ('1771', '英山县', '421124', '421100', '30.74135', '115.687422');
INSERT INTO `t_sys_division_coordinate` VALUES ('1772', '浠水县', '421125', '421100', '30.457461', '115.271569');
INSERT INTO `t_sys_division_coordinate` VALUES ('1773', '蕲春县', '421126', '421100', '30.232535', '115.442399');
INSERT INTO `t_sys_division_coordinate` VALUES ('1774', '黄梅县', '421127', '421100', '30.076605', '115.950462');
INSERT INTO `t_sys_division_coordinate` VALUES ('1775', '麻城市', '421181', '421100', '31.176996', '115.016562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1776', '武穴市', '421182', '421100', '29.850441', '115.567392');
INSERT INTO `t_sys_division_coordinate` VALUES ('1777', '咸宁市', '421200', '420000', '29.847056', '114.328519');
INSERT INTO `t_sys_division_coordinate` VALUES ('1778', '咸安区', '421202', '421200', '29.858154', '114.30457');
INSERT INTO `t_sys_division_coordinate` VALUES ('1779', '嘉鱼县', '421221', '421200', '29.976354', '113.94557');
INSERT INTO `t_sys_division_coordinate` VALUES ('1780', '通城县', '421222', '421200', '29.250858', '113.823568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1781', '崇阳县', '421223', '421200', '29.561334', '114.046563');
INSERT INTO `t_sys_division_coordinate` VALUES ('1782', '通山县', '421224', '421200', '29.612634', '114.489393');
INSERT INTO `t_sys_division_coordinate` VALUES ('1783', '赤壁市', '421281', '421200', '29.730666', '113.906437');
INSERT INTO `t_sys_division_coordinate` VALUES ('1784', '随州市', '421300', '420000', '31.696517', '113.38945');
INSERT INTO `t_sys_division_coordinate` VALUES ('1785', '曾都区', '421303', '421300', '31.722123', '113.377513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1786', '随县', '421321', '421300', '31.722123', '113.377513');
INSERT INTO `t_sys_division_coordinate` VALUES ('1787', '广水市', '421381', '421300', '31.622476', '113.832593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1788', '恩施土家族苗族自治州', '422800', '420000', '30.27794', '109.494593');
INSERT INTO `t_sys_division_coordinate` VALUES ('1789', '恩施市', '422801', '422800', '30.301037', '109.48655');
INSERT INTO `t_sys_division_coordinate` VALUES ('1790', '利川市', '422802', '422800', '30.297203', '108.942481');
INSERT INTO `t_sys_division_coordinate` VALUES ('1791', '建始县', '422822', '422800', '30.607907', '109.728556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1792', '巴东县', '422823', '422800', '31.048064', '110.347575');
INSERT INTO `t_sys_division_coordinate` VALUES ('1793', '宣恩县', '422825', '422800', '29.992604', '109.497568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1794', '咸丰县', '422826', '422800', '29.671078', '109.146608');
INSERT INTO `t_sys_division_coordinate` VALUES ('1795', '来凤县', '422827', '422800', '29.499444', '109.413495');
INSERT INTO `t_sys_division_coordinate` VALUES ('1796', '鹤峰县', '422828', '422800', '29.896116', '110.040424');
INSERT INTO `t_sys_division_coordinate` VALUES ('1797', '仙桃市', '429004', '420000', '30.368272', '113.461591');
INSERT INTO `t_sys_division_coordinate` VALUES ('1798', '潜江市', '429005', '420000', '30.408358', '112.905474');
INSERT INTO `t_sys_division_coordinate` VALUES ('1799', '天门市', '429006', '420000', '30.669622', '113.172409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1800', '神农架林区', '429021', '420000', '31.750496', '110.682525');
INSERT INTO `t_sys_division_coordinate` VALUES ('1801', '湖南省', '430000', '0', '28.11827', '112.989603');
INSERT INTO `t_sys_division_coordinate` VALUES ('1802', '长沙市', '430100', '430000', '28.234889', '112.945473');
INSERT INTO `t_sys_division_coordinate` VALUES ('1803', '芙蓉区', '430102', '430100', '28.191913', '113.039408');
INSERT INTO `t_sys_division_coordinate` VALUES ('1804', '天心区', '430103', '430100', '28.118211', '112.996592');
INSERT INTO `t_sys_division_coordinate` VALUES ('1805', '岳麓区', '430104', '430100', '28.241489', '112.937448');
INSERT INTO `t_sys_division_coordinate` VALUES ('1806', '开福区', '430105', '430100', '28.261379', '112.992585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1807', '雨花区', '430111', '430100', '28.142233', '113.042422');
INSERT INTO `t_sys_division_coordinate` VALUES ('1808', '望城区', '430112', '430100', '28.367403', '112.824466');
INSERT INTO `t_sys_division_coordinate` VALUES ('1809', '长沙县', '430121', '430100', '28.251818', '113.087559');
INSERT INTO `t_sys_division_coordinate` VALUES ('1810', '宁乡县', '430124', '430100', '28.284105', '112.558407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1811', '浏阳市', '430181', '430100', '28.169832', '113.649398');
INSERT INTO `t_sys_division_coordinate` VALUES ('1812', '株洲市', '430200', '430000', '27.833568', '113.140471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1813', '荷塘区', '430202', '430200', '27.862156', '113.180452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1814', '芦淞区', '430203', '430200', '27.791509', '113.158419');
INSERT INTO `t_sys_division_coordinate` VALUES ('1815', '石峰区', '430204', '430200', '27.880705', '113.124568');
INSERT INTO `t_sys_division_coordinate` VALUES ('1816', '天元区', '430211', '430200', '27.833084', '113.089541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1817', '株洲县', '430221', '430200', '27.704323', '113.150427');
INSERT INTO `t_sys_division_coordinate` VALUES ('1818', '攸县', '430223', '430200', '27.005772', '113.351578');
INSERT INTO `t_sys_division_coordinate` VALUES ('1819', '茶陵县', '430224', '430200', '26.783589', '113.545472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1820', '炎陵县', '430225', '430200', '26.496061', '113.779419');
INSERT INTO `t_sys_division_coordinate` VALUES ('1821', '醴陵市', '430281', '430200', '27.652325', '113.503483');
INSERT INTO `t_sys_division_coordinate` VALUES ('1822', '湘潭市', '430300', '430000', '27.835702', '112.950464');
INSERT INTO `t_sys_division_coordinate` VALUES ('1823', '雨湖区', '430302', '430300', '27.862467', '112.91345');
INSERT INTO `t_sys_division_coordinate` VALUES ('1824', '岳塘区', '430304', '430300', '27.877721', '112.975589');
INSERT INTO `t_sys_division_coordinate` VALUES ('1825', '湘潭县', '430321', '430300', '27.784983', '112.957505');
INSERT INTO `t_sys_division_coordinate` VALUES ('1826', '湘乡市', '430381', '430300', '27.740191', '112.541492');
INSERT INTO `t_sys_division_coordinate` VALUES ('1827', '韶山市', '430382', '430300', '27.921044', '112.533499');
INSERT INTO `t_sys_division_coordinate` VALUES ('1828', '衡阳市', '430400', '430000', '26.899576', '112.578447');
INSERT INTO `t_sys_division_coordinate` VALUES ('1829', '珠晖区', '430405', '430400', '26.900265', '112.626594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1830', '雁峰区', '430406', '430400', '26.894368', '112.623588');
INSERT INTO `t_sys_division_coordinate` VALUES ('1831', '石鼓区', '430407', '430400', '26.948962', '112.60453');
INSERT INTO `t_sys_division_coordinate` VALUES ('1832', '蒸湘区', '430408', '430400', '26.91772', '112.573444');
INSERT INTO `t_sys_division_coordinate` VALUES ('1833', '南岳区', '430412', '430400', '27.23836', '112.745574');
INSERT INTO `t_sys_division_coordinate` VALUES ('1834', '衡阳县', '430421', '430400', '26.975295', '112.377553');
INSERT INTO `t_sys_division_coordinate` VALUES ('1835', '衡南县', '430422', '430400', '26.744532', '112.684403');
INSERT INTO `t_sys_division_coordinate` VALUES ('1836', '衡山县', '430423', '430400', '27.235996', '112.875563');
INSERT INTO `t_sys_division_coordinate` VALUES ('1837', '衡东县', '430424', '430400', '27.087043', '112.959495');
INSERT INTO `t_sys_division_coordinate` VALUES ('1838', '祁东县', '430426', '430400', '26.805995', '112.096447');
INSERT INTO `t_sys_division_coordinate` VALUES ('1839', '耒阳市', '430481', '430400', '26.428066', '112.866597');
INSERT INTO `t_sys_division_coordinate` VALUES ('1840', '常宁市', '430482', '430400', '26.42672', '112.405561');
INSERT INTO `t_sys_division_coordinate` VALUES ('1841', '邵阳市', '430500', '430000', '27.24527', '111.474433');
INSERT INTO `t_sys_division_coordinate` VALUES ('1842', '双清区', '430502', '430500', '27.239109', '111.503442');
INSERT INTO `t_sys_division_coordinate` VALUES ('1843', '大祥区', '430503', '430500', '27.227014', '111.445528');
INSERT INTO `t_sys_division_coordinate` VALUES ('1844', '北塔区', '430511', '430500', '27.251536', '111.458497');
INSERT INTO `t_sys_division_coordinate` VALUES ('1845', '邵东县', '430521', '430500', '27.264507', '111.750491');
INSERT INTO `t_sys_division_coordinate` VALUES ('1846', '新邵县', '430522', '430500', '27.327132', '111.464449');
INSERT INTO `t_sys_division_coordinate` VALUES ('1847', '邵阳县', '430523', '430500', '26.996528', '111.280508');
INSERT INTO `t_sys_division_coordinate` VALUES ('1848', '隆回县', '430524', '430500', '27.119946', '111.039507');
INSERT INTO `t_sys_division_coordinate` VALUES ('1849', '洞口县', '430525', '430500', '27.065975', '110.582579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1850', '绥宁县', '430527', '430500', '26.588423', '110.16242');
INSERT INTO `t_sys_division_coordinate` VALUES ('1851', '新宁县', '430528', '430500', '26.439724', '110.863491');
INSERT INTO `t_sys_division_coordinate` VALUES ('1852', '城步苗族自治县', '430529', '430500', '26.396203', '110.328537');
INSERT INTO `t_sys_division_coordinate` VALUES ('1853', '武冈市', '430581', '430500', '26.732899', '110.638408');
INSERT INTO `t_sys_division_coordinate` VALUES ('1854', '岳阳市', '430600', '430000', '29.363178', '113.135489');
INSERT INTO `t_sys_division_coordinate` VALUES ('1855', '岳阳楼区', '430602', '430600', '29.377995', '113.136481');
INSERT INTO `t_sys_division_coordinate` VALUES ('1856', '云溪区', '430603', '430600', '29.479907', '113.278407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1857', '君山区', '430611', '430600', '29.467129', '113.012517');
INSERT INTO `t_sys_division_coordinate` VALUES ('1858', '岳阳县', '430621', '430600', '29.150269', '113.122544');
INSERT INTO `t_sys_division_coordinate` VALUES ('1859', '华容县', '430623', '430600', '29.536286', '112.547462');
INSERT INTO `t_sys_division_coordinate` VALUES ('1860', '湘阴县', '430624', '430600', '28.676676', '112.889522');
INSERT INTO `t_sys_division_coordinate` VALUES ('1861', '平江县', '430626', '430600', '28.707564', '113.587604');
INSERT INTO `t_sys_division_coordinate` VALUES ('1862', '汨罗市', '430681', '430600', '28.812455', '113.073493');
INSERT INTO `t_sys_division_coordinate` VALUES ('1863', '临湘市', '430682', '430600', '29.482801', '113.456562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1864', '常德市', '430700', '430000', '29.03775', '111.705452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1865', '武陵区', '430702', '430700', '29.060783', '111.689545');
INSERT INTO `t_sys_division_coordinate` VALUES ('1866', '鼎城区', '430703', '430700', '29.024443', '111.687522');
INSERT INTO `t_sys_division_coordinate` VALUES ('1867', '安乡县', '430721', '430700', '29.41732', '112.177506');
INSERT INTO `t_sys_division_coordinate` VALUES ('1868', '汉寿县', '430722', '430700', '28.912288', '111.976412');
INSERT INTO `t_sys_division_coordinate` VALUES ('1869', '澧县', '430723', '430700', '29.638946', '111.765534');
INSERT INTO `t_sys_division_coordinate` VALUES ('1870', '临澧县', '430724', '430700', '29.446544', '111.653585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1871', '桃源县', '430725', '430700', '28.908694', '111.495407');
INSERT INTO `t_sys_division_coordinate` VALUES ('1872', '石门县', '430726', '430700', '29.590366', '111.386451');
INSERT INTO `t_sys_division_coordinate` VALUES ('1873', '津市市', '430781', '430700', '29.611259', '111.884517');
INSERT INTO `t_sys_division_coordinate` VALUES ('1874', '张家界市', '430800', '430000', '29.122816', '110.485533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1875', '永定区', '430802', '430800', '29.126191', '110.544432');
INSERT INTO `t_sys_division_coordinate` VALUES ('1876', '武陵源区', '430811', '430800', '29.351681', '110.557499');
INSERT INTO `t_sys_division_coordinate` VALUES ('1877', '慈利县', '430821', '430800', '29.435987', '111.145471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1878', '桑植县', '430822', '430800', '29.405923', '110.170413');
INSERT INTO `t_sys_division_coordinate` VALUES ('1879', '益阳市', '430900', '430000', '28.559711', '112.361516');
INSERT INTO `t_sys_division_coordinate` VALUES ('1880', '资阳区', '430902', '430900', '28.597235', '112.330435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1881', '赫山区', '430903', '430900', '28.584984', '112.380598');
INSERT INTO `t_sys_division_coordinate` VALUES ('1882', '南县', '430921', '430900', '29.36707', '112.402542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1883', '桃江县', '430922', '430900', '28.523871', '112.162541');
INSERT INTO `t_sys_division_coordinate` VALUES ('1884', '安化县', '430923', '430900', '28.380054', '111.219493');
INSERT INTO `t_sys_division_coordinate` VALUES ('1885', '沅江市', '430981', '430900', '28.850234', '112.360532');
INSERT INTO `t_sys_division_coordinate` VALUES ('1886', '郴州市', '431000', '430000', '25.776683', '113.02146');
INSERT INTO `t_sys_division_coordinate` VALUES ('1887', '北湖区', '431002', '431000', '25.790815', '113.017482');
INSERT INTO `t_sys_division_coordinate` VALUES ('1888', '苏仙区', '431003', '431000', '25.806737', '113.048423');
INSERT INTO `t_sys_division_coordinate` VALUES ('1889', '桂阳县', '431021', '431000', '25.759775', '112.74056');
INSERT INTO `t_sys_division_coordinate` VALUES ('1890', '宜章县', '431022', '431000', '25.405714', '112.955479');
INSERT INTO `t_sys_division_coordinate` VALUES ('1891', '永兴县', '431023', '431000', '26.132968', '113.122533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1892', '嘉禾县', '431024', '431000', '25.593422', '112.375584');
INSERT INTO `t_sys_division_coordinate` VALUES ('1893', '临武县', '431025', '431000', '25.282527', '112.570411');
INSERT INTO `t_sys_division_coordinate` VALUES ('1894', '汝城县', '431026', '431000', '25.556057', '113.691545');
INSERT INTO `t_sys_division_coordinate` VALUES ('1895', '桂东县', '431027', '431000', '26.083174', '113.951594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1896', '安仁县', '431028', '431000', '26.715683', '113.275424');
INSERT INTO `t_sys_division_coordinate` VALUES ('1897', '资兴市', '431081', '431000', '25.981874', '113.242556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1898', '永州市', '431100', '430000', '26.425864', '111.619455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1899', '零陵区', '431102', '431100', '26.227682', '111.637502');
INSERT INTO `t_sys_division_coordinate` VALUES ('1900', '冷水滩区', '431103', '431100', '26.467706', '111.598426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1901', '祁阳县', '431121', '431100', '26.586435', '111.84742');
INSERT INTO `t_sys_division_coordinate` VALUES ('1902', '东安县', '431122', '431100', '26.398288', '111.323542');
INSERT INTO `t_sys_division_coordinate` VALUES ('1903', '双牌县', '431123', '431100', '25.967169', '111.667594');
INSERT INTO `t_sys_division_coordinate` VALUES ('1904', '道县', '431124', '431100', '25.53253', '111.607404');
INSERT INTO `t_sys_division_coordinate` VALUES ('1905', '江永县', '431125', '431100', '25.279721', '111.350437');
INSERT INTO `t_sys_division_coordinate` VALUES ('1906', '宁远县', '431126', '431100', '25.577052', '111.952453');
INSERT INTO `t_sys_division_coordinate` VALUES ('1907', '蓝山县', '431127', '431100', '25.375935', '112.203435');
INSERT INTO `t_sys_division_coordinate` VALUES ('1908', '新田县', '431128', '431100', '25.909826', '112.210409');
INSERT INTO `t_sys_division_coordinate` VALUES ('1909', '江华瑶族自治县', '431129', '431100', '25.191349', '111.585452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1910', '怀化市', '431200', '430000', '27.575161', '110.008514');
INSERT INTO `t_sys_division_coordinate` VALUES ('1911', '鹤城区', '431202', '431200', '27.585226', '110.0464');
INSERT INTO `t_sys_division_coordinate` VALUES ('1912', '中方县', '431221', '431200', '27.446081', '109.951462');
INSERT INTO `t_sys_division_coordinate` VALUES ('1913', '沅陵县', '431222', '431200', '28.459018', '110.400431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1914', '辰溪县', '431223', '431200', '28.012605', '110.190487');
INSERT INTO `t_sys_division_coordinate` VALUES ('1915', '溆浦县', '431224', '431200', '27.913963', '110.601551');
INSERT INTO `t_sys_division_coordinate` VALUES ('1916', '会同县', '431225', '431200', '26.893384', '109.741586');
INSERT INTO `t_sys_division_coordinate` VALUES ('1917', '麻阳苗族自治县', '431226', '431200', '27.87193', '109.809436');
INSERT INTO `t_sys_division_coordinate` VALUES ('1918', '新晃侗族自治县', '431227', '431200', '27.358783', '109.181472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1919', '芷江侗族自治县', '431228', '431200', '27.449513', '109.691402');
INSERT INTO `t_sys_division_coordinate` VALUES ('1920', '靖州苗族侗族自治县', '431229', '431200', '26.581321', '109.702452');
INSERT INTO `t_sys_division_coordinate` VALUES ('1921', '通道侗族自治县', '431230', '431200', '26.16422', '109.790445');
INSERT INTO `t_sys_division_coordinate` VALUES ('1922', '洪江市', '431281', '431200', '27.215077', '109.84351');
INSERT INTO `t_sys_division_coordinate` VALUES ('1923', '娄底市', '431300', '430000', '27.703209', '112.001503');
INSERT INTO `t_sys_division_coordinate` VALUES ('1924', '娄星区', '431302', '431300', '27.735605', '112.008558');
INSERT INTO `t_sys_division_coordinate` VALUES ('1925', '双峰县', '431321', '431300', '27.462983', '112.18146');
INSERT INTO `t_sys_division_coordinate` VALUES ('1926', '新化县', '431322', '431300', '27.732667', '111.334515');
INSERT INTO `t_sys_division_coordinate` VALUES ('1927', '冷水江市', '431381', '431300', '27.692059', '111.44154');
INSERT INTO `t_sys_division_coordinate` VALUES ('1928', '涟源市', '431382', '431300', '27.698168', '111.670562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1929', '湘西土家族苗族自治州', '433100', '430000', '28.317369', '109.745577');
INSERT INTO `t_sys_division_coordinate` VALUES ('1930', '吉首市', '433101', '433100', '28.267493', '109.704449');
INSERT INTO `t_sys_division_coordinate` VALUES ('1931', '泸溪县', '433122', '433100', '28.221873', '110.226599');
INSERT INTO `t_sys_division_coordinate` VALUES ('1932', '凤凰县', '433123', '433100', '27.953848', '109.605527');
INSERT INTO `t_sys_division_coordinate` VALUES ('1933', '花垣县', '433124', '433100', '28.57791', '109.488562');
INSERT INTO `t_sys_division_coordinate` VALUES ('1934', '保靖县', '433125', '433100', '28.705969', '109.666474');
INSERT INTO `t_sys_division_coordinate` VALUES ('1935', '古丈县', '433126', '433100', '28.623084', '109.957507');
INSERT INTO `t_sys_division_coordinate` VALUES ('1936', '永顺县', '433127', '433100', '28.985774', '109.863586');
INSERT INTO `t_sys_division_coordinate` VALUES ('1937', '龙山县', '433130', '433100', '29.464122', '109.450416');
INSERT INTO `t_sys_division_coordinate` VALUES ('1938', '广东省', '440000', '0', '23.137949', '113.272429');
INSERT INTO `t_sys_division_coordinate` VALUES ('1939', '广州市', '440100', '440000', '23.135336', '113.271431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1940', '荔湾区', '440103', '440100', '23.131791', '113.250502');
INSERT INTO `t_sys_division_coordinate` VALUES ('1941', '越秀区', '440104', '440100', '23.13526', '113.273426');
INSERT INTO `t_sys_division_coordinate` VALUES ('1942', '海珠区', '440105', '440100', '23.088981', '113.32354');
INSERT INTO `t_sys_division_coordinate` VALUES ('1943', '天河区', '440106', '440100', '23.130358', '113.368509');
INSERT INTO `t_sys_division_coordinate` VALUES ('1944', '白云区', '440111', '440100', '23.164317', '113.279433');
INSERT INTO `t_sys_division_coordinate` VALUES ('1945', '黄埔区', '440112', '440100', '23.112058', '113.466563');
INSERT INTO `t_sys_division_coordinate` VALUES ('1946', '番禺区', '440113', '440100', '22.943831', '113.39047');
INSERT INTO `t_sys_division_coordinate` VALUES ('1947', '花都区', '440114', '440100', '23.411162', '113.226576');
INSERT INTO `t_sys_division_coordinate` VALUES ('1948', '南沙区', '440115', '440100', '22.807929', '113.531436');
INSERT INTO `t_sys_division_coordinate` VALUES ('1949', '从化区', '440117', '440100', '23.553986', '113.593585');
INSERT INTO `t_sys_division_coordinate` VALUES ('1950', '增城区', '440118', '440100', '23.266592', '113.817546');
INSERT INTO `t_sys_division_coordinate` VALUES ('1951', '韶关市', '440200', '440000', '24.815881', '113.603527');
INSERT INTO `t_sys_division_coordinate` VALUES ('1952', '武江区', '440203', '440200', '24.798486', '113.594556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1953', '浈江区', '440204', '440200', '24.810414', '113.617477');
INSERT INTO `t_sys_division_coordinate` VALUES ('1954', '曲江区', '440205', '440200', '24.688408', '113.611501');
INSERT INTO `t_sys_division_coordinate` VALUES ('1955', '始兴县', '440222', '440200', '24.958558', '114.068567');
INSERT INTO `t_sys_division_coordinate` VALUES ('1956', '仁化县', '440224', '440200', '25.092288', '113.755443');
INSERT INTO `t_sys_division_coordinate` VALUES ('1957', '翁源县', '440229', '440200', '24.356594', '114.136427');
INSERT INTO `t_sys_division_coordinate` VALUES ('1958', '乳源瑶族自治县', '440232', '440200', '24.782333', '113.282431');
INSERT INTO `t_sys_division_coordinate` VALUES ('1959', '新丰县', '440233', '440200', '24.065547', '114.213512');
INSERT INTO `t_sys_division_coordinate` VALUES ('1960', '乐昌市', '440281', '440200', '25.135592', '113.354579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1961', '南雄市', '440282', '440200', '25.123527', '114.318579');
INSERT INTO `t_sys_division_coordinate` VALUES ('1962', '深圳市', '440300', '440000', '22.548457', '114.064552');
INSERT INTO `t_sys_division_coordinate` VALUES ('1963', '罗湖区', '440303', '440300', '22.554485', '114.137432');
INSERT INTO `t_sys_division_coordinate` VALUES ('1964', '福田区', '440304', '440300', '22.528466', '114.061547');
INSERT INTO `t_sys_division_coordinate` VALUES ('1965', '南山区', '440305', '440300', '22.5385', '113.936539');
INSERT INTO `t_sys_division_coordinate` VALUES ('1966', '宝安区', '440306', '440300', '22.560033', '113.890427');
INSERT INTO `t_sys_division_coordinate` VALUES ('1967', '龙岗区', '440307', '440300', '22.726017', '114.254455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1968', '盐田区', '440308', '440300', '22.563438', '114.24343');
INSERT INTO `t_sys_division_coordinate` VALUES ('1969', '珠海市', '440400', '440000', '22.276565', '113.582555');
INSERT INTO `t_sys_division_coordinate` VALUES ('1970', '香洲区', '440402', '440400', '22.273004', '113.550472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1971', '斗门区', '440403', '440400', '22.215516', '113.303467');
INSERT INTO `t_sys_division_coordinate` VALUES ('1972', '金湾区', '440404', '440400', '22.152577', '113.369517');
INSERT INTO `t_sys_division_coordinate` VALUES ('1973', '汕头市', '440500', '440000', '23.359092', '116.688529');
INSERT INTO `t_sys_division_coordinate` VALUES ('1974', '龙湖区', '440507', '440500', '23.377776', '116.723525');
INSERT INTO `t_sys_division_coordinate` VALUES ('1975', '金平区', '440511', '440500', '23.37175', '116.70955');
INSERT INTO `t_sys_division_coordinate` VALUES ('1976', '濠江区', '440512', '440500', '23.291546', '116.733517');
INSERT INTO `t_sys_division_coordinate` VALUES ('1977', '潮阳区', '440513', '440500', '23.270855', '116.608515');
INSERT INTO `t_sys_division_coordinate` VALUES ('1978', '潮南区', '440514', '440500', '23.256341', '116.439491');
INSERT INTO `t_sys_division_coordinate` VALUES ('1979', '澄海区', '440515', '440500', '23.472341', '116.762425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1980', '南澳县', '440523', '440500', '23.427812', '117.030496');
INSERT INTO `t_sys_division_coordinate` VALUES ('1981', '佛山市', '440600', '440000', '23.027759', '113.128512');
INSERT INTO `t_sys_division_coordinate` VALUES ('1982', '禅城区', '440604', '440600', '23.015374', '113.129505');
INSERT INTO `t_sys_division_coordinate` VALUES ('1983', '南海区', '440605', '440600', '23.035011', '113.149446');
INSERT INTO `t_sys_division_coordinate` VALUES ('1984', '顺德区', '440606', '440600', '22.810453', '113.300453');
INSERT INTO `t_sys_division_coordinate` VALUES ('1985', '三水区', '440607', '440600', '23.16192', '112.903471');
INSERT INTO `t_sys_division_coordinate` VALUES ('1986', '高明区', '440608', '440600', '22.90635', '112.899472');
INSERT INTO `t_sys_division_coordinate` VALUES ('1987', '江门市', '440700', '440000', '22.584604', '113.088556');
INSERT INTO `t_sys_division_coordinate` VALUES ('1988', '蓬江区', '440703', '440700', '22.601066', '113.084546');
INSERT INTO `t_sys_division_coordinate` VALUES ('1989', '江海区', '440704', '440700', '22.566115', '113.117557');
INSERT INTO `t_sys_division_coordinate` VALUES ('1990', '新会区', '440705', '440700', '22.465113', '113.038455');
INSERT INTO `t_sys_division_coordinate` VALUES ('1991', '台山市', '440781', '440700', '22.257923', '112.800445');
INSERT INTO `t_sys_division_coordinate` VALUES ('1992', '开平市', '440783', '440700', '22.382499', '112.704464');
INSERT INTO `t_sys_division_coordinate` VALUES ('1993', '鹤山市', '440784', '440700', '22.771169', '112.970527');
INSERT INTO `t_sys_division_coordinate` VALUES ('1994', '恩平市', '440785', '440700', '22.189035', '112.311438');
INSERT INTO `t_sys_division_coordinate` VALUES ('1995', '湛江市', '440800', '440000', '21.276723', '110.365554');
INSERT INTO `t_sys_division_coordinate` VALUES ('1996', '赤坎区', '440802', '440800', '21.272135', '110.372533');
INSERT INTO `t_sys_division_coordinate` VALUES ('1997', '霞山区', '440803', '440800', '21.198227', '110.404425');
INSERT INTO `t_sys_division_coordinate` VALUES ('1998', '坡头区', '440804', '440800', '21.250377', '110.462567');
INSERT INTO `t_sys_division_coordinate` VALUES ('1999', '麻章区', '440811', '440800', '21.269189', '110.340579');
INSERT INTO `t_sys_division_coordinate` VALUES ('2000', '遂溪县', '440823', '440800', '21.383103', '110.256515');
INSERT INTO `t_sys_division_coordinate` VALUES ('2001', '徐闻县', '440825', '440800', '20.331724', '110.182473');
INSERT INTO `t_sys_division_coordinate` VALUES ('2002', '廉江市', '440881', '440800', '21.615816', '110.292448');
INSERT INTO `t_sys_division_coordinate` VALUES ('2003', '雷州市', '440882', '440800', '20.919881', '110.102581');
INSERT INTO `t_sys_division_coordinate` VALUES ('2004', '吴川市', '440883', '440800', '21.447263', '110.78645');
INSERT INTO `t_sys_division_coordinate` VALUES ('2005', '茂名市', '440900', '440000', '21.669064', '110.931543');
INSERT INTO `t_sys_division_coordinate` VALUES ('2006', '茂南区', '440902', '440900', '21.647152', '110.925546');
INSERT INTO `t_sys_division_coordinate` VALUES ('2007', '电白区', '440904', '440900', '21.520351', '111.020471');
INSERT INTO `t_sys_division_coordinate` VALUES ('2008', '高州市', '440981', '440900', '21.924049', '110.859474');
INSERT INTO `t_sys_division_coordinate` VALUES ('2009', '化州市', '440982', '440900', '21.670231', '110.646431');
INSERT INTO `t_sys_division_coordinate` VALUES ('2010', '信宜市', '440983', '440900', '22.360093', '110.953582');
INSERT INTO `t_sys_division_coordinate` VALUES ('2011', '肇庆市', '441200', '440000', '23.052889', '112.471489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2012', '端州区', '441202', '441200', '23.057564', '112.49156');
INSERT INTO `t_sys_division_coordinate` VALUES ('2013', '鼎湖区', '441203', '441200', '23.164308', '112.574434');
INSERT INTO `t_sys_division_coordinate` VALUES ('2014', '高要区', '441204', '441200', '23.031896', '112.464446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2015', '广宁县', '441223', '441200', '23.641036', '112.447424');
INSERT INTO `t_sys_division_coordinate` VALUES ('2016', '怀集县', '441224', '441200', '23.917842', '112.191469');
INSERT INTO `t_sys_division_coordinate` VALUES ('2017', '封开县', '441225', '441200', '23.429769', '111.518526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2018', '德庆县', '441226', '441200', '23.151373', '111.791554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2019', '四会市', '441284', '441200', '23.332381', '112.740579');
INSERT INTO `t_sys_division_coordinate` VALUES ('2020', '惠州市', '441300', '440000', '23.116359', '114.423558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2021', '惠城区', '441302', '441300', '23.089726', '114.38949');
INSERT INTO `t_sys_division_coordinate` VALUES ('2022', '惠阳区', '441303', '441300', '22.794721', '114.463464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2023', '博罗县', '441322', '441300', '23.178806', '114.296573');
INSERT INTO `t_sys_division_coordinate` VALUES ('2024', '惠东县', '441323', '441300', '22.991443', '114.726426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2025', '龙门县', '441324', '441300', '23.733838', '114.26143');
INSERT INTO `t_sys_division_coordinate` VALUES ('2026', '梅州市', '441400', '440000', '24.294178', '116.129537');
INSERT INTO `t_sys_division_coordinate` VALUES ('2027', '梅江区', '441402', '441400', '24.315879', '116.123536');
INSERT INTO `t_sys_division_coordinate` VALUES ('2028', '梅县区', '441403', '441400', '24.270999', '116.088562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2029', '大埔县', '441422', '441400', '24.353459', '116.701559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2030', '丰顺县', '441423', '441400', '23.745738', '116.188454');
INSERT INTO `t_sys_division_coordinate` VALUES ('2031', '五华县', '441424', '441400', '23.938409', '115.782485');
INSERT INTO `t_sys_division_coordinate` VALUES ('2032', '平远县', '441426', '441400', '24.572414', '115.897477');
INSERT INTO `t_sys_division_coordinate` VALUES ('2033', '蕉岭县', '441427', '441400', '24.664993', '116.177439');
INSERT INTO `t_sys_division_coordinate` VALUES ('2034', '兴宁市', '441481', '441400', '24.142294', '115.737579');
INSERT INTO `t_sys_division_coordinate` VALUES ('2035', '汕尾市', '441500', '440000', '22.791263', '115.381553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2036', '城区', '441502', '441500', '22.784552', '115.371531');
INSERT INTO `t_sys_division_coordinate` VALUES ('2037', '海丰县', '441521', '441500', '22.972744', '115.329445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2038', '陆河县', '441523', '441500', '23.307677', '115.666483');
INSERT INTO `t_sys_division_coordinate` VALUES ('2039', '陆丰市', '441581', '441500', '22.923636', '115.65849');
INSERT INTO `t_sys_division_coordinate` VALUES ('2040', '河源市', '441600', '440000', '23.749684', '114.707446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2041', '源城区', '441602', '441600', '23.740298', '114.708439');
INSERT INTO `t_sys_division_coordinate` VALUES ('2042', '紫金县', '441621', '441600', '23.64143', '115.190448');
INSERT INTO `t_sys_division_coordinate` VALUES ('2043', '龙川县', '441622', '441600', '24.105851', '115.266555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2044', '连平县', '441623', '441600', '24.375808', '114.495444');
INSERT INTO `t_sys_division_coordinate` VALUES ('2045', '和平县', '441624', '441600', '24.448253', '114.945449');
INSERT INTO `t_sys_division_coordinate` VALUES ('2046', '东源县', '441625', '441600', '23.794258', '114.753508');
INSERT INTO `t_sys_division_coordinate` VALUES ('2047', '阳江市', '441700', '440000', '21.86434', '111.988489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2048', '江城区', '441702', '441700', '21.868128', '111.961455');
INSERT INTO `t_sys_division_coordinate` VALUES ('2049', '阳东区', '441704', '441700', '21.873997', '112.018579');
INSERT INTO `t_sys_division_coordinate` VALUES ('2050', '阳西县', '441721', '441700', '21.758701', '111.624481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2051', '阳春市', '441781', '441700', '22.176015', '111.797536');
INSERT INTO `t_sys_division_coordinate` VALUES ('2052', '清远市', '441800', '440000', '23.68823', '113.062468');
INSERT INTO `t_sys_division_coordinate` VALUES ('2053', '清城区', '441802', '441800', '23.704022', '113.069477');
INSERT INTO `t_sys_division_coordinate` VALUES ('2054', '清新区', '441803', '441800', '23.75427', '112.991558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2055', '佛冈县', '441821', '441800', '23.885475', '113.538441');
INSERT INTO `t_sys_division_coordinate` VALUES ('2056', '阳山县', '441823', '441800', '24.470944', '112.64752');
INSERT INTO `t_sys_division_coordinate` VALUES ('2057', '连山壮族瑶族自治县', '441825', '441800', '24.576846', '112.100426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2058', '连南瑶族自治县', '441826', '441800', '24.731549', '112.293517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2059', '英德市', '441881', '441800', '24.191939', '113.421443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2060', '连州市', '441882', '441800', '24.786467', '112.383573');
INSERT INTO `t_sys_division_coordinate` VALUES ('2061', '东莞市', '441900', '440000', '23.027308', '113.75842');
INSERT INTO `t_sys_division_coordinate` VALUES ('2062', '中山市', '442000', '440000', '22.522315', '113.399422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2063', '潮州市', '445100', '440000', '23.662623', '116.62947');
INSERT INTO `t_sys_division_coordinate` VALUES ('2064', '湘桥区', '445102', '445100', '23.680687', '116.634462');
INSERT INTO `t_sys_division_coordinate` VALUES ('2065', '潮安区', '445103', '445100', '23.468357', '116.684526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2066', '饶平县', '445122', '445100', '23.670347', '117.010449');
INSERT INTO `t_sys_division_coordinate` VALUES ('2067', '揭阳市', '445200', '440000', '23.55574', '116.378512');
INSERT INTO `t_sys_division_coordinate` VALUES ('2068', '榕城区', '445202', '445200', '23.530746', '116.373516');
INSERT INTO `t_sys_division_coordinate` VALUES ('2069', '揭东区', '445203', '445200', '23.572485', '116.418456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2070', '揭西县', '445222', '445200', '23.4373', '115.848561');
INSERT INTO `t_sys_division_coordinate` VALUES ('2071', '惠来县', '445224', '445200', '23.039645', '116.301444');
INSERT INTO `t_sys_division_coordinate` VALUES ('2072', '普宁市', '445281', '445200', '23.303635', '116.172449');
INSERT INTO `t_sys_division_coordinate` VALUES ('2073', '云浮市', '445300', '440000', '22.920912', '112.051513');
INSERT INTO `t_sys_division_coordinate` VALUES ('2074', '云城区', '445302', '445300', '22.933898', '112.050529');
INSERT INTO `t_sys_division_coordinate` VALUES ('2075', '云安区', '445303', '445300', '23.076893', '112.009563');
INSERT INTO `t_sys_division_coordinate` VALUES ('2076', '新兴县', '445321', '445300', '22.70189', '112.231497');
INSERT INTO `t_sys_division_coordinate` VALUES ('2077', '郁南县', '445322', '445300', '23.240174', '111.541554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2078', '罗定市', '445381', '445300', '22.774296', '111.57648');
INSERT INTO `t_sys_division_coordinate` VALUES ('2079', '广西壮族自治区', '450000', '0', '22.821269', '108.334521');
INSERT INTO `t_sys_division_coordinate` VALUES ('2080', '南宁市', '450100', '450000', '22.822607', '108.373451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2081', '兴宁区', '450102', '450100', '22.860291', '108.375445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2082', '青秀区', '450103', '450100', '22.792227', '108.501439');
INSERT INTO `t_sys_division_coordinate` VALUES ('2083', '江南区', '450105', '450100', '22.787046', '108.279494');
INSERT INTO `t_sys_division_coordinate` VALUES ('2084', '西乡塘区', '450107', '450100', '22.839652', '108.319572');
INSERT INTO `t_sys_division_coordinate` VALUES ('2085', '良庆区', '450108', '450100', '22.762849', '108.327516');
INSERT INTO `t_sys_division_coordinate` VALUES ('2086', '邕宁区', '450109', '450100', '22.7646', '108.49342');
INSERT INTO `t_sys_division_coordinate` VALUES ('2087', '武鸣区', '450110', '450100', '23.164516', '108.281517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2088', '隆安县', '450123', '450100', '23.171585', '107.702574');
INSERT INTO `t_sys_division_coordinate` VALUES ('2089', '马山县', '450124', '450100', '23.713878', '108.183562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2090', '上林县', '450125', '450100', '23.438519', '108.611451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2091', '宾阳县', '450126', '450100', '23.223701', '108.816502');
INSERT INTO `t_sys_division_coordinate` VALUES ('2092', '横县', '450127', '450100', '22.685573', '109.267568');
INSERT INTO `t_sys_division_coordinate` VALUES ('2093', '柳州市', '450200', '450000', '24.331961', '109.434422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2094', '城中区', '450202', '450200', '24.321314', '109.417482');
INSERT INTO `t_sys_division_coordinate` VALUES ('2095', '鱼峰区', '450203', '450200', '24.318522', '109.449416');
INSERT INTO `t_sys_division_coordinate` VALUES ('2096', '柳南区', '450204', '450200', '24.341579', '109.391552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2097', '柳北区', '450205', '450200', '24.367867', '109.408532');
INSERT INTO `t_sys_division_coordinate` VALUES ('2098', '柳江区', '450206', '450200', '24.260815', '109.332444');
INSERT INTO `t_sys_division_coordinate` VALUES ('2099', '柳城县', '450222', '450200', '24.65637', '109.251562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2100', '鹿寨县', '450223', '450200', '24.478622', '109.757554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2101', '融安县', '450224', '450200', '25.230511', '109.404563');
INSERT INTO `t_sys_division_coordinate` VALUES ('2102', '融水苗族自治县', '450225', '450200', '25.072077', '109.262561');
INSERT INTO `t_sys_division_coordinate` VALUES ('2103', '三江侗族自治县', '450226', '450200', '25.78883', '109.614547');
INSERT INTO `t_sys_division_coordinate` VALUES ('2104', '桂林市', '450300', '450000', '25.242886', '110.203545');
INSERT INTO `t_sys_division_coordinate` VALUES ('2105', '秀峰区', '450302', '450300', '25.279618', '110.270437');
INSERT INTO `t_sys_division_coordinate` VALUES ('2106', '叠彩区', '450303', '450300', '25.320233', '110.308463');
INSERT INTO `t_sys_division_coordinate` VALUES ('2107', '象山区', '450304', '450300', '25.26793', '110.287423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2108', '七星区', '450305', '450300', '25.258567', '110.324538');
INSERT INTO `t_sys_division_coordinate` VALUES ('2109', '雁山区', '450311', '450300', '25.066214', '110.315479');
INSERT INTO `t_sys_division_coordinate` VALUES ('2110', '临桂区', '450312', '450300', '25.244302', '110.218587');
INSERT INTO `t_sys_division_coordinate` VALUES ('2111', '阳朔县', '450321', '450300', '24.784519', '110.503475');
INSERT INTO `t_sys_division_coordinate` VALUES ('2112', '灵川县', '450323', '450300', '25.41555', '110.332537');
INSERT INTO `t_sys_division_coordinate` VALUES ('2113', '全州县', '450324', '450300', '25.934343', '111.079569');
INSERT INTO `t_sys_division_coordinate` VALUES ('2114', '兴安县', '450325', '450300', '25.617567', '110.678516');
INSERT INTO `t_sys_division_coordinate` VALUES ('2115', '永福县', '450326', '450300', '24.985578', '109.989591');
INSERT INTO `t_sys_division_coordinate` VALUES ('2116', '灌阳县', '450327', '450300', '25.495121', '111.167552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2117', '龙胜各族自治县', '450328', '450300', '25.804117', '110.017494');
INSERT INTO `t_sys_division_coordinate` VALUES ('2118', '资源县', '450329', '450300', '26.048569', '110.658439');
INSERT INTO `t_sys_division_coordinate` VALUES ('2119', '平乐县', '450330', '450300', '24.639632', '110.649446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2120', '荔浦县', '450331', '450300', '24.494122', '110.401437');
INSERT INTO `t_sys_division_coordinate` VALUES ('2121', '恭城瑶族自治县', '450332', '450300', '24.837194', '110.83456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2122', '梧州市', '450400', '450000', '23.482745', '111.285517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2123', '万秀区', '450403', '450400', '23.478846', '111.32752');
INSERT INTO `t_sys_division_coordinate` VALUES ('2124', '长洲区', '450405', '450400', '23.49151', '111.281499');
INSERT INTO `t_sys_division_coordinate` VALUES ('2125', '龙圩区', '450406', '450400', '23.482745', '111.285517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2126', '苍梧县', '450421', '450400', '23.845998', '111.555547');
INSERT INTO `t_sys_division_coordinate` VALUES ('2127', '藤县', '450422', '450400', '23.38101', '110.921499');
INSERT INTO `t_sys_division_coordinate` VALUES ('2128', '蒙山县', '450423', '450400', '24.200017', '110.531417');
INSERT INTO `t_sys_division_coordinate` VALUES ('2129', '岑溪市', '450481', '450400', '22.924621', '111.001432');
INSERT INTO `t_sys_division_coordinate` VALUES ('2130', '北海市', '450500', '450000', '21.486836', '109.126533');
INSERT INTO `t_sys_division_coordinate` VALUES ('2131', '海城区', '450502', '450500', '21.481066', '109.124521');
INSERT INTO `t_sys_division_coordinate` VALUES ('2132', '银海区', '450503', '450500', '21.454769', '109.146545');
INSERT INTO `t_sys_division_coordinate` VALUES ('2133', '铁山港区', '450512', '450500', '21.535295', '109.428473');
INSERT INTO `t_sys_division_coordinate` VALUES ('2134', '合浦县', '450521', '450500', '21.667006', '109.213439');
INSERT INTO `t_sys_division_coordinate` VALUES ('2135', '防城港市', '450600', '450000', '21.693005', '108.360419');
INSERT INTO `t_sys_division_coordinate` VALUES ('2136', '港口区', '450602', '450600', '21.649566', '108.386483');
INSERT INTO `t_sys_division_coordinate` VALUES ('2137', '防城区', '450603', '450600', '21.775411', '108.360448');
INSERT INTO `t_sys_division_coordinate` VALUES ('2138', '上思县', '450621', '450600', '22.159914', '107.990443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2139', '东兴市', '450681', '450600', '21.553615', '107.977489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2140', '钦州市', '450700', '450000', '21.986594', '108.66058');
INSERT INTO `t_sys_division_coordinate` VALUES ('2141', '钦南区', '450702', '450700', '21.945972', '108.664549');
INSERT INTO `t_sys_division_coordinate` VALUES ('2142', '钦北区', '450703', '450700', '22.020367', '108.638513');
INSERT INTO `t_sys_division_coordinate` VALUES ('2143', '灵山县', '450721', '450700', '22.422413', '109.297478');
INSERT INTO `t_sys_division_coordinate` VALUES ('2144', '浦北县', '450722', '450700', '22.277822', '109.563423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2145', '贵港市', '450800', '450000', '23.117448', '109.60552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2146', '港北区', '450802', '450800', '23.117564', '109.578433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2147', '港南区', '450803', '450800', '23.08124', '109.606553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2148', '覃塘区', '450804', '450800', '23.133251', '109.459427');
INSERT INTO `t_sys_division_coordinate` VALUES ('2149', '平南县', '450821', '450800', '23.545506', '110.398452');
INSERT INTO `t_sys_division_coordinate` VALUES ('2150', '桂平市', '450881', '450800', '23.400049', '110.085526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2151', '玉林市', '450900', '450000', '22.659831', '110.188453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2152', '玉州区', '450902', '450900', '22.634493', '110.157431');
INSERT INTO `t_sys_division_coordinate` VALUES ('2153', '福绵区', '450903', '450900', '22.634493', '110.157431');
INSERT INTO `t_sys_division_coordinate` VALUES ('2154', '容县', '450921', '450900', '22.863666', '110.56453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2155', '陆川县', '450922', '450900', '22.327222', '110.270456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2156', '博白县', '450923', '450900', '22.278675', '109.982553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2157', '兴业县', '450924', '450900', '22.742268', '109.881552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2158', '北流市', '450981', '450900', '22.713958', '110.36057');
INSERT INTO `t_sys_division_coordinate` VALUES ('2159', '百色市', '451000', '450000', '23.908186', '106.624589');
INSERT INTO `t_sys_division_coordinate` VALUES ('2160', '右江区', '451002', '451000', '23.907085', '106.625589');
INSERT INTO `t_sys_division_coordinate` VALUES ('2161', '田阳县', '451021', '451000', '23.742006', '106.921413');
INSERT INTO `t_sys_division_coordinate` VALUES ('2162', '田东县', '451022', '451000', '23.60313', '107.132499');
INSERT INTO `t_sys_division_coordinate` VALUES ('2163', '平果县', '451023', '451000', '23.334923', '107.596571');
INSERT INTO `t_sys_division_coordinate` VALUES ('2164', '德保县', '451024', '451000', '23.328994', '106.621583');
INSERT INTO `t_sys_division_coordinate` VALUES ('2165', '那坡县', '451026', '451000', '23.393794', '105.839423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2166', '凌云县', '451027', '451000', '24.354015', '106.568416');
INSERT INTO `t_sys_division_coordinate` VALUES ('2167', '乐业县', '451028', '451000', '24.783216', '106.56343');
INSERT INTO `t_sys_division_coordinate` VALUES ('2168', '田林县', '451029', '451000', '24.300535', '106.234498');
INSERT INTO `t_sys_division_coordinate` VALUES ('2169', '西林县', '451030', '451000', '24.495668', '105.100494');
INSERT INTO `t_sys_division_coordinate` VALUES ('2170', '隆林各族自治县', '451031', '451000', '24.776814', '105.350459');
INSERT INTO `t_sys_division_coordinate` VALUES ('2171', '靖西市', '451081', '451000', '23.140126', '106.424453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2172', '贺州市', '451100', '450000', '24.409451', '111.573526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2173', '八步区', '451102', '451100', '24.417531', '111.558567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2174', '平桂区', '451103', '451100', '24.462001', '111.478414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2175', '昭平县', '451121', '451100', '24.175106', '110.817575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2176', '钟山县', '451122', '451100', '24.531673', '111.309586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2177', '富川瑶族自治县', '451123', '451100', '24.82016', '111.284511');
INSERT INTO `t_sys_division_coordinate` VALUES ('2178', '河池市', '451200', '450000', '24.698912', '108.0915');
INSERT INTO `t_sys_division_coordinate` VALUES ('2179', '金城江区', '451202', '451200', '24.695679', '108.043507');
INSERT INTO `t_sys_division_coordinate` VALUES ('2180', '南丹县', '451221', '451200', '24.98185', '107.54748');
INSERT INTO `t_sys_division_coordinate` VALUES ('2181', '天峨县', '451222', '451200', '25.005664', '107.178456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2182', '凤山县', '451223', '451200', '24.553218', '107.04842');
INSERT INTO `t_sys_division_coordinate` VALUES ('2183', '东兰县', '451224', '451200', '24.516871', '107.380504');
INSERT INTO `t_sys_division_coordinate` VALUES ('2184', '罗城仫佬族自治县', '451225', '451200', '24.783085', '108.911574');
INSERT INTO `t_sys_division_coordinate` VALUES ('2185', '环江毛南族自治县', '451226', '451200', '24.832088', '108.264443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2186', '巴马瑶族自治县', '451227', '451200', '24.147265', '107.266481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2187', '都安瑶族自治县', '451228', '451200', '23.937331', '108.111458');
INSERT INTO `t_sys_division_coordinate` VALUES ('2188', '大化瑶族自治县', '451229', '451200', '23.742818', '108.004411');
INSERT INTO `t_sys_division_coordinate` VALUES ('2189', '宜州市', '451281', '451200', '24.491084', '108.643532');
INSERT INTO `t_sys_division_coordinate` VALUES ('2190', '来宾市', '451300', '450000', '23.756547', '109.227458');
INSERT INTO `t_sys_division_coordinate` VALUES ('2191', '兴宾区', '451302', '451300', '23.733211', '109.241499');
INSERT INTO `t_sys_division_coordinate` VALUES ('2192', '忻城县', '451321', '451300', '24.071889', '108.672562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2193', '象州县', '451322', '451300', '23.979681', '109.711462');
INSERT INTO `t_sys_division_coordinate` VALUES ('2194', '武宣县', '451323', '451300', '23.600404', '109.669442');
INSERT INTO `t_sys_division_coordinate` VALUES ('2195', '金秀瑶族自治县', '451324', '451300', '24.136319', '110.195506');
INSERT INTO `t_sys_division_coordinate` VALUES ('2196', '合山市', '451381', '451300', '23.81226', '108.892566');
INSERT INTO `t_sys_division_coordinate` VALUES ('2197', '崇左市', '451400', '450000', '22.383117', '107.37152');
INSERT INTO `t_sys_division_coordinate` VALUES ('2198', '江州区', '451402', '451400', '22.411246', '107.359533');
INSERT INTO `t_sys_division_coordinate` VALUES ('2199', '扶绥县', '451421', '451400', '22.641097', '107.910465');
INSERT INTO `t_sys_division_coordinate` VALUES ('2200', '宁明县', '451422', '451400', '22.145885', '107.083524');
INSERT INTO `t_sys_division_coordinate` VALUES ('2201', '龙州县', '451423', '451400', '22.348299', '106.860582');
INSERT INTO `t_sys_division_coordinate` VALUES ('2202', '大新县', '451424', '451400', '22.836229', '107.207557');
INSERT INTO `t_sys_division_coordinate` VALUES ('2203', '天等县', '451425', '451400', '23.087506', '107.149473');
INSERT INTO `t_sys_division_coordinate` VALUES ('2204', '凭祥市', '451481', '451400', '22.100153', '106.773524');
INSERT INTO `t_sys_division_coordinate` VALUES ('2205', '海南省', '460000', '0', '20.025802', '110.355537');
INSERT INTO `t_sys_division_coordinate` VALUES ('2206', '海口市', '460100', '460000', '20.044049', '110.325525');
INSERT INTO `t_sys_division_coordinate` VALUES ('2207', '秀英区', '460105', '460100', '20.013642', '110.300436');
INSERT INTO `t_sys_division_coordinate` VALUES ('2208', '龙华区', '460106', '460100', '20.036321', '110.335541');
INSERT INTO `t_sys_division_coordinate` VALUES ('2209', '琼山区', '460107', '460100', '20.009151', '110.360526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2210', '美兰区', '460108', '460100', '20.034646', '110.373498');
INSERT INTO `t_sys_division_coordinate` VALUES ('2211', '三亚市', '460200', '460000', '18.258736', '109.518557');
INSERT INTO `t_sys_division_coordinate` VALUES ('2212', '海棠区', '460202', '460200', '18.337879', '109.7235');
INSERT INTO `t_sys_division_coordinate` VALUES ('2213', '吉阳区', '460203', '460200', '18.337879', '109.7235');
INSERT INTO `t_sys_division_coordinate` VALUES ('2214', '天涯区', '460204', '460200', '18.337879', '109.7235');
INSERT INTO `t_sys_division_coordinate` VALUES ('2215', '崖州区', '460205', '460200', '18.337879', '109.7235');
INSERT INTO `t_sys_division_coordinate` VALUES ('2216', '三沙市', '460300', '460000', '16.497085', '111.673087');
INSERT INTO `t_sys_division_coordinate` VALUES ('2217', '儋州市', '469003', '460000', '19.527146', '109.587456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2218', '五指山市', '469001', '460000', '18.780994', '109.52354');
INSERT INTO `t_sys_division_coordinate` VALUES ('2219', '琼海市', '469002', '460000', '19.264254', '110.480545');
INSERT INTO `t_sys_division_coordinate` VALUES ('2220', '文昌市', '469005', '460000', '19.549062', '110.804509');
INSERT INTO `t_sys_division_coordinate` VALUES ('2221', '万宁市', '469006', '460000', '18.800107', '110.399434');
INSERT INTO `t_sys_division_coordinate` VALUES ('2222', '东方市', '469007', '460000', '19.101105', '108.658567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2223', '定安县', '469021', '460000', '19.68712', '110.365533');
INSERT INTO `t_sys_division_coordinate` VALUES ('2224', '屯昌县', '469022', '460000', '19.357375', '110.108577');
INSERT INTO `t_sys_division_coordinate` VALUES ('2225', '澄迈县', '469023', '460000', '19.744349', '110.013511');
INSERT INTO `t_sys_division_coordinate` VALUES ('2226', '临高县', '469024', '460000', '19.919475', '109.697443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2227', '白沙黎族自治县', '469025', '460000', '19.231379', '109.457471');
INSERT INTO `t_sys_division_coordinate` VALUES ('2228', '昌江黎族自治县', '469026', '460000', '19.303998', '109.062464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2229', '乐东黎族自治县', '469027', '460000', '18.755871', '109.180508');
INSERT INTO `t_sys_division_coordinate` VALUES ('2230', '陵水黎族自治县', '469028', '460000', '18.512332', '110.044464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2231', '保亭黎族苗族自治县', '469029', '460000', '18.64691', '109.703482');
INSERT INTO `t_sys_division_coordinate` VALUES ('2232', '琼中黎族苗族自治县', '469030', '460000', '19.039164', '109.844511');
INSERT INTO `t_sys_division_coordinate` VALUES ('2233', '重庆市', '500000', '0', '29.568996', '106.558434');
INSERT INTO `t_sys_division_coordinate` VALUES ('2234', '市辖区', '500100', '500000', '29.568996', '106.558434');
INSERT INTO `t_sys_division_coordinate` VALUES ('2235', '万州区', '500101', '500100', '30.813622', '108.415558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2236', '涪陵区', '500102', '500100', '29.709278', '107.39642');
INSERT INTO `t_sys_division_coordinate` VALUES ('2237', '渝中区', '500103', '500100', '29.55909', '106.57544');
INSERT INTO `t_sys_division_coordinate` VALUES ('2238', '大渡口区', '500104', '500100', '29.490107', '106.488534');
INSERT INTO `t_sys_division_coordinate` VALUES ('2239', '江北区', '500105', '500100', '29.612832', '106.580415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2240', '沙坪坝区', '500106', '500100', '29.547193', '106.464465');
INSERT INTO `t_sys_division_coordinate` VALUES ('2241', '九龙坡区', '500107', '500100', '29.507928', '106.517559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2242', '南岸区', '500108', '500100', '29.502683', '106.66843');
INSERT INTO `t_sys_division_coordinate` VALUES ('2243', '北碚区', '500109', '500100', '29.811603', '106.403569');
INSERT INTO `t_sys_division_coordinate` VALUES ('2244', '綦江区', '500110', '500100', '29.034114', '106.657484');
INSERT INTO `t_sys_division_coordinate` VALUES ('2245', '大足区', '500111', '500100', '29.713114', '105.728405');
INSERT INTO `t_sys_division_coordinate` VALUES ('2246', '渝北区', '500112', '500100', '29.723927', '106.637559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2247', '巴南区', '500113', '500100', '29.408475', '106.547454');
INSERT INTO `t_sys_division_coordinate` VALUES ('2248', '黔江区', '500114', '500100', '29.538813', '108.777591');
INSERT INTO `t_sys_division_coordinate` VALUES ('2249', '长寿区', '500115', '500100', '29.86352', '107.087531');
INSERT INTO `t_sys_division_coordinate` VALUES ('2250', '江津区', '500116', '500100', '29.295884', '106.265598');
INSERT INTO `t_sys_division_coordinate` VALUES ('2251', '合川区', '500117', '500100', '29.978181', '106.282541');
INSERT INTO `t_sys_division_coordinate` VALUES ('2252', '永川区', '500118', '500100', '29.362046', '105.933499');
INSERT INTO `t_sys_division_coordinate` VALUES ('2253', '南川区', '500119', '500100', '29.163479', '107.105585');
INSERT INTO `t_sys_division_coordinate` VALUES ('2254', '璧山区', '500120', '500100', '29.598347', '106.233475');
INSERT INTO `t_sys_division_coordinate` VALUES ('2255', '铜梁区', '500151', '500100', '29.850509', '106.063449');
INSERT INTO `t_sys_division_coordinate` VALUES ('2256', '潼南区', '500152', '500100', '30.197314', '105.847399');
INSERT INTO `t_sys_division_coordinate` VALUES ('2257', '荣昌区', '500153', '500100', '29.411307', '105.60142');
INSERT INTO `t_sys_division_coordinate` VALUES ('2258', '开州区', '500154', '500100', '31.166644', '108.399498');
INSERT INTO `t_sys_division_coordinate` VALUES ('2259', '县', '500200', '500000', '30.006109', '108.120414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2260', '梁平县', '500228', '500200', '30.660545', '107.7761');
INSERT INTO `t_sys_division_coordinate` VALUES ('2261', '城口县', '500229', '500200', '31.953391', '108.671612');
INSERT INTO `t_sys_division_coordinate` VALUES ('2262', '丰都县', '500230', '500200', '29.869413', '107.737481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2263', '垫江县', '500231', '500200', '30.333294', '107.339566');
INSERT INTO `t_sys_division_coordinate` VALUES ('2264', '武隆县', '500232', '500200', '29.335005', '107.774902');
INSERT INTO `t_sys_division_coordinate` VALUES ('2265', '忠县', '500233', '500200', '30.278161', '107.478814');
INSERT INTO `t_sys_division_coordinate` VALUES ('2266', '云阳县', '500235', '500200', '30.936611', '108.703448');
INSERT INTO `t_sys_division_coordinate` VALUES ('2267', '奉节县', '500236', '500200', '31.024602', '109.470473');
INSERT INTO `t_sys_division_coordinate` VALUES ('2268', '巫山县', '500237', '500200', '31.080519', '109.885546');
INSERT INTO `t_sys_division_coordinate` VALUES ('2269', '巫溪县', '500238', '500200', '31.40488', '109.576403');
INSERT INTO `t_sys_division_coordinate` VALUES ('2270', '石柱土家族自治县', '500240', '500200', '31.40488', '109.576403');
INSERT INTO `t_sys_division_coordinate` VALUES ('2271', '秀山土家族苗族自治县', '500241', '500200', '28.453448', '109.013574');
INSERT INTO `t_sys_division_coordinate` VALUES ('2272', '酉阳土家族苗族自治县', '500242', '500200', '28.84704', '108.774586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2273', '彭水苗族土家族自治县', '500243', '500200', '29.299462', '108.172578');
INSERT INTO `t_sys_division_coordinate` VALUES ('2274', '四川省', '510000', '0', '30.577543', '104.073467');
INSERT INTO `t_sys_division_coordinate` VALUES ('2275', '成都市', '510100', '510000', '30.655822', '104.081534');
INSERT INTO `t_sys_division_coordinate` VALUES ('2276', '锦江区', '510104', '510100', '30.661904', '104.089562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2277', '青羊区', '510105', '510100', '30.680038', '104.067445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2278', '金牛区', '510106', '510100', '30.697356', '104.057404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2279', '武侯区', '510107', '510100', '30.648713', '104.049424');
INSERT INTO `t_sys_division_coordinate` VALUES ('2280', '成华区', '510108', '510100', '30.665589', '104.108592');
INSERT INTO `t_sys_division_coordinate` VALUES ('2281', '龙泉驿区', '510112', '510100', '30.562698', '104.281397');
INSERT INTO `t_sys_division_coordinate` VALUES ('2282', '青白江区', '510113', '510100', '30.884421', '104.257512');
INSERT INTO `t_sys_division_coordinate` VALUES ('2283', '新都区', '510114', '510100', '30.829407', '104.165393');
INSERT INTO `t_sys_division_coordinate` VALUES ('2284', '温江区', '510115', '510100', '30.688487', '103.863573');
INSERT INTO `t_sys_division_coordinate` VALUES ('2285', '双流区', '510116', '510100', '30.580399', '103.930392');
INSERT INTO `t_sys_division_coordinate` VALUES ('2286', '金堂县', '510121', '510100', '30.868358', '104.418443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2287', '郫县', '510124', '510100', '30.799538', '103.905446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2288', '大邑县', '510129', '510100', '30.593155', '103.52753');
INSERT INTO `t_sys_division_coordinate` VALUES ('2289', '蒲江县', '510131', '510100', '30.2025', '103.512571');
INSERT INTO `t_sys_division_coordinate` VALUES ('2290', '新津县', '510132', '510100', '30.416364', '103.817433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2291', '都江堰市', '510181', '510100', '30.994257', '103.653534');
INSERT INTO `t_sys_division_coordinate` VALUES ('2292', '彭州市', '510182', '510100', '30.995564', '103.965561');
INSERT INTO `t_sys_division_coordinate` VALUES ('2293', '邛崃市', '510183', '510100', '30.416399', '103.470481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2294', '崇州市', '510184', '510100', '30.636596', '103.679433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2295', '简阳市', '510185', '510100', '30.3766', '104.569516');
INSERT INTO `t_sys_division_coordinate` VALUES ('2296', '自贡市', '510300', '510000', '29.345585', '104.784449');
INSERT INTO `t_sys_division_coordinate` VALUES ('2297', '自流井区', '510302', '510300', '29.343499', '104.783447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2298', '贡井区', '510303', '510300', '29.351476', '104.721557');
INSERT INTO `t_sys_division_coordinate` VALUES ('2299', '大安区', '510304', '510300', '29.369929', '104.780416');
INSERT INTO `t_sys_division_coordinate` VALUES ('2300', '沿滩区', '510311', '510300', '29.278797', '104.880409');
INSERT INTO `t_sys_division_coordinate` VALUES ('2301', '荣县', '510321', '510300', '29.451801', '104.423458');
INSERT INTO `t_sys_division_coordinate` VALUES ('2302', '富顺县', '510322', '510300', '29.186886', '104.981494');
INSERT INTO `t_sys_division_coordinate` VALUES ('2303', '攀枝花市', '510400', '510000', '26.588033', '101.725541');
INSERT INTO `t_sys_division_coordinate` VALUES ('2304', '东区', '510402', '510400', '26.552106', '101.710597');
INSERT INTO `t_sys_division_coordinate` VALUES ('2305', '西区', '510403', '510400', '26.603868', '101.637413');
INSERT INTO `t_sys_division_coordinate` VALUES ('2306', '仁和区', '510411', '510400', '26.504019', '101.74445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2307', '米易县', '510421', '510400', '26.896968', '102.11644');
INSERT INTO `t_sys_division_coordinate` VALUES ('2308', '盐边县', '510422', '510400', '26.688767', '101.860499');
INSERT INTO `t_sys_division_coordinate` VALUES ('2309', '泸州市', '510500', '510000', '28.877668', '105.448524');
INSERT INTO `t_sys_division_coordinate` VALUES ('2310', '江阳区', '510502', '510500', '28.884672', '105.441545');
INSERT INTO `t_sys_division_coordinate` VALUES ('2311', '纳溪区', '510503', '510500', '28.77936', '105.377409');
INSERT INTO `t_sys_division_coordinate` VALUES ('2312', '龙马潭区', '510504', '510500', '28.919012', '105.444544');
INSERT INTO `t_sys_division_coordinate` VALUES ('2313', '泸县', '510521', '510500', '29.157626', '105.388456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2314', '合江县', '510522', '510500', '28.817793', '105.838432');
INSERT INTO `t_sys_division_coordinate` VALUES ('2315', '叙永县', '510524', '510500', '28.161714', '105.451508');
INSERT INTO `t_sys_division_coordinate` VALUES ('2316', '古蔺县', '510525', '510500', '28.044745', '105.819471');
INSERT INTO `t_sys_division_coordinate` VALUES ('2317', '德阳市', '510600', '510000', '31.133115', '104.404419');
INSERT INTO `t_sys_division_coordinate` VALUES ('2318', '旌阳区', '510603', '510600', '31.148596', '104.423439');
INSERT INTO `t_sys_division_coordinate` VALUES ('2319', '中江县', '510623', '510600', '31.038954', '104.68553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2320', '罗江县', '510626', '510600', '31.324179', '104.517414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2321', '广汉市', '510681', '510600', '30.982415', '104.288422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2322', '什邡市', '510682', '510600', '31.132889', '104.174427');
INSERT INTO `t_sys_division_coordinate` VALUES ('2323', '绵竹市', '510683', '510600', '31.343592', '104.227609');
INSERT INTO `t_sys_division_coordinate` VALUES ('2324', '绵阳市', '510700', '510000', '31.473663', '104.685562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2325', '涪城区', '510703', '510700', '31.461314', '104.76342');
INSERT INTO `t_sys_division_coordinate` VALUES ('2326', '游仙区', '510704', '510700', '31.479904', '104.772429');
INSERT INTO `t_sys_division_coordinate` VALUES ('2327', '安州区', '510705', '510700', '31.540751', '104.573555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2328', '三台县', '510722', '510700', '31.101586', '105.10149');
INSERT INTO `t_sys_division_coordinate` VALUES ('2329', '盐亭县', '510723', '510700', '31.214319', '105.395503');
INSERT INTO `t_sys_division_coordinate` VALUES ('2330', '梓潼县', '510725', '510700', '31.648313', '105.177567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2331', '北川羌族自治县', '510726', '510700', '31.963084', '104.361586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2332', '平武县', '510727', '510700', '32.414682', '104.535422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2333', '江油市', '510781', '510700', '31.784128', '104.752412');
INSERT INTO `t_sys_division_coordinate` VALUES ('2334', '广元市', '510800', '510000', '32.441616', '105.850423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2335', '利州区', '510802', '510800', '32.440208', '105.852426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2336', '昭化区', '510811', '510800', '32.329618', '105.969419');
INSERT INTO `t_sys_division_coordinate` VALUES ('2337', '朝天区', '510812', '510800', '32.649726', '105.896589');
INSERT INTO `t_sys_division_coordinate` VALUES ('2338', '旺苍县', '510821', '510800', '32.235097', '106.296491');
INSERT INTO `t_sys_division_coordinate` VALUES ('2339', '青川县', '510822', '510800', '32.581617', '105.245407');
INSERT INTO `t_sys_division_coordinate` VALUES ('2340', '剑阁县', '510823', '510800', '32.293479', '105.531576');
INSERT INTO `t_sys_division_coordinate` VALUES ('2341', '苍溪县', '510824', '510800', '31.738684', '105.941483');
INSERT INTO `t_sys_division_coordinate` VALUES ('2342', '遂宁市', '510900', '510000', '30.539098', '105.599422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2343', '船山区', '510903', '510900', '30.531471', '105.574523');
INSERT INTO `t_sys_division_coordinate` VALUES ('2344', '安居区', '510904', '510900', '30.361496', '105.462467');
INSERT INTO `t_sys_division_coordinate` VALUES ('2345', '蓬溪县', '510921', '510900', '30.763751', '105.713446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2346', '射洪县', '510922', '510900', '30.877139', '105.39451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2347', '大英县', '510923', '510900', '30.60081', '105.243404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2348', '内江市', '511000', '510000', '29.585887', '105.064588');
INSERT INTO `t_sys_division_coordinate` VALUES ('2349', '市中区', '511002', '511000', '29.59271', '105.074574');
INSERT INTO `t_sys_division_coordinate` VALUES ('2350', '东兴区', '511011', '511000', '29.598486', '105.082547');
INSERT INTO `t_sys_division_coordinate` VALUES ('2351', '威远县', '511024', '511000', '29.533635', '104.674498');
INSERT INTO `t_sys_division_coordinate` VALUES ('2352', '资中县', '511025', '511000', '29.770234', '104.858495');
INSERT INTO `t_sys_division_coordinate` VALUES ('2353', '隆昌县', '511028', '511000', '29.345245', '105.294572');
INSERT INTO `t_sys_division_coordinate` VALUES ('2354', '乐山市', '511100', '510000', '29.557941', '103.772538');
INSERT INTO `t_sys_division_coordinate` VALUES ('2355', '市中区', '511102', '511100', '29.561364', '103.767559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2356', '沙湾区', '511111', '511100', '29.419272', '103.556436');
INSERT INTO `t_sys_division_coordinate` VALUES ('2357', '五通桥区', '511112', '511100', '29.413185', '103.824455');
INSERT INTO `t_sys_division_coordinate` VALUES ('2358', '金口河区', '511113', '511100', '29.250804', '103.085394');
INSERT INTO `t_sys_division_coordinate` VALUES ('2359', '犍为县', '511123', '511100', '29.214219', '103.955507');
INSERT INTO `t_sys_division_coordinate` VALUES ('2360', '井研县', '511124', '511100', '29.657303', '104.076511');
INSERT INTO `t_sys_division_coordinate` VALUES ('2361', '夹江县', '511126', '511100', '29.743846', '103.57841');
INSERT INTO `t_sys_division_coordinate` VALUES ('2362', '沐川县', '511129', '511100', '28.962888', '103.908467');
INSERT INTO `t_sys_division_coordinate` VALUES ('2363', '峨边彝族自治县', '511132', '511100', '29.236089', '103.268577');
INSERT INTO `t_sys_division_coordinate` VALUES ('2364', '马边彝族自治县', '511133', '511100', '28.841736', '103.552454');
INSERT INTO `t_sys_division_coordinate` VALUES ('2365', '峨眉山市', '511181', '511100', '29.606976', '103.491546');
INSERT INTO `t_sys_division_coordinate` VALUES ('2366', '南充市', '511300', '510000', '30.843783', '106.117503');
INSERT INTO `t_sys_division_coordinate` VALUES ('2367', '顺庆区', '511302', '511300', '30.802753', '106.098411');
INSERT INTO `t_sys_division_coordinate` VALUES ('2368', '高坪区', '511303', '511300', '30.787255', '106.12554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2369', '嘉陵区', '511304', '511300', '30.764896', '106.078433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2370', '南部县', '511321', '511300', '31.353705', '106.043578');
INSERT INTO `t_sys_division_coordinate` VALUES ('2371', '营山县', '511322', '511300', '31.083003', '106.572408');
INSERT INTO `t_sys_division_coordinate` VALUES ('2372', '蓬安县', '511323', '511300', '31.034631', '106.418482');
INSERT INTO `t_sys_division_coordinate` VALUES ('2373', '仪陇县', '511324', '511300', '31.277597', '106.30943');
INSERT INTO `t_sys_division_coordinate` VALUES ('2374', '西充县', '511325', '511300', '31.000688', '105.907611');
INSERT INTO `t_sys_division_coordinate` VALUES ('2375', '阆中市', '511381', '511300', '31.564075', '106.011565');
INSERT INTO `t_sys_division_coordinate` VALUES ('2376', '眉山市', '511400', '510000', '30.082526', '103.856563');
INSERT INTO `t_sys_division_coordinate` VALUES ('2377', '东坡区', '511402', '511400', '30.048272', '103.838525');
INSERT INTO `t_sys_division_coordinate` VALUES ('2378', '彭山区', '511403', '511400', '30.198854', '103.879558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2379', '仁寿县', '511421', '511400', '30.001664', '104.140477');
INSERT INTO `t_sys_division_coordinate` VALUES ('2380', '洪雅县', '511423', '511400', '29.910616', '103.379602');
INSERT INTO `t_sys_division_coordinate` VALUES ('2381', '丹棱县', '511424', '511400', '30.020363', '103.519583');
INSERT INTO `t_sys_division_coordinate` VALUES ('2382', '青神县', '511425', '511400', '29.837055', '103.853559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2383', '宜宾市', '511500', '510000', '28.758007', '104.649404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2384', '翠屏区', '511502', '511500', '28.772052', '104.626438');
INSERT INTO `t_sys_division_coordinate` VALUES ('2385', '南溪区', '511503', '511500', '28.851504', '104.976513');
INSERT INTO `t_sys_division_coordinate` VALUES ('2386', '宜宾县', '511521', '511500', '28.696246', '104.539443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2387', '江安县', '511523', '511500', '28.72961', '105.073595');
INSERT INTO `t_sys_division_coordinate` VALUES ('2388', '长宁县', '511524', '511500', '28.588133', '104.927564');
INSERT INTO `t_sys_division_coordinate` VALUES ('2389', '高县', '511525', '511500', '28.442511', '104.524411');
INSERT INTO `t_sys_division_coordinate` VALUES ('2390', '珙县', '511526', '511500', '28.44432', '104.715575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2391', '筠连县', '511527', '511500', '28.170174', '104.517406');
INSERT INTO `t_sys_division_coordinate` VALUES ('2392', '兴文县', '511528', '511500', '28.309905', '105.242402');
INSERT INTO `t_sys_division_coordinate` VALUES ('2393', '屏山县', '511529', '511500', '28.707647', '104.05945');
INSERT INTO `t_sys_division_coordinate` VALUES ('2394', '广安市', '511600', '510000', '30.461746', '106.639553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2395', '广安区', '511602', '511600', '30.479768', '106.648531');
INSERT INTO `t_sys_division_coordinate` VALUES ('2396', '前锋区', '511603', '511600', '30.461746', '106.639553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2397', '岳池县', '511621', '511600', '30.54412', '106.446411');
INSERT INTO `t_sys_division_coordinate` VALUES ('2398', '武胜县', '511622', '511600', '30.355496', '106.302462');
INSERT INTO `t_sys_division_coordinate` VALUES ('2399', '邻水县', '511623', '511600', '30.341073', '106.936403');
INSERT INTO `t_sys_division_coordinate` VALUES ('2400', '华蓥市', '511681', '511600', '30.396307', '106.789462');
INSERT INTO `t_sys_division_coordinate` VALUES ('2401', '达州市', '511700', '510000', '31.214308', '107.474594');
INSERT INTO `t_sys_division_coordinate` VALUES ('2402', '通川区', '511702', '511700', '31.220932', '107.511447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2403', '达川区', '511703', '511700', '31.202393', '107.518411');
INSERT INTO `t_sys_division_coordinate` VALUES ('2404', '宣汉县', '511722', '511700', '31.359755', '107.733534');
INSERT INTO `t_sys_division_coordinate` VALUES ('2405', '开江县', '511723', '511700', '31.089372', '107.875425');
INSERT INTO `t_sys_division_coordinate` VALUES ('2406', '大竹县', '511724', '511700', '30.742077', '107.21158');
INSERT INTO `t_sys_division_coordinate` VALUES ('2407', '渠县', '511725', '511700', '30.842299', '106.979583');
INSERT INTO `t_sys_division_coordinate` VALUES ('2408', '万源市', '511781', '511700', '32.087421', '108.041541');
INSERT INTO `t_sys_division_coordinate` VALUES ('2409', '雅安市', '511800', '510000', '30.016793', '103.049543');
INSERT INTO `t_sys_division_coordinate` VALUES ('2410', '雨城区', '511802', '511800', '30.011062', '103.039575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2411', '名山区', '511803', '511800', '30.075914', '103.115486');
INSERT INTO `t_sys_division_coordinate` VALUES ('2412', '荥经县', '511822', '511800', '29.799194', '102.853436');
INSERT INTO `t_sys_division_coordinate` VALUES ('2413', '汉源县', '511823', '511800', '29.350217', '102.658576');
INSERT INTO `t_sys_division_coordinate` VALUES ('2414', '石棉县', '511824', '511800', '29.234305', '102.366405');
INSERT INTO `t_sys_division_coordinate` VALUES ('2415', '天全县', '511825', '511800', '30.072473', '102.76453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2416', '芦山县', '511826', '511800', '30.149873', '102.934528');
INSERT INTO `t_sys_division_coordinate` VALUES ('2417', '宝兴县', '511827', '511800', '30.374082', '102.821484');
INSERT INTO `t_sys_division_coordinate` VALUES ('2418', '巴中市', '511900', '510000', '31.872889', '106.751585');
INSERT INTO `t_sys_division_coordinate` VALUES ('2419', '巴州区', '511902', '511900', '31.857686', '106.775513');
INSERT INTO `t_sys_division_coordinate` VALUES ('2420', '恩阳区', '511903', '511900', '31.857686', '106.775513');
INSERT INTO `t_sys_division_coordinate` VALUES ('2421', '通江县', '511921', '511900', '31.917714', '107.251517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2422', '南江县', '511922', '511900', '32.352532', '106.834483');
INSERT INTO `t_sys_division_coordinate` VALUES ('2423', '平昌县', '511923', '511900', '31.566186', '107.110593');
INSERT INTO `t_sys_division_coordinate` VALUES ('2424', '资阳市', '512000', '510000', '30.134957', '104.634435');
INSERT INTO `t_sys_division_coordinate` VALUES ('2425', '雁江区', '512002', '512000', '30.123753', '104.658424');
INSERT INTO `t_sys_division_coordinate` VALUES ('2426', '安岳县', '512021', '512000', '30.103393', '105.342454');
INSERT INTO `t_sys_division_coordinate` VALUES ('2427', '乐至县', '512022', '512000', '30.282348', '105.027477');
INSERT INTO `t_sys_division_coordinate` VALUES ('2428', '阿坝藏族羌族自治州', '513200', '510000', '31.905512', '102.231415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2429', '马尔康市', '513201', '513200', '31.911748', '102.213502');
INSERT INTO `t_sys_division_coordinate` VALUES ('2430', '汶川县', '513221', '513200', '31.483005', '103.596518');
INSERT INTO `t_sys_division_coordinate` VALUES ('2431', '理县', '513222', '513200', '31.44255', '103.173511');
INSERT INTO `t_sys_division_coordinate` VALUES ('2432', '茂县', '513223', '513200', '31.686809', '103.85959');
INSERT INTO `t_sys_division_coordinate` VALUES ('2433', '松潘县', '513224', '513200', '32.661797', '103.61058');
INSERT INTO `t_sys_division_coordinate` VALUES ('2434', '九寨沟县', '513225', '513200', '33.257592', '104.249547');
INSERT INTO `t_sys_division_coordinate` VALUES ('2435', '金川县', '513226', '513200', '31.482006', '102.07061');
INSERT INTO `t_sys_division_coordinate` VALUES ('2436', '小金县', '513227', '513200', '31.002209', '102.369426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2437', '黑水县', '513228', '513200', '32.067805', '102.996517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2438', '壤塘县', '513230', '513200', '32.271093', '100.985583');
INSERT INTO `t_sys_division_coordinate` VALUES ('2439', '阿坝县', '513231', '513200', '32.908221', '101.71361');
INSERT INTO `t_sys_division_coordinate` VALUES ('2440', '若尔盖县', '513232', '513200', '33.584377', '102.974391');
INSERT INTO `t_sys_division_coordinate` VALUES ('2441', '红原县', '513233', '513200', '32.796605', '102.550615');
INSERT INTO `t_sys_division_coordinate` VALUES ('2442', '甘孜藏族自治州', '513300', '510000', '30.055279', '101.968547');
INSERT INTO `t_sys_division_coordinate` VALUES ('2443', '康定市', '513301', '513300', '30.004407', '101.963555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2444', '泸定县', '513322', '513300', '29.920402', '102.241432');
INSERT INTO `t_sys_division_coordinate` VALUES ('2445', '丹巴县', '513323', '513300', '30.88477', '101.896437');
INSERT INTO `t_sys_division_coordinate` VALUES ('2446', '九龙县', '513324', '513300', '30.88477', '101.896437');
INSERT INTO `t_sys_division_coordinate` VALUES ('2447', '雅江县', '513325', '513300', '30.037569', '101.0205');
INSERT INTO `t_sys_division_coordinate` VALUES ('2448', '道孚县', '513326', '513300', '30.985326', '101.13154');
INSERT INTO `t_sys_division_coordinate` VALUES ('2449', '炉霍县', '513327', '513300', '31.397992', '100.682397');
INSERT INTO `t_sys_division_coordinate` VALUES ('2450', '甘孜县', '513328', '513300', '31.628957', '99.99921');
INSERT INTO `t_sys_division_coordinate` VALUES ('2451', '新龙县', '513329', '513300', '30.94547', '100.318398');
INSERT INTO `t_sys_division_coordinate` VALUES ('2452', '德格县', '513330', '513300', '31.812106', '98.587402');
INSERT INTO `t_sys_division_coordinate` VALUES ('2453', '白玉县', '513331', '513300', '31.215314', '98.8311');
INSERT INTO `t_sys_division_coordinate` VALUES ('2454', '石渠县', '513332', '513300', '32.984003', '98.109481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2455', '色达县', '513333', '513300', '32.27433', '100.339414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2456', '理塘县', '513334', '513300', '30.000031', '100.275575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2457', '巴塘县', '513335', '513300', '30.011662', '99.116727');
INSERT INTO `t_sys_division_coordinate` VALUES ('2458', '乡城县', '513336', '513300', '28.936733', '99.80506');
INSERT INTO `t_sys_division_coordinate` VALUES ('2459', '稻城县', '513337', '513300', '29.043122', '100.304462');
INSERT INTO `t_sys_division_coordinate` VALUES ('2460', '得荣县', '513338', '513300', '28.71878', '99.292984');
INSERT INTO `t_sys_division_coordinate` VALUES ('2461', '凉山彝族自治州', '513400', '510000', '27.887752', '102.273503');
INSERT INTO `t_sys_division_coordinate` VALUES ('2462', '西昌市', '513401', '513400', '27.900581', '102.271484');
INSERT INTO `t_sys_division_coordinate` VALUES ('2463', '木里藏族自治县', '513422', '513400', '27.934599', '101.286397');
INSERT INTO `t_sys_division_coordinate` VALUES ('2464', '盐源县', '513423', '513400', '27.428155', '101.515429');
INSERT INTO `t_sys_division_coordinate` VALUES ('2465', '德昌县', '513424', '513400', '27.408504', '102.182596');
INSERT INTO `t_sys_division_coordinate` VALUES ('2466', '会理县', '513425', '513400', '26.6612', '102.251436');
INSERT INTO `t_sys_division_coordinate` VALUES ('2467', '会东县', '513426', '513400', '26.640824', '102.584462');
INSERT INTO `t_sys_division_coordinate` VALUES ('2468', '宁南县', '513427', '513400', '27.064605', '102.762526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2469', '普格县', '513428', '513400', '27.381996', '102.546597');
INSERT INTO `t_sys_division_coordinate` VALUES ('2470', '布拖县', '513429', '513400', '27.712129', '102.818478');
INSERT INTO `t_sys_division_coordinate` VALUES ('2471', '金阳县', '513430', '513400', '27.702145', '103.254549');
INSERT INTO `t_sys_division_coordinate` VALUES ('2472', '昭觉县', '513431', '513400', '28.020506', '102.849423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2473', '喜德县', '513432', '513400', '28.31271', '102.419567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2474', '冕宁县', '513433', '513400', '28.555294', '102.183575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2475', '越西县', '513434', '513400', '28.645828', '102.514474');
INSERT INTO `t_sys_division_coordinate` VALUES ('2476', '甘洛县', '513435', '513400', '28.964823', '102.778597');
INSERT INTO `t_sys_division_coordinate` VALUES ('2477', '美姑县', '513436', '513400', '28.33402', '103.138586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2478', '雷波县', '513437', '513400', '28.268951', '103.578429');
INSERT INTO `t_sys_division_coordinate` VALUES ('2479', '贵州省', '520000', '0', '26.60403', '106.714476');
INSERT INTO `t_sys_division_coordinate` VALUES ('2480', '贵阳市', '520100', '520000', '26.60403', '106.714476');
INSERT INTO `t_sys_division_coordinate` VALUES ('2481', '南明区', '520102', '520100', '26.574336', '106.720528');
INSERT INTO `t_sys_division_coordinate` VALUES ('2482', '云岩区', '520103', '520100', '26.610381', '106.730535');
INSERT INTO `t_sys_division_coordinate` VALUES ('2483', '花溪区', '520111', '520100', '26.415879', '106.676441');
INSERT INTO `t_sys_division_coordinate` VALUES ('2484', '乌当区', '520112', '520100', '26.636529', '106.757558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2485', '白云区', '520113', '520100', '26.683588', '106.629597');
INSERT INTO `t_sys_division_coordinate` VALUES ('2486', '观山湖区', '520115', '520100', '26.636529', '106.757558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2487', '开阳县', '520121', '520100', '27.063674', '106.97156');
INSERT INTO `t_sys_division_coordinate` VALUES ('2488', '息烽县', '520122', '520100', '27.096475', '106.747562');
INSERT INTO `t_sys_division_coordinate` VALUES ('2489', '修文县', '520123', '520100', '26.844862', '106.598492');
INSERT INTO `t_sys_division_coordinate` VALUES ('2490', '清镇市', '520181', '520100', '26.561988', '106.477523');
INSERT INTO `t_sys_division_coordinate` VALUES ('2491', '六盘水市', '520200', '520000', '26.598833', '104.837555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2492', '钟山区', '520201', '520200', '26.580704', '104.85053');
INSERT INTO `t_sys_division_coordinate` VALUES ('2493', '六枝特区', '520203', '520200', '26.219214', '105.483429');
INSERT INTO `t_sys_division_coordinate` VALUES ('2494', '水城县', '520221', '520200', '26.55372', '104.964566');
INSERT INTO `t_sys_division_coordinate` VALUES ('2495', '盘县', '520222', '520200', '25.715651', '104.478582');
INSERT INTO `t_sys_division_coordinate` VALUES ('2496', '遵义市', '520300', '520000', '27.731701', '106.933428');
INSERT INTO `t_sys_division_coordinate` VALUES ('2497', '红花岗区', '520302', '520300', '27.65087', '106.900497');
INSERT INTO `t_sys_division_coordinate` VALUES ('2498', '汇川区', '520303', '520300', '27.756343', '106.940458');
INSERT INTO `t_sys_division_coordinate` VALUES ('2499', '播州区', '520304', '520300', '27.542501', '106.836504');
INSERT INTO `t_sys_division_coordinate` VALUES ('2500', '桐梓县', '520322', '520300', '28.139468', '106.832489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2501', '绥阳县', '520323', '520300', '27.95308', '107.197492');
INSERT INTO `t_sys_division_coordinate` VALUES ('2502', '正安县', '520324', '520300', '28.559092', '107.460575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2503', '道真仡佬族苗族自治县', '520325', '520300', '28.86865', '107.619484');
INSERT INTO `t_sys_division_coordinate` VALUES ('2504', '务川仡佬族苗族自治县', '520326', '520300', '28.569077', '107.905456');
INSERT INTO `t_sys_division_coordinate` VALUES ('2505', '凤冈县', '520327', '520300', '27.960695', '107.723548');
INSERT INTO `t_sys_division_coordinate` VALUES ('2506', '湄潭县', '520328', '520300', '27.754498', '107.472599');
INSERT INTO `t_sys_division_coordinate` VALUES ('2507', '余庆县', '520329', '520300', '27.221379', '107.91146');
INSERT INTO `t_sys_division_coordinate` VALUES ('2508', '习水县', '520330', '520300', '28.339118', '106.203428');
INSERT INTO `t_sys_division_coordinate` VALUES ('2509', '赤水市', '520381', '520300', '28.596119', '105.703489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2510', '仁怀市', '520382', '520300', '27.797752', '106.407527');
INSERT INTO `t_sys_division_coordinate` VALUES ('2511', '安顺市', '520400', '520000', '26.259252', '105.954417');
INSERT INTO `t_sys_division_coordinate` VALUES ('2512', '西秀区', '520402', '520400', '26.251498', '105.972406');
INSERT INTO `t_sys_division_coordinate` VALUES ('2513', '平坝区', '520403', '520400', '26.411186', '106.263584');
INSERT INTO `t_sys_division_coordinate` VALUES ('2514', '普定县', '520422', '520400', '26.308233', '105.748486');
INSERT INTO `t_sys_division_coordinate` VALUES ('2515', '镇宁布依族苗族自治县', '520423', '520400', '26.063829', '105.776583');
INSERT INTO `t_sys_division_coordinate` VALUES ('2516', '关岭布依族苗族自治县', '520424', '520400', '25.949877', '105.625476');
INSERT INTO `t_sys_division_coordinate` VALUES ('2517', '紫云苗族布依族自治县', '520425', '520400', '25.757409', '106.090414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2518', '毕节市', '520500', '520000', '27.304095', '105.311581');
INSERT INTO `t_sys_division_coordinate` VALUES ('2519', '七星关区', '520502', '520500', '27.304095', '105.311581');
INSERT INTO `t_sys_division_coordinate` VALUES ('2520', '大方县', '520521', '520500', '27.165261', '105.611399');
INSERT INTO `t_sys_division_coordinate` VALUES ('2521', '黔西县', '520522', '520500', '27.014345', '106.038574');
INSERT INTO `t_sys_division_coordinate` VALUES ('2522', '金沙县', '520523', '520500', '27.465355', '106.226442');
INSERT INTO `t_sys_division_coordinate` VALUES ('2523', '织金县', '520524', '520500', '26.669222', '105.77759');
INSERT INTO `t_sys_division_coordinate` VALUES ('2524', '纳雍县', '520525', '520500', '26.783717', '105.389487');
INSERT INTO `t_sys_division_coordinate` VALUES ('2525', '威宁彝族回族苗族自治县', '520526', '520500', '26.875711', '104.282508');
INSERT INTO `t_sys_division_coordinate` VALUES ('2526', '赫章县', '520527', '520500', '27.129052', '104.733516');
INSERT INTO `t_sys_division_coordinate` VALUES ('2527', '铜仁市', '520600', '520000', '27.696773', '109.187435');
INSERT INTO `t_sys_division_coordinate` VALUES ('2528', '碧江区', '520602', '520600', '27.696773', '109.187435');
INSERT INTO `t_sys_division_coordinate` VALUES ('2529', '万山区', '520603', '520600', '27.696773', '109.187435');
INSERT INTO `t_sys_division_coordinate` VALUES ('2530', '江口县', '520621', '520600', '27.699558', '108.857371');
INSERT INTO `t_sys_division_coordinate` VALUES ('2531', '玉屏侗族自治县', '520622', '520600', '27.455339', '109.024903');
INSERT INTO `t_sys_division_coordinate` VALUES ('2532', '石阡县', '520623', '520600', '27.519722', '108.230464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2533', '思南县', '520624', '520600', '27.743042', '109.195295');
INSERT INTO `t_sys_division_coordinate` VALUES ('2534', '印江土家族苗族自治县', '520625', '520600', '27.999307', '108.415088');
INSERT INTO `t_sys_division_coordinate` VALUES ('2535', '德江县', '520626', '520600', '28.270733', '108.126401');
INSERT INTO `t_sys_division_coordinate` VALUES ('2536', '沿河土家族自治县', '520627', '520600', '28.570124', '108.50793');
INSERT INTO `t_sys_division_coordinate` VALUES ('2537', '松桃苗族自治县', '520628', '520600', '27.875214', '109.134326');
INSERT INTO `t_sys_division_coordinate` VALUES ('2538', '黔西南布依族苗族自治州', '522300', '520000', '25.093967', '104.912492');
INSERT INTO `t_sys_division_coordinate` VALUES ('2539', '兴义市', '522301', '522300', '25.098113', '104.902461');
INSERT INTO `t_sys_division_coordinate` VALUES ('2540', '兴仁县', '522322', '522300', '25.440899', '105.192568');
INSERT INTO `t_sys_division_coordinate` VALUES ('2541', '普安县', '522323', '522300', '25.789952', '104.959546');
INSERT INTO `t_sys_division_coordinate` VALUES ('2542', '晴隆县', '522324', '522300', '25.841048', '105.225484');
INSERT INTO `t_sys_division_coordinate` VALUES ('2543', '贞丰县', '522325', '522300', '25.392124', '105.65656');
INSERT INTO `t_sys_division_coordinate` VALUES ('2544', '望谟县', '522326', '522300', '25.184355', '106.106445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2545', '册亨县', '522327', '522300', '24.989637', '105.818511');
INSERT INTO `t_sys_division_coordinate` VALUES ('2546', '安龙县', '522328', '522300', '25.10399', '105.449543');
INSERT INTO `t_sys_division_coordinate` VALUES ('2547', '黔东南苗族侗族自治州', '522600', '520000', '26.589703', '107.989446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2548', '凯里市', '522601', '522600', '26.573079', '107.987469');
INSERT INTO `t_sys_division_coordinate` VALUES ('2549', '黄平县', '522622', '522600', '26.911289', '107.923548');
INSERT INTO `t_sys_division_coordinate` VALUES ('2550', '施秉县', '522623', '522600', '27.039822', '108.13044');
INSERT INTO `t_sys_division_coordinate` VALUES ('2551', '三穗县', '522624', '522600', '26.958666', '108.681545');
INSERT INTO `t_sys_division_coordinate` VALUES ('2552', '镇远县', '522625', '522600', '27.054821', '108.436581');
INSERT INTO `t_sys_division_coordinate` VALUES ('2553', '岑巩县', '522626', '522600', '27.179902', '108.822481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2554', '天柱县', '522627', '522600', '26.915804', '109.214446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2555', '锦屏县', '522628', '522600', '26.682632', '109.207438');
INSERT INTO `t_sys_division_coordinate` VALUES ('2556', '剑河县', '522629', '522600', '26.734048', '108.447517');
INSERT INTO `t_sys_division_coordinate` VALUES ('2557', '台江县', '522630', '522600', '26.672373', '108.328552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2558', '黎平县', '522631', '522600', '26.236874', '109.143567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2559', '榕江县', '522632', '522600', '25.937725', '108.527554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2560', '从江县', '522633', '522600', '25.759881', '108.911561');
INSERT INTO `t_sys_division_coordinate` VALUES ('2561', '雷山县', '522634', '522600', '26.384205', '108.084529');
INSERT INTO `t_sys_division_coordinate` VALUES ('2562', '麻江县', '522635', '522600', '26.496808', '107.595551');
INSERT INTO `t_sys_division_coordinate` VALUES ('2563', '丹寨县', '522636', '522600', '26.204421', '107.795513');
INSERT INTO `t_sys_division_coordinate` VALUES ('2564', '黔南布依族苗族自治州', '522700', '520000', '26.260616', '107.528403');
INSERT INTO `t_sys_division_coordinate` VALUES ('2565', '都匀市', '522701', '522700', '26.266118', '107.525404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2566', '福泉市', '522702', '522700', '26.692526', '107.526433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2567', '荔波县', '522722', '522700', '25.417098', '107.893409');
INSERT INTO `t_sys_division_coordinate` VALUES ('2568', '贵定县', '522723', '522700', '26.59066', '107.240554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2569', '瓮安县', '522725', '522700', '27.084126', '107.477552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2570', '独山县', '522726', '522700', '25.828288', '107.551498');
INSERT INTO `t_sys_division_coordinate` VALUES ('2571', '平塘县', '522727', '522700', '25.828202', '107.329567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2572', '罗甸县', '522728', '522700', '25.430838', '106.758548');
INSERT INTO `t_sys_division_coordinate` VALUES ('2573', '长顺县', '522729', '522700', '26.028455', '106.458421');
INSERT INTO `t_sys_division_coordinate` VALUES ('2574', '龙里县', '522730', '522700', '26.459081', '106.986586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2575', '惠水县', '522731', '522700', '26.13821', '106.663453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2576', '三都水族自治县', '522732', '522700', '25.989479', '107.876429');
INSERT INTO `t_sys_division_coordinate` VALUES ('2577', '云南省', '530000', '0', '25.051562', '102.716416');
INSERT INTO `t_sys_division_coordinate` VALUES ('2578', '昆明市', '530100', '530000', '24.873998', '102.852448');
INSERT INTO `t_sys_division_coordinate` VALUES ('2579', '五华区', '530102', '530100', '25.049835', '102.713423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2580', '盘龙区', '530103', '530100', '25.122372', '102.758526');
INSERT INTO `t_sys_division_coordinate` VALUES ('2581', '官渡区', '530111', '530100', '25.021196', '102.750482');
INSERT INTO `t_sys_division_coordinate` VALUES ('2582', '西山区', '530112', '530100', '25.043199', '102.671557');
INSERT INTO `t_sys_division_coordinate` VALUES ('2583', '东川区', '530113', '530100', '26.089054', '103.194452');
INSERT INTO `t_sys_division_coordinate` VALUES ('2584', '呈贡区', '530114', '530100', '24.891871', '102.827473');
INSERT INTO `t_sys_division_coordinate` VALUES ('2585', '晋宁县', '530122', '530100', '24.676099', '102.602418');
INSERT INTO `t_sys_division_coordinate` VALUES ('2586', '富民县', '530124', '530100', '25.228085', '102.504473');
INSERT INTO `t_sys_division_coordinate` VALUES ('2587', '宜良县', '530125', '530100', '24.925287', '103.147558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2588', '石林彝族自治县', '530126', '530100', '24.777702', '103.296508');
INSERT INTO `t_sys_division_coordinate` VALUES ('2589', '嵩明县', '530127', '530100', '25.344409', '103.043564');
INSERT INTO `t_sys_division_coordinate` VALUES ('2590', '禄劝彝族苗族自治县', '530128', '530100', '25.557672', '102.477423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2591', '寻甸回族彝族自治县', '530129', '530100', '25.563894', '103.263574');
INSERT INTO `t_sys_division_coordinate` VALUES ('2592', '安宁市', '530181', '530100', '24.925602', '102.484409');
INSERT INTO `t_sys_division_coordinate` VALUES ('2593', '曲靖市', '530300', '530000', '25.496407', '103.802435');
INSERT INTO `t_sys_division_coordinate` VALUES ('2594', '麒麟区', '530302', '530300', '25.502102', '103.81143');
INSERT INTO `t_sys_division_coordinate` VALUES ('2595', '沾益区', '530303', '530300', '25.606631', '103.828485');
INSERT INTO `t_sys_division_coordinate` VALUES ('2596', '马龙县', '530321', '530300', '25.433966', '103.585447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2597', '陆良县', '530322', '530300', '25.035639', '103.673432');
INSERT INTO `t_sys_division_coordinate` VALUES ('2598', '师宗县', '530323', '530300', '24.827995', '103.991556');
INSERT INTO `t_sys_division_coordinate` VALUES ('2599', '罗平县', '530324', '530300', '24.89052', '104.31551');
INSERT INTO `t_sys_division_coordinate` VALUES ('2600', '富源县', '530325', '530300', '25.68028', '104.261474');
INSERT INTO `t_sys_division_coordinate` VALUES ('2601', '会泽县', '530326', '530300', '26.424215', '103.303487');
INSERT INTO `t_sys_division_coordinate` VALUES ('2602', '宣威市', '530381', '530300', '26.225598', '104.111576');
INSERT INTO `t_sys_division_coordinate` VALUES ('2603', '玉溪市', '530400', '530000', '24.357711', '102.55356');
INSERT INTO `t_sys_division_coordinate` VALUES ('2604', '红塔区', '530402', '530400', '24.359801', '102.551565');
INSERT INTO `t_sys_division_coordinate` VALUES ('2605', '江川区', '530403', '530400', '24.293439', '102.760527');
INSERT INTO `t_sys_division_coordinate` VALUES ('2606', '澄江县', '530422', '530400', '24.679415', '102.914555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2607', '通海县', '530423', '530400', '24.117891', '102.732423');
INSERT INTO `t_sys_division_coordinate` VALUES ('2608', '华宁县', '530424', '530400', '24.198581', '102.935492');
INSERT INTO `t_sys_division_coordinate` VALUES ('2609', '易门县', '530425', '530400', '24.677404', '102.169535');
INSERT INTO `t_sys_division_coordinate` VALUES ('2610', '峨山彝族自治县', '530426', '530400', '24.174774', '102.412565');
INSERT INTO `t_sys_division_coordinate` VALUES ('2611', '新平彝族傣族自治县', '530427', '530400', '24.076263', '101.996428');
INSERT INTO `t_sys_division_coordinate` VALUES ('2612', '元江哈尼族彝族傣族自治县', '530428', '530400', '23.603001', '102.004415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2613', '保山市', '530500', '530000', '25.139039', '99.177273');
INSERT INTO `t_sys_division_coordinate` VALUES ('2614', '隆阳区', '530502', '530500', '25.126888', '99.172071');
INSERT INTO `t_sys_division_coordinate` VALUES ('2615', '施甸县', '530521', '530500', '24.728835', '99.195469');
INSERT INTO `t_sys_division_coordinate` VALUES ('2616', '龙陵县', '530523', '530500', '24.592547', '98.69575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2617', '昌宁县', '530524', '530500', '24.833985', '99.611617');
INSERT INTO `t_sys_division_coordinate` VALUES ('2618', '腾冲市', '530581', '530500', '25.026617', '98.497595');
INSERT INTO `t_sys_division_coordinate` VALUES ('2619', '昭通市', '530600', '530000', '27.344084', '103.723512');
INSERT INTO `t_sys_division_coordinate` VALUES ('2620', '昭阳区', '530602', '530600', '27.326144', '103.71347');
INSERT INTO `t_sys_division_coordinate` VALUES ('2621', '鲁甸县', '530621', '530600', '27.193107', '103.564412');
INSERT INTO `t_sys_division_coordinate` VALUES ('2622', '巧家县', '530622', '530600', '26.914705', '102.936519');
INSERT INTO `t_sys_division_coordinate` VALUES ('2623', '盐津县', '530623', '530600', '28.114384', '104.241579');
INSERT INTO `t_sys_division_coordinate` VALUES ('2624', '大关县', '530624', '530600', '27.754021', '103.897515');
INSERT INTO `t_sys_division_coordinate` VALUES ('2625', '永善县', '530625', '530600', '28.234722', '103.644569');
INSERT INTO `t_sys_division_coordinate` VALUES ('2626', '绥江县', '530626', '530600', '28.604278', '103.964552');
INSERT INTO `t_sys_division_coordinate` VALUES ('2627', '镇雄县', '530627', '530600', '27.447795', '104.880404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2628', '彝良县', '530628', '530600', '27.63169', '104.054443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2629', '威信县', '530629', '530600', '27.852537', '105.055577');
INSERT INTO `t_sys_division_coordinate` VALUES ('2630', '水富县', '530630', '530600', '28.636107', '104.422433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2631', '丽江市', '530700', '530000', '26.860657', '100.232465');
INSERT INTO `t_sys_division_coordinate` VALUES ('2632', '古城区', '530702', '530700', '26.883162', '100.23248');
INSERT INTO `t_sys_division_coordinate` VALUES ('2633', '玉龙纳西族自治县', '530721', '530700', '26.827392', '100.243527');
INSERT INTO `t_sys_division_coordinate` VALUES ('2634', '永胜县', '530722', '530700', '26.68995', '100.757581');
INSERT INTO `t_sys_division_coordinate` VALUES ('2635', '华坪县', '530723', '530700', '26.635223', '101.27243');
INSERT INTO `t_sys_division_coordinate` VALUES ('2636', '宁蒗彝族自治县', '530724', '530700', '27.287728', '100.85859');
INSERT INTO `t_sys_division_coordinate` VALUES ('2637', '普洱市', '530800', '530000', '22.830979', '100.97257');
INSERT INTO `t_sys_division_coordinate` VALUES ('2638', '思茅区', '530802', '530800', '22.792498', '100.983555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2639', '宁洱哈尼族彝族自治县', '530821', '530800', '23.05459', '101.052442');
INSERT INTO `t_sys_division_coordinate` VALUES ('2640', '墨江哈尼族自治县', '530822', '530800', '23.437726', '101.698584');
INSERT INTO `t_sys_division_coordinate` VALUES ('2641', '景东彝族自治县', '530823', '530800', '24.451864', '100.838489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2642', '景谷傣族彝族自治县', '530824', '530800', '24.451864', '100.838489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2643', '镇沅彝族哈尼族拉祜族自治县', '530825', '530800', '24.010331', '101.115569');
INSERT INTO `t_sys_division_coordinate` VALUES ('2644', '江城哈尼族彝族自治县', '530826', '530800', '22.591684', '101.868479');
INSERT INTO `t_sys_division_coordinate` VALUES ('2645', '孟连傣族拉祜族佤族自治县', '530827', '530800', '22.335308', '99.590963');
INSERT INTO `t_sys_division_coordinate` VALUES ('2646', '澜沧拉祜族自治县', '530828', '530800', '22.561832', '99.938588');
INSERT INTO `t_sys_division_coordinate` VALUES ('2647', '西盟佤族自治县', '530829', '530800', '22.650656', '99.596622');
INSERT INTO `t_sys_division_coordinate` VALUES ('2648', '临沧市', '530900', '530000', '23.890469', '100.09544');
INSERT INTO `t_sys_division_coordinate` VALUES ('2649', '临翔区', '530902', '530900', '23.901402', '100.088443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2650', '凤庆县', '530921', '530900', '24.586472', '99.934989');
INSERT INTO `t_sys_division_coordinate` VALUES ('2651', '云县', '530922', '530900', '24.442807', '100.129531');
INSERT INTO `t_sys_division_coordinate` VALUES ('2652', '永德县', '530923', '530900', '24.024871', '99.265076');
INSERT INTO `t_sys_division_coordinate` VALUES ('2653', '镇康县', '530924', '530900', '23.768315', '98.831871');
INSERT INTO `t_sys_division_coordinate` VALUES ('2654', '双江拉祜族佤族布朗族傣族自治县', '530925', '530900', '23.479837', '99.834131');
INSERT INTO `t_sys_division_coordinate` VALUES ('2655', '耿马傣族佤族自治县', '530926', '530900', '23.543491', '99.403942');
INSERT INTO `t_sys_division_coordinate` VALUES ('2656', '沧源佤族自治县', '530927', '530900', '23.152879', '99.252722');
INSERT INTO `t_sys_division_coordinate` VALUES ('2657', '楚雄彝族自治州', '532300', '530000', '25.051774', '101.534412');
INSERT INTO `t_sys_division_coordinate` VALUES ('2658', '楚雄市', '532301', '532300', '25.03886', '101.552472');
INSERT INTO `t_sys_division_coordinate` VALUES ('2659', '双柏县', '532322', '532300', '25.03886', '101.552472');
INSERT INTO `t_sys_division_coordinate` VALUES ('2660', '牟定县', '532323', '532300', '25.318846', '101.553481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2661', '南华县', '532324', '532300', '25.198587', '101.280421');
INSERT INTO `t_sys_division_coordinate` VALUES ('2662', '姚安县', '532325', '532300', '25.509775', '101.248527');
INSERT INTO `t_sys_division_coordinate` VALUES ('2663', '大姚县', '532326', '532300', '25.727601', '101.330567');
INSERT INTO `t_sys_division_coordinate` VALUES ('2664', '永仁县', '532327', '532300', '26.055566', '101.672493');
INSERT INTO `t_sys_division_coordinate` VALUES ('2665', '元谋县', '532328', '532300', '25.710895', '101.880445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2666', '武定县', '532329', '532300', '25.53609', '102.410532');
INSERT INTO `t_sys_division_coordinate` VALUES ('2667', '禄丰县', '532331', '532300', '25.155831', '102.085531');
INSERT INTO `t_sys_division_coordinate` VALUES ('2668', '红河哈尼族彝族自治州', '532500', '530000', '23.369996', '103.381549');
INSERT INTO `t_sys_division_coordinate` VALUES ('2669', '个旧市', '532501', '532500', '23.364942', '103.166519');
INSERT INTO `t_sys_division_coordinate` VALUES ('2670', '开远市', '532502', '532500', '23.364942', '103.166519');
INSERT INTO `t_sys_division_coordinate` VALUES ('2671', '蒙自市', '532503', '532500', '23.40208', '103.371546');
INSERT INTO `t_sys_division_coordinate` VALUES ('2672', '弥勒市', '532504', '532500', '24.417982', '103.421489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2673', '屏边苗族自治县', '532523', '532500', '22.98999', '103.693432');
INSERT INTO `t_sys_division_coordinate` VALUES ('2674', '建水县', '532524', '532500', '23.640939', '102.83344');
INSERT INTO `t_sys_division_coordinate` VALUES ('2675', '石屏县', '532525', '532500', '23.712004', '102.502447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2676', '泸西县', '532527', '532500', '24.538037', '103.772523');
INSERT INTO `t_sys_division_coordinate` VALUES ('2677', '元阳县', '532528', '532500', '23.226198', '102.841433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2678', '红河县', '532529', '532500', '23.374489', '102.427551');
INSERT INTO `t_sys_division_coordinate` VALUES ('2679', '金平苗族瑶族傣族自治县', '532530', '532500', '23.374489', '102.427551');
INSERT INTO `t_sys_division_coordinate` VALUES ('2680', '绿春县', '532531', '532500', '23.000165', '102.398494');
INSERT INTO `t_sys_division_coordinate` VALUES ('2681', '河口瑶族自治县', '532532', '532500', '22.535466', '103.945444');
INSERT INTO `t_sys_division_coordinate` VALUES ('2682', '文山壮族苗族自治州', '532600', '530000', '23.405994', '104.222569');
INSERT INTO `t_sys_division_coordinate` VALUES ('2683', '文山市', '532601', '532600', '23.391944', '104.238544');
INSERT INTO `t_sys_division_coordinate` VALUES ('2684', '砚山县', '532622', '532600', '23.611487', '104.343551');
INSERT INTO `t_sys_division_coordinate` VALUES ('2685', '西畴县', '532623', '532600', '23.443271', '104.678525');
INSERT INTO `t_sys_division_coordinate` VALUES ('2686', '麻栗坡县', '532624', '532600', '23.131586', '104.709549');
INSERT INTO `t_sys_division_coordinate` VALUES ('2687', '马关县', '532625', '532600', '23.018994', '104.400415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2688', '丘北县', '532626', '532600', '24.056994', '104.173442');
INSERT INTO `t_sys_division_coordinate` VALUES ('2689', '广南县', '532627', '532600', '24.052199', '105.061582');
INSERT INTO `t_sys_division_coordinate` VALUES ('2690', '富宁县', '532628', '532600', '23.63138', '105.63749');
INSERT INTO `t_sys_division_coordinate` VALUES ('2691', '西双版纳傣族自治州', '532800', '530000', '22.013601', '100.803447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2692', '景洪市', '532801', '532800', '22.017004', '100.806443');
INSERT INTO `t_sys_division_coordinate` VALUES ('2693', '勐海县', '532822', '532800', '21.963434', '100.459446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2694', '勐腊县', '532823', '532800', '21.465281', '101.571528');
INSERT INTO `t_sys_division_coordinate` VALUES ('2695', '大理白族自治州', '532900', '530000', '25.612128', '100.274583');
INSERT INTO `t_sys_division_coordinate` VALUES ('2696', '大理市', '532901', '532900', '25.597605', '100.236519');
INSERT INTO `t_sys_division_coordinate` VALUES ('2697', '漾濞彝族自治县', '532922', '532900', '25.597605', '100.236519');
INSERT INTO `t_sys_division_coordinate` VALUES ('2698', '祥云县', '532923', '532900', '25.489873', '100.557447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2699', '宾川县', '532924', '532900', '25.835249', '100.578457');
INSERT INTO `t_sys_division_coordinate` VALUES ('2700', '弥渡县', '532925', '532900', '25.349336', '100.497586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2701', '南涧彝族自治县', '532926', '532900', '25.349336', '100.497586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2702', '巍山彝族回族自治县', '532927', '532900', '25.233439', '100.31346');
INSERT INTO `t_sys_division_coordinate` VALUES ('2703', '永平县', '532928', '532900', '25.470206', '99.547495');
INSERT INTO `t_sys_division_coordinate` VALUES ('2704', '云龙县', '532929', '532900', '25.891945', '99.377416');
INSERT INTO `t_sys_division_coordinate` VALUES ('2705', '洱源县', '532930', '532900', '26.120093', '99.96921');
INSERT INTO `t_sys_division_coordinate` VALUES ('2706', '剑川县', '532931', '532900', '26.542517', '99.912091');
INSERT INTO `t_sys_division_coordinate` VALUES ('2707', '鹤庆县', '532932', '532900', '26.566197', '100.182492');
INSERT INTO `t_sys_division_coordinate` VALUES ('2708', '德宏傣族景颇族自治州', '533100', '530000', '24.438011', '98.591359');
INSERT INTO `t_sys_division_coordinate` VALUES ('2709', '瑞丽市', '533102', '533100', '24.022817', '97.862486');
INSERT INTO `t_sys_division_coordinate` VALUES ('2710', '芒市', '533103', '533100', '24.022817', '97.862486');
INSERT INTO `t_sys_division_coordinate` VALUES ('2711', '梁河县', '533122', '533100', '24.810784', '98.303134');
INSERT INTO `t_sys_division_coordinate` VALUES ('2712', '盈江县', '533123', '533100', '24.711534', '97.938427');
INSERT INTO `t_sys_division_coordinate` VALUES ('2713', '陇川县', '533124', '533100', '24.189468', '97.79853');
INSERT INTO `t_sys_division_coordinate` VALUES ('2714', '怒江傈僳族自治州', '533300', '530000', '25.823707', '98.863288');
INSERT INTO `t_sys_division_coordinate` VALUES ('2715', '泸水市', '533301', '533300', '25.829027', '98.864586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2716', '福贡县', '533323', '533300', '26.908055', '98.875649');
INSERT INTO `t_sys_division_coordinate` VALUES ('2717', '贡山独龙族怒族自治县', '533324', '533300', '27.747068', '98.672399');
INSERT INTO `t_sys_division_coordinate` VALUES ('2718', '兰坪白族普米族自治县', '533325', '533300', '26.459208', '99.423285');
INSERT INTO `t_sys_division_coordinate` VALUES ('2719', '迪庆藏族自治州', '533400', '530000', '27.825185', '99.70953');
INSERT INTO `t_sys_division_coordinate` VALUES ('2720', '香格里拉市', '533401', '533400', '27.83576', '99.707445');
INSERT INTO `t_sys_division_coordinate` VALUES ('2721', '德钦县', '533422', '533400', '28.470086', '98.924453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2722', '维西傈僳族自治县', '533423', '533400', '27.18317', '99.293466');
INSERT INTO `t_sys_division_coordinate` VALUES ('2723', '西藏自治区', '540000', '0', '29.652894', '91.124342');
INSERT INTO `t_sys_division_coordinate` VALUES ('2724', '拉萨市', '540100', '540000', '29.65004', '91.120824');
INSERT INTO `t_sys_division_coordinate` VALUES ('2725', '城关区', '540102', '540100', '29.658331', '91.1451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2726', '堆龙德庆区', '540103', '540100', '29.651626', '91.009963');
INSERT INTO `t_sys_division_coordinate` VALUES ('2727', '林周县', '540121', '540100', '29.898733', '91.269501');
INSERT INTO `t_sys_division_coordinate` VALUES ('2728', '当雄县', '540122', '540100', '30.479222', '91.107452');
INSERT INTO `t_sys_division_coordinate` VALUES ('2729', '尼木县', '540123', '540100', '29.437519', '90.17118');
INSERT INTO `t_sys_division_coordinate` VALUES ('2730', '曲水县', '540124', '540100', '29.358987', '90.749959');
INSERT INTO `t_sys_division_coordinate` VALUES ('2731', '达孜县', '540126', '540100', '29.675409', '91.356318');
INSERT INTO `t_sys_division_coordinate` VALUES ('2732', '墨竹工卡县', '540127', '540100', '29.839753', '91.737266');
INSERT INTO `t_sys_division_coordinate` VALUES ('2733', '日喀则市', '540200', '540000', '29.255583', '88.902952');
INSERT INTO `t_sys_division_coordinate` VALUES ('2734', '桑珠孜区', '540202', '540200', '29.255583', '88.902952');
INSERT INTO `t_sys_division_coordinate` VALUES ('2735', '南木林县', '540221', '540200', '29.688959', '89.108283');
INSERT INTO `t_sys_division_coordinate` VALUES ('2736', '江孜县', '540222', '540200', '28.916435', '89.614958');
INSERT INTO `t_sys_division_coordinate` VALUES ('2737', '定日县', '540223', '540200', '29.004648', '88.859425');
INSERT INTO `t_sys_division_coordinate` VALUES ('2738', '萨迦县', '540224', '540200', '28.907594', '88.02935');
INSERT INTO `t_sys_division_coordinate` VALUES ('2739', '拉孜县', '540225', '540200', '29.273927', '88.893863');
INSERT INTO `t_sys_division_coordinate` VALUES ('2740', '昂仁县', '540226', '540200', '29.271424', '88.88319');
INSERT INTO `t_sys_division_coordinate` VALUES ('2741', '谢通门县', '540227', '540200', '29.436132', '88.267177');
INSERT INTO `t_sys_division_coordinate` VALUES ('2742', '白朗县', '540228', '540200', '29.116209', '89.267941');
INSERT INTO `t_sys_division_coordinate` VALUES ('2743', '仁布县', '540229', '540200', '29.236361', '89.848427');
INSERT INTO `t_sys_division_coordinate` VALUES ('2744', '康马县', '540230', '540200', '28.561444', '89.688245');
INSERT INTO `t_sys_division_coordinate` VALUES ('2745', '定结县', '540231', '540200', '28.369911', '87.772377');
INSERT INTO `t_sys_division_coordinate` VALUES ('2746', '仲巴县', '540232', '540200', '29.775982', '84.038117');
INSERT INTO `t_sys_division_coordinate` VALUES ('2747', '亚东县', '540233', '540200', '29.275644', '88.896978');
INSERT INTO `t_sys_division_coordinate` VALUES ('2748', '吉隆县', '540234', '540200', '29.401862', '88.662548');
INSERT INTO `t_sys_division_coordinate` VALUES ('2749', '聂拉木县', '540235', '540200', '29.275236', '88.889064');
INSERT INTO `t_sys_division_coordinate` VALUES ('2750', '萨嘎县', '540236', '540200', '29.079969', '88.647947');
INSERT INTO `t_sys_division_coordinate` VALUES ('2751', '岗巴县', '540237', '540200', '29.277094', '89.322529');
INSERT INTO `t_sys_division_coordinate` VALUES ('2752', '昌都市', '540300', '540000', '31.144249', '97.186654');
INSERT INTO `t_sys_division_coordinate` VALUES ('2753', '卡若区', '540302', '540300', '31.144249', '97.186654');
INSERT INTO `t_sys_division_coordinate` VALUES ('2754', '江达县', '540321', '540300', '31.505147', '98.224424');
INSERT INTO `t_sys_division_coordinate` VALUES ('2755', '贡觉县', '540322', '540300', '30.865967', '98.277334');
INSERT INTO `t_sys_division_coordinate` VALUES ('2756', '类乌齐县', '540323', '540300', '31.22509', '96.608489');
INSERT INTO `t_sys_division_coordinate` VALUES ('2757', '丁青县', '540324', '540300', '31.149643', '97.177402');
INSERT INTO `t_sys_division_coordinate` VALUES ('2758', '察雅县', '540325', '540300', '30.660119', '97.575976');
INSERT INTO `t_sys_division_coordinate` VALUES ('2759', '八宿县', '540326', '540300', '30.061833', '96.931495');
INSERT INTO `t_sys_division_coordinate` VALUES ('2760', '左贡县', '540327', '540300', '29.676849', '97.847367');
INSERT INTO `t_sys_division_coordinate` VALUES ('2761', '芒康县', '540328', '540300', '30.738561', '96.848134');
INSERT INTO `t_sys_division_coordinate` VALUES ('2762', '洛隆县', '540329', '540300', '31.06774', '97.399916');
INSERT INTO `t_sys_division_coordinate` VALUES ('2763', '边坝县', '540330', '540300', '30.939625', '94.714371');
INSERT INTO `t_sys_division_coordinate` VALUES ('2764', '林芝市', '540400', '540000', '29.654042', '94.368058');
INSERT INTO `t_sys_division_coordinate` VALUES ('2765', '巴宜区', '540402', '540400', '29.641645', '94.367544');
INSERT INTO `t_sys_division_coordinate` VALUES ('2766', '工布江达县', '540421', '540400', '29.891368', '93.25242');
INSERT INTO `t_sys_division_coordinate` VALUES ('2767', '米林县', '540422', '540400', '29.220917', '94.219939');
INSERT INTO `t_sys_division_coordinate` VALUES ('2768', '墨脱县', '540423', '540400', '29.330938', '95.339495');
INSERT INTO `t_sys_division_coordinate` VALUES ('2769', '波密县', '540424', '540400', '29.86506', '95.7739');
INSERT INTO `t_sys_division_coordinate` VALUES ('2770', '察隅县', '540425', '540400', '28.667444', '97.47327');
INSERT INTO `t_sys_division_coordinate` VALUES ('2771', '朗县', '540426', '540400', '29.051902', '93.081368');
INSERT INTO `t_sys_division_coordinate` VALUES ('2772', '山南市', '540500', '540000', '29.243027', '91.778675');
INSERT INTO `t_sys_division_coordinate` VALUES ('2773', '乃东区', '540502', '540500', '29.234229', '91.778682');
INSERT INTO `t_sys_division_coordinate` VALUES ('2774', '扎囊县', '540521', '540500', '29.251164', '91.343627');
INSERT INTO `t_sys_division_coordinate` VALUES ('2775', '贡嘎县', '540522', '540500', '29.251164', '91.343627');
INSERT INTO `t_sys_division_coordinate` VALUES ('2776', '桑日县', '540523', '540500', '29.267104', '92.021252');
INSERT INTO `t_sys_division_coordinate` VALUES ('2777', '琼结县', '540524', '540500', '29.030866', '91.690101');
INSERT INTO `t_sys_division_coordinate` VALUES ('2778', '曲松县', '540525', '540500', '29.071107', '92.205435');
INSERT INTO `t_sys_division_coordinate` VALUES ('2779', '措美县', '540526', '540500', '28.444258', '91.439918');
INSERT INTO `t_sys_division_coordinate` VALUES ('2780', '洛扎县', '540527', '540500', '28.391993', '90.855029');
INSERT INTO `t_sys_division_coordinate` VALUES ('2781', '加查县', '540528', '540500', '29.144787', '92.601582');
INSERT INTO `t_sys_division_coordinate` VALUES ('2782', '隆子县', '540529', '540500', '28.414441', '92.469078');
INSERT INTO `t_sys_division_coordinate` VALUES ('2783', '错那县', '540530', '540500', '27.998343', '91.968115');
INSERT INTO `t_sys_division_coordinate` VALUES ('2784', '浪卡子县', '540531', '540500', '28.973992', '90.404647');
INSERT INTO `t_sys_division_coordinate` VALUES ('2785', '那曲地区', '542400', '540000', '31.482438', '92.057338');
INSERT INTO `t_sys_division_coordinate` VALUES ('2786', '那曲县', '542421', '542400', '31.476117', '92.059847');
INSERT INTO `t_sys_division_coordinate` VALUES ('2787', '嘉黎县', '542422', '542400', '30.647062', '93.238732');
INSERT INTO `t_sys_division_coordinate` VALUES ('2788', '比如县', '542423', '542400', '31.486357', '93.685966');
INSERT INTO `t_sys_division_coordinate` VALUES ('2789', '聂荣县', '542424', '542400', '32.113707', '92.308654');
INSERT INTO `t_sys_division_coordinate` VALUES ('2790', '安多县', '542425', '542400', '32.271268', '91.688891');
INSERT INTO `t_sys_division_coordinate` VALUES ('2791', '申扎县', '542426', '542400', '30.936393', '88.716481');
INSERT INTO `t_sys_division_coordinate` VALUES ('2792', '索县', '542427', '542400', '31.892424', '93.792173');
INSERT INTO `t_sys_division_coordinate` VALUES ('2793', '班戈县', '542428', '542400', '31.398728', '90.016708');
INSERT INTO `t_sys_division_coordinate` VALUES ('2794', '巴青县', '542429', '542400', '31.924549', '94.059882');
INSERT INTO `t_sys_division_coordinate` VALUES ('2795', '尼玛县', '542430', '542400', '31.790953', '87.243292');
INSERT INTO `t_sys_division_coordinate` VALUES ('2796', '双湖县', '542431', '542400', '31.790953', '87.243292');
INSERT INTO `t_sys_division_coordinate` VALUES ('2797', '阿里地区', '542500', '540000', '32.506866', '80.112777');
INSERT INTO `t_sys_division_coordinate` VALUES ('2798', '普兰县', '542521', '542500', '30.300163', '81.183095');
INSERT INTO `t_sys_division_coordinate` VALUES ('2799', '札达县', '542522', '542500', '31.485343', '79.809323');
INSERT INTO `t_sys_division_coordinate` VALUES ('2800', '噶尔县', '542523', '542500', '32.497157', '80.102877');
INSERT INTO `t_sys_division_coordinate` VALUES ('2801', '日土县', '542524', '542500', '33.387186', '79.739109');
INSERT INTO `t_sys_division_coordinate` VALUES ('2802', '革吉县', '542525', '542500', '32.393356', '81.151664');
INSERT INTO `t_sys_division_coordinate` VALUES ('2803', '改则县', '542526', '542500', '32.308357', '84.069113');
INSERT INTO `t_sys_division_coordinate` VALUES ('2804', '措勤县', '542527', '542500', '32.308357', '84.069113');
INSERT INTO `t_sys_division_coordinate` VALUES ('2805', '陕西省', '610000', '0', '34.275808', '108.960393');
INSERT INTO `t_sys_division_coordinate` VALUES ('2806', '西安市', '610100', '610000', '34.347269', '108.946466');
INSERT INTO `t_sys_division_coordinate` VALUES ('2807', '新城区', '610102', '610100', '34.272724', '108.967391');
INSERT INTO `t_sys_division_coordinate` VALUES ('2808', '碑林区', '610103', '610100', '34.236474', '108.940498');
INSERT INTO `t_sys_division_coordinate` VALUES ('2809', '莲湖区', '610104', '610100', '34.271017', '108.950426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2810', '灞桥区', '610111', '610100', '34.279128', '109.071415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2811', '未央区', '610112', '610100', '34.299148', '108.953401');
INSERT INTO `t_sys_division_coordinate` VALUES ('2812', '雁塔区', '610113', '610100', '34.220635', '108.95144');
INSERT INTO `t_sys_division_coordinate` VALUES ('2813', '阎良区', '610114', '610100', '34.668363', '109.232463');
INSERT INTO `t_sys_division_coordinate` VALUES ('2814', '临潼区', '610115', '610100', '34.372747', '109.220436');
INSERT INTO `t_sys_division_coordinate` VALUES ('2815', '长安区', '610116', '610100', '34.16329', '108.91358');
INSERT INTO `t_sys_division_coordinate` VALUES ('2816', '高陵区', '610117', '610100', '34.541093', '109.094387');
INSERT INTO `t_sys_division_coordinate` VALUES ('2817', '蓝田县', '610122', '610100', '34.157621', '109.329388');
INSERT INTO `t_sys_division_coordinate` VALUES ('2818', '周至县', '610124', '610100', '34.169385', '108.228422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2819', '户县', '610125', '610100', '34.115021', '108.61142');
INSERT INTO `t_sys_division_coordinate` VALUES ('2820', '铜川市', '610200', '610000', '34.902637', '108.952404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2821', '王益区', '610202', '610200', '35.075322', '109.081417');
INSERT INTO `t_sys_division_coordinate` VALUES ('2822', '印台区', '610203', '610200', '35.120859', '109.106434');
INSERT INTO `t_sys_division_coordinate` VALUES ('2823', '耀州区', '610204', '610200', '34.91596', '108.986438');
INSERT INTO `t_sys_division_coordinate` VALUES ('2824', '宜君县', '610222', '610200', '35.404582', '109.123537');
INSERT INTO `t_sys_division_coordinate` VALUES ('2825', '宝鸡市', '610300', '610000', '34.368916', '107.244575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2826', '渭滨区', '610302', '610300', '34.377481', '107.156419');
INSERT INTO `t_sys_division_coordinate` VALUES ('2827', '金台区', '610303', '610300', '34.382351', '107.153424');
INSERT INTO `t_sys_division_coordinate` VALUES ('2828', '陈仓区', '610304', '610300', '34.360756', '107.393438');
INSERT INTO `t_sys_division_coordinate` VALUES ('2829', '凤翔县', '610322', '610300', '34.527616', '107.407379');
INSERT INTO `t_sys_division_coordinate` VALUES ('2830', '岐山县', '610323', '610300', '34.449777', '107.627447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2831', '扶风县', '610324', '610300', '34.381463', '107.906453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2832', '眉县', '610326', '610300', '34.280376', '107.756398');
INSERT INTO `t_sys_division_coordinate` VALUES ('2833', '陇县', '610327', '610300', '34.89878', '106.870584');
INSERT INTO `t_sys_division_coordinate` VALUES ('2834', '千阳县', '610328', '610300', '34.648545', '107.139466');
INSERT INTO `t_sys_division_coordinate` VALUES ('2835', '麟游县', '610329', '610300', '34.683749', '107.799514');
INSERT INTO `t_sys_division_coordinate` VALUES ('2836', '凤县', '610330', '610300', '33.916583', '106.522558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2837', '太白县', '610331', '610300', '34.064248', '107.325529');
INSERT INTO `t_sys_division_coordinate` VALUES ('2838', '咸阳市', '610400', '610000', '34.335476', '108.715422');
INSERT INTO `t_sys_division_coordinate` VALUES ('2839', '秦都区', '610402', '610400', '34.335145', '108.712432');
INSERT INTO `t_sys_division_coordinate` VALUES ('2840', '杨陵区', '610403', '610400', '34.278013', '108.091515');
INSERT INTO `t_sys_division_coordinate` VALUES ('2841', '渭城区', '610404', '610400', '34.36811', '108.743451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2842', '三原县', '610422', '610400', '34.623079', '108.947447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2843', '泾阳县', '610423', '610400', '34.533317', '108.849379');
INSERT INTO `t_sys_division_coordinate` VALUES ('2844', '乾县', '610424', '610400', '34.534018', '108.245378');
INSERT INTO `t_sys_division_coordinate` VALUES ('2845', '礼泉县', '610425', '610400', '34.487391', '108.431615');
INSERT INTO `t_sys_division_coordinate` VALUES ('2846', '永寿县', '610426', '610400', '34.698036', '108.148469');
INSERT INTO `t_sys_division_coordinate` VALUES ('2847', '彬县', '610427', '610400', '35.049611', '108.084566');
INSERT INTO `t_sys_division_coordinate` VALUES ('2848', '长武县', '610428', '610400', '35.211657', '107.805561');
INSERT INTO `t_sys_division_coordinate` VALUES ('2849', '旬邑县', '610429', '610400', '35.117964', '108.340467');
INSERT INTO `t_sys_division_coordinate` VALUES ('2850', '淳化县', '610430', '610400', '34.804777', '108.587442');
INSERT INTO `t_sys_division_coordinate` VALUES ('2851', '武功县', '610431', '610400', '34.266138', '108.206551');
INSERT INTO `t_sys_division_coordinate` VALUES ('2852', '兴平市', '610481', '610400', '34.305477', '108.496394');
INSERT INTO `t_sys_division_coordinate` VALUES ('2853', '渭南市', '610500', '610000', '34.505716', '109.51659');
INSERT INTO `t_sys_division_coordinate` VALUES ('2854', '临渭区', '610502', '610500', '34.504', '109.498596');
INSERT INTO `t_sys_division_coordinate` VALUES ('2855', '华州区', '610503', '610500', '34.518731', '109.778477');
INSERT INTO `t_sys_division_coordinate` VALUES ('2856', '潼关县', '610522', '610500', '34.550327', '110.252508');
INSERT INTO `t_sys_division_coordinate` VALUES ('2857', '大荔县', '610523', '610500', '34.801833', '109.948453');
INSERT INTO `t_sys_division_coordinate` VALUES ('2858', '合阳县', '610524', '610500', '35.243872', '110.155396');
INSERT INTO `t_sys_division_coordinate` VALUES ('2859', '澄城县', '610525', '610500', '35.196573', '109.938434');
INSERT INTO `t_sys_division_coordinate` VALUES ('2860', '蒲城县', '610526', '610500', '34.961274', '109.592497');
INSERT INTO `t_sys_division_coordinate` VALUES ('2861', '白水县', '610527', '610500', '35.183288', '109.597521');
INSERT INTO `t_sys_division_coordinate` VALUES ('2862', '富平县', '610528', '610500', '34.75726', '109.186437');
INSERT INTO `t_sys_division_coordinate` VALUES ('2863', '韩城市', '610581', '610500', '35.482087', '110.449553');
INSERT INTO `t_sys_division_coordinate` VALUES ('2864', '华阴市', '610582', '610500', '34.5718', '110.098601');
INSERT INTO `t_sys_division_coordinate` VALUES ('2865', '延安市', '610600', '610000', '36.591111', '109.496582');
INSERT INTO `t_sys_division_coordinate` VALUES ('2866', '宝塔区', '610602', '610600', '36.59689', '109.499594');
INSERT INTO `t_sys_division_coordinate` VALUES ('2867', '安塞区', '610603', '610600', '36.870098', '109.335419');
INSERT INTO `t_sys_division_coordinate` VALUES ('2868', '延长县', '610621', '610600', '36.585329', '110.018472');
INSERT INTO `t_sys_division_coordinate` VALUES ('2869', '延川县', '610622', '610600', '36.884137', '110.20054');
INSERT INTO `t_sys_division_coordinate` VALUES ('2870', '子长县', '610623', '610600', '37.148817', '109.68139');
INSERT INTO `t_sys_division_coordinate` VALUES ('2871', '志丹县', '610625', '610600', '36.828021', '108.775577');
INSERT INTO `t_sys_division_coordinate` VALUES ('2872', '吴起县', '610626', '610600', '36.932576', '108.18259');
INSERT INTO `t_sys_division_coordinate` VALUES ('2873', '甘泉县', '610627', '610600', '36.282689', '109.357524');
INSERT INTO `t_sys_division_coordinate` VALUES ('2874', '富县', '610628', '610600', '35.993368', '109.386597');
INSERT INTO `t_sys_division_coordinate` VALUES ('2875', '洛川县', '610629', '610600', '35.7683', '109.438404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2876', '宜川县', '610630', '610600', '36.056397', '110.175413');
INSERT INTO `t_sys_division_coordinate` VALUES ('2877', '黄龙县', '610631', '610600', '35.590234', '109.846549');
INSERT INTO `t_sys_division_coordinate` VALUES ('2878', '黄陵县', '610632', '610600', '35.585076', '109.269606');
INSERT INTO `t_sys_division_coordinate` VALUES ('2879', '汉中市', '610700', '610000', '33.0738', '107.02943');
INSERT INTO `t_sys_division_coordinate` VALUES ('2880', '汉台区', '610702', '610700', '33.074191', '107.038402');
INSERT INTO `t_sys_division_coordinate` VALUES ('2881', '南郑县', '610721', '610700', '33.005615', '106.942433');
INSERT INTO `t_sys_division_coordinate` VALUES ('2882', '城固县', '610722', '610700', '33.162399', '107.340613');
INSERT INTO `t_sys_division_coordinate` VALUES ('2883', '洋县', '610723', '610700', '33.228863', '107.552464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2884', '西乡县', '610724', '610700', '32.989397', '107.773393');
INSERT INTO `t_sys_division_coordinate` VALUES ('2885', '勉县', '610725', '610700', '33.159805', '106.679426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2886', '宁强县', '610726', '610700', '32.83538', '106.264589');
INSERT INTO `t_sys_division_coordinate` VALUES ('2887', '略阳县', '610727', '610700', '33.333194', '106.163544');
INSERT INTO `t_sys_division_coordinate` VALUES ('2888', '镇巴县', '610728', '610700', '32.542833', '107.901446');
INSERT INTO `t_sys_division_coordinate` VALUES ('2889', '留坝县', '610729', '610700', '33.623825', '106.927414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2890', '佛坪县', '610730', '610700', '33.530693', '107.997424');
INSERT INTO `t_sys_division_coordinate` VALUES ('2891', '榆林市', '610800', '610000', '38.290884', '109.741616');
INSERT INTO `t_sys_division_coordinate` VALUES ('2892', '榆阳区', '610802', '610800', '38.28242', '109.727559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2893', '横山区', '610803', '610800', '37.968573', '109.300491');
INSERT INTO `t_sys_division_coordinate` VALUES ('2894', '神木县', '610821', '610800', '38.848544', '110.50543');
INSERT INTO `t_sys_division_coordinate` VALUES ('2895', '府谷县', '610822', '610800', '39.033796', '111.073628');
INSERT INTO `t_sys_division_coordinate` VALUES ('2896', '靖边县', '610824', '610800', '37.605063', '108.8006');
INSERT INTO `t_sys_division_coordinate` VALUES ('2897', '定边县', '610825', '610800', '37.60046', '107.60757');
INSERT INTO `t_sys_division_coordinate` VALUES ('2898', '绥德县', '610826', '610800', '37.508907', '110.269426');
INSERT INTO `t_sys_division_coordinate` VALUES ('2899', '米脂县', '610827', '610800', '37.761398', '110.190451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2900', '佳县', '610828', '610800', '38.025612', '110.497477');
INSERT INTO `t_sys_division_coordinate` VALUES ('2901', '吴堡县', '610829', '610800', '37.45827', '110.746455');
INSERT INTO `t_sys_division_coordinate` VALUES ('2902', '清涧县', '610830', '610800', '37.094853', '110.127559');
INSERT INTO `t_sys_division_coordinate` VALUES ('2903', '子洲县', '610831', '610800', '37.617026', '110.042398');
INSERT INTO `t_sys_division_coordinate` VALUES ('2904', '安康市', '610900', '610000', '32.690513', '109.035601');
INSERT INTO `t_sys_division_coordinate` VALUES ('2905', '汉滨区', '610902', '610900', '32.701196', '109.033596');
INSERT INTO `t_sys_division_coordinate` VALUES ('2906', '汉阴县', '610921', '610900', '32.899121', '108.515507');
INSERT INTO `t_sys_division_coordinate` VALUES ('2907', '石泉县', '610922', '610900', '33.044602', '108.254427');
INSERT INTO `t_sys_division_coordinate` VALUES ('2908', '宁陕县', '610923', '610900', '33.316555', '108.320564');
INSERT INTO `t_sys_division_coordinate` VALUES ('2909', '紫阳县', '610924', '610900', '32.525786', '108.541594');
INSERT INTO `t_sys_division_coordinate` VALUES ('2910', '岚皋县', '610925', '610900', '32.312881', '108.908615');
INSERT INTO `t_sys_division_coordinate` VALUES ('2911', '平利县', '610926', '610900', '32.394804', '109.368547');
INSERT INTO `t_sys_division_coordinate` VALUES ('2912', '镇坪县', '610927', '610900', '31.889643', '109.533497');
INSERT INTO `t_sys_division_coordinate` VALUES ('2913', '旬阳县', '610928', '610900', '32.839864', '109.371557');
INSERT INTO `t_sys_division_coordinate` VALUES ('2914', '白河县', '610929', '610900', '32.814846', '110.119587');
INSERT INTO `t_sys_division_coordinate` VALUES ('2915', '商洛市', '611000', '610000', '33.878634', '109.924418');
INSERT INTO `t_sys_division_coordinate` VALUES ('2916', '商州区', '611002', '611000', '33.868855', '109.947472');
INSERT INTO `t_sys_division_coordinate` VALUES ('2917', '洛南县', '611021', '611000', '34.097071', '110.154427');
INSERT INTO `t_sys_division_coordinate` VALUES ('2918', '丹凤县', '611022', '611000', '33.701537', '110.33356');
INSERT INTO `t_sys_division_coordinate` VALUES ('2919', '商南县', '611023', '611000', '33.537533', '110.888408');
INSERT INTO `t_sys_division_coordinate` VALUES ('2920', '山阳县', '611024', '611000', '33.537968', '109.888549');
INSERT INTO `t_sys_division_coordinate` VALUES ('2921', '镇安县', '611025', '611000', '33.429045', '109.159575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2922', '柞水县', '611026', '611000', '33.692026', '109.120502');
INSERT INTO `t_sys_division_coordinate` VALUES ('2923', '甘肃省', '620000', '0', '36.065465', '103.832478');
INSERT INTO `t_sys_division_coordinate` VALUES ('2924', '兰州市', '620100', '620000', '36.067235', '103.840521');
INSERT INTO `t_sys_division_coordinate` VALUES ('2925', '城关区', '620102', '620100', '36.063181', '103.831475');
INSERT INTO `t_sys_division_coordinate` VALUES ('2926', '七里河区', '620103', '620100', '36.072129', '103.792414');
INSERT INTO `t_sys_division_coordinate` VALUES ('2927', '西固区', '620104', '620100', '36.094109', '103.63458');
INSERT INTO `t_sys_division_coordinate` VALUES ('2928', '安宁区', '620105', '620100', '36.109754', '103.725535');
INSERT INTO `t_sys_division_coordinate` VALUES ('2929', '红古区', '620111', '620100', '36.351863', '102.865428');
INSERT INTO `t_sys_division_coordinate` VALUES ('2930', '永登县', '620121', '620100', '36.742095', '103.266624');
INSERT INTO `t_sys_division_coordinate` VALUES ('2931', '皋兰县', '620122', '620100', '36.338142', '103.953464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2932', '榆中县', '620123', '620100', '35.848851', '104.119566');
INSERT INTO `t_sys_division_coordinate` VALUES ('2933', '嘉峪关市', '620200', '620000', '39.77796', '98.296204');
INSERT INTO `t_sys_division_coordinate` VALUES ('2934', '金昌市', '620300', '620000', '38.52582', '102.194606');
INSERT INTO `t_sys_division_coordinate` VALUES ('2935', '金川区', '620302', '620300', '38.525772', '102.200586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2936', '永昌县', '620321', '620300', '38.252941', '101.979464');
INSERT INTO `t_sys_division_coordinate` VALUES ('2937', '白银市', '620400', '620000', '36.550825', '104.144451');
INSERT INTO `t_sys_division_coordinate` VALUES ('2938', '白银区', '620402', '620400', '36.541464', '104.155413');
INSERT INTO `t_sys_division_coordinate` VALUES ('2939', '平川区', '620403', '620400', '36.733499', '104.831614');
INSERT INTO `t_sys_division_coordinate` VALUES ('2940', '靖远县', '620421', '620400', '36.577096', '104.682515');
INSERT INTO `t_sys_division_coordinate` VALUES ('2941', '会宁县', '620422', '620400', '35.698508', '105.059607');
INSERT INTO `t_sys_division_coordinate` VALUES ('2942', '景泰县', '620423', '620400', '37.187406', '104.069444');
INSERT INTO `t_sys_division_coordinate` VALUES ('2943', '天水市', '620500', '620000', '34.587412', '105.731417');
INSERT INTO `t_sys_division_coordinate` VALUES ('2944', '秦州区', '620502', '620500', '34.587316', '105.730415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2945', '麦积区', '620503', '620500', '34.576337', '105.895597');
INSERT INTO `t_sys_division_coordinate` VALUES ('2946', '清水县', '620521', '620500', '34.753883', '106.143595');
INSERT INTO `t_sys_division_coordinate` VALUES ('2947', '秦安县', '620522', '620500', '34.864876', '105.681575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2948', '甘谷县', '620523', '620500', '34.7383', '105.342475');
INSERT INTO `t_sys_division_coordinate` VALUES ('2949', '武山县', '620524', '620500', '34.727669', '104.897428');
INSERT INTO `t_sys_division_coordinate` VALUES ('2950', '张家川回族自治县', '620525', '620500', '34.994905', '106.21139');
INSERT INTO `t_sys_division_coordinate` VALUES ('2951', '武威市', '620600', '620000', '37.934378', '102.644554');
INSERT INTO `t_sys_division_coordinate` VALUES ('2952', '凉州区', '620602', '620600', '37.934122', '102.648575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2953', '民勤县', '620621', '620600', '38.630625', '103.1004');
INSERT INTO `t_sys_division_coordinate` VALUES ('2954', '古浪县', '620622', '620600', '37.475802', '102.90363');
INSERT INTO `t_sys_division_coordinate` VALUES ('2955', '天祝藏族自治县', '620623', '620600', '36.977596', '103.148621');
INSERT INTO `t_sys_division_coordinate` VALUES ('2956', '张掖市', '620700', '620000', '38.932066', '100.456411');
INSERT INTO `t_sys_division_coordinate` VALUES ('2957', '甘州区', '620702', '620700', '38.934781', '100.484558');
INSERT INTO `t_sys_division_coordinate` VALUES ('2958', '肃南裕固族自治县', '620721', '620700', '38.8431', '99.621905');
INSERT INTO `t_sys_division_coordinate` VALUES ('2959', '民乐县', '620722', '620700', '38.436842', '100.819429');
INSERT INTO `t_sys_division_coordinate` VALUES ('2960', '临泽县', '620723', '620700', '39.158514', '100.170555');
INSERT INTO `t_sys_division_coordinate` VALUES ('2961', '高台县', '620724', '620700', '39.383646', '99.82576');
INSERT INTO `t_sys_division_coordinate` VALUES ('2962', '山丹县', '620725', '620700', '38.790453', '101.095616');
INSERT INTO `t_sys_division_coordinate` VALUES ('2963', '平凉市', '620800', '620000', '35.549232', '106.671442');
INSERT INTO `t_sys_division_coordinate` VALUES ('2964', '崆峒区', '620802', '620800', '35.548815', '106.681415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2965', '泾川县', '620821', '620800', '35.338669', '107.374518');
INSERT INTO `t_sys_division_coordinate` VALUES ('2966', '灵台县', '620822', '620800', '35.071582', '107.627461');
INSERT INTO `t_sys_division_coordinate` VALUES ('2967', '崇信县', '620823', '620800', '35.308616', '107.041415');
INSERT INTO `t_sys_division_coordinate` VALUES ('2968', '华亭县', '620824', '620800', '35.223551', '106.659486');
INSERT INTO `t_sys_division_coordinate` VALUES ('2969', '庄浪县', '620825', '620800', '35.208192', '106.042586');
INSERT INTO `t_sys_division_coordinate` VALUES ('2970', '静宁县', '620826', '620800', '35.528257', '105.738416');
INSERT INTO `t_sys_division_coordinate` VALUES ('2971', '酒泉市', '620900', '620000', '39.738469', '98.500685');
INSERT INTO `t_sys_division_coordinate` VALUES ('2972', '肃州区', '620902', '620900', '39.751246', '98.514322');
INSERT INTO `t_sys_division_coordinate` VALUES ('2973', '金塔县', '620921', '620900', '39.990029', '98.908368');
INSERT INTO `t_sys_division_coordinate` VALUES ('2974', '瓜州县', '620922', '620900', '40.526106', '95.788736');
INSERT INTO `t_sys_division_coordinate` VALUES ('2975', '肃北蒙古族自治县', '620923', '620900', '39.51833', '94.883692');
INSERT INTO `t_sys_division_coordinate` VALUES ('2976', '阿克塞哈萨克族自治县', '620924', '620900', '39.640045', '94.34676');
INSERT INTO `t_sys_division_coordinate` VALUES ('2977', '玉门市', '620981', '620900', '40.29762', '97.051712');
INSERT INTO `t_sys_division_coordinate` VALUES ('2978', '敦煌市', '620982', '620900', '40.147867', '94.668527');
INSERT INTO `t_sys_division_coordinate` VALUES ('2979', '庆阳市', '621000', '620000', '35.715216', '107.649386');
INSERT INTO `t_sys_division_coordinate` VALUES ('2980', '西峰区', '621002', '621000', '35.736864', '107.657391');
INSERT INTO `t_sys_division_coordinate` VALUES ('2981', '庆城县', '621021', '621000', '36.021726', '107.888406');
INSERT INTO `t_sys_division_coordinate` VALUES ('2982', '环县', '621022', '621000', '36.574427', '107.31447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2983', '华池县', '621023', '621000', '36.467575', '107.99639');
INSERT INTO `t_sys_division_coordinate` VALUES ('2984', '合水县', '621024', '621000', '35.825262', '108.026447');
INSERT INTO `t_sys_division_coordinate` VALUES ('2985', '正宁县', '621025', '621000', '35.498219', '108.366375');
INSERT INTO `t_sys_division_coordinate` VALUES ('2986', '宁县', '621026', '621000', '35.507933', '107.934571');
INSERT INTO `t_sys_division_coordinate` VALUES ('2987', '镇原县', '621027', '621000', '35.683231', '107.207576');
INSERT INTO `t_sys_division_coordinate` VALUES ('2988', '定西市', '621100', '620000', '35.586833', '104.63242');
INSERT INTO `t_sys_division_coordinate` VALUES ('2989', '安定区', '621102', '621100', '35.5856', '104.6165');
INSERT INTO `t_sys_division_coordinate` VALUES ('2990', '通渭县', '621121', '621100', '35.217217', '105.248404');
INSERT INTO `t_sys_division_coordinate` VALUES ('2991', '陇西县', '621122', '621100', '35.010197', '104.641381');
INSERT INTO `t_sys_division_coordinate` VALUES ('2992', '渭源县', '621123', '621100', '35.142392', '104.221584');
INSERT INTO `t_sys_division_coordinate` VALUES ('2993', '临洮县', '621124', '621100', '35.400587', '103.865601');
INSERT INTO `t_sys_division_coordinate` VALUES ('2994', '漳县', '621125', '621100', '34.85425', '104.478595');
INSERT INTO `t_sys_division_coordinate` VALUES ('2995', '岷县', '621126', '621100', '34.444408', '104.043396');
INSERT INTO `t_sys_division_coordinate` VALUES ('2996', '陇南市', '621200', '620000', '33.40662', '104.928575');
INSERT INTO `t_sys_division_coordinate` VALUES ('2997', '武都区', '621202', '621200', '33.398072', '104.932593');
INSERT INTO `t_sys_division_coordinate` VALUES ('2998', '成县', '621221', '621200', '33.756635', '105.748478');
INSERT INTO `t_sys_division_coordinate` VALUES ('2999', '文县', '621222', '621200', '32.949601', '104.689558');
INSERT INTO `t_sys_division_coordinate` VALUES ('3000', '宕昌县', '621223', '621200', '34.053486', '104.399386');
INSERT INTO `t_sys_division_coordinate` VALUES ('3001', '康县', '621224', '621200', '33.335376', '105.615392');
INSERT INTO `t_sys_division_coordinate` VALUES ('3002', '西和县', '621225', '621200', '34.016787', '105.30761');
INSERT INTO `t_sys_division_coordinate` VALUES ('3003', '礼县', '621226', '621200', '34.194685', '105.183591');
INSERT INTO `t_sys_division_coordinate` VALUES ('3004', '徽县', '621227', '621200', '33.775194', '106.094418');
INSERT INTO `t_sys_division_coordinate` VALUES ('3005', '两当县', '621228', '621200', '33.915123', '106.311419');
INSERT INTO `t_sys_division_coordinate` VALUES ('3006', '临夏回族自治州', '622900', '620000', '35.607562', '103.216391');
INSERT INTO `t_sys_division_coordinate` VALUES ('3007', '临夏市', '622901', '622900', '35.609899', '103.249549');
INSERT INTO `t_sys_division_coordinate` VALUES ('3008', '临夏县', '622921', '622900', '35.497398', '103.002514');
INSERT INTO `t_sys_division_coordinate` VALUES ('3009', '康乐县', '622922', '622900', '35.37611', '103.715476');
INSERT INTO `t_sys_division_coordinate` VALUES ('3010', '永靖县', '622923', '622900', '35.96333', '103.292507');
INSERT INTO `t_sys_division_coordinate` VALUES ('3011', '广河县', '622924', '622900', '35.494101', '103.58241');
INSERT INTO `t_sys_division_coordinate` VALUES ('3012', '和政县', '622925', '622900', '35.43059', '103.357524');
INSERT INTO `t_sys_division_coordinate` VALUES ('3013', '东乡族自治县', '622926', '622900', '35.66933', '103.395613');
INSERT INTO `t_sys_division_coordinate` VALUES ('3014', '积石山保安族东乡族撒拉族自治县', '622927', '622900', '35.723499', '102.882518');
INSERT INTO `t_sys_division_coordinate` VALUES ('3015', '甘南藏族自治州', '623000', '620000', '34.98914', '102.917585');
INSERT INTO `t_sys_division_coordinate` VALUES ('3016', '合作市', '623001', '623000', '35.005935', '102.917572');
INSERT INTO `t_sys_division_coordinate` VALUES ('3017', '临潭县', '623021', '623000', '34.698639', '103.360533');
INSERT INTO `t_sys_division_coordinate` VALUES ('3018', '卓尼县', '623022', '623000', '34.594916', '103.513616');
INSERT INTO `t_sys_division_coordinate` VALUES ('3019', '舟曲县', '623023', '623000', '33.790815', '104.37749');
INSERT INTO `t_sys_division_coordinate` VALUES ('3020', '迭部县', '623024', '623000', '34.06202', '103.22844');
INSERT INTO `t_sys_division_coordinate` VALUES ('3021', '玛曲县', '623025', '623000', '34.003358', '102.0786');
INSERT INTO `t_sys_division_coordinate` VALUES ('3022', '碌曲县', '623026', '623000', '34.597087', '102.494424');
INSERT INTO `t_sys_division_coordinate` VALUES ('3023', '夏河县', '623027', '623000', '35.208324', '102.528577');
INSERT INTO `t_sys_division_coordinate` VALUES ('3024', '青海省', '630000', '0', '36.627159', '101.786462');
INSERT INTO `t_sys_division_coordinate` VALUES ('3025', '西宁市', '630100', '630000', '36.623385', '101.78445');
INSERT INTO `t_sys_division_coordinate` VALUES ('3026', '城东区', '630102', '630100', '36.605708', '101.809569');
INSERT INTO `t_sys_division_coordinate` VALUES ('3027', '城中区', '630103', '630100', '36.6288', '101.790484');
INSERT INTO `t_sys_division_coordinate` VALUES ('3028', '城西区', '630104', '630100', '36.634497', '101.772414');
INSERT INTO `t_sys_division_coordinate` VALUES ('3029', '城北区', '630105', '630100', '36.656294', '101.772405');
INSERT INTO `t_sys_division_coordinate` VALUES ('3030', '大通回族土族自治县', '630121', '630100', '36.932666', '101.692564');
INSERT INTO `t_sys_division_coordinate` VALUES ('3031', '湟中县', '630122', '630100', '36.506628', '101.578617');
INSERT INTO `t_sys_division_coordinate` VALUES ('3032', '湟源县', '630123', '630100', '36.688588', '101.262449');
INSERT INTO `t_sys_division_coordinate` VALUES ('3033', '海东市', '630200', '630000', '36.508511', '102.110444');
INSERT INTO `t_sys_division_coordinate` VALUES ('3034', '乐都区', '630202', '630200', '36.48782', '102.408566');
INSERT INTO `t_sys_division_coordinate` VALUES ('3035', '平安区', '630203', '630200', '36.506554', '102.114428');
INSERT INTO `t_sys_division_coordinate` VALUES ('3036', '民和回族土族自治县', '630222', '630200', '36.325561', '102.83639');
INSERT INTO `t_sys_division_coordinate` VALUES ('3037', '互助土族自治县', '630223', '630200', '36.850022', '101.964569');
INSERT INTO `t_sys_division_coordinate` VALUES ('3038', '化隆回族自治县', '630224', '630200', '36.100988', '102.270448');
INSERT INTO `t_sys_division_coordinate` VALUES ('3039', '循化撒拉族自治县', '630225', '630200', '35.856667', '102.495385');
INSERT INTO `t_sys_division_coordinate` VALUES ('3040', '海北藏族自治州', '632200', '630000', '36.960663', '100.907434');
INSERT INTO `t_sys_division_coordinate` VALUES ('3041', '门源回族自治县', '632221', '632200', '37.382181', '101.628438');
INSERT INTO `t_sys_division_coordinate` VALUES ('3042', '祁连县', '632222', '632200', '38.182925', '100.259622');
INSERT INTO `t_sys_division_coordinate` VALUES ('3043', '海晏县', '632223', '632200', '36.902376', '101.000586');
INSERT INTO `t_sys_division_coordinate` VALUES ('3044', '刚察县', '632224', '632200', '37.32732', '100.153606');
INSERT INTO `t_sys_division_coordinate` VALUES ('3045', '黄南藏族自治州', '632300', '630000', '35.525805', '102.022428');
INSERT INTO `t_sys_division_coordinate` VALUES ('3046', '同仁县', '632321', '632300', '35.521865', '102.025438');
INSERT INTO `t_sys_division_coordinate` VALUES ('3047', '尖扎县', '632322', '632300', '35.944284', '102.037507');
INSERT INTO `t_sys_division_coordinate` VALUES ('3048', '泽库县', '632323', '632300', '35.042014', '101.473595');
INSERT INTO `t_sys_division_coordinate` VALUES ('3049', '河南蒙古族自治县', '632324', '632300', '34.740396', '101.622473');
INSERT INTO `t_sys_division_coordinate` VALUES ('3050', '海南藏族自治州', '632500', '630000', '36.292102', '100.626621');
INSERT INTO `t_sys_division_coordinate` VALUES ('3051', '共和县', '632521', '632500', '36.288703', '100.626623');
INSERT INTO `t_sys_division_coordinate` VALUES ('3052', '同德县', '632522', '632500', '35.259858', '100.585424');
INSERT INTO `t_sys_division_coordinate` VALUES ('3053', '贵德县', '632523', '632500', '36.046158', '101.439533');
INSERT INTO `t_sys_division_coordinate` VALUES ('3054', '兴海县', '632524', '632500', '35.59463', '99.99438');
INSERT INTO `t_sys_division_coordinate` VALUES ('3055', '贵南县', '632525', '632500', '35.592415', '100.753593');
INSERT INTO `t_sys_division_coordinate` VALUES ('3056', '果洛藏族自治州', '632600', '630000', '34.477194', '100.251592');
INSERT INTO `t_sys_division_coordinate` VALUES ('3057', '玛沁县', '632621', '632600', '34.483569', '100.245564');
INSERT INTO `t_sys_division_coordinate` VALUES ('3058', '班玛县', '632622', '632600', '32.938504', '100.743605');
INSERT INTO `t_sys_division_coordinate` VALUES ('3059', '甘德县', '632623', '632600', '33.975004', '99.907511');
INSERT INTO `t_sys_division_coordinate` VALUES ('3060', '达日县', '632624', '632600', '33.754937', '99.65801');
INSERT INTO `t_sys_division_coordinate` VALUES ('3061', '久治县', '632625', '632600', '33.434773', '101.488532');
INSERT INTO `t_sys_division_coordinate` VALUES ('3062', '玛多县', '632626', '632600', '34.920749', '98.215884');
INSERT INTO `t_sys_division_coordinate` VALUES ('3063', '玉树藏族自治州', '632700', '630000', '33.01098', '97.013181');
INSERT INTO `t_sys_division_coordinate` VALUES ('3064', '玉树市', '632701', '632700', '32.999556', '97.015376');
INSERT INTO `t_sys_division_coordinate` VALUES ('3065', '杂多县', '632722', '632700', '32.899241', '95.306965');
INSERT INTO `t_sys_division_coordinate` VALUES ('3066', '称多县', '632723', '632700', '33.374226', '97.115');
INSERT INTO `t_sys_division_coordinate` VALUES ('3067', '治多县', '632724', '632700', '33.857953', '95.619794');
INSERT INTO `t_sys_division_coordinate` VALUES ('3068', '囊谦县', '632725', '632700', '32.209194', '96.486918');
INSERT INTO `t_sys_division_coordinate` VALUES ('3069', '曲麻莱县', '632726', '632700', '34.132299', '95.80375');
INSERT INTO `t_sys_division_coordinate` VALUES ('3070', '海西蒙古族藏族自治州', '632800', '630000', '37.38275', '97.376299');
INSERT INTO `t_sys_division_coordinate` VALUES ('3071', '格尔木市', '632801', '632800', '36.412371', '94.93331');
INSERT INTO `t_sys_division_coordinate` VALUES ('3072', '德令哈市', '632802', '632800', '37.375346', '97.36747');
INSERT INTO `t_sys_division_coordinate` VALUES ('3073', '乌兰县', '632821', '632800', '36.935748', '98.486736');
INSERT INTO `t_sys_division_coordinate` VALUES ('3074', '都兰县', '632822', '632800', '36.307611', '98.102705');
INSERT INTO `t_sys_division_coordinate` VALUES ('3075', '天峻县', '632823', '632800', '37.306903', '99.029243');
INSERT INTO `t_sys_division_coordinate` VALUES ('3076', '宁夏回族自治区', '640000', '0', '38.476878', '106.265605');
INSERT INTO `t_sys_division_coordinate` VALUES ('3077', '银川市', '640100', '640000', '38.49246', '106.238494');
INSERT INTO `t_sys_division_coordinate` VALUES ('3078', '兴庆区', '640104', '640100', '38.479579', '106.295494');
INSERT INTO `t_sys_division_coordinate` VALUES ('3079', '西夏区', '640105', '640100', '38.496817', '106.156581');
INSERT INTO `t_sys_division_coordinate` VALUES ('3080', '金凤区', '640106', '640100', '38.478695', '106.249561');
INSERT INTO `t_sys_division_coordinate` VALUES ('3081', '永宁县', '640121', '640100', '38.283001', '106.259605');
INSERT INTO `t_sys_division_coordinate` VALUES ('3082', '贺兰县', '640122', '640100', '38.560407', '106.356518');
INSERT INTO `t_sys_division_coordinate` VALUES ('3083', '灵武市', '640181', '640100', '38.108659', '106.34644');
INSERT INTO `t_sys_division_coordinate` VALUES ('3084', '石嘴山市', '640200', '640000', '38.989683', '106.3906');
INSERT INTO `t_sys_division_coordinate` VALUES ('3085', '大武口区', '640202', '640200', '39.024848', '106.37461');
INSERT INTO `t_sys_division_coordinate` VALUES ('3086', '惠农区', '640205', '640200', '39.245388', '106.78843');
INSERT INTO `t_sys_division_coordinate` VALUES ('3087', '平罗县', '640221', '640200', '38.919607', '106.536518');
INSERT INTO `t_sys_division_coordinate` VALUES ('3088', '吴忠市', '640300', '640000', '38.003713', '106.205371');
INSERT INTO `t_sys_division_coordinate` VALUES ('3089', '利通区', '640302', '640300', '37.990746', '106.219407');
INSERT INTO `t_sys_division_coordinate` VALUES ('3090', '红寺堡区', '640303', '640300', '37.431882', '106.068421');
INSERT INTO `t_sys_division_coordinate` VALUES ('3091', '盐池县', '640323', '640300', '37.789296', '107.41338');
INSERT INTO `t_sys_division_coordinate` VALUES ('3092', '同心县', '640324', '640300', '36.98627', '105.920599');
INSERT INTO `t_sys_division_coordinate` VALUES ('3093', '青铜峡市', '640381', '640300', '38.027412', '106.08537');
INSERT INTO `t_sys_division_coordinate` VALUES ('3094', '固原市', '640400', '640000', '36.021617', '106.248577');
INSERT INTO `t_sys_division_coordinate` VALUES ('3095', '原州区', '640402', '640400', '36.009368', '106.294515');
INSERT INTO `t_sys_division_coordinate` VALUES ('3096', '西吉县', '640422', '640400', '35.970076', '105.735386');
INSERT INTO `t_sys_division_coordinate` VALUES ('3097', '隆德县', '640423', '640400', '35.631762', '106.118498');
INSERT INTO `t_sys_division_coordinate` VALUES ('3098', '泾源县', '640424', '640400', '35.504362', '106.337393');
INSERT INTO `t_sys_division_coordinate` VALUES ('3099', '彭阳县', '640425', '640400', '35.855405', '106.644544');
INSERT INTO `t_sys_division_coordinate` VALUES ('3100', '中卫市', '640500', '640000', '37.505701', '105.203571');
INSERT INTO `t_sys_division_coordinate` VALUES ('3101', '沙坡头区', '640502', '640500', '37.505701', '105.203571');
INSERT INTO `t_sys_division_coordinate` VALUES ('3102', '中宁县', '640521', '640500', '37.497421', '105.691537');
INSERT INTO `t_sys_division_coordinate` VALUES ('3103', '海原县', '640522', '640500', '36.570781', '105.650555');
INSERT INTO `t_sys_division_coordinate` VALUES ('3104', '新疆维吾尔自治区', '650000', '0', '43.799238', '87.633473');
INSERT INTO `t_sys_division_coordinate` VALUES ('3105', '乌鲁木齐市', '650100', '650000', '43.830763', '87.62444');
INSERT INTO `t_sys_division_coordinate` VALUES ('3106', '天山区', '650102', '650100', '43.800271', '87.638408');
INSERT INTO `t_sys_division_coordinate` VALUES ('3107', '沙依巴克区', '650103', '650100', '43.807262', '87.60467');
INSERT INTO `t_sys_division_coordinate` VALUES ('3108', '新市区', '650104', '650100', '43.861394', '87.575908');
INSERT INTO `t_sys_division_coordinate` VALUES ('3109', '水磨沟区', '650105', '650100', '43.861394', '87.575908');
INSERT INTO `t_sys_division_coordinate` VALUES ('3110', '头屯河区', '650106', '650100', '43.882653', '87.434507');
INSERT INTO `t_sys_division_coordinate` VALUES ('3111', '达坂城区', '650107', '650100', '43.369943', '88.317398');
INSERT INTO `t_sys_division_coordinate` VALUES ('3112', '米东区', '650109', '650100', '43.979247', '87.662134');
INSERT INTO `t_sys_division_coordinate` VALUES ('3113', '乌鲁木齐县', '650121', '650100', '43.477086', '87.416029');
INSERT INTO `t_sys_division_coordinate` VALUES ('3114', '克拉玛依市', '650200', '650000', '45.585675', '84.895901');
INSERT INTO `t_sys_division_coordinate` VALUES ('3115', '独山子区', '650202', '650200', '44.334407', '84.893613');
INSERT INTO `t_sys_division_coordinate` VALUES ('3116', '克拉玛依区', '650203', '650200', '45.596624', '84.866222');
INSERT INTO `t_sys_division_coordinate` VALUES ('3117', '白碱滩区', '650204', '650200', '45.693952', '85.13951');
INSERT INTO `t_sys_division_coordinate` VALUES ('3118', '乌尔禾区', '650205', '650200', '46.095295', '85.700305');
INSERT INTO `t_sys_division_coordinate` VALUES ('3119', '吐鲁番市', '650400', '650000', '42.948549', '89.192459');
INSERT INTO `t_sys_division_coordinate` VALUES ('3120', '高昌区', '650402', '650400', '42.948549', '89.192459');
INSERT INTO `t_sys_division_coordinate` VALUES ('3121', '鄯善县', '650421', '650400', '42.874759', '90.220094');
INSERT INTO `t_sys_division_coordinate` VALUES ('3122', '托克逊县', '650422', '650400', '42.798546', '88.660164');
INSERT INTO `t_sys_division_coordinate` VALUES ('3123', '哈密市', '650500', '650000', '42.832856', '93.521308');
INSERT INTO `t_sys_division_coordinate` VALUES ('3124', '伊州区', '650502', '650500', '42.825878', '93.519883');
INSERT INTO `t_sys_division_coordinate` VALUES ('3125', '巴里坤哈萨克自治县', '650521', '650500', '43.605689', '93.022931');
INSERT INTO `t_sys_division_coordinate` VALUES ('3126', '伊吾县', '650522', '650500', '43.260677', '94.703826');
INSERT INTO `t_sys_division_coordinate` VALUES ('3127', '昌吉回族自治州', '652300', '650000', '44.016854', '87.315002');
INSERT INTO `t_sys_division_coordinate` VALUES ('3128', '昌吉市', '652301', '652300', '44.020127', '87.273865');
INSERT INTO `t_sys_division_coordinate` VALUES ('3129', '阜康市', '652302', '652300', '44.020127', '87.273865');
INSERT INTO `t_sys_division_coordinate` VALUES ('3130', '呼图壁县', '652323', '652300', '44.197655', '86.905144');
INSERT INTO `t_sys_division_coordinate` VALUES ('3131', '玛纳斯县', '652324', '652300', '44.310063', '86.220643');
INSERT INTO `t_sys_division_coordinate` VALUES ('3132', '奇台县', '652325', '652300', '44.026898', '89.601081');
INSERT INTO `t_sys_division_coordinate` VALUES ('3133', '吉木萨尔县', '652327', '652300', '44.005718', '89.187123');
INSERT INTO `t_sys_division_coordinate` VALUES ('3134', '木垒哈萨克自治县', '652328', '652300', '43.840308', '90.292515');
INSERT INTO `t_sys_division_coordinate` VALUES ('3135', '博尔塔拉蒙古自治州', '652700', '650000', '44.912196', '82.072915');
INSERT INTO `t_sys_division_coordinate` VALUES ('3136', '博乐市', '652701', '652700', '44.86001', '82.057972');
INSERT INTO `t_sys_division_coordinate` VALUES ('3137', '阿拉山口市', '652702', '652700', '44.86001', '82.057972');
INSERT INTO `t_sys_division_coordinate` VALUES ('3138', '精河县', '652722', '652700', '44.606646', '82.900655');
INSERT INTO `t_sys_division_coordinate` VALUES ('3139', '温泉县', '652723', '652700', '44.974857', '81.031146');
INSERT INTO `t_sys_division_coordinate` VALUES ('3140', '巴音郭楞蒙古自治州', '652800', '650000', '41.770287', '86.151714');
INSERT INTO `t_sys_division_coordinate` VALUES ('3141', '库尔勒市', '652801', '652800', '41.732373', '86.181494');
INSERT INTO `t_sys_division_coordinate` VALUES ('3142', '轮台县', '652822', '652800', '41.732373', '86.181494');
INSERT INTO `t_sys_division_coordinate` VALUES ('3143', '尉犁县', '652823', '652800', '41.350123', '86.266037');
INSERT INTO `t_sys_division_coordinate` VALUES ('3144', '若羌县', '652824', '652800', '39.028991', '88.175324');
INSERT INTO `t_sys_division_coordinate` VALUES ('3145', '且末县', '652825', '652800', '38.151388', '85.53599');
INSERT INTO `t_sys_division_coordinate` VALUES ('3146', '焉耆回族自治县', '652826', '652800', '42.064851', '86.581222');
INSERT INTO `t_sys_division_coordinate` VALUES ('3147', '和静县', '652827', '652800', '42.329365', '86.390398');
INSERT INTO `t_sys_division_coordinate` VALUES ('3148', '和硕县', '652828', '652800', '42.288065', '86.883689');
INSERT INTO `t_sys_division_coordinate` VALUES ('3149', '博湖县', '652829', '652800', '41.98643', '86.638469');
INSERT INTO `t_sys_division_coordinate` VALUES ('3150', '阿克苏地区', '652900', '650000', '41.17503', '80.266943');
INSERT INTO `t_sys_division_coordinate` VALUES ('3151', '阿克苏市', '652901', '652900', '41.17386', '80.269927');
INSERT INTO `t_sys_division_coordinate` VALUES ('3152', '温宿县', '652922', '652900', '41.282567', '80.245564');
INSERT INTO `t_sys_division_coordinate` VALUES ('3153', '库车县', '652923', '652900', '41.723448', '82.968459');
INSERT INTO `t_sys_division_coordinate` VALUES ('3154', '沙雅县', '652924', '652900', '41.227749', '82.788824');
INSERT INTO `t_sys_division_coordinate` VALUES ('3155', '新和县', '652925', '652900', '41.554', '82.615823');
INSERT INTO `t_sys_division_coordinate` VALUES ('3156', '拜城县', '652926', '652900', '41.800707', '81.858516');
INSERT INTO `t_sys_division_coordinate` VALUES ('3157', '乌什县', '652927', '652900', '41.220871', '79.230869');
INSERT INTO `t_sys_division_coordinate` VALUES ('3158', '阿瓦提县', '652928', '652900', '40.649359', '80.381849');
INSERT INTO `t_sys_division_coordinate` VALUES ('3159', '柯坪县', '652929', '652900', '40.514055', '79.053214');
INSERT INTO `t_sys_division_coordinate` VALUES ('3160', '克孜勒苏柯尔克孜自治州', '653000', '650000', '39.720471', '76.174309');
INSERT INTO `t_sys_division_coordinate` VALUES ('3161', '阿图什市', '653001', '653000', '39.722079', '76.174906');
INSERT INTO `t_sys_division_coordinate` VALUES ('3162', '阿克陶县', '653022', '653000', '39.153889', '75.953725');
INSERT INTO `t_sys_division_coordinate` VALUES ('3163', '阿合奇县', '653023', '653000', '39.153889', '75.953725');
INSERT INTO `t_sys_division_coordinate` VALUES ('3164', '乌恰县', '653024', '653000', '39.725124', '75.265334');
INSERT INTO `t_sys_division_coordinate` VALUES ('3165', '喀什地区', '653100', '650000', '39.476097', '75.996391');
INSERT INTO `t_sys_division_coordinate` VALUES ('3166', '喀什市', '653101', '653100', '39.47365', '76.000313');
INSERT INTO `t_sys_division_coordinate` VALUES ('3167', '疏附县', '653121', '653100', '39.381292', '75.869169');
INSERT INTO `t_sys_division_coordinate` VALUES ('3168', '疏勒县', '653122', '653100', '39.406709', '76.056614');
INSERT INTO `t_sys_division_coordinate` VALUES ('3169', '英吉沙县', '653123', '653100', '38.935671', '76.182075');
INSERT INTO `t_sys_division_coordinate` VALUES ('3170', '泽普县', '653124', '653100', '38.190725', '77.266559');
INSERT INTO `t_sys_division_coordinate` VALUES ('3171', '莎车县', '653125', '653100', '38.420157', '77.252437');
INSERT INTO `t_sys_division_coordinate` VALUES ('3172', '叶城县', '653126', '653100', '37.889167', '77.420098');
INSERT INTO `t_sys_division_coordinate` VALUES ('3173', '麦盖提县', '653127', '653100', '38.911194', '77.658824');
INSERT INTO `t_sys_division_coordinate` VALUES ('3174', '岳普湖县', '653128', '653100', '39.239387', '76.784148');
INSERT INTO `t_sys_division_coordinate` VALUES ('3175', '伽师县', '653129', '653100', '39.493852', '76.730386');
INSERT INTO `t_sys_division_coordinate` VALUES ('3176', '巴楚县', '653130', '653100', '39.790788', '78.555701');
INSERT INTO `t_sys_division_coordinate` VALUES ('3177', '塔什库尔干塔吉克自治县', '653131', '653100', '37.779046', '75.230805');
INSERT INTO `t_sys_division_coordinate` VALUES ('3178', '和田地区', '653200', '650000', '37.120446', '79.928507');
INSERT INTO `t_sys_division_coordinate` VALUES ('3179', '和田市', '653201', '653200', '37.118336', '79.920212');
INSERT INTO `t_sys_division_coordinate` VALUES ('3180', '和田县', '653221', '653200', '37.090362', '79.866216');
INSERT INTO `t_sys_division_coordinate` VALUES ('3181', '墨玉县', '653222', '653200', '37.282993', '79.735479');
INSERT INTO `t_sys_division_coordinate` VALUES ('3182', '皮山县', '653223', '653200', '37.627249', '78.289871');
INSERT INTO `t_sys_division_coordinate` VALUES ('3183', '洛浦县', '653224', '653200', '37.079611', '80.195388');
INSERT INTO `t_sys_division_coordinate` VALUES ('3184', '策勒县', '653225', '653200', '37.004122', '80.813201');
INSERT INTO `t_sys_division_coordinate` VALUES ('3185', '于田县', '653226', '653200', '36.862954', '81.683783');
INSERT INTO `t_sys_division_coordinate` VALUES ('3186', '民丰县', '653227', '653200', '37.070257', '82.702713');
INSERT INTO `t_sys_division_coordinate` VALUES ('3187', '伊犁哈萨克自治州', '654000', '650000', '43.922723', '81.330538');
INSERT INTO `t_sys_division_coordinate` VALUES ('3188', '伊宁市', '654002', '654000', '43.915299', '81.284242');
INSERT INTO `t_sys_division_coordinate` VALUES ('3189', '奎屯市', '654003', '654000', '44.432057', '84.909449');
INSERT INTO `t_sys_division_coordinate` VALUES ('3190', '霍尔果斯市', '654004', '654000', '44.06225', '80.885281');
INSERT INTO `t_sys_division_coordinate` VALUES ('3191', '伊宁县', '654021', '654000', '43.982909', '81.533906');
INSERT INTO `t_sys_division_coordinate` VALUES ('3192', '察布查尔锡伯自治县', '654022', '654000', '43.84669', '81.157925');
INSERT INTO `t_sys_division_coordinate` VALUES ('3193', '霍城县', '654023', '654000', '44.06225', '80.885281');
INSERT INTO `t_sys_division_coordinate` VALUES ('3194', '巩留县', '654024', '654000', '44.06225', '80.885281');
INSERT INTO `t_sys_division_coordinate` VALUES ('3195', '新源县', '654025', '654000', '43.435927', '83.267022');
INSERT INTO `t_sys_division_coordinate` VALUES ('3196', '昭苏县', '654026', '654000', '43.163497', '81.137378');
INSERT INTO `t_sys_division_coordinate` VALUES ('3197', '特克斯县', '654027', '654000', '43.224248', '81.842587');
INSERT INTO `t_sys_division_coordinate` VALUES ('3198', '尼勒克县', '654028', '654000', '43.804595', '82.518007');
INSERT INTO `t_sys_division_coordinate` VALUES ('3199', '塔城地区', '654200', '650000', '46.750948', '82.987236');
INSERT INTO `t_sys_division_coordinate` VALUES ('3200', '塔城市', '654201', '654200', '46.754347', '82.985532');
INSERT INTO `t_sys_division_coordinate` VALUES ('3201', '乌苏市', '654202', '654200', '44.424048', '84.720088');
INSERT INTO `t_sys_division_coordinate` VALUES ('3202', '额敏县', '654221', '654200', '46.531885', '83.633374');
INSERT INTO `t_sys_division_coordinate` VALUES ('3203', '沙湾县', '654223', '654200', '44.331949', '85.626145');
INSERT INTO `t_sys_division_coordinate` VALUES ('3204', '托里县', '654224', '654200', '45.942743', '83.612909');
INSERT INTO `t_sys_division_coordinate` VALUES ('3205', '裕民县', '654225', '654200', '46.207454', '82.989439');
INSERT INTO `t_sys_division_coordinate` VALUES ('3206', '和布克赛尔蒙古自治县', '654226', '654200', '46.798685', '85.735009');
INSERT INTO `t_sys_division_coordinate` VALUES ('3207', '阿勒泰地区', '654300', '650000', '47.850728', '88.147926');
INSERT INTO `t_sys_division_coordinate` VALUES ('3208', '阿勒泰市', '654301', '654300', '47.832753', '88.139227');
INSERT INTO `t_sys_division_coordinate` VALUES ('3209', '布尔津县', '654321', '654300', '47.707952', '86.88136');
INSERT INTO `t_sys_division_coordinate` VALUES ('3210', '富蕴县', '654322', '654300', '46.999951', '89.531953');
INSERT INTO `t_sys_division_coordinate` VALUES ('3211', '福海县', '654323', '654300', '47.118141', '87.493157');
INSERT INTO `t_sys_division_coordinate` VALUES ('3212', '哈巴河县', '654324', '654300', '48.066149', '86.424818');
INSERT INTO `t_sys_division_coordinate` VALUES ('3213', '青河县', '654325', '654300', '46.680194', '90.389444');
INSERT INTO `t_sys_division_coordinate` VALUES ('3214', '吉木乃县', '654326', '654300', '47.449018', '85.880818');
INSERT INTO `t_sys_division_coordinate` VALUES ('3215', '石河子市', '659001', '650000', '44.311976', '86.086886');
INSERT INTO `t_sys_division_coordinate` VALUES ('3216', '阿拉尔市', '659002', '650000', '40.553264', '81.287354');
INSERT INTO `t_sys_division_coordinate` VALUES ('3217', '图木舒克市', '659003', '650000', '39.871209', '79.075616');
INSERT INTO `t_sys_division_coordinate` VALUES ('3218', '五家渠市', '659004', '650000', '44.172445', '87.549937');
INSERT INTO `t_sys_division_coordinate` VALUES ('3219', '铁门关市', '659006', '650000', '41.732373', '86.181494');
INSERT INTO `t_sys_division_coordinate` VALUES ('3220', '香港特别行政区', '810000', '0', '22.337784', '114.173825');
INSERT INTO `t_sys_division_coordinate` VALUES ('3221', '中西區', null, '810000', '22.291343', '114.159491');
INSERT INTO `t_sys_division_coordinate` VALUES ('3222', '灣仔區', null, '810000', '22.283159', '114.18355');
INSERT INTO `t_sys_division_coordinate` VALUES ('3223', '東區', null, '810000', '22.287684', '114.235426');
INSERT INTO `t_sys_division_coordinate` VALUES ('3224', '南區', null, '810000', '22.251947', '114.165543');
INSERT INTO `t_sys_division_coordinate` VALUES ('3225', '油尖旺區', null, '810000', '22.306584', '114.178545');
INSERT INTO `t_sys_division_coordinate` VALUES ('3226', '深水埗區', null, '810000', '22.345029', '114.181574');
INSERT INTO `t_sys_division_coordinate` VALUES ('3227', '九龍城區', null, '810000', '22.325723', '114.198554');
INSERT INTO `t_sys_division_coordinate` VALUES ('3228', '黃大仙區', null, '810000', '22.344517', '114.205553');
INSERT INTO `t_sys_division_coordinate` VALUES ('3229', '觀塘區', null, '810000', '22.316804', '114.237431');
INSERT INTO `t_sys_division_coordinate` VALUES ('3230', '荃灣區', null, '810000', '22.378244', '114.126441');
INSERT INTO `t_sys_division_coordinate` VALUES ('3231', '屯門區', null, '810000', '22.393585', '113.987456');
INSERT INTO `t_sys_division_coordinate` VALUES ('3232', '元朗區', null, '810000', '22.448565', '114.03851');
INSERT INTO `t_sys_division_coordinate` VALUES ('3233', '北區', null, '810000', '22.498024', '114.149484');
INSERT INTO `t_sys_division_coordinate` VALUES ('3234', '大埔區', null, '810000', '22.453814', '114.175565');
INSERT INTO `t_sys_division_coordinate` VALUES ('3235', '西貢區', null, '810000', '22.385077', '114.283525');
INSERT INTO `t_sys_division_coordinate` VALUES ('3236', '沙田區', null, '810000', '22.388522', '114.198551');
INSERT INTO `t_sys_division_coordinate` VALUES ('3237', '葵青區', null, '810000', '22.366619', '114.143475');
INSERT INTO `t_sys_division_coordinate` VALUES ('3238', '離島區', null, '810000', '22.286066', '113.951547');
INSERT INTO `t_sys_division_coordinate` VALUES ('3239', '澳门特别行政区', '820000', '0', '22.214787', '113.560161');
INSERT INTO `t_sys_division_coordinate` VALUES ('3240', '花地瑪堂區', null, '820000', '22.212784', '113.55751');
INSERT INTO `t_sys_division_coordinate` VALUES ('3241', '花王堂區', null, '820000', '22.202058', '113.550294');
INSERT INTO `t_sys_division_coordinate` VALUES ('3242', '望德堂區', null, '820000', '22.202511', '113.561514');
INSERT INTO `t_sys_division_coordinate` VALUES ('3243', '大堂區', null, '820000', '22.192801', '113.561167');
INSERT INTO `t_sys_division_coordinate` VALUES ('3244', '風順堂區', null, '820000', '22.192783', '113.545451');
INSERT INTO `t_sys_division_coordinate` VALUES ('3245', '嘉模堂區', null, '820000', '22.163142', '113.565515');
INSERT INTO `t_sys_division_coordinate` VALUES ('3246', '路氹填海區', null, '820000', '22.146272', '113.570544');
INSERT INTO `t_sys_division_coordinate` VALUES ('3247', '台湾省', '710000', '0', '41.732373', '86.181494');
INSERT INTO `t_sys_division_coordinate` VALUES ('3248', '台北市 ', null, '710000', '25.073653', '121.539414');
INSERT INTO `t_sys_division_coordinate` VALUES ('3249', '高雄市', null, '710000', '22.679904', '120.315994');
INSERT INTO `t_sys_division_coordinate` VALUES ('3250', '曾母暗沙', null, '0', '4.008237', '111.79862');

-- ----------------------------
-- Table structure for t_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file`;
CREATE TABLE `t_sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `business_id` int(11) DEFAULT NULL COMMENT '业务id',
  `addr` varchar(1000) DEFAULT NULL COMMENT '附件地址',
  `order_flag` int(11) DEFAULT NULL COMMENT '排序方式',
  `type` int(11) DEFAULT NULL COMMENT '业务类型',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_id,type,name` (`business_id`,`type`,`name`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  CONSTRAINT `t_sys_file_ibfk_1` FOREIGN KEY (`type`) REFERENCES `t_sys_dict` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of t_sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user_extend
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_extend`;
CREATE TABLE `t_sys_user_extend` (
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `company_id` varchar(32) DEFAULT NULL COMMENT '所属企业',
  `status` int(11) DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户拓展表';

-- ----------------------------
-- Records of t_sys_user_extend
-- ----------------------------
