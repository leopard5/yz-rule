package com.yz.rule.monitoring.exception;

import com.yz.rule.monitoring.EventMonitor;
import com.yz.rule.monitoring.Monitoring;
import org.springframework.stereotype.Component;

/**
 * @author yazhong
 * @description EventMonitorsListener
 */
@Component
@EventMonitor
public class LoadingException implements Monitoring {
    @Override
    public void doProcess() {

    }
}
