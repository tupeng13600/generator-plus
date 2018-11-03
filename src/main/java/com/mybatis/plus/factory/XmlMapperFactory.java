package com.mybatis.plus.factory;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public class XmlMapperFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "XmlMapper.ftl";
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
        args.put("domainPackage", PlusContext.getDomainPackage());
        args.put("examplePackage", PlusContext.getExamplePackage());
        args.put("mapperPackage", PlusContext.getMapperPackage());
        args.put("tableName", PlusContext.getTable(domainName));
        return args;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/resources/";
        String xmlPath = PlusContext.getXmlPackage().replaceAll("\\.", "/").concat("/");
        return prefix.concat(xmlPath).concat(domainName).concat("Mapper").concat(".xml");
    }
}
