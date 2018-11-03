package com.mybatis.plus.util;

public abstract class StringUtils {

    public static String package2Path(String desPackage){
        return desPackage.replaceAll("\\.", "/").concat("/");
    }

}
