package com.mybatis.plus.factory;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.factory.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.FreeMarkerUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseMapperFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "BaseMapper.ftl";
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return null;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/java/";
        String domainPath = PlusContext.getMapperPackage().concat(".base").replaceAll("\\.", "/").concat("/");
        return prefix.concat(domainPath).concat(domainName).concat(".java");
    }

    @Override
    public void generate() {
        Map<String, Object> args = new HashMap<>();
        args.put("package", PlusContext.getMapperPackage().concat(".base"));
        FreeMarkerUtils.writeFiles(desPath("BaseMapper"), templateName(), args,false);
    }
}
