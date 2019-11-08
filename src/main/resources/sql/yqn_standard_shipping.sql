SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for container_tracking
-- ----------------------------
DROP TABLE IF EXISTS `container_tracking`;
CREATE TABLE `container_tracking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bl_no` varchar(32) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(32) DEFAULT NULL COMMENT '箱号',
  `status_code` varchar(32) DEFAULT NULL COMMENT '状态码',
  `business_date` datetime DEFAULT NULL COMMENT '业务处理时间',
  `carrier_id` bigint(20) DEFAULT NULL COMMENT '承运人Id',
  `carrier_code` varchar(255) DEFAULT NULL COMMENT '承运人code',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='箱子数据tracking表';

-- ----------------------------
-- Table structure for container_voyage
-- ----------------------------
DROP TABLE IF EXISTS `container_voyage`;
CREATE TABLE `container_voyage` (
  `cbv_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_no` varchar(32) DEFAULT NULL COMMENT '箱号',
  `seal_no` varchar(32) DEFAULT NULL COMMENT '封号',
  `bl_no` varchar(32) DEFAULT NULL COMMENT '提单号',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `vessel_id` int(11) DEFAULT NULL,
  `vessel_name` varchar(100) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人ID',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人Code',
  `pieces` decimal(18,4) DEFAULT NULL COMMENT '件',
  `weight` decimal(18,4) DEFAULT NULL COMMENT '毛重',
  `volume` decimal(18,4) DEFAULT NULL COMMENT '体积',
  `vgm` decimal(18,4) DEFAULT NULL COMMENT '空箱毛重 可能目前没有',
  `container_size` varchar(32) DEFAULT NULL COMMENT '尺寸',
  `container_type` varchar(32) DEFAULT NULL COMMENT '类型 (GP,HQ,特种箱等)',
  `enter_port_date` datetime DEFAULT NULL COMMENT '进场时间',
  `leave_port_date` datetime DEFAULT NULL COMMENT '出场时间',
  `customs_release_status` varchar(32) DEFAULT NULL COMMENT '海关放行状态',
  `customs_release_date` datetime DEFAULT NULL COMMENT '海放时间',
  `port_release_status` varchar(32) DEFAULT NULL COMMENT '码头放行状态',
  `port_release_date` datetime DEFAULT NULL COMMENT '码放时间',
  `distribution_ship_status` varchar(32) DEFAULT NULL COMMENT '配船状态',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `is_valid` bit(1) DEFAULT NULL COMMENT '是否有效',
  `request_id` varchar(100) DEFAULT NULL COMMENT '来源请求ID',
  `last_push` int(11) DEFAULT NULL,
  `loading_code` varchar(32) DEFAULT NULL COMMENT '装货港EDI',
  `container_position` varchar(32) DEFAULT NULL COMMENT '场箱位',
  `imo_class` varchar(32) DEFAULT NULL COMMENT '危险品等级',
  `fcl_lcl` varchar(32) DEFAULT NULL COMMENT '整拼标志',
  `temperature` varchar(32) DEFAULT NULL COMMENT '冷藏箱温度',
  `un_code` varchar(32) DEFAULT NULL COMMENT '联合国编号',
  `over_limit` varchar(32) DEFAULT NULL COMMENT '超限',
  `over_limit_length` varchar(32) DEFAULT NULL COMMENT '超限长度',
  `discarge_code` varchar(32) DEFAULT NULL COMMENT '卸货港EDI',
  `depart_code` varchar(32) DEFAULT NULL COMMENT '目的港EDI',
  `customs_no` varchar(32) DEFAULT NULL COMMENT '报关单号',
  `dock` varchar(32) DEFAULT NULL COMMENT '码头',
  `total_total_weight` decimal(18,4) DEFAULT NULL COMMENT '总重量',
  `hb_voyage_id` varchar(100) DEFAULT NULL COMMENT '船期标识',
  `carrier_operation` varchar(255) DEFAULT NULL COMMENT '船公司操作',
  `container_high_cn` varchar(32) DEFAULT NULL COMMENT '中文箱高',
  `container_size_str` varchar(32) DEFAULT NULL COMMENT '尺寸',
  PRIMARY KEY (`cbv_id`),
  UNIQUE KEY `ix_container_voyage` (`container_no`,`seal_no`,`bl_no`,`carrier_code`),
  KEY `container_voyage_hb_voyage_id_index` (`hb_voyage_id`),
  KEY `container_voyage_version_index` (`version`),
  KEY `container_voyage_bl_no_index` (`bl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1158147 DEFAULT CHARSET=utf8 COMMENT='箱-本航次信息';

-- ----------------------------
-- Table structure for container_voyage_port_info
-- ----------------------------
DROP TABLE IF EXISTS `container_voyage_port_info`;
CREATE TABLE `container_voyage_port_info` (
  `container_voyage_port_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '航次靠离港ID',
  `bl_no` varchar(100) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `seal_no` varchar(100) DEFAULT NULL COMMENT '封号',
  `port_id` int(11) DEFAULT NULL COMMENT '港口ID',
  `port_code` varchar(32) DEFAULT NULL COMMENT '港口Code',
  `vessel_en` varchar(32) DEFAULT NULL COMMENT '英文名',
  `vessel_cn` varchar(32) DEFAULT NULL COMMENT '中文名',
  `voyage` varchar(32) DEFAULT NULL COMMENT '航次',
  `voyage_import` varchar(32) DEFAULT NULL COMMENT '进口航次',
  `voyage_export` varchar(32) DEFAULT NULL COMMENT '出口航次',
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
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '船公司简称',
  `state` varchar(32) DEFAULT NULL COMMENT '结果状态',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  `status` int(11) DEFAULT NULL COMMENT '状态 1-正常 2-完结',
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `hb_voyage_id` varchar(100) DEFAULT NULL COMMENT '船期标识',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人ID',
  `carrier_code` varchar(64) DEFAULT NULL COMMENT '承运人公司代码',
  PRIMARY KEY (`container_voyage_port_id`),
  UNIQUE KEY `ix_container_voyage_port_info_uindex` (`hb_voyage_id`),
  KEY `container_voyage_port_info_hb_voyage_id_index` (`hb_voyage_id`),
  KEY `container_voyage_port_info_version_index` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=1563669 DEFAULT CHARSET=utf8mb4 COMMENT='航次靠离港信息 ';

-- ----------------------------
-- Table structure for hb_container_voyage_log
-- ----------------------------
DROP TABLE IF EXISTS `hb_container_voyage_log`;
CREATE TABLE `hb_container_voyage_log` (
  `hd_container_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '箱标识',
  `hd_voyage_id` varchar(100) DEFAULT NULL COMMENT '船期标识',
  `bl_no` varchar(100) DEFAULT NULL COMMENT '提单号',
  `dock` varchar(32) DEFAULT NULL COMMENT '码头',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '承运人ID',
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '船公司简称',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '船公司代码',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `container_size` varchar(32) DEFAULT NULL COMMENT '尺寸箱型',
  `container_high` varchar(32) DEFAULT NULL COMMENT '箱高度',
  `container_high_cn` varchar(32) DEFAULT NULL COMMENT '箱高度中文',
  `container_owner` varchar(32) DEFAULT NULL COMMENT '持箱人',
  `container_status` varchar(32) DEFAULT NULL COMMENT '箱状态',
  `vessel_en` varchar(100) DEFAULT NULL COMMENT '码头船名',
  `voyage` varchar(32) DEFAULT NULL COMMENT '码头航次',
  `ex_im_sign` varchar(32) DEFAULT NULL COMMENT '进出口标志',
  `seal_no` varchar(100) DEFAULT NULL COMMENT '铅封号',
  `discarge_code` varchar(32) DEFAULT NULL COMMENT '卸货港EDI',
  `depart_code` varchar(32) DEFAULT NULL COMMENT '目的港EDI',
  `temperature` varchar(32) DEFAULT NULL COMMENT '冷藏箱温度',
  `over_limit` varchar(32) DEFAULT NULL COMMENT '超限',
  `over_limit_length` varchar(32) DEFAULT NULL COMMENT '超限长度',
  `imo_class` varchar(32) DEFAULT NULL COMMENT '危险品等级',
  `un_code` varchar(32) DEFAULT NULL COMMENT '联合国编号',
  `tare_weight` decimal(18,4) DEFAULT NULL COMMENT '箱皮重',
  `total_container_weight` decimal(18,4) DEFAULT NULL COMMENT '箱总重',
  `total_total_weight` decimal(18,4) DEFAULT NULL COMMENT '总重量',
  `vgm` decimal(18,4) DEFAULT NULL COMMENT 'VGM船公司报文重量',
  `vgm_date` varchar(32) DEFAULT NULL COMMENT 'VGM报文时间',
  `enter_port_date` varchar(32) DEFAULT NULL COMMENT '进港时间',
  `arrival_file_date` varchar(32) DEFAULT NULL COMMENT '运抵报文发送时间',
  `port_release_status` varchar(32) DEFAULT NULL COMMENT '码头放行标志',
  `distribution_ship_status` varchar(32) DEFAULT NULL COMMENT '配载标志',
  `out_port_date` varchar(32) DEFAULT NULL COMMENT '出港时间',
  `pieces` decimal(18,4) DEFAULT NULL COMMENT '分件数',
  `weight` decimal(18,4) DEFAULT NULL COMMENT '分重量',
  `volume` decimal(18,4) DEFAULT NULL COMMENT '分体积',
  `total_pieces` decimal(18,4) DEFAULT NULL COMMENT '总件数',
  `total_volume` decimal(18,4) DEFAULT NULL COMMENT '总体积',
  `customs_file_date` varchar(32) DEFAULT NULL COMMENT '海关报文发送时间',
  `customs_no` varchar(32) DEFAULT NULL COMMENT '报关单号',
  `customs_release_sign` varchar(32) DEFAULT NULL COMMENT '海关放关标志',
  `container_position` varchar(32) DEFAULT NULL COMMENT '场箱位',
  `broken_sign` varchar(32) DEFAULT NULL COMMENT '坏污标志',
  `loading_code` varchar(32) DEFAULT NULL COMMENT '装货港EDI',
  `container_status_code` varchar(32) DEFAULT NULL COMMENT '箱状态代码',
  `customs_release` varchar(32) DEFAULT NULL COMMENT '海关放关',
  `customs_release_result` varchar(32) DEFAULT NULL COMMENT '海放结果',
  `in_way` varchar(32) DEFAULT NULL COMMENT '进场方式',
  `out_way` varchar(32) DEFAULT NULL COMMENT '出场方式',
  `fcl_lcl` varchar(32) DEFAULT NULL COMMENT '整拼标志',
  `cud` varchar(32) DEFAULT NULL COMMENT 'CUD',
  `file_name` varchar(32) DEFAULT NULL COMMENT 'FILENAME',
  `wel_id` varchar(32) DEFAULT NULL COMMENT 'EWL_ID',
  `operator` varchar(32) DEFAULT NULL COMMENT '操作者',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `carrier_operation` varchar(255) DEFAULT NULL COMMENT '船公司操作',
  `pre_recorded_date` varchar(32) DEFAULT NULL COMMENT '箱预录时间',
  `dock_code` varchar(32) DEFAULT NULL COMMENT '码头场站代码',
  `ciq_no` varchar(32) DEFAULT NULL COMMENT '报检单号',
  `car_no` varchar(32) DEFAULT NULL COMMENT '车牌号',
  `cargo_desc` varchar(255) DEFAULT NULL COMMENT '货物品名',
  `business_date` varchar(255) DEFAULT NULL COMMENT '业务处理时间',
  `is986` varchar(32) DEFAULT NULL COMMENT '是否过986',
  `sub_bl_no` varchar(100) DEFAULT NULL COMMENT '子提单号',
  PRIMARY KEY (`hd_container_id`),
  KEY `hb_container_voyage_log_bl_no_index` (`bl_no`),
  KEY `hb_container_voyage_log_version_index` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=3803145 DEFAULT CHARSET=utf8 COMMENT='海渤港口箱货数据 ';

-- ----------------------------
-- Table structure for hb_port_voyage_log
-- ----------------------------
DROP TABLE IF EXISTS `hb_port_voyage_log`;
CREATE TABLE `hb_port_voyage_log` (
  `port_voyage_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键\n',
  `hb_voyage_id` varchar(100) DEFAULT NULL COMMENT '船期标识',
  `vessel_en` varchar(100) DEFAULT NULL COMMENT '英文船名',
  `vessel_cn` varchar(100) DEFAULT NULL COMMENT '中文船名',
  `bl_no` varchar(100) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `seal_no` varchar(100) DEFAULT NULL COMMENT '封号',
  `import_voyage` varchar(32) DEFAULT NULL COMMENT '进口航次',
  `export_voyage` varchar(32) DEFAULT NULL COMMENT '出口航次',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '船公司代码',
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '船公司简称',
  `agency_code` varchar(32) DEFAULT NULL COMMENT '船代理代码',
  `agency_name` varchar(32) DEFAULT NULL COMMENT '船代理简称',
  `ship_state` varchar(32) DEFAULT NULL COMMENT '船期状态',
  `eta` varchar(32) DEFAULT NULL COMMENT 'ETA',
  `etd` varchar(32) DEFAULT NULL COMMENT 'ETD',
  `ata` varchar(32) DEFAULT NULL COMMENT 'ATA',
  `atd` varchar(32) DEFAULT NULL COMMENT 'ATD',
  `cuton` varchar(32) DEFAULT NULL COMMENT '出口进箱开始时间',
  `cutoff` varchar(32) DEFAULT NULL COMMENT '出口进箱截止时间',
  `pre_depart` varchar(32) DEFAULT NULL COMMENT '计划离泊时间',
  `depart` varchar(32) DEFAULT NULL COMMENT '实际离泊时间',
  `pre_arrive` varchar(32) DEFAULT NULL COMMENT '计划靠泊时间',
  `arrive` varchar(32) DEFAULT NULL COMMENT '实际靠泊时间',
  `dock` varchar(32) DEFAULT NULL COMMENT '靠泊码头',
  `voyage` varchar(32) DEFAULT NULL COMMENT '码头航次',
  `ports` varchar(512) DEFAULT NULL COMMENT '挂靠港',
  `ports_cn` varchar(512) DEFAULT NULL COMMENT '挂靠港中文名',
  `file_name` varchar(32) DEFAULT NULL COMMENT 'FILENAME',
  `cud` varchar(32) DEFAULT NULL COMMENT 'CUD',
  `ewl_id` varchar(32) DEFAULT NULL COMMENT 'EWL_ID',
  `operator` varchar(32) DEFAULT NULL COMMENT '操作者',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `pol_id` int(11) DEFAULT NULL COMMENT '起始港(随订阅参数传递过来)',
  `doc_close` datetime DEFAULT NULL,
  PRIMARY KEY (`port_voyage_id`),
  KEY `hb_port_voyage_log_hb_voyage_id_index` (`hb_voyage_id`),
  KEY `hb_port_voyage_log_version_index` (`version`),
  KEY `hb_port_voyage_log_pol_id_index` (`pol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1948312 DEFAULT CHARSET=utf8 COMMENT='海渤港口靠离泊数据 ';

-- ----------------------------
-- Table structure for lc_container
-- ----------------------------
DROP TABLE IF EXISTS `lc_container`;
CREATE TABLE `lc_container` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(40) DEFAULT NULL COMMENT '订单号',
  `bl_no` varchar(32) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(50) DEFAULT NULL COMMENT '箱号',
  `carrier_id` int(32) DEFAULT NULL COMMENT '船公司id',
  `carrier_code` varchar(30) DEFAULT NULL COMMENT '船公司Code',
  `car_num` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `car_track_id` bigint(40) DEFAULT NULL COMMENT '拖车轨迹',
  `created_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53170 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=555366 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=13455 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=60884 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=192818 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lc_track_passage
-- ----------------------------
DROP TABLE IF EXISTS `lc_track_passage`;
CREATE TABLE `lc_track_passage` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(40) DEFAULT NULL COMMENT '订单号',
  `transport_mode` int(11) DEFAULT NULL COMMENT '运输方式（1：拖车 2：船舶）',
  `vessel` varchar(50) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(50) DEFAULT NULL COMMENT '航次',
  `car_num` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `track_id` bigint(40) DEFAULT NULL COMMENT '轨迹id',
  `created_id` bigint(20) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4 COMMENT='用户物流跟踪记录表';

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
) ENGINE=InnoDB AUTO_INCREMENT=29894 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='船舶轨迹-航段';

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
) ENGINE=InnoDB AUTO_INCREMENT=11106476 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='船舶轨迹-经纬度点';

-- ----------------------------
-- Table structure for log_mq_message
-- ----------------------------
DROP TABLE IF EXISTS `log_mq_message`;
CREATE TABLE `log_mq_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `message` mediumtext COMMENT 'mq消息内容',
  `status` int(11) DEFAULT NULL COMMENT '0、待发送   1、已发送',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `log_mq_message_bl_no_index` (`bl_no`),
  KEY `log_mq_message_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10176977 DEFAULT CHARSET=utf8 COMMENT='mq消息发送日志';

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
) ENGINE=InnoDB AUTO_INCREMENT=92654 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，最新箱信息';

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
) ENGINE=InnoDB AUTO_INCREMENT=180384 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，事件表';

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
) ENGINE=InnoDB AUTO_INCREMENT=18175 DEFAULT CHARSET=utf8mb4 COMMENT='港区数据船事件表';

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
) ENGINE=InnoDB AUTO_INCREMENT=16609 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，船期表';

-- ----------------------------
-- Table structure for portdata_shipping_schedule_copy
-- ----------------------------
DROP TABLE IF EXISTS `portdata_shipping_schedule_copy`;
CREATE TABLE `portdata_shipping_schedule_copy` (
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
  `version` varchar(32) DEFAULT NULL COMMENT '数据版本',
  `source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  `status` int(11) DEFAULT NULL COMMENT '状态 1-正常 2-完结',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效,1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9724 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='港区数据，船期表';

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
) ENGINE=InnoDB AUTO_INCREMENT=126031 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=3733412 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=365446 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ship_not_mmsi
-- ----------------------------
DROP TABLE IF EXISTS `ship_not_mmsi`;
CREATE TABLE `ship_not_mmsi` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `ship_name` varchar(40) NOT NULL COMMENT '船名',
  `req_date` datetime DEFAULT NULL COMMENT '请求日期',
  `status` int(11) DEFAULT NULL COMMENT '状态 1可用',
  `created_id` bigint(20) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `trace_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ship_name` (`ship_name`)
) ENGINE=InnoDB AUTO_INCREMENT=66372 DEFAULT CHARSET=utf8mb4 COMMENT='无mmsi请求船达通历史表';

-- ----------------------------
-- Table structure for ship_tracking
-- ----------------------------
DROP TABLE IF EXISTS `ship_tracking`;
CREATE TABLE `ship_tracking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pol_id` int(20) DEFAULT NULL COMMENT '港口id',
  `vessel_en` varchar(255) DEFAULT NULL COMMENT '船名',
  `voyage_export` varchar(255) DEFAULT NULL COMMENT '出口航次',
  `status_code` varchar(255) DEFAULT NULL COMMENT '状态码',
  `business_date` datetime DEFAULT NULL COMMENT '业务处理时间',
  `create_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(255) DEFAULT NULL COMMENT '数据版本',
  `moves` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ship_tracking_log
-- ----------------------------
DROP TABLE IF EXISTS `ship_tracking_log`;
CREATE TABLE `ship_tracking_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vessel_en` varchar(255) DEFAULT NULL COMMENT '船名',
  `voyage_export` varchar(255) DEFAULT NULL COMMENT '出口航次',
  `status_code` varchar(255) DEFAULT NULL COMMENT '状态码',
  `business_date` datetime DEFAULT NULL COMMENT '业务处理时间',
  `create_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(255) DEFAULT NULL COMMENT '数据版本',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ssi_spu
-- ----------------------------
DROP TABLE IF EXISTS `ssi_spu`;
CREATE TABLE `ssi_spu` (
  `spu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SPU ID',
  `pol_id` int(11) NOT NULL COMMENT '出发港ID',
  `pod_id` int(11) NOT NULL COMMENT '目的港ID',
  `carrier_id` int(11) NOT NULL COMMENT '承运人ID',
  `pol_code` varchar(10) NOT NULL COMMENT '出发港Code',
  `pod_code` varchar(10) NOT NULL COMMENT '目的港Code',
  `carrier_code` varchar(50) NOT NULL COMMENT '承运人Code',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `is_valid` bit(1) DEFAULT NULL COMMENT '是否有效',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `is_verify` tinyint(1) DEFAULT '0',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`spu_id`) USING BTREE,
  UNIQUE KEY `idx_ssi_spu_pk` (`pol_id`,`pod_id`,`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1267431 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=1448443 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='渠道供应商原始日志';

-- ----------------------------
-- Table structure for tracking_bl_event_log
-- ----------------------------
DROP TABLE IF EXISTS `tracking_bl_event_log`;
CREATE TABLE `tracking_bl_event_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `vessel_name` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `depart` varchar(100) DEFAULT NULL COMMENT '出发港口',
  `load` varchar(100) DEFAULT NULL COMMENT '装货港口',
  `discharge` varchar(100) DEFAULT NULL COMMENT '卸货港口',
  `arrive` varchar(100) DEFAULT NULL COMMENT '目的港口',
  `expected_time` datetime DEFAULT NULL COMMENT '预计到达时间',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人ID',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人Code',
  `event_code` varchar(32) DEFAULT NULL COMMENT '事件code',
  `event_sort` int(11) DEFAULT NULL COMMENT '事件顺序',
  `event_name` varchar(128) DEFAULT NULL COMMENT '事件名称',
  `event_date` datetime DEFAULT NULL COMMENT '事件时间',
  `event_expect_date` datetime DEFAULT NULL COMMENT '事件预期时间',
  `event_description` varchar(255) DEFAULT NULL COMMENT '事件描述',
  `event_vessel_name` varchar(100) DEFAULT NULL COMMENT '事件船名',
  `event_voyage` varchar(100) DEFAULT NULL COMMENT '事件航次',
  `location_name` varchar(255) DEFAULT NULL COMMENT '位置名称',
  `transport_mode` varchar(100) DEFAULT NULL COMMENT '运输方式',
  `version` varchar(100) DEFAULT NULL COMMENT '数据版本',
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求来源',
  `created_id` int(11) DEFAULT NULL COMMENT '创建人',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_id` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `is_active` bit(1) DEFAULT b'1' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_bl_event` (`bl_no`,`event_name`) USING BTREE COMMENT '提单号、事件名称联合索引',
  KEY `index_version` (`version`) USING BTREE COMMENT '版本号'
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=19705282 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='tracking箱事件';

-- ----------------------------
-- Table structure for tracking_container_event_log
-- ----------------------------
DROP TABLE IF EXISTS `tracking_container_event_log`;
CREATE TABLE `tracking_container_event_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bl_no` varchar(64) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `seal_no` varchar(100) DEFAULT NULL COMMENT '封号',
  `vessel_name` varchar(100) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(100) DEFAULT NULL COMMENT '航次',
  `depart` varchar(100) DEFAULT NULL COMMENT '出发港口',
  `load` varchar(100) DEFAULT NULL COMMENT '装货港口',
  `discharge` varchar(100) DEFAULT NULL COMMENT '卸货港口',
  `arrive` varchar(100) DEFAULT NULL COMMENT '目的港口',
  `expected_time` datetime DEFAULT NULL COMMENT '预计到达时间',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人ID',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人Code',
  `event_code` varchar(32) DEFAULT NULL COMMENT '事件code',
  `event_sort` int(11) DEFAULT NULL COMMENT '事件顺序',
  `event_name` varchar(128) DEFAULT NULL COMMENT '事件名称',
  `event_expect_date` datetime DEFAULT NULL COMMENT '事件预期时间',
  `event_date` datetime DEFAULT NULL COMMENT '事件时间',
  `event_description` varchar(255) DEFAULT NULL COMMENT '事件描述',
  `event_vessel_name` varchar(100) DEFAULT NULL COMMENT '事件船名',
  `event_voyage` varchar(100) DEFAULT NULL COMMENT '事件航次',
  `transport_mode` varchar(100) DEFAULT NULL COMMENT '运输方式',
  `location_name` varchar(255) DEFAULT NULL COMMENT '位置名称',
  `version` varchar(100) DEFAULT NULL COMMENT '数据版本',
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求来源',
  `container_size` varchar(100) DEFAULT NULL COMMENT '箱大小',
  `container_type` varchar(100) DEFAULT NULL COMMENT '箱类型',
  `created_id` int(11) DEFAULT NULL COMMENT '创建人',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_id` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `is_active` bit(1) DEFAULT b'1' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_event_exist` (`bl_no`,`container_no`,`event_name`) USING BTREE COMMENT '提单号 箱号 事件名称联合索引',
  KEY `index_version` (`version`) USING BTREE COMMENT '版本号'
) ENGINE=InnoDB AUTO_INCREMENT=5265 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='tracking箱事件日志表';

-- ----------------------------
-- Table structure for tracking_sub_record
-- ----------------------------
DROP TABLE IF EXISTS `tracking_sub_record`;
CREATE TABLE `tracking_sub_record` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bl_no` varchar(100) DEFAULT NULL COMMENT '提单号',
  `container_no` varchar(100) DEFAULT NULL COMMENT '箱号',
  `type` varchar(32) DEFAULT NULL COMMENT '订阅类型：bl,conainer',
  `carrier_id` int(11) DEFAULT NULL COMMENT '承运人ID',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '承运人Code',
  `expected_time` datetime DEFAULT NULL COMMENT '预计到达时间',
  `created_id` int(11) DEFAULT NULL COMMENT '创建人',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_id` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_active` bit(1) DEFAULT b'1' COMMENT '是否有效,1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='tracking订阅记录表';

SET FOREIGN_KEY_CHECKS = 1;
