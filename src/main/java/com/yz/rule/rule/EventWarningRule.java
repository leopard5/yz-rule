package com.yz.rule.rule;

import com.yz.rule.data.PropertiesDefinition;
import com.yz.rule.enums.ExceptionCodeEnums;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class EventWarningRule {
    /**
     * 事件编码
     */
    private String eventCode;

    /**
     * 事件异常定义
     */
    private List<ExceptionCodeEnums> exceptionProcess;

    /**
     *
     */
    private Map<ExceptionCodeEnums, List<PropertiesDefinition>> modifyProperties;

    /**
     * 唯一键
     * blNo containerNo eventPlace time
     */
    private List<String> uniqueKey;


}
