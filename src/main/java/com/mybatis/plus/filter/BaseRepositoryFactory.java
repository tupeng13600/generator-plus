package com.mybatis.plus.filter;

import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.filter.base.GeneratorFactory;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.FreeMarkerUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseRepositoryFactory extends GeneratorFactory {

    @Override
    protected String templateName() {
        return "BaseRepository.ftl";
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return null;
    }

    @Override
    protected String desPath(String domainName) {
        String prefix = "/src/main/java/";
        String domainPath = PlusContext.getRepositoryPackage().concat(".base").replaceAll("\\.", "/").concat("/");
        return prefix.concat(domainPath).concat(domainName).concat(".java");
    }

    @Override
    public void generate() {
        Map<String, Object> args = new HashMap<>();
        args.put("package", PlusContext.getRepositoryPackage().concat(".base"));
        args.put("mapperPackage", PlusContext.getMapperPackage());
        FreeMarkerUtils.writeFiles(desPath("BaseRepository"), templateName(), args,false);
    }
}
