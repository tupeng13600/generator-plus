package com.generator.plus.factory;

import com.generator.plus.context.ArgsFactory;
import com.generator.plus.context.PlusContext;
import com.generator.plus.factory.base.GeneratorFactory;
import com.generator.plus.model.PropertyModel;
import com.generator.plus.util.FreeMarkerUtils;
import com.generator.plus.constant.Constant;
import com.generator.plus.util.StringUtils;
import com.sun.tools.corba.se.idl.constExpr.Plus;

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
        PlusContext.setDesFilePath(desPath(NAME));
        FreeMarkerUtils.writeFiles(templateName(), args,false);
    }

    public static void write(){
        new BaseMapperFactory().generate();
    }

}
