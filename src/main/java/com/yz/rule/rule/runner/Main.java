package com.yz.rule.rule.runner;

import com.ql.util.express.DefaultContext;
import com.ql.util.express.ExpressRunner;

import javax.script.Bindings;
import javax.script.Compilable;
import javax.script.CompiledScript;
import javax.script.ScriptEngineManager;

/**
 * SPEL
 * Groovy
 * Expression4j  主要是数学函数
 * Aviator
 * QLExpress
 */

public class Main {
    public static void main(String[] args) {
        try {
            testQLExpress();
            testCompiledJsScript();
        } catch (Exception e) {

        }
    }


    static void testQLExpress() throws Exception {
        ExpressRunner runner = new ExpressRunner();
        DefaultContext<String, Object> context = new DefaultContext<String, Object>();
        context.put("a", 1);
        context.put("b", 2);
        context.put("c", 3);
        String express = "a+b*c";
        Object r = runner.execute(express, context, null, true, false);
        System.out.println(r);
    }

    static void testCompiledJsScript() throws Exception {
        javax.script.ScriptEngine se = new ScriptEngineManager().getEngineByName("js");
        Compilable ce = (Compilable) se;
        CompiledScript cs = ce.compile("a*b*c");
        Bindings bindings = se.createBindings();
        bindings.put("a", 3600);
        bindings.put("b", 14);
        bindings.put("c", 4);
        Object r = cs.eval(bindings);
        System.out.println(r);
    }
}
