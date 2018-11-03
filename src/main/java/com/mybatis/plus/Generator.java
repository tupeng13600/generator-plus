package com.mybatis.plus;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.*;
import com.mybatis.plus.util.StringUtils;

public class Generator {

    private String ip;

    private String port;

    private String database;

    private String user;

    private String password;

    private String repositoryPackage;
    private String mapperPackage;
    private String examplePackage;
    private String domainPackage;
    private String xmlPackage;

    private Generator(){};

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
        PlusContext.setRepositoryPackage(repositoryPackage);
        return this;
    }

    public Generator mapperPackage(String mapperPackage){
        PlusContext.setMapperPackage(mapperPackage);
        return this;
    }

    public Generator examplePackage(String examplePackage){
        PlusContext.setExamplePackage(examplePackage);
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

    public void gernerate() {
        PlusContext.setDataSource(ip, port, database, user, password);
        PlusContext.setLombokEnable(true);
        DomainFactory.write();
        BaseMapperFactory.write();
        BaseRepositoryFactory.write();
        MapperFactory.write();
        ExampleFactory.write();
        RepositoryFactory.write();
        XmlExtMapperFactory.write();
        XmlMapperFactory.write();
    }

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
