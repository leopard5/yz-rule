package com.yz.rule.schema;

import lombok.Data;

import java.io.Serializable;

/**
 * 箱事件
 */
@Data
public class ContainerEvent implements Schema,Serializable{
    private static final long serialVersionUID = -1247993025159461079L;

    private String containerNo;
    private String blNo;
    private String eventCode;

    private String bkNo;
    private String voyage;
    private String vesselName;
    private String vesselNameNoSpace;

    private Byte eventPlace;
    private String eventName;
    private Integer eventSort;
    private String eventData;

    private String locationName;

}
