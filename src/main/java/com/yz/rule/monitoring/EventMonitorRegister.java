package com.yz.rule.monitoring;

import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author yazhong
 * @description EventMonitorsListener
 */
@Service
public class EventMonitorRegister {
    private static List<Monitoring> monitorHandlers = Lists.newArrayList();

    public void loadEventMonitor(List<Monitoring> monitorHandlers) {
        if (monitorHandlers == null) {
            return;
        }
        monitorHandlers.addAll(monitorHandlers);
    }

    public void execute() {
        for (Monitoring handler : monitorHandlers) {
            handler.doProcess();
        }
    }
}
