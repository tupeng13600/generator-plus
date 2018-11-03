package com.mybatis.plus.factory;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public class JavaRepositoryFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "Repositoryjava.ftl";
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        Map<String, Object> args = new HashMap<>();
        args.put("domain", domainName);
        args.put("examplePackage", PlusContext.getExamplePackage());
        args.put("domainPackage", PlusContext.getDomainPackage());
        args.put("package", PlusContext.getRepositoryPackage());
        args.put("override", false);
        return args;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/java/";
        String examplePackage = PlusContext.getRepositoryPackage();
        String examplePath = examplePackage.replaceAll("\\.", "/").concat("/");
        return prefix.concat(examplePath).concat(domainName).concat("Repository").concat(".java");
    }
}
