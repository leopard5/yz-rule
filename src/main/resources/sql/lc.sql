/*
 Navicat Premium Data Transfer

 Source Server         : mac_Mysql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : lc

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 16/10/2019 09:56:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lc_container
-- ----------------------------
DROP TABLE IF EXISTS `lc_container`;
CREATE TABLE `lc_container` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `container_no` varchar(32) NOT NULL DEFAULT '' COMMENT '箱号',
  `bl_no` varchar(32) NOT NULL DEFAULT '' COMMENT '提单号',
  `voyage_source_id` varchar(100) DEFAULT NULL COMMENT '船期标识',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `vessel_name` varchar(100) DEFAULT NULL COMMENT '船名',
  `vessel_name_no_space` varchar(150) DEFAULT NULL COMMENT '船名去空格存储',
  `un_code` varchar(32) DEFAULT NULL COMMENT '联合国编号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人code',
  `transit_port_code` varchar(32) DEFAULT NULL COMMENT '经停港（五字码）',
  `transit_port_name` varchar(255) DEFAULT NULL COMMENT '经停港（中文名）',
  `seal_no` varchar(32) DEFAULT NULL COMMENT '铅封号',
  `truck_no` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `fcl_lcl` varchar(32) DEFAULT NULL COMMENT '整拼标志',
  `direct` varchar(16) DEFAULT NULL COMMENT '进出口标志(I=进口,E=出口)',
  `pieces` decimal(18,4) DEFAULT NULL COMMENT '货物件数',
  `weight` decimal(18,4) DEFAULT NULL COMMENT '重量',
  `volume` decimal(18,4) DEFAULT NULL COMMENT '体积',
  `vgm` decimal(18,4) DEFAULT NULL COMMENT '出口集装箱重量查核',
  `total_total_weight` decimal(18,4) DEFAULT NULL COMMENT '总重量',
  `tare_weight` decimal(18,4) DEFAULT NULL COMMENT '箱皮重',
  `container_size` varchar(32) DEFAULT NULL COMMENT '箱尺寸',
  `container_type` varchar(32) DEFAULT NULL COMMENT '类型 (GP,HQ,特种箱等)',
  `container_owner` varchar(10) DEFAULT NULL COMMENT '箱主',
  `container_status` varchar(50) DEFAULT NULL COMMENT '箱状态',
  `container_size_str` varchar(32) DEFAULT NULL COMMENT '尺寸',
  `container_high_cn` varchar(32) DEFAULT NULL COMMENT '中文箱高',
  `imo_class` varchar(32) DEFAULT NULL COMMENT '危险品等级',
  `enter_port_date` datetime DEFAULT NULL COMMENT '进场时间',
  `leave_port_date` datetime DEFAULT NULL COMMENT '出场时间',
  `customs_release_status` varchar(32) DEFAULT NULL COMMENT '海关放行状态',
  `customs_release_date` datetime DEFAULT NULL COMMENT '海放时间',
  `port_release_status` varchar(32) DEFAULT NULL COMMENT '码头放行状态',
  `port_release_date` datetime DEFAULT NULL COMMENT '码放时间',
  `distribution_ship_status` varchar(32) DEFAULT NULL COMMENT '配船状态',
  `loading_code` varchar(32) DEFAULT NULL COMMENT '装货港EDI',
  `dock` varchar(32) DEFAULT NULL COMMENT '码头',
  `container_position` varchar(32) DEFAULT NULL COMMENT '场箱位',
  `temperature` varchar(32) DEFAULT NULL COMMENT '冷藏箱温度',
  `over_limit` varchar(32) DEFAULT NULL COMMENT '超限',
  `over_limit_length` varchar(32) DEFAULT NULL COMMENT '超限长度',
  `discarge_code` varchar(32) DEFAULT NULL COMMENT '卸货港EDI',
  `depart_code` varchar(32) DEFAULT NULL COMMENT '目的港EDI',
  `customs_no` varchar(32) DEFAULT NULL COMMENT '报关单号',
  `carrier_operation` varchar(255) DEFAULT NULL COMMENT '船公司操作',
  `vgm_Date` datetime DEFAULT NULL COMMENT 'vgm报文发送时间',
  `arrival_file_date` datetime DEFAULT NULL COMMENT '运抵报文发送时间',
  `customs_file_date` datetime DEFAULT NULL COMMENT '海关报文发送时间',
  `pre_recorded_date` datetime DEFAULT NULL COMMENT '箱预录时间',
  `customs_release_result` varchar(100) DEFAULT NULL COMMENT '海放结果',
  `in_way` varchar(20) DEFAULT NULL COMMENT '进场方式',
  `out_way` varchar(20) DEFAULT NULL COMMENT '出场方式',
  `ewl_id` varchar(40) DEFAULT NULL COMMENT 'EWL_ID',
  `bk_no` varchar(100) DEFAULT NULL COMMENT '订舱号',
  `vgm_accept_date` datetime DEFAULT NULL COMMENT 'VGM接受时间',
  `vgm_method` varchar(100) DEFAULT NULL COMMENT 'VGM称重方法',
  `vgm_signature` varchar(100) DEFAULT NULL COMMENT 'VGM申报人签名',
  `vgm_sender_code` varchar(100) DEFAULT NULL COMMENT 'VGM发送方代码',
  `vgm_receiver_code` varchar(100) DEFAULT NULL COMMENT 'VGM接收方代码',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='箱信息表';

-- ----------------------------
-- Table structure for lc_container_event
-- ----------------------------
DROP TABLE IF EXISTS `lc_container_event`;
CREATE TABLE `lc_container_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `container_no` varchar(100) NOT NULL DEFAULT '' COMMENT '箱号',
  `bl_no` varchar(100) NOT NULL DEFAULT '' COMMENT '提单号',
  `bk_no` varchar(100) NOT NULL DEFAULT '' COMMENT '订舱号',
  `carrier_id` int(32) DEFAULT NULL COMMENT '船公司id',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '船公司Code',
  `vessel` varchar(32) DEFAULT NULL COMMENT '船名',
  `vessel_no_space` varchar(150) DEFAULT NULL COMMENT '船名无空格',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `event_place` int(11) DEFAULT NULL COMMENT '事件地点 1：起运港；2：中转港 3：目的港',
  `event_code` varchar(32) DEFAULT NULL COMMENT '事件code',
  `event_name` varchar(64) DEFAULT NULL COMMENT '事件名称',
  `event_sort` int(11) DEFAULT NULL COMMENT '事件顺序',
  `event_data` text COMMENT '事件基础数据，json格式',
  `location_name` varchar(150) DEFAULT NULL COMMENT '地点',
  `source` varchar(32) DEFAULT NULL COMMENT '来源',
  `send_status` int(11) NOT NULL DEFAULT '1',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='箱事件信息表';

-- ----------------------------
-- Table structure for lc_container_event_change_log
-- ----------------------------
DROP TABLE IF EXISTS `lc_container_event_change_log`;
CREATE TABLE `lc_container_event_change_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `container_no` varchar(64) NOT NULL DEFAULT '' COMMENT '箱号',
  `bl_no` varchar(64) NOT NULL DEFAULT '' COMMENT '提单号',
  `original_ content` json NOT NULL COMMENT '原始内容',
  `modified_ content` json NOT NULL COMMENT '修改后内容',
  `change_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='箱事件变更日志表';

-- ----------------------------
-- Table structure for lc_customs_declaration
-- ----------------------------
DROP TABLE IF EXISTS `lc_customs_declaration`;
CREATE TABLE `lc_customs_declaration` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `customs_no` varchar(32) NOT NULL DEFAULT '' COMMENT '报关单号',
  `container_no` varchar(32) NOT NULL DEFAULT '' COMMENT '箱号',
  `bl_no` varchar(32) NOT NULL COMMENT '提单号',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报关信息表';

-- ----------------------------
-- Table structure for lc_exception
-- ----------------------------
DROP TABLE IF EXISTS `lc_exception`;
CREATE TABLE `lc_exception` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bl_no` varchar(100) NOT NULL DEFAULT '' COMMENT '提单号',
  `container_no` varchar(100) NOT NULL DEFAULT '' COMMENT '箱号',
  `exception_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '异常等级（0.一般 1.严重）',
  `exception_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '异常类型（加锁/漏装/查验/改装/改配/退关 等等）',
  `location` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '地点（岗前服务/堆场/港区/海上/目的港）',
  `warning_rule` varchar(32) NOT NULL DEFAULT '' COMMENT '预警规则',
  `remedy_rule` varchar(128) NOT NULL DEFAULT '' COMMENT '补救规则（缴费，重新申报 等等）',
  `occurrence_time` timestamp NULL DEFAULT NULL COMMENT '发生时间',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流异常信息表';

-- ----------------------------
-- Table structure for lc_lading_bill
-- ----------------------------
DROP TABLE IF EXISTS `lc_lading_bill`;
CREATE TABLE `lc_lading_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bl_no` varchar(32) NOT NULL DEFAULT '' COMMENT '提单编号',
  `container_no` varchar(32) NOT NULL DEFAULT '' COMMENT '箱号',
  `customs_no` varchar(64) NOT NULL DEFAULT '' COMMENT '报关单号',
  `pieces` decimal(18,4) DEFAULT NULL COMMENT '货物件数',
  `weight` decimal(18,4) DEFAULT NULL COMMENT '重量',
  `volume` decimal(18,4) DEFAULT NULL COMMENT '体积',
  `total_weight` decimal(18,4) DEFAULT NULL COMMENT '总重量',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提单信息表';

-- ----------------------------
-- Table structure for lc_port_call
-- ----------------------------
DROP TABLE IF EXISTS `lc_port_call`;
CREATE TABLE `lc_port_call` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mmsi` varchar(50) NOT NULL COMMENT '船舶mmsi号',
  `ship_name` varchar(100) NOT NULL COMMENT '船舶名称',
  `port_name_cn` varchar(200) DEFAULT NULL COMMENT '港口中文名称',
  `port_name_en` varchar(200) NOT NULL COMMENT '港口英文名',
  `port_code` varchar(50) DEFAULT NULL COMMENT '港口代码',
  `country_cn` varchar(200) DEFAULT NULL COMMENT '国家中文名',
  `country_en` varchar(200) NOT NULL COMMENT '国家英文名',
  `country_code` varchar(10) DEFAULT NULL COMMENT '国家代码',
  `ata` datetime DEFAULT NULL COMMENT '到港时间',
  `atd` datetime DEFAULT NULL COMMENT '离岗时间',
  `stayinport` varchar(32) DEFAULT NULL COMMENT '滞留时间',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='挂靠港信息表';

-- ----------------------------
-- Table structure for lc_scheduled_task
-- ----------------------------
DROP TABLE IF EXISTS `lc_scheduled_task`;
CREATE TABLE `lc_scheduled_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `task_type` varchar(32) DEFAULT NULL COMMENT '调度任务类型',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(64) DEFAULT NULL COMMENT '订舱号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人code',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `task_status` int(1) DEFAULT '1' COMMENT '任务调度响应状态，1：正常响应；2：请求参数非法；3：第三方请求无结果；4：请求http状态码异常；5:正常响应，没有tracking事件',
  `status` int(11) DEFAULT '1' COMMENT '状态,1有效，0完成',
  `source` varchar(64) DEFAULT NULL COMMENT '来源',
  `delivery_date` datetime DEFAULT NULL COMMENT '开航日期',
  `pre_time` datetime DEFAULT NULL COMMENT '上一次时间',
  `next_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下一次时间',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度表';

-- ----------------------------
-- Table structure for lc_scheduled_task_log
-- ----------------------------
DROP TABLE IF EXISTS `lc_scheduled_task_log`;
CREATE TABLE `lc_scheduled_task_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `taskId` int(11) NOT NULL COMMENT '任务表id',
  `taskType` varchar(50) NOT NULL COMMENT '任务类型',
  `start_time` datetime NOT NULL COMMENT '任务开始时间',
  `end_time` datetime NOT NULL COMMENT '任务结束时间',
  `task_status` int(11) DEFAULT NULL COMMENT '任务状态0失败1成功',
  `task_data` mediumtext COMMENT '数据',
  `bl_no` varchar(50) DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(50) DEFAULT NULL COMMENT '订舱号',
  `container_no` varchar(50) DEFAULT NULL COMMENT '箱号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `carrier_code` varchar(50) DEFAULT NULL COMMENT '承运人编码',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel` varchar(50) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(50) DEFAULT NULL COMMENT '航次',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度日志表';

-- ----------------------------
-- Table structure for lc_shipping_schedule
-- ----------------------------
DROP TABLE IF EXISTS `lc_shipping_schedule`;
CREATE TABLE `lc_shipping_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel_en` varchar(32) DEFAULT NULL COMMENT '船英文名',
  `vessel_en_no_blank` varchar(100) DEFAULT NULL COMMENT '船名中文不去空格',
  `vessel_cn` varchar(32) DEFAULT NULL COMMENT '船中文名',
  `vessel_imo` varchar(32) DEFAULT '' COMMENT '船舶IMO',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `voyage_import` varchar(32) DEFAULT NULL COMMENT '进口航次',
  `voyage_export` varchar(32) DEFAULT NULL COMMENT '出口航次',
  `direction` varchar(32) DEFAULT NULL COMMENT '航向',
  `voyage_source_id` varchar(100) DEFAULT NULL COMMENT '船期数据唯一id',
  `transit_port_code` varchar(200) DEFAULT NULL COMMENT '经停港（五字码）',
  `transit_port_name` varchar(255) DEFAULT NULL COMMENT '经停港（中文名）',
  `pre_arrive` datetime DEFAULT NULL COMMENT '计划靠泊时间',
  `arrive` datetime DEFAULT NULL COMMENT '实际靠泊时间',
  `pre_departure` datetime DEFAULT NULL COMMENT '计划离泊时间',
  `departure` datetime DEFAULT NULL COMMENT '实际离泊时间',
  `eta` datetime DEFAULT NULL COMMENT '预计到港时间、预计到达时间',
  `etd` datetime DEFAULT NULL COMMENT '预计离港时间、预计离开时间',
  `ata` datetime DEFAULT NULL COMMENT '实际到港时间、实际到达时间',
  `atd` datetime DEFAULT NULL COMMENT '实际离港时间、实际出发时间、实际离开时间',
  `dock` varchar(32) DEFAULT NULL COMMENT '靠泊码头',
  `open_time` datetime DEFAULT NULL COMMENT '开港时间',
  `close_time` datetime DEFAULT NULL COMMENT '截港时间',
  `closing_time` datetime DEFAULT NULL COMMENT '截关时间',
  `port_close_date` datetime DEFAULT NULL COMMENT '码头截单时间',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人公司id',
  `carrier_code` varchar(64) DEFAULT NULL COMMENT '承运人公司代码',
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '船公司简称',
  `ship_company_code` varchar(20) DEFAULT NULL COMMENT '船公司代码',
  `ship_agent_code` varchar(20) DEFAULT NULL COMMENT '船公司代理代码',
  `ship_agent_name` varchar(20) DEFAULT NULL COMMENT '船公司代理简称',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='船计划表';

-- ----------------------------
-- Table structure for lc_shipping_tracking
-- ----------------------------
DROP TABLE IF EXISTS `lc_shipping_tracking`;
CREATE TABLE `lc_shipping_tracking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mmsi` varchar(50) NOT NULL COMMENT '船舶id',
  `ship_name` varchar(100) DEFAULT NULL COMMENT '船舶名字',
  `status_time` datetime NOT NULL COMMENT '时间',
  `lat` bigint(32) DEFAULT NULL COMMENT '经度',
  `lon` bigint(32) NOT NULL COMMENT '纬度',
  `course` int(11) NOT NULL COMMENT '航迹向',
  `speed` int(11) NOT NULL COMMENT '速度（毫米/秒）',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='船舶轨迹表';

-- ----------------------------
-- Table structure for lc_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `lc_subscribe`;
CREATE TABLE `lc_subscribe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(64) DEFAULT NULL COMMENT '订舱号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '船公司Id',
  `carrier_code` varchar(20) DEFAULT NULL COMMENT '承运人Code',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `delivery_date` datetime DEFAULT NULL COMMENT '开航日期',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `task_status` tinyint(4) DEFAULT NULL COMMENT '调度状态',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订阅记录表';

-- ----------------------------
-- Table structure for lc_subscribe_detail
-- ----------------------------
DROP TABLE IF EXISTS `lc_subscribe_detail`;
CREATE TABLE `lc_subscribe_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` bigint(40) NOT NULL COMMENT '订单号',
  `biz_type` int(11) NOT NULL COMMENT '业务字段类型',
  `biz_no` varchar(500) DEFAULT NULL COMMENT '业务字段',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `status` int(11) DEFAULT NULL COMMENT '状态 1可用 2冻结',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订阅记录明细表';

-- ----------------------------
-- Table structure for lc_supplier_container
-- ----------------------------
DROP TABLE IF EXISTS `lc_supplier_container`;
CREATE TABLE `lc_supplier_container` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商箱信息表';

-- ----------------------------
-- Table structure for lc_supplier_container_event
-- ----------------------------
DROP TABLE IF EXISTS `lc_supplier_container_event`;
CREATE TABLE `lc_supplier_container_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商箱事件信息表';

-- ----------------------------
-- Table structure for lc_supplier_data
-- ----------------------------
DROP TABLE IF EXISTS `lc_supplier_data`;
CREATE TABLE `lc_supplier_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `source` varchar(32) DEFAULT NULL COMMENT '来源供应商',
  `md5` varchar(64) DEFAULT NULL COMMENT '原始数据md5串',
  `version` varchar(64) DEFAULT NULL COMMENT '时间戳版本号',
  `log_type` varchar(32) DEFAULT NULL COMMENT '日志类型',
  `bl_no` varchar(100) DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(100) DEFAULT NULL COMMENT '订舱号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `port_code` varchar(32) DEFAULT NULL COMMENT '港口Code',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船英文名',
  `voyage` varchar(64) DEFAULT NULL COMMENT '航次',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人code',
  `log_data` longtext COMMENT '原始数据，json格式',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商原始数据表';

-- ----------------------------
-- Table structure for lc_supplier_shipping_schedule
-- ----------------------------
DROP TABLE IF EXISTS `lc_supplier_shipping_schedule`;
CREATE TABLE `lc_supplier_shipping_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商船计划信息表';

-- ----------------------------
-- Table structure for lc_supplier_shipping_schedule_event
-- ----------------------------
DROP TABLE IF EXISTS `lc_supplier_shipping_schedule_event`;
CREATE TABLE `lc_supplier_shipping_schedule_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商船计划事件信息表';

-- ----------------------------
-- Table structure for lc_supplier_voyage
-- ----------------------------
DROP TABLE IF EXISTS `lc_supplier_voyage`;
CREATE TABLE `lc_supplier_voyage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商航程信息表';

-- ----------------------------
-- Table structure for lc_trailer_tracking
-- ----------------------------
DROP TABLE IF EXISTS `lc_trailer_tracking`;
CREATE TABLE `lc_trailer_tracking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `truck_no` varchar(16) NOT NULL DEFAULT '' COMMENT '车牌号',
  `container_no` varchar(32) NOT NULL DEFAULT '' COMMENT '箱号',
  `bl_no` varchar(32) NOT NULL DEFAULT '' COMMENT '提单号',
  `driver` varchar(32) NOT NULL DEFAULT '' COMMENT '司机',
  `driver_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '司机电话',
  `station_no` varchar(32) DEFAULT NULL COMMENT '门点编码',
  `vendor_code` varchar(32) DEFAULT '' COMMENT '供应商编码',
  `vehicle_type` tinyint(4) DEFAULT NULL COMMENT '车辆类型 1.20qt 2.40qt',
  `tracking_no` varchar(32) DEFAULT NULL COMMENT ' 北斗或者GPS追踪ID',
  `estimated_cost` decimal(18,4) DEFAULT NULL COMMENT '预估成本',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='拖车轨迹表';

-- ----------------------------
-- Table structure for lc_voyage
-- ----------------------------
DROP TABLE IF EXISTS `lc_voyage`;
CREATE TABLE `lc_voyage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `leg_seq` int(4) DEFAULT NULL COMMENT '航程顺序',
  `bl_no` varchar(100) DEFAULT NULL COMMENT '提单号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(200) DEFAULT NULL COMMENT '航次',
  `mmsi` varchar(50) DEFAULT NULL COMMENT '船舶id',
  `lloyds_number` varchar(100) DEFAULT NULL COMMENT '船的标识,来源于cargoSmart tracking',
  `call_sign_tracking` varchar(32) DEFAULT NULL COMMENT '呼号，来源tracking',
  `vessel_nationality_tracking` varchar(64) DEFAULT NULL COMMENT '船舶国籍，来源tracking',
  `call_number_tracking` int(1) DEFAULT NULL COMMENT '港口停靠次数',
  `from_port` varchar(2000) DEFAULT NULL COMMENT '起始港(船达通），json格式标准port模型',
  `to_port` varchar(2000) DEFAULT NULL COMMENT '目的港，json格式标准port模型',
  `from_port_tracking` varchar(2000) DEFAULT NULL COMMENT '起始港tracking，json格式标准port模型',
  `to_port_tracking` varchar(2000) DEFAULT NULL COMMENT '目的港tracking，json格式标准port模型',
  `from_port_ata_tracking` datetime DEFAULT NULL COMMENT '此段航程起始港，到港时间,来源tracking',
  `to_port_ata_tracking` datetime DEFAULT NULL COMMENT '此段航程目的港，到港时间,来源tracking',
  `from_port_atd_tracking` datetime DEFAULT NULL COMMENT '此段航程起始港，离港时间,来源tracking',
  `to_port_atd_tracking` datetime DEFAULT NULL COMMENT '此段航程目的港，离港时间,来源tracking',
  `from_port_eta_tracking` datetime DEFAULT NULL COMMENT '此段航程起始港，预计到港时间,来源tracking',
  `to_port_eta_tracking` datetime DEFAULT NULL COMMENT '此段航程目的港，预计到港时间,来源tracking',
  `from_port_etd_tracking` datetime DEFAULT NULL COMMENT '此段航程起始港，预计离港时间,来源tracking',
  `to_port_etd_tracking` datetime DEFAULT NULL COMMENT '此段航程目的港，预计离港时间,来源tracking',
  `from_port_ata` datetime DEFAULT NULL COMMENT '此段航程起始港，到港时间',
  `to_port_ata` datetime DEFAULT NULL COMMENT '此段航程目的港，到港时间',
  `from_port_atd` datetime DEFAULT NULL COMMENT '此段航程起始港，离港时间',
  `to_port_atd` datetime DEFAULT NULL COMMENT '此段航程目的港，离港时间',
  `tracking_source` varchar(32) DEFAULT NULL COMMENT 'tracking数据来源，spider,cargoSmart',
  `status` int(11) DEFAULT NULL COMMENT '状态（1:未开始、2：进行中 3：已结束）',
  `op_port_call_status` int(11) DEFAULT '1' COMMENT '操作状态 1 可操作 2已完成',
  `op_points_status` int(11) DEFAULT NULL COMMENT '轨迹处理状态',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='航程信息表';

-- ----------------------------
-- Table structure for lc_yard
-- ----------------------------
DROP TABLE IF EXISTS `lc_yard`;
CREATE TABLE `lc_yard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `depot_no` varchar(32) NOT NULL DEFAULT '' COMMENT '堆场编码',
  `depot` varchar(32) DEFAULT NULL COMMENT '堆场名称',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_user` varchar(16) DEFAULT '' COMMENT '创建人',
  `updated_user` varchar(16) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '1.删除 0.未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='堆场信息表';

SET FOREIGN_KEY_CHECKS = 1;
