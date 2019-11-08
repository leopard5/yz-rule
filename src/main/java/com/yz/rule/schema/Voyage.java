package com.yz.rule.schema;

import lombok.Data;

import java.io.Serializable;

/**
 * 航程
 */
@Data
public class Voyage implements Schema,Serializable {
    private static final long serialVersionUID = -3083502772159174041L;

    private Integer legSeq;
    private String blNo;
    private String carrierCode;

    private String portCode;
    private String vessel;
    private String voyage;
    private String mmsi;

    private String fromPort;
    private String toPort;


}
