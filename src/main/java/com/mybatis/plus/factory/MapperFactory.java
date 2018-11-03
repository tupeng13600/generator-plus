package com.mybatis.plus.factory;

import com.mybatis.plus.constant.Constant;
import com.mybatis.plus.context.ArgsFactory;
import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.StringUtils;

import java.util.*;

public class MapperFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return Constant.MAPPER_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return ArgsFactory.initArg(domainName, propertyList);
    }

    @Override
    protected String desPath(String domainName) {
        String examplePath = StringUtils.package2Path(PlusContext.getMapperPackage());
        return Constant.JAVA_BASE_PATH.concat(examplePath).concat(domainName).concat("Mapper").concat(Constant.JAVA_SUFFIX);
    }
}
