package com.generator.plus.util;

public class Log {

    public static void info(String first, String second) {
        System.out.println("generate ".concat(format(first, 40)).concat(" success. file save at [").concat(second).concat("]"));
    }

    private static String format(String des, Integer desLong) {
        Integer length = des.length();
        StringBuilder builder = new StringBuilder("[");
        builder.append(des);
        if(des.length() < desLong) {
            desLong = desLong - length;
            for (Integer i = 0; i < desLong; i++) {
                builder.append(" ");
            }
        }
        builder.append("]");
        return builder.toString();
    }

}
