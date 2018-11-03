package com.mybatis.plus.filter;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.filter.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public class JavaMapperFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "mapperjava.ftl";
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
        args.put("domain", domainName);
        args.put("examplePackage", PlusContext.getExamplePackage());
        args.put("domainPackage", PlusContext.getDomainPackage());
        args.put("package", PlusContext.getMapperPackage());
        args.put("override", false);
        return args;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/java/";
        String examplePackage = PlusContext.getMapperPackage();
        String examplePath = examplePackage.replaceAll("\\.", "/").concat("/");
        return prefix.concat(examplePath).concat(domainName).concat("Mapper").concat(".java");
    }
}
