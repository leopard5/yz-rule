package com.yz.rule.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ExceptionCodeEnums {
    EVENT_SEQUENCE_TIME(1, "事件顺序时间异常"),
    EVENT_DUPLICATE(2, "物流中心事件重复发生"),
    SAME_EVENT_DIFF_TIME(3, "同一供应商相同事件发生时间不同"),
    ;
    private Integer code;
    private String desc;
}
