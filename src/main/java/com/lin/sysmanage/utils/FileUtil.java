package com.lin.sysmanage.utils;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.FileOutputStream;

public class FileUtil {
    private static Logger log = Log4jUtils.getLog(FileUtil.class);

    public static boolean uploadFile(byte[] file, String filePath) throws Exception {
        String tempPath = filePath.substring(0, filePath.lastIndexOf("/"));
        File targetFile = new File(tempPath);
        if (!targetFile.exists()) {
            boolean out = targetFile.mkdirs();
            if (out) {
                log.info(filePath + "上传成功！");
            } else {
                log.info(filePath + "上传失败！");
            }
        }

        FileOutputStream out1 = new FileOutputStream(filePath);
        out1.write(file);
        out1.flush();
        out1.close();
        File f = new File(filePath);
        return f.exists();
    }
}
