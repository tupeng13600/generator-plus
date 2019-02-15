package com.generator.plus.factory;

import com.generator.plus.context.ArgsFactory;
import com.generator.plus.context.PlusContext;
import com.generator.plus.factory.base.GeneratorFactory;
import com.generator.plus.model.PropertyModel;
import com.generator.plus.constant.Constant;
import com.generator.plus.util.Log;
import com.generator.plus.util.StringUtils;

import java.util.*;

public class XmlExtMapperFactory extends GeneratorFactory {

    private static String SUFFIX = "ExtMapper_sql";

    @Override
    protected String templateName() {
        return Constant.EXT_XML_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return ArgsFactory.initArg(domainName, propertyList, false);
    }

    @Override
    protected String desPath(String domainName) {
        String xmlPath = StringUtils.package2Path(PlusContext.getXmlPackage());
        return Constant.RESOURCE_BASE_PATH.concat(xmlPath).concat(domainName).concat(SUFFIX).concat(Constant.XML_SUFFIX);
    }

    public static void write() {
        new XmlExtMapperFactory().generate();
    }

    @Override
    protected void afterGenerate(String domain) {
        Log.info(domain.concat("ExtMapper.xml"), PlusContext.getDesFilePath());
    }
}
