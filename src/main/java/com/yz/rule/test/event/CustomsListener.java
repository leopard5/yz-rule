package com.yz.rule.test.event;

import org.springframework.context.ApplicationListener;

/**
 * @author yazhong
 */
public class CustomsListener implements ApplicationListener<CustomsEvent> {
    @Override
    public void onApplicationEvent(CustomsEvent event) {

    }
}
