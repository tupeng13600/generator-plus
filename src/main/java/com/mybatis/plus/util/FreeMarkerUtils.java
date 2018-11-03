package com.mybatis.plus.util;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.Map;

public abstract class FreeMarkerUtils {

    private static final String TEMPLATE_PATH = "src/main/resources/template";

    public static void writeFiles(String filePath, String templateName, Map<String, Object> dataMap, Boolean override) {

        String desPath = System.getProperty("user.dir").concat(filePath);

        if(!override && FileUtil.exist(desPath)) {
            return;
        }


        Configuration configuration = new Configuration(Configuration.VERSION_2_3_0);
        Writer out = null;
        try {
            configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_PATH));
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
