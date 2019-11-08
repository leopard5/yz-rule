package com.yz.rule.test.event;

import com.yz.rule.schema.Container;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.stereotype.Component;

/**
 * @author yazhong
 */
@Component
public class CustomsEvent extends ApplicationEvent {
    private static final long serialVersionUID = -1488896797964757767L;

    private Container container;

    /**
     * Create a new ContextStartedEvent.
     *
     * @param source the {@code ApplicationContext} that the event is raised for
     *               (must not be {@code null})
     * @param c
     */
    public CustomsEvent(ApplicationContext source, Container c) {
        super(source);
        this.container = c;
    }


}
