package com.generator.plus.factory;

import com.generator.plus.context.ArgsFactory;
import com.generator.plus.context.PlusContext;
import com.generator.plus.factory.base.GeneratorFactory;
import com.generator.plus.model.PropertyModel;
import com.generator.plus.util.FreeMarkerUtils;
import com.generator.plus.constant.Constant;
import com.generator.plus.util.Log;
import com.generator.plus.util.StringUtils;

import java.util.List;
import java.util.Map;

public class BaseRepositoryFactory extends GeneratorFactory {

    private static String NAME = "BaseRepository";

    @Override
    protected String templateName() {
        return Constant.BASE_REPOSITORY_TEMPLATE;
    }

    @Override
    protected Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList) {
        return ArgsFactory.initArg(domainName, propertyList, false);
    }

    @Override
    protected String desPath(String domainName) {
        String desPath = StringUtils.package2Path(PlusContext.getBasePackage());
        return Constant.JAVA_BASE_PATH.concat(desPath).concat(domainName).concat(Constant.JAVA_SUFFIX);
    }

    @Override
    public void generate() {
        Map<String, Object> args = ArgsFactory.initArg();
        PlusContext.setDesFilePath(desPath(NAME));
        FreeMarkerUtils.writeFiles(templateName(), args,false);
        afterGenerate("");
    }

    public static void write() {
        new BaseRepositoryFactory().generate();

    }

    @Override
    protected void afterGenerate(String domain) {
        Log.info("BaseRepository.java", PlusContext.getDesFilePath());
    }
}
