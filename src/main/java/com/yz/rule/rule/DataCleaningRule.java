package com.yz.rule.rule;

import com.yz.rule.clean.enums.SchemaTypeEnum;
import lombok.Data;

/**
 * @author yazhong
 */
@Data
public class DataCleaningRule implements ExecuteEngine {

    /**
     * 规则名称
     */
    private String ruleName;

    /**
     * 规则描述
     */
    private String ruleDescription;

    /**
     * 字段表达式
     * #{Container.containerNo}
     */
    private String fieldExpression;

    /**
     * 数据获取表达式
     * #{ab.cd.ef.gh}
     */
    private String dataExpression;

    /**
     * 领域标识
     */
    private String domain;

    /**
     * 数据源类型
     */
    private String defaultSourceType;

    /**
     * 默认值
     */
    private String defaultValue;

    /**
     * 格式化规则
     */
    private String formatRule;

    /**
     * 数据源优先级 表达式
     */
    private String dataPriorityExpression;

    /**
     * 规则内容
     */
    private String rule;

    /**
     * 前置条件
     */
    private String preCondition;

    /**
     * 后置动作
     */
    private String postAction;

    /**
     * 告警规则
     */
    private String alarmRule;


    @Override
    public boolean execute(SchemaTypeEnum type) {
        return false;
    }
}
