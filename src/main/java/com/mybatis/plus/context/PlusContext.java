package com.mybatis.plus.context;

import java.util.HashMap;
import java.util.Map;

public class PlusContext {

    private static Map<String, String> tableMap = new HashMap<>();

    private static DataSourceConfig dataSource = null;

    private static String domainPackage = null;

    private static String examplePackage = null;

    private static Boolean lombokEnable = false;

    private static String xmlPackage = null;

    private static String mapperPackage = null;

    private static String repositoryPackage = null;

    public static void add(String domain, String table) {
        tableMap.put(domain, table);
    }

    public static String getTable(String domain) {
        return tableMap.get(domain);
    }


    public static void setDataSource(String ip, String port, String database, String username, String password){
        dataSource = new DataSourceConfig(ip, port, database, username, password);
    }

    public static DataSourceConfig getDataSource(){
        return dataSource;
    }

    public static void setDomainPackage(String packageName){
        domainPackage = packageName;
    }

    public static String getDomainPackage(){
        if(domainPackage == null || domainPackage.trim().equals("")) {
            return getRepositoryPackage().concat(".domain");
        }
        return domainPackage;
    }

    public static Boolean getLombokEnable() {
        return lombokEnable;
    }

    public static void setLombokEnable(Boolean lombokEnable) {
        PlusContext.lombokEnable = lombokEnable;
    }

    public static String getExamplePackage() {
        if(null == examplePackage || "".equals(examplePackage.trim())) {
            return getDomainPackage().concat(".example");
        }
        return examplePackage;
    }

    public static void setExamplePackage(String examplePackage) {
        PlusContext.examplePackage = examplePackage;
    }

    public static String getXmlPackage() {
        return (xmlPackage == null || xmlPackage.trim().equals("")) ? "mapper" : xmlPackage;
    }

    public static void setXmlPackage(String xmlPackage) {
        PlusContext.xmlPackage = xmlPackage;
    }

    public static String getMapperPackage() {
        if(mapperPackage == null || mapperPackage.trim().equals("")) {
            return getRepositoryPackage().concat(".mapper");
        }
        return mapperPackage;
    }

    public static void setMapperPackage(String mapperPackage) {
        PlusContext.mapperPackage = mapperPackage;
    }

    public static String getRepositoryPackage() {
        return repositoryPackage;
    }

    public static void setRepositoryPackage(String repositoryPackage) {
        PlusContext.repositoryPackage = repositoryPackage;
    }
}
