package com.yz.rule.schema;

import lombok.Data;

import java.io.Serializable;

/**
 * 报关信息
 */
@Data
public class CustomsDeclaration implements Schema, Serializable {
    private static final long serialVersionUID = 394834354275051970L;

    private String customsNo;
    private String containerNo;
    private String blNo;

    private Long dealTime;
    private Byte status;

    private String dealResult;
    private Long lastUpdateTime;

}
