package com.yz.rule.dao.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("lc_event")
public class Event {
    @TableId(type = IdType.ID_WORKER)
    private Long id;
    private Long orderId;
    private String blNo;
}
