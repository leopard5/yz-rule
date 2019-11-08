package com.yz.rule.schema;

import lombok.Data;

import java.io.Serializable;

/**
 * 船计划
 */
@Data
public class ShippingSchedule implements Schema,Serializable {
    private static final long serialVersionUID = 2340816128373187061L;

    private Integer portId;
    private String vesselEN;
    private String vesselEnNoSpace;
    private String vesselCN;
    private String vesselIMO;
    private String voyage;
    private String voyageImport;
    private String voyageExport;
    private String direction;
    private String transitPortCode;
    private String transitPortName;

    private Long preArriveTime;
    private Long arriveTime;
    private Long preDeparture;
    private Long departure;

    private Long etd;
    private Long eta;
    private Long atd;
    private Long ata;
    private String dock;

    private Long openTime;
    private Long closeTime;
    private Long closingTime;
    private Long portCloseTime;

    private String carrierCode;
    private String carrierName;

    private String shipCompanyCode;
    private String shipAgentCode;
    private String shipAgentName;

}
