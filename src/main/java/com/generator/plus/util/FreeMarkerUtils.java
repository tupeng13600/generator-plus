package com.generator.plus.util;

import com.generator.plus.context.PlusContext;
import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.NullCacheStorage;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;
import java.util.Map;

public abstract class FreeMarkerUtils {

    private static Configuration configuration = new Configuration(Configuration.VERSION_2_3_0);

    static {
        configuration.setTemplateLoader(new ClassTemplateLoader(FreeMarkerUtils.class, "/template"));
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        configuration.setCacheStorage(NullCacheStorage.INSTANCE);
    }

    public static void writeFiles(String templateName, Map<String, Object> dataMap, Boolean override) {

        String desPath = PlusContext.getDesFilePath();

        if (!override && FileUtil.exist(desPath)) {
            return;
        }
        Writer out = null;
        try {
            Template template = configuration.getTemplate(templateName);
            File desFile = FileUtil.createIfNotExist(desPath);
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(desFile)));
            template.process(dataMap, out);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != out) {
                    out.flush();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
