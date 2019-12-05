package com.yz.rule.clean;

import com.yz.rule.clean.enums.DataSupplierEnum;
import com.yz.rule.clean.enums.LogisticEventEnums;
import com.yz.rule.clean.enums.SchemaTypeEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * @author yazhong
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SupplierPriorityConfig {

    /**
     * 港口ID
     */
    private String portId;

    /**
     * 物流事件数据供应商优先级
     */
    private Map<LogisticEventEnums, List<DataSupplierEnum>> eventSupplierPriority;

    /**
     * 各个承运商对应的数据供应商优先级
     * key     承运商编码
     * value   优先级规则
     */
    private Map<String, List<DataSupplierEnum>> carriers;

    /**
     * 箱数据供应商优先级
     */
    private ContainerPriorityConfig containerPriority;

    /**
     * 物流业务域对应的数据供应商优先级
     */
    private Map<SchemaTypeEnum, List<DataSupplierEnum>> schemaSupplierPriority;
}
