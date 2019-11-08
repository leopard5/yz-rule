package com.yz.rule.data;

import com.yz.rule.enums.EventPlaceEnum;
import lombok.Data;

@Data
public class EventSequenceDefinition {
    /**
     * 事件编码
     */
    private String eventCode;

    /**
     * 事件发生地
     */
    private EventPlaceEnum eventPlace;

    /**
     * 事件发生顺序排序
     */
    private Integer rank;
}
