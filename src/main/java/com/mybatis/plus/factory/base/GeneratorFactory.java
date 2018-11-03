package com.mybatis.plus.factory.base;

import com.mybatis.plus.context.DataSourceConfig;
import com.mybatis.plus.context.PlusContext;
import com.mybatis.plus.model.PropertyModel;
import com.mybatis.plus.util.FreeMarkerUtils;
import com.mybatis.plus.util.JDBCUtil;

import java.util.List;
import java.util.Map;

public abstract class GeneratorFactory {

    protected static Map<String, List<PropertyModel>> domainMap = null;

    protected synchronized void initObjects() {
        if (null == domainMap) {
            DataSourceConfig dataSource = PlusContext.getDataSource();
            try (JDBCUtil jdbcUtil = JDBCUtil.build(dataSource)) {
                domainMap = jdbcUtil.getDomainList();
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
            FreeMarkerUtils.writeFiles(desPath(domainName), templateName, templateArgs, override == null ? true : override);
        });
    }

}
