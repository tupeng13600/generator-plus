package com.generator.plus.util;

public abstract class StringUtils {

    public static String package2Path(String desPackage){
        return desPackage.replaceAll("\\.", "/").concat("/");
    }

    public static Boolean isBlank(String source){
        return null == source || "".equals(source.trim());
    }

}
