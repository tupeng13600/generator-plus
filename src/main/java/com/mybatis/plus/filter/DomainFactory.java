package com.mybatis.plus.filter;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.filter.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public class DomainFactory extends GeneratorFactory {


    @Override
    protected String templateName() {
        return "domain.ftl";
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        Map<String, Object> args = new HashMap<>();

        Set<String> importList = new HashSet<>();
        for (PropertyModel property : propertyList) {
            if(null != property.getFullTypeName() && !"".equals(property.getFullTypeName().trim())) {
                importList.add(property.getFullTypeName());
            }
        }
        args.put("propertyList", propertyList);
        args.put("domain", domainName);
        args.put("importList", importList);
        args.put("package", PlusContext.getDomainPackage());
        return args;
    }


    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/java/";
        String domainPath = PlusContext.getDomainPackage().replaceAll("\\.", "/").concat("/");
        return prefix.concat(domainPath).concat(domainName).concat(".java");
    }

    public static void main(String[] args) {
        PlusContext.setRepositoryPackage("com.mybatis.plus.generate.repository");
        PlusContext.setDataSource("127.0.0.1", "3306", "sjs", "root", "Txx@13600");
        PlusContext.setLombokEnable(true);
        DomainFactory domainFactory = new DomainFactory();
        domainFactory.generate();

        ExampleFactory exampleFactory = new ExampleFactory();
        exampleFactory.generate();

        XmlMapperFactory xmlMapperFactory = new XmlMapperFactory();
        xmlMapperFactory.generate();

        BaseMapperFactory baseMapperFactory = new BaseMapperFactory();
        baseMapperFactory.generate();

        JavaMapperFactory mapperFactory = new JavaMapperFactory();
        mapperFactory.generate();

        ExtXmlMapperFactory extXmlMapperFactory = new ExtXmlMapperFactory();
        extXmlMapperFactory.generate();

        BaseRepositoryFactory baseRepositoryFactory = new BaseRepositoryFactory();
        baseRepositoryFactory.generate();

        JavaRepositoryFactory javaRepositoryFactory = new JavaRepositoryFactory();
        javaRepositoryFactory.generate();

    }

}
