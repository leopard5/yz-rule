package com.yz.rule.monitoring.listener;

import com.yz.rule.monitoring.EventMonitor;
import com.yz.rule.monitoring.EventMonitorRegister;
import com.yz.rule.monitoring.Monitoring;
import org.apache.commons.collections.MapUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author yazhong
 * @description EventMonitorsListener
 */
@Component
public class EventMonitorsListener implements ApplicationListener<ContextRefreshedEvent> {

    @Resource
    private EventMonitorRegister monitorRegister;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if (event.getApplicationContext().getParent() == null) {

            Map<String, Object> beans = event.getApplicationContext().getBeansWithAnnotation(EventMonitor.class);

            if (MapUtils.isNotEmpty(beans)) {
                List<Monitoring> monitoringList = new ArrayList<>(beans.size());
                for (Object bean : beans.values()) {
                    if (bean == null) {
                        continue;
                    }
                    if (Monitoring.class.isAssignableFrom(bean.getClass())) {
                        monitoringList.add((Monitoring) bean);
                    }
                }
                monitorRegister.loadEventMonitor(monitoringList);
            }
            System.err.println("=====ContextRefreshedEvent=====" + event.getSource().getClass().getName());
        }
    }
}
