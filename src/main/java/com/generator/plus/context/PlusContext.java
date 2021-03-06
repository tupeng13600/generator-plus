package com.generator.plus.context;

import java.util.*;

public class PlusContext {

    private static Map<String, String> tableMap = new HashMap<>();

    private static DataSourceConfig dataSource = null;

    private static String domainPackage = null;

    private static String assemblerPackage = null;

    private static Boolean lombokEnable = false;

    private static String xmlPackage = null;

    private static String mapperPackage = null;

    private static String repositoryPackage = null;

    private static Set<String> tableNames = new HashSet<>();

    private static String projectPath = null;

    private static String desFilePath = null;

    private static String basePackage = null;

    public static String getDesFilePath() {
        return desFilePath;
    }

    public static void setDesFilePath(String desFilePath) {
        PlusContext.desFilePath = getProjectPath().concat(desFilePath);
        if(System.getProperty("os.name").trim().equals("Windows")) {
            PlusContext.desFilePath = PlusContext.desFilePath.replaceAll("/", "\\\\");
        } else {
            PlusContext.desFilePath = PlusContext.desFilePath.replaceAll("\\\\", "/");
        }
    }

    public static void add(String... tableNames) {
        if(null == tableNames || tableNames.length < 1) {
            return;
        }
        PlusContext.tableNames.addAll(Arrays.asList(tableNames));
    }

    public static Set<String> getTableNames(){
        return tableNames;
    }

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
        if(null == lombokEnable) {
            PlusContext.lombokEnable = false;
        } else {
            PlusContext.lombokEnable = lombokEnable;
        }
    }

    public static String getAssemblerPackage() {
        if(null == assemblerPackage || "".equals(assemblerPackage.trim())) {
            return getMapperPackage().concat(".assembler");
        }
        return assemblerPackage;
    }

    public static void setAssemblerPackage(String assemblerPackage) {
        PlusContext.assemblerPackage = assemblerPackage;
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

    public static String getBasePackage() {
        if(null == basePackage || "".equalsIgnoreCase(basePackage.trim())) {
            return getRepositoryPackage().concat(".base");
        }
        return basePackage;
    }

    public static void setBasePackage(String basePackage) {
        PlusContext.basePackage = basePackage;
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

    public static String getProjectPath() {
        return (projectPath == null || "".equals(projectPath.trim())) ? System.getProperty("user.dir") : projectPath;
    }

    public static void setProjectPath(String projectPath) {
        if(projectPath.endsWith("/") || projectPath.endsWith("\\\\")) {
            projectPath = projectPath.substring(0, projectPath.length() - 1);
        }

        if(System.getProperty("os.name").trim().equals("Windows")) {
            projectPath = projectPath.replaceAll("/", "\\\\");
        } else {
            projectPath = projectPath.replaceAll("\\\\", "/");
        }

        PlusContext.projectPath = projectPath;
    }

}
