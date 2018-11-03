package com.mybatis.plus.filter;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.filter.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public class ExampleFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "example.ftl";
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

        String examplePackage = PlusContext.getExamplePackage() == null || PlusContext.getExamplePackage().trim().equals("")
                ? PlusContext.getDomainPackage() : PlusContext.getExamplePackage();
        args.put("propertyList", propertyList);
        args.put("domain", domainName);
        args.put("importList", importList);
        args.put("package", examplePackage);
        return args;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/java/";
        String examplePackage = PlusContext.getExamplePackage() == null || PlusContext.getExamplePackage().trim().equals("")
                ? PlusContext.getDomainPackage() : PlusContext.getExamplePackage();
        String examplePath = examplePackage.replaceAll("\\.", "/").concat("/");
        return prefix.concat(examplePath).concat(domainName).concat("Example").concat(".java");
    }
}
