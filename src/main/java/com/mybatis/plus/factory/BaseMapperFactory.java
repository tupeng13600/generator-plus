package com.mybatis.plus.factory;

import com.mybatis.plus.constant.Constant;
import com.mybatis.plus.context.ArgsFactory;
import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.FreeMarkerUtils;
import com.mybatis.plus.util.StringUtils;

import java.util.List;
import java.util.Map;

public class BaseMapperFactory extends GeneratorFactory {

    private static String NAME = "BaseMapper";

    @Override
    protected String templateName() {
        return Constant.BASE_MAPPER_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return null;
    }

    @Override
    protected String desPath(String domainName) {
        String domainPath = StringUtils.package2Path(PlusContext.getMapperPackage().concat(Constant.BASE_PACKAGE));
        return Constant.JAVA_BASE_PATH.concat(domainPath).concat(domainName).concat(Constant.JAVA_SUFFIX);
    }

    @Override
    public void generate() {
        Map<String, Object> args = ArgsFactory.initArg();
        FreeMarkerUtils.writeFiles(desPath(NAME), templateName(), args,false);
    }

    public static void write(){
        new BaseMapperFactory().generate();
    }

}
