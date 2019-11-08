SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lc_event
-- ----------------------------
DROP TABLE IF EXISTS `lc_event`;
CREATE TABLE `lc_event` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(40) DEFAULT NULL COMMENT '订单号',
  `bl_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '订舱号',
  `container_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '箱号',
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
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_id` int(11) DEFAULT NULL COMMENT '创建人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_id` int(11) DEFAULT NULL COMMENT '更新人',
  `is_active` bit(1) DEFAULT b'1' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `indx_bl_no` (`bl_no`) USING BTREE,
  KEY `idx_container_no` (`container_no`) COMMENT 'idx_container_no'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for lc_port_call
-- ----------------------------
DROP TABLE IF EXISTS `lc_port_call`;
CREATE TABLE `lc_port_call` (
  `port_call_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `created_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_id` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(32) DEFAULT '0' COMMENT '数据版本',
  PRIMARY KEY (`port_call_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for lc_subscribe_record
-- ----------------------------
DROP TABLE IF EXISTS `lc_subscribe_record`;
CREATE TABLE `lc_subscribe_record` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(40) DEFAULT NULL COMMENT '订单号',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(64) DEFAULT NULL COMMENT '订舱号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '船公司Id',
  `carrier_code` varchar(20) DEFAULT NULL COMMENT '承运人Code',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `delivery_date` datetime DEFAULT NULL COMMENT '开航日期',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `created_id` bigint(20) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `task_status` tinyint(4) DEFAULT NULL COMMENT '调度状态',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_orderId_bl_no` (`order_id`,`bl_no`) USING BTREE COMMENT 'idx_orderId_bl_no',
  KEY `idx_bl_no` (`bl_no`) USING BTREE COMMENT 'idx_bl_no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for lc_subscribe_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `lc_subscribe_record_detail`;
CREATE TABLE `lc_subscribe_record_detail` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(40) NOT NULL COMMENT '订单号',
  `biz_type` int(11) NOT NULL COMMENT '业务字段类型',
  `biz_no` varchar(500) DEFAULT NULL COMMENT '业务字段',
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `status` int(11) DEFAULT NULL COMMENT '状态 1可用 2冻结',
  `created_id` bigint(20) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `trace_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bl_no` (`biz_no`(191)) COMMENT 'idx_bl_no',
  KEY `idx_orderId_bl_no` (`order_id`) COMMENT 'idx_orderId_bl_no',
  KEY `idx_orderId_vessel` (`vessel`,`voyage`) COMMENT 'idx_orderId_vessel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lc_user_track_record
-- ----------------------------
DROP TABLE IF EXISTS `lc_user_track_record`;
CREATE TABLE `lc_user_track_record` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `track_num` varchar(100) DEFAULT NULL COMMENT '编号',
  `port_id` bigint(11) DEFAULT NULL COMMENT '港口',
  `port_code` varchar(50) DEFAULT NULL,
  `vessel` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `truck_no` varchar(50) DEFAULT NULL COMMENT '车牌号',
  `track_type` int(11) DEFAULT NULL COMMENT '查询类型：1.提单;2.箱号;3.船计划;4.拖车跟踪;5.船舶定位',
  `is_track` bit(1) DEFAULT NULL COMMENT '是否跟踪',
  `bp_id` bigint(11) DEFAULT NULL COMMENT '企业id',
  `user_id` bigint(11) NOT NULL COMMENT '登入用户账号',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `created_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_active` bit(1) DEFAULT NULL,
  `trace_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_track_num` (`track_num`(10)) USING BTREE,
  KEY `idx_user_id` (`user_id`,`is_active`,`track_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户物流跟踪记录表';

-- ----------------------------
-- Table structure for lc_vessel_track_leg
-- ----------------------------
DROP TABLE IF EXISTS `lc_vessel_track_leg`;
CREATE TABLE `lc_vessel_track_leg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `call_number_tracking` int(1) DEFAULT NULL COMMENT '港口停靠次数，来源tracking',
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
  `created_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `trace_id` varchar(100) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='船舶轨迹-航段';

-- ----------------------------
-- Table structure for lc_vessel_track_points
-- ----------------------------
DROP TABLE IF EXISTS `lc_vessel_track_points`;
CREATE TABLE `lc_vessel_track_points` (
  `point_id` int(11) NOT NULL AUTO_INCREMENT,
  `mmsi` varchar(50) NOT NULL COMMENT '船舶id',
  `ship_name` varchar(100) DEFAULT NULL COMMENT '船舶名字',
  `time` datetime NOT NULL COMMENT '时间',
  `lat` bigint(32) DEFAULT NULL COMMENT '经度',
  `lon` bigint(32) NOT NULL COMMENT '纬度',
  `course` int(11) NOT NULL COMMENT '航迹向',
  `speed` int(11) NOT NULL COMMENT '速度（毫米/秒）',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `is_active` bit(1) DEFAULT b'1' COMMENT '是否有效',
  `trace_id` varchar(32) DEFAULT NULL COMMENT 'traceId',
  PRIMARY KEY (`point_id`) USING BTREE,
  KEY `idx_leg_id` (`mmsi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='船舶轨迹-经纬度点';

-- ----------------------------
-- Table structure for portdata_container_info
-- ----------------------------
DROP TABLE IF EXISTS `portdata_container_info`;
CREATE TABLE `portdata_container_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voyage_source_id` varchar(100) DEFAULT NULL COMMENT '船期标识',
  `container_id` varchar(40) DEFAULT NULL COMMENT '箱标示',
  `bl_no` varchar(32) DEFAULT NULL COMMENT '提单号',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `vessel_name` varchar(100) DEFAULT NULL COMMENT '船名',
  `vessel_name_no_space` varchar(150) DEFAULT NULL COMMENT '船名去空格存储',
  `un_code` varchar(32) DEFAULT NULL COMMENT '联合国编号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人code',
  `transit_port_code` varchar(32) DEFAULT NULL COMMENT '经停港（五字码）',
  `transit_port_name` varchar(255) DEFAULT NULL COMMENT '经停港（中文名）',
  `container_no` varchar(32) DEFAULT NULL COMMENT '箱号',
  `seal_no` varchar(32) DEFAULT NULL COMMENT '封号',
  `truck_no` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `fcl_lcl` varchar(32) DEFAULT NULL COMMENT '整拼标志',
  `direct` varchar(5) DEFAULT NULL COMMENT '进出口标识',
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
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源供应商',
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_date` datetime COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_bl_no` (`bl_no`) USING BTREE,
  KEY `idx_container_no` (`container_no`) COMMENT 'idx_container_no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，最新箱信息';

-- ----------------------------
-- Table structure for portdata_event
-- ----------------------------
DROP TABLE IF EXISTS `portdata_event`;
CREATE TABLE `portdata_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bl_no` varchar(32) DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(100) DEFAULT NULL COMMENT '订舱号',
  `container_no` varchar(32) DEFAULT NULL COMMENT '箱号',
  `carrier_id` int(11) DEFAULT NULL,
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人code',
  `vessel` varchar(32) DEFAULT NULL COMMENT '船名',
  `vessel_no_space` varchar(150) DEFAULT NULL COMMENT '船名去空格存储',
  `vessel_imo` varchar(32) DEFAULT NULL COMMENT '船舶IMO',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `event_code` varchar(32) DEFAULT NULL COMMENT '事件code',
  `event_name` varchar(64) DEFAULT NULL COMMENT '事件名称',
  `event_sort` int(11) DEFAULT NULL COMMENT '事件顺序',
  `event_data` text COMMENT '事件基础数据，json格式',
  `source` varchar(32) DEFAULT NULL COMMENT '来源',
  `create_date` datetime COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效,1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_blNo_cNo` (`bl_no`,`container_no`) USING BTREE COMMENT '提单号，箱号，联合索引',
  KEY `idx_vesselNo` (`vessel_no_space`) USING BTREE COMMENT '无空格船名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，事件表';

-- ----------------------------
-- Table structure for portdata_ship_event
-- ----------------------------
DROP TABLE IF EXISTS `portdata_ship_event`;
CREATE TABLE `portdata_ship_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) DEFAULT NULL,
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人code',
  `vessel` varchar(150) DEFAULT NULL COMMENT '船名',
  `vessel_no_space` varchar(150) DEFAULT NULL COMMENT '船名去空格存储',
  `vessel_imo` varchar(32) DEFAULT NULL COMMENT '船舶IMO',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `event_code` varchar(32) DEFAULT NULL COMMENT '事件code',
  `event_name` varchar(64) DEFAULT NULL COMMENT '事件名称',
  `event_sort` int(11) DEFAULT NULL COMMENT '事件顺序',
  `event_data` text COMMENT '事件基础数据，json格式',
  `source` varchar(32) DEFAULT NULL COMMENT '来源',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效,1有效，0无效',
  PRIMARY KEY (`id`),
  KEY `idx_vesselno_voyage` (`vessel_no_space`,`voyage`) USING BTREE COMMENT '无空格船名',
  KEY `idx_vessel_voyage` (`vessel`,`voyage`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='港区数据船事件表';

-- ----------------------------
-- Table structure for portdata_shipping_schedule
-- ----------------------------
DROP TABLE IF EXISTS `portdata_shipping_schedule`;
CREATE TABLE `portdata_shipping_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  `status` int(11) DEFAULT NULL COMMENT '状态 1-正常 2-完结',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效,1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，船期表';

-- ----------------------------
-- Table structure for scheduled_task
-- ----------------------------
DROP TABLE IF EXISTS `scheduled_task`;
CREATE TABLE `scheduled_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '调度任务类型',
  `bl_no` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '提单号',
  `bk_no` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '订舱号',
  `container_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '箱号',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人id',
  `carrier_code` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '承运人code',
  `port_id` int(11) DEFAULT NULL COMMENT '港口id',
  `vessel` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '航次',
  `task_status` int(1) DEFAULT '1' COMMENT '任务调度响应状态，1：正常响应；2：请求参数非法；3：第三方请求无结果；4：请求http状态码异常；5:正常响应，没有tracking事件',
  `status` int(11) DEFAULT '1' COMMENT '状态,1有效，0完成',
  `source` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '来源',
  `delivery_date` datetime DEFAULT NULL COMMENT '开航日期',
  `pre_time` datetime DEFAULT NULL COMMENT '上一次时间',
  `next_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下一次时间',
  `create_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效,1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_bl_search` (`bl_no`,`port_id`,`carrier_id`) USING BTREE COMMENT '查询索引',
  KEY `idx_task` (`task_type`,`status`) USING BTREE COMMENT '调度任务类型查询索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for scheduled_task_log
-- ----------------------------
DROP TABLE IF EXISTS `scheduled_task_log`;
CREATE TABLE `scheduled_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  `created_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ship_full_call
-- ----------------------------
DROP TABLE IF EXISTS `ship_full_call`;
CREATE TABLE `ship_full_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imo` varchar(255) DEFAULT '' COMMENT 'imo',
  `mmsi` varchar(255) DEFAULT '' COMMENT 'mmsi',
  `call_sign` varchar(255) DEFAULT '' COMMENT 'call_sign',
  `flag` varchar(255) DEFAULT NULL COMMENT 'flag',
  `ais_vessel_type` varchar(255) DEFAULT NULL COMMENT 'ais_vessel_type',
  `gross_tonnage` varchar(255) DEFAULT NULL COMMENT 'gross_tonnage',
  `dead_weight` varchar(255) DEFAULT NULL COMMENT 'dead_weight',
  `length_breadth` varchar(255) DEFAULT NULL COMMENT 'length_breadth',
  `year_built` varchar(255) DEFAULT NULL COMMENT '建造年份',
  `status` varchar(255) DEFAULT NULL COMMENT 'status',
  `name1` varchar(255) DEFAULT NULL COMMENT 'name1',
  `ship_name_no_space` varchar(50) DEFAULT NULL COMMENT '去空格船名',
  `vessel_type` varchar(255) DEFAULT NULL COMMENT 'vessel_type',
  `net_tonnage` varchar(255) DEFAULT NULL COMMENT 'net_tonnage',
  `light_ship` varchar(255) DEFAULT NULL COMMENT 'light_ship',
  `summer` varchar(255) DEFAULT NULL COMMENT 'summer',
  `grain` varchar(255) DEFAULT NULL COMMENT 'grain',
  `capacity_teu` varchar(255) DEFAULT NULL COMMENT '船 teu 量',
  `ballast` varchar(255) DEFAULT NULL COMMENT 'ballast',
  PRIMARY KEY (`id`),
  KEY `idx_name1` (`name1`) USING BTREE,
  KEY `idx_vessel_type` (`vessel_type`) USING BTREE,
  KEY `idx_name_no_space` (`ship_name_no_space`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for supplier_log
-- ----------------------------
DROP TABLE IF EXISTS `supplier_log`;
CREATE TABLE `supplier_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_id` int(11) DEFAULT NULL COMMENT '订阅记录表id',
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
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_md5` (`source`,`md5`) USING BTREE,
  KEY `idx_sub_id` (`sub_id`) USING BTREE COMMENT '调度任务id索引',
  KEY `idx_version_log_type` (`version`,`log_type`) USING BTREE,
  KEY `idx_bl_no` (`bl_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='渠道供应商原始日志';

-- ----------------------------
-- Table structure for tracking_container_event
-- ----------------------------
DROP TABLE IF EXISTS `tracking_container_event`;
CREATE TABLE `tracking_container_event` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `seal_no` varchar(100) DEFAULT NULL COMMENT '封号',
  `vessel_name` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `depart` varchar(2000) DEFAULT NULL COMMENT '出发港口,json格式港口',
  `load` varchar(2000) DEFAULT NULL COMMENT '装货港口,json格式港口',
  `discharge` varchar(2000) DEFAULT NULL COMMENT '卸货港口,json格式港口',
  `arrive` varchar(2000) DEFAULT NULL COMMENT '目的港口,json格式港口',
  `expected_time` datetime DEFAULT NULL COMMENT '预计到达时间',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人ID',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人Code',
  `event_code` varchar(32) DEFAULT NULL COMMENT '事件code',
  `event_sort` int(11) DEFAULT NULL COMMENT '事件顺序',
  `event_name` varchar(128) DEFAULT NULL COMMENT '事件名称',
  `event_date` datetime DEFAULT NULL COMMENT '事件实际时间',
  `event_expect_date` datetime DEFAULT NULL COMMENT '事件预期时间',
  `event_description` varchar(255) DEFAULT NULL COMMENT '事件描述',
  `event_vessel_name` varchar(100) DEFAULT NULL COMMENT '事件船名',
  `event_voyage` varchar(100) DEFAULT NULL COMMENT '事件航次',
  `transport_mode` varchar(100) DEFAULT NULL COMMENT '运输方式',
  `location_name` varchar(2000) DEFAULT NULL COMMENT 'json格式地点',
  `location_type` varchar(32) DEFAULT NULL COMMENT '地点类型',
  `version` varchar(100) DEFAULT NULL COMMENT '数据版本',
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求来源',
  `container_size` varchar(100) DEFAULT NULL COMMENT '箱大小',
  `container_type` varchar(100) DEFAULT NULL COMMENT '箱类型',
  `third_event_code` varchar(100) DEFAULT NULL COMMENT '供应商标准事件code',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源，spider,cargoSmart',
  `md5` varchar(100) DEFAULT NULL COMMENT '多个字段md5唯一标识一条事件',
  `created_id` int(11) DEFAULT NULL COMMENT '创建人',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_id` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_active` bit(1) DEFAULT b'1' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_cEvent` (`bl_no`,`container_no`,`event_name`) USING BTREE COMMENT '箱事件唯一索引',
  KEY `index_md5` (`md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='tracking箱事件';


-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
