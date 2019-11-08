package com.yz.rule.schema;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 箱
 */
@Data
@Component
public class Container implements Schema,Serializable {
    private static final long serialVersionUID = -3152519062066839331L;

    private String containerNo;
    private String blNo;

    private String voyage;
    private String vesselName;
    private String vesselNameNoSpace;
    private String transitPortCode;
    private String transitPortName;
    private String sealNo;
    private String truckNo;

    private BigDecimal pieces;
    private BigDecimal weight;
    private BigDecimal volume;

    private BigDecimal vgm;
    private BigDecimal totalWeight;
    private BigDecimal tareWeight;


    private String  containerSize ;
    private String  containerType;
    private String  containerOwner;
    private String  containerStatus;
    private String  containerHigh;

    private String  imoClass;
}
