package com.yz.rule.schema;

import lombok.Data;

import java.io.Serializable;

/**
 * 挂靠港
 */
@Data
public class PortCall implements Schema, Serializable {
    private static final long serialVersionUID = 376656496265543577L;

    private String mmsi;
    private String shipName;
    private String portNameCN;
    private String portNameEN;
    private String portCode;

    private String countryCN;
    private String countryEN;
    private String countryCode;

    private Long etd;
    private Long eta;
    private Long atd;
    private Long ata;
    private Long stayPortTime;

}
