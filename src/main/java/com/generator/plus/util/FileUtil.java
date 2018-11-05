package com.generator.plus.util;

import java.io.File;
import java.io.IOException;

public class FileUtil {

    public static Boolean exist(String path) {
        File file = new File(path);
        return file.exists();
    }

    public static File createIfNotExist(String path) throws IOException {
        File file = new File(path);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        if (!file.exists() && !file.createNewFile()) {
            System.out.println("文件创建失败....".concat(path));
        }
        return file;
    }

}
