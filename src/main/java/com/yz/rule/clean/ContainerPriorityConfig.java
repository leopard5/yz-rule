package com.yz.rule.clean;

import com.yz.rule.clean.enums.DataSupplierEnum;
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
public class ContainerPriorityConfig {

    /**
     * 数据供应商优先级
     */
    List<DataSupplierEnum> supplierPriority;

    /**
     * 箱字段数据优先级规则
     * 字段无配置时使用supplierPriority优先级规则
     */
    Map<String, List<DataSupplierEnum>> containerFieldSupplierPriority;
}
