package com.yz.rule.clean.enums;

import lombok.Getter;

/**
 * @author yazhong
 */
@Getter
public enum LogisticEventEnums {
    PUT_CONTAINER("放箱"),
    EMPTY_CONTAINER_OUT("提空箱"),
    BOXING("装箱"),
    HEAVY_CONTAINER_ENTRY("重箱进港"),
    CUSTOMS_INSPECTION("海关查验"),
    CUSTOMS_CLEARANCE("海关放行"),
    PORT_RELEASE("码头放行"),
    BERTHING("靠泊"),
    UNLOADING("卸载"),
    LOADING("装载"),
    UN_BERTHING("离泊"),
    RECEIVING_PLACE_HEAVY_OUT("收货地重箱出场"),
    RECEIVING_PLACE_EMPTY_ENTRY("收货地空箱返场"),
    HEAVY_CONTAINER_IN_YARD("重箱进场"),
    HEAVY_CONTAINER_OUT_YARD("重箱出场"),
    LOCK_SHIP("船公司加锁"),
    UNLOCK_SHIP("船公司解锁"),
    SHUT_OUT("退关"),
    CHECK("查验"),
    PICK_UP_BACK("提退运箱"),
    RELOAD("改装"),
    RE_BOOKING("改配"),
    OVERWEIGHT("超重"),
    OVERRUN("超限"),
    ;

    private String desc;

    LogisticEventEnums(String desc) {
        this.desc = desc;
    }
}
