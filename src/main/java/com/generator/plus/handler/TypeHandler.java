package com.generator.plus.handler;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class TypeHandler {

    private static Map<String, Class> typeMap = new HashMap<>();

    static {
        typeMap.put("ARRAY", Object.class);
        typeMap.put("BIGINT", Long.class);
        typeMap.put("BIT", Boolean.class);
        typeMap.put("BOOLEAN", Boolean.class);
        typeMap.put("CHAR", String.class);
        typeMap.put("CLOB", String.class);
        typeMap.put("DATALINK", Object.class);
        typeMap.put("DATE", Date.class);
        typeMap.put("DECIMAL", BigDecimal.class);
        typeMap.put("DISTINCT", Object.class);
        typeMap.put("DOUBLE", Double.class);
        typeMap.put("FLOAT", Double.class);
        typeMap.put("INTEGER", Integer.class);
        typeMap.put("INT", Integer.class);
        typeMap.put("JAVA_OBJECT", Object.class);
        typeMap.put("LONGNVARCHAR", String.class);
        typeMap.put("LONGVARCHAR", String.class);
        typeMap.put("NCHAR", String.class);
        typeMap.put("NCLOB", String.class);
        typeMap.put("NVARCHAR", String.class);
        typeMap.put("NULL", Object.class);
        typeMap.put("NUMERIC", Integer.class);
        typeMap.put("OTHER", Object.class);
        typeMap.put("REAL", Float.class);
        typeMap.put("REF", Object.class);
        typeMap.put("SMALLINT", Integer.class);
        typeMap.put("STRUCT", Object.class);
        typeMap.put("TIME", Date.class);
        typeMap.put("DATETIME", Date.class);
        typeMap.put("TIMESTAMP", Date.class);
        typeMap.put("TINYINT", Integer.class);
        typeMap.put("VARCHAR", String.class);
        typeMap.put("ENUM", String.class);
    }

    public static Class handler(String dbType) {
        Class clazz = typeMap.get(dbType.toUpperCase());
        if (null == clazz) {
            throw new IllegalArgumentException("un support type 4 field:".concat(dbType));
        } else {
            return clazz;
        }
    }

}
