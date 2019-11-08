package com.yz.rule.dynamic;

import lombok.Data;

import java.io.Serializable;

@Data
public class DataInputDTO implements Serializable {
    private static final long serialVersionUID = -5186993185754643067L;

    /**
     * 唯一键值
     */
    private String uniqueKey;

    /**
     * 字段表达式
     */
    private String fieldExpression;

    /**
     * 数据获取表达式
     */
    private String dataExpression;
}
