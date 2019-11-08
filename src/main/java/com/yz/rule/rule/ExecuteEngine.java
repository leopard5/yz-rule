package com.yz.rule.rule;

import com.yz.rule.enums.SchemaTypeEnum;

public interface ExecuteEngine {
    boolean execute(SchemaTypeEnum type);
}
