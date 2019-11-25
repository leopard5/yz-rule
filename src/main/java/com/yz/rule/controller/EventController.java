package com.yz.rule.controller;

import com.google.common.collect.Lists;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author yazhong
 */
@RestController
public class EventController {

    @RequestMapping("/rule/list")
    public String getRules(){
        List<String> rules = Lists.newArrayList();
        Lists.partition(rules, 10);
        return "";
    }

}
