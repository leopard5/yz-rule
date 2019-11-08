package com.yz.rule.schema;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 船舶轨迹
 */
@Data
public class ShippingTracking implements Schema, Serializable {
    private static final long serialVersionUID = 5165347287191607379L;

    private String mmsi;
    private String shipName;
    private Long statusTime;

    private BigDecimal lat;
    private BigDecimal lon;

    private String course;
    private BigDecimal speed;
}
