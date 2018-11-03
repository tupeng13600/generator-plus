package com.mybatis.plus.factory;

import com.mybatis.plus.constant.Constant;
import com.mybatis.plus.context.ArgsFactory;
import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.StringUtils;

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

}
