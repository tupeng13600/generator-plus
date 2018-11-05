package com.generator.plus.factory.base;

import com.generator.plus.context.DataSourceConfig;
import com.generator.plus.context.PlusContext;
import com.generator.plus.model.PropertyModel;
import com.generator.plus.util.FreeMarkerUtils;
import com.generator.plus.util.JDBCUtil;

import java.util.List;
import java.util.Map;

public abstract class GeneratorFactory {

    protected static Map<String, List<PropertyModel>> domainMap = null;

    protected synchronized void initObjects() {
        if (null == domainMap) {
            DataSourceConfig dataSource = PlusContext.getDataSource();
            try (JDBCUtil jdbcUtil = JDBCUtil.build(dataSource)) {
                domainMap = jdbcUtil.getDomainList(PlusContext.getTableNames());
            }
        }
    }

    protected abstract String templateName();

    protected abstract Map<String, Object> templateArgs(String domainName, List<PropertyModel> propertyList);

    protected abstract String desPath(String domainName);

    public void generate() {
        initObjects();
        domainMap.forEach((domainName, fieldList) -> {
            String templateName = templateName();
            Map<String, Object> templateArgs = templateArgs(domainName, fieldList);
            Boolean override = (Boolean) templateArgs.get("override");
            PlusContext.setDesFilePath(desPath(domainName));
            FreeMarkerUtils.writeFiles(templateName, templateArgs, override == null ? true : override);
        });
    }

}
