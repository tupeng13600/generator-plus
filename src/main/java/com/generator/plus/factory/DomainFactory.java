package com.generator.plus.factory;

import com.generator.plus.context.ArgsFactory;
import com.generator.plus.context.PlusContext;
import com.generator.plus.factory.base.GeneratorFactory;
import com.generator.plus.model.PropertyModel;
import com.generator.plus.constant.Constant;
import com.generator.plus.util.Log;
import com.generator.plus.util.StringUtils;

import java.util.*;

public class DomainFactory extends GeneratorFactory {


    @Override
    protected String templateName() {
        return Constant.DOMAIN_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return ArgsFactory.initArg(domainName, propertyList);
    }


    @Override
    protected String desPath(String domainName) {
        String domainPath = StringUtils.package2Path(PlusContext.getDomainPackage());
        return Constant.JAVA_BASE_PATH.concat(domainPath).concat(domainName).concat(Constant.JAVA_SUFFIX);
    }

    public static void write() {
        new DomainFactory().generate();
    }

    @Override
    protected void afterGenerate(String domain) {
        Log.info(domain.concat(".java"), PlusContext.getDesFilePath());
    }

}
