package com.generator.plus;

import com.generator.plus.context.PlusContext;
import com.generator.plus.factory.*;
import com.generator.plus.util.StringUtils;

public class Generator {

    private String ip;

    private String port;

    private String database;

    private String user;

    private String password;

    private String repositoryPackage;

    private Generator(){}

    public static Generator build(){
        return new Generator();
    }

    public Generator ip(String ip){
        this.ip = ip;
        return this;
    }

    public Generator port(Integer port){
        this.port = port.toString();
        return this;
    }

    public Generator database(String database){
        this.database = database;
        return this;
    }

    public Generator user(String user){
        this.user = user;
        return this;
    }

    public Generator password(String password){
        this.password = password;
        return this;
    }

    public Generator repositoryPackage(String repositoryPackage){
        this.repositoryPackage = repositoryPackage;
        PlusContext.setRepositoryPackage(repositoryPackage);
        return this;
    }

    public Generator baseClassPackage(String baseClassPackage) {
        PlusContext.setBasePackage(baseClassPackage);
        return this;
    }

    public Generator lombokEnable(Boolean lombokEnable) {
        PlusContext.setLombokEnable(lombokEnable);
        return this;
    }

    public Generator mapperPackage(String mapperPackage){
        PlusContext.setMapperPackage(mapperPackage);
        return this;
    }

    public Generator assemblerPackage(String assemblerPackage){
        PlusContext.setAssemblerPackage(assemblerPackage);
        return this;
    }

    public Generator domainPackage(String domainPackage){
        PlusContext.setDomainPackage(domainPackage);
        return this;
    }

    public Generator xmlPackage(String xmlPackage){
        PlusContext.setXmlPackage(xmlPackage);
        return this;
    }

    public Generator addTables(String...tableNames){
        PlusContext.add(tableNames);
        return this;
    }

    public Generator projectPath(String projectPath){
        PlusContext.setProjectPath(projectPath);
        return this;
    }

    public void gernerate() {
        this.validate();
        PlusContext.setDataSource(ip, port, database, user, password);
        DomainFactory.write();
        BaseMapperFactory.write();
        BaseRepositoryFactory.write();
        BaseAssemblerFactory.write();
//        CorrectRepositoryBaseFactory.write();
        MapperFactory.write();
        AssemblerFactory.write();
        RepositoryFactory.write();
        XmlExtMapperFactory.write();
        XmlMapperFactory.write();
    }

//    public static void main(String[] args) {
//        Generator.build().ip("10.104.50.25")
//                .port(3306)
//                .database("mmc_admin")
//                .user("mmcadmin_w")
//                .projectPath("/Users/tutu/IdeaProjects/generator-plus")
//                .password("aY2cpKmEJQNBh5Cc")
//                .repositoryPackage("com.uc.mmcmams.repository")
//                .addTables("t_user_test")
//                .gernerate();
//
//    }

    private void validate(){
        if(StringUtils.isBlank(ip)) {
            throw new IllegalArgumentException("ip can not be null");
        }

        if(StringUtils.isBlank(port)) {
            throw new IllegalArgumentException("port can not be null");
        }

        if(StringUtils.isBlank(database)) {
            throw new IllegalArgumentException("database can not be null");
        }

        if(StringUtils.isBlank(user)) {
            throw new IllegalArgumentException("user can not be null");
        }

        if(StringUtils.isBlank(password)) {
            throw new IllegalArgumentException("password can not be null");
        }

        if(StringUtils.isBlank(repositoryPackage)) {
            throw new IllegalArgumentException("repositoryPackage can not be null");
        }
    }

}
