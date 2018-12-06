package com.lin.sysmanage.utils;

import org.apache.log4j.Logger;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.File;
import java.io.FileInputStream;
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

    /**
     * 将文件转成base64 字符串
     * @param path:文件路径
     * @return base64 字符串
     * @throws Exception
     */
    public static String encodeBase64File(String path) throws Exception {
        File file = new File(path);
        FileInputStream inputFile = new FileInputStream(file);
        byte[] buffer = new byte[(int) file.length()];
        inputFile.read(buffer);
        inputFile.close();
        return new BASE64Encoder().encode(buffer);
    }

    /**
     * 将base64字符解码保存文件
     *
     * @param base64Code
     * @param targetPath
     * @throws Exception
     */
    public static void decoderBase64File(String base64Code, String targetPath)
            throws Exception {       
        byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
        FileOutputStream out = new FileOutputStream(targetPath);
        out.write(buffer);
        out.close();
    }
}