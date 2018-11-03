package com.mybatis.plus.factory;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public class ExtXmlMapperFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "XmlExtMapper.ftl";
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        Map<String, Object> args = new HashMap<>();
        args.put("domain", domainName);
        args.put("mapperPackage", PlusContext.getMapperPackage());
        args.put("override", false);
        return args;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/resources/";
        String xmlPath = PlusContext.getXmlPackage().concat(".ext").replaceAll("\\.", "/").concat("/");
        return prefix.concat(xmlPath).concat(domainName).concat("ExtMapper").concat(".xml");
    }
}
