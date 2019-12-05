package com.yz.rule.rule;

import com.yz.rule.clean.enums.DataSupplierEnum;
import com.yz.rule.clean.enums.SchemaTypeEnum;
import lombok.Data;

import java.util.List;

@Data
public class SchemaPreparationRule {
    private SchemaTypeEnum schema;
    private DataSupplierEnum defaultSupplier;
    private List<DataSupplierEnum> alternateDataSuppliers;

}
