package com.mybatis.plus.factory;

import com.mybatis.plus.constant.Constant;
import com.mybatis.plus.context.ArgsFactory;
import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.StringUtils;

import java.util.*;

public class XmlMapperFactory extends GeneratorFactory {

    private static String SUFFIX = "Mapper";

    @Override
    protected String templateName() {
        return Constant.XML_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        Map<String, Object> args = ArgsFactory.initArg(domainName, propertyList);
        args.put("tableName", PlusContext.getTable(domainName));
        return args;
    }

    @Override
    protected String desPath(String domainName) {
        String xmlPath = StringUtils.package2Path(PlusContext.getXmlPackage());
        return Constant.RESOURCE_BASE_PATH.concat(xmlPath).concat(domainName).concat(SUFFIX).concat(Constant.XML_SUFFIX);
    }

    public static void write() {
        new XmlMapperFactory().generate();
    }
}
