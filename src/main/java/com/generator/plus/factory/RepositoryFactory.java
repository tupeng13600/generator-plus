package com.generator.plus.factory;

import com.generator.plus.context.ArgsFactory;
import com.generator.plus.context.PlusContext;
import com.generator.plus.factory.base.GeneratorFactory;
import com.generator.plus.model.PropertyModel;
import com.generator.plus.constant.Constant;
import com.generator.plus.util.Log;
import com.generator.plus.util.StringUtils;

import java.util.*;

public class RepositoryFactory extends GeneratorFactory {

    private static String SUFFIX = "Repository";

    @Override
    protected String templateName() {
        return Constant.REPOSITORY_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return ArgsFactory.initArg(domainName, propertyList);
    }

    @Override
    protected String desPath(String domainName) {
        String examplePath = StringUtils.package2Path(PlusContext.getRepositoryPackage());
        return Constant.JAVA_BASE_PATH.concat(examplePath).concat(domainName).concat(SUFFIX).concat(Constant.JAVA_SUFFIX);
    }

    public static void write() {
        new RepositoryFactory().generate();
    }

    @Override
    protected void afterGenerate(String domain) {
        Log.info(domain.concat("Repository.java"), PlusContext.getDesFilePath());
    }
}