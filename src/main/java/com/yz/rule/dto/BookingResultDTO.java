package com.yz.rule.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;

/**
 * @author yazhong
 */
@Data
public class BookingResultDTO implements Serializable {
    private static final long serialVersionUID = 8097518066965905580L;

    private Integer index;
    private String company;
    private String blNo;
    private Boolean success;
    private String message;
    private Map<String, Integer> mapEventStatus;

}
