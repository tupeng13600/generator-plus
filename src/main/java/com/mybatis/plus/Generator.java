package com.mybatis.plus;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.*;

public class Generator {



    public static void main(String[] args) {
        PlusContext.setRepositoryPackage("com.mybatis.plus.generate.repository");
        PlusContext.setDataSource("127.0.0.1", "3306", "sjs", "root", "Txx@13600");
        PlusContext.setLombokEnable(true);
        DomainFactory domainFactory = new DomainFactory();
        domainFactory.generate();

        ExampleFactory exampleFactory = new ExampleFactory();
        exampleFactory.generate();

        XmlMapperFactory xmlcomMapperFactory = new XmlMapperFactory();
        xmlMapperFactory.generate();

        BaseMapperFactory baseMapperFactory = new BaseMapperFactory();
        baseMapperFactory.generate();

        MapperFactory mapperFactory = new MapperFactory();
        mapperFactory.generate();

        XmlExtMapperFactory xmlExtMapperFactory = new XmlExtMapperFactory();
        xmlExtMapperFactory.generate();

        BaseRepositoryFactory baseRepositoryFactory = new BaseRepositoryFactory();
        baseRepositoryFactory.generate();

        RepositoryFactory repositoryFactory = new RepositoryFactory();
        repositoryFactory.generate();

    }

}
