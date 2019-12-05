package com.yz.rule.rule;

import com.yz.rule.clean.enums.SchemaTypeEnum;

public interface ExecuteEngine {
    boolean execute(SchemaTypeEnum type);
}
