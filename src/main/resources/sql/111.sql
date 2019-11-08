ALTER TABLE `lc_container` 
  ADD `voyage_source_id` VARCHAR (100) DEFAULT NULL COMMENT '船期标识',
  ADD `container_id` VARCHAR (40) DEFAULT NULL COMMENT '箱标示',
  ADD `bl_no` VARCHAR (32) DEFAULT NULL COMMENT '提单号',
  ADD `voyage` VARCHAR (32) DEFAULT NULL COMMENT '航次',
  ADD `vessel_name` VARCHAR (100) DEFAULT NULL COMMENT '船名',
  ADD `vessel_name_no_space` VARCHAR (150) DEFAULT NULL COMMENT '船名去空格存储',
  ADD `un_code` VARCHAR (32) DEFAULT NULL COMMENT '联合国编号',
  ADD `carrier_id` INT (11) DEFAULT NULL COMMENT '承运人id',
  ADD `carrier_code` VARCHAR (32) DEFAULT NULL COMMENT '承运人code',
  ADD `transit_port_code` VARCHAR (32) DEFAULT NULL COMMENT '经停港（五字码）',
  ADD `transit_port_name` VARCHAR (255) DEFAULT NULL COMMENT '经停港（中文名）',
  ADD `container_no` VARCHAR (32) DEFAULT NULL COMMENT '箱号',
  ADD `seal_no` VARCHAR (32) DEFAULT NULL COMMENT '封号',
  ADD `truck_no` VARCHAR (20) DEFAULT NULL COMMENT '车牌号',
  ADD `fcl_lcl` VARCHAR (32) DEFAULT NULL COMMENT '整拼标志',
  ADD `direct` VARCHAR (5) DEFAULT NULL COMMENT '进出口标识',
  ADD `pieces` DECIMAL (18, 4) DEFAULT NULL COMMENT '货物件数',
  ADD `weight` DECIMAL (18, 4) DEFAULT NULL COMMENT '重量',
  ADD `volume` DECIMAL (18, 4) DEFAULT NULL COMMENT '体积',
  ADD `vgm` DECIMAL (18, 4) DEFAULT NULL COMMENT '出口集装箱重量查核',
  ADD `total_total_weight` DECIMAL (18, 4) DEFAULT NULL COMMENT '总重量',
  ADD `tare_weight` DECIMAL (18, 4) DEFAULT NULL COMMENT '箱皮重',
  ADD `container_size` VARCHAR (32) DEFAULT NULL COMMENT '箱尺寸',
  ADD `container_type` VARCHAR (32) DEFAULT NULL COMMENT '类型 (GP,HQ,特种箱等)',
  ADD `container_owner` VARCHAR (10) DEFAULT NULL COMMENT '箱主',
  ADD `container_status` VARCHAR (50) DEFAULT NULL COMMENT '箱状态',
  ADD `container_size_str` VARCHAR (32) DEFAULT NULL COMMENT '尺寸',
  ADD `container_high_cn` VARCHAR (32) DEFAULT NULL COMMENT '中文箱高',
  ADD `imo_class` VARCHAR (32) DEFAULT NULL COMMENT '危险品等级',
  ADD `enter_port_date` DATETIME DEFAULT NULL COMMENT '进场时间',
  ADD `leave_port_date` DATETIME DEFAULT NULL COMMENT '出场时间',
  ADD `customs_release_status` VARCHAR (32) DEFAULT NULL COMMENT '海关放行状态',
  ADD `customs_release_date` DATETIME DEFAULT NULL COMMENT '海放时间',
  ADD `port_release_status` VARCHAR (32) DEFAULT NULL COMMENT '码头放行状态',
  ADD `port_release_date` DATETIME DEFAULT NULL COMMENT '码放时间',
  ADD `distribution_ship_status` VARCHAR (32) DEFAULT NULL COMMENT '配船状态',
  ADD `loading_code` VARCHAR (32) DEFAULT NULL COMMENT '装货港EDI',
  ADD `dock` VARCHAR (32) DEFAULT NULL COMMENT '码头',
  ADD `container_position` VARCHAR (32) DEFAULT NULL COMMENT '场箱位',
  ADD `temperature` VARCHAR (32) DEFAULT NULL COMMENT '冷藏箱温度',
  ADD `over_limit` VARCHAR (32) DEFAULT NULL COMMENT '超限',
  ADD `over_limit_length` VARCHAR (32) DEFAULT NULL COMMENT '超限长度',
  ADD `discarge_code` VARCHAR (32) DEFAULT NULL COMMENT '卸货港EDI',
  ADD `depart_code` VARCHAR (32) DEFAULT NULL COMMENT '目的港EDI',
  ADD `customs_no` VARCHAR (32) DEFAULT NULL COMMENT '报关单号',
  ADD `carrier_operation` VARCHAR (255) DEFAULT NULL COMMENT '船公司操作',
  ADD `vgm_Date` DATETIME DEFAULT NULL COMMENT 'vgm报文发送时间',
  ADD `arrival_file_date` DATETIME DEFAULT NULL COMMENT '运抵报文发送时间',
  ADD `customs_file_date` DATETIME DEFAULT NULL COMMENT '海关报文发送时间',
  ADD `pre_recorded_date` DATETIME DEFAULT NULL COMMENT '箱预录时间',
  ADD `customs_release_result` VARCHAR (100) DEFAULT NULL COMMENT '海放结果',
  ADD `in_way` VARCHAR (20) DEFAULT NULL COMMENT '进场方式',
  ADD `out_way` VARCHAR (20) DEFAULT NULL COMMENT '出场方式',
  ADD `ewl_id` VARCHAR (40) DEFAULT NULL COMMENT 'EWL_ID',
  ADD `bk_no` VARCHAR (100) DEFAULT NULL COMMENT '订舱号',
  ADD `vgm_accept_date` DATETIME DEFAULT NULL COMMENT 'VGM接受时间',
  ADD `vgm_method` VARCHAR (100) DEFAULT NULL COMMENT 'VGM称重方法',
  ADD `vgm_signature` VARCHAR (100) DEFAULT NULL COMMENT 'VGM申报人签名',
  ADD `vgm_sender_code` VARCHAR (100) DEFAULT NULL COMMENT 'VGM发送方代码',
  ADD `vgm_receiver_code` VARCHAR (100) DEFAULT NULL COMMENT 'VGM接收方代码' ;

ALTER TABLE `lc_subscribe` 
  ADD `bl_no` VARCHAR (64) DEFAULT NULL COMMENT '提单号',
  ADD `bk_no` VARCHAR (64) DEFAULT NULL COMMENT '订舱号',
  ADD `carrier_id` INT (11) DEFAULT NULL COMMENT '船公司Id',
  ADD `carrier_code` VARCHAR (20) DEFAULT NULL COMMENT '承运人Code',
  ADD `port_id` INT (11) DEFAULT NULL COMMENT '港口id',
  ADD `vessel` VARCHAR (100) DEFAULT NULL COMMENT '船名',
  ADD `voyage` VARCHAR (100) DEFAULT NULL COMMENT '航次',
  ADD `delivery_date` DATETIME DEFAULT NULL COMMENT '开航日期',
  ADD `status` INT (11) DEFAULT NULL COMMENT '状态',
  ADD `task_status` TINYINT (4) DEFAULT NULL COMMENT '调度状态' ;

-- 通用字段
ALTER TABLE `aaaaa`
   ADD  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   ADD  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
   ADD  `created_user` VARCHAR(16) DEFAULT '' COMMENT '创建人',
   ADD  `updated_user` VARCHAR(16) DEFAULT NULL COMMENT '更新人',
   ADD  `is_deleted`  tinyint (1) unsigned DEFAULT 0 COMMENT '1.删除 0.未删除' ;
