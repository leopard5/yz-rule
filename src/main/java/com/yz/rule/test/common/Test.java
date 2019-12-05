package com.yz.rule.test.common;

import org.apache.commons.lang.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
    public static final Pattern AB = Pattern.compile("(.+?),(.+?),(.+?),?(.+?),?");

    public static void main(String[] args) {
        String a1 = "New York1, New York2, New York3, United States";
        String a2 = "Le Havre1, Le Havre2, Seine Maritime, Haute Normandie, France\n";
        String a3 = "Shanghai1, Shanghai2, China";

        Matcher matcher = AB.matcher(a2);
        if (matcher.find()) {
            switch (StringUtils.countMatches(a1, ",")){
                case 4:

                case 3:

                case 2:

                default:

            }
        }





        if (matcher.find()) {
            System.out.println(matcher.groupCount());
            System.out.println(matcher.group(1));
        }

    }
}
