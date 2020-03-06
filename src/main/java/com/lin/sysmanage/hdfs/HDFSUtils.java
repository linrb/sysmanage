package com.lin.sysmanage.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Hadoop HDFS Java API 操作
 * Created by LinRB on 2019/7/24.
 */
public class HDFSUtils {
    private static String HDFSUri = "hdfs://localhost:9000";

    public static Configuration getCOnfig() {
        //get Configuration
        Configuration config = new Configuration();
        config.set("fs.defaultFS", HDFSUri);
        return config;
    }

    public static FileSystem getFileSystem() throws IOException {
        Configuration config = getCOnfig();
        FileSystem fileSystem = FileSystem.get(config);
        return fileSystem;
    }

    public static void readFile(FileSystem fileSystem, String fileName) throws IOException {
        //real path
        Path realPath = new Path(fileName);
        //open file
        FSDataInputStream input = fileSystem.open(realPath);
        try {
            //read io
            IOUtils.copyBytes(input, System.out, 4096, false);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //close io
            IOUtils.closeStream(input);
        }
    }

    /**
     * 从 HDFS 下载文件到本地
     *
     * @param srcFile  HDFS文件路径
     * @param dsetFile 本地路径
     */
    public static void downloadFile(String srcFile, String dsetFile) {
        //构建filesystem
        try {
            FileSystem fs = getFileSystem();
            InputStream is = fs.open(new Path(srcFile));
            IOUtils.copyBytes(is, new FileOutputStream(new File(dsetFile)), 4096, true);
            fs.close();
            System.out.println("下载完成..." + dsetFile);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 获取文件系统
     *
     * @param path
     * @return
     */
    public static List<String> getFileList(String path) {
        List<String> fileList = null;
        try {
            fileList = new ArrayList<>();
            FileSystem fs = getFileSystem();
            Path realPath = new Path(path);
            if (fs.exists(realPath)) {
                FileStatus file[] = fs.listStatus(realPath);
                for (FileStatus fileStatus : file) {
                    String strFilePath = fileStatus.getPath().toString();
                    if (fileStatus.isFile()) {
                        fileList.add(strFilePath);
                    } else if (fileStatus.isDirectory()) {
                        // dir
                        fileList.add(strFilePath);
                    } else if (fileStatus.isSymlink()) {
                        // is s symlink in linux
                        fileList.add(strFilePath);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileList;
    }

    /**
     * 本地文件上传至 HDFS
     *
     * @param srcFile  源文件 路径
     * @param destPath hdfs路径
     */
    public static void uploadLocalFileToHDFS(String srcFile, String destPath) throws Exception {

        FileInputStream fis = new FileInputStream(new File(srcFile));//读取本地文件

        FileSystem fs = getFileSystem();
        OutputStream os = fs.create(new Path(destPath));
        //copy
        IOUtils.copyBytes(fis, os, 4096, true);   //ture 结束后关闭fis和os
        System.out.println("拷贝完成...");
        fs.close();
    }

    /**
     * 删除文件或者文件目录
     *
     * @param path
     */
    public static void deleteHDFSFile(String path) throws IOException {
        FileSystem fs = getFileSystem();
        path = HDFSUri + path;

        try {
            fs.delete(new Path(path), true);
            System.out.println(path + "删除完成...");
        } catch (IllegalArgumentException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    /**
     * 创建文件目录
     *
     * @param path 文件路径
     */
    public static void mkdir(String path) {
        try {
            FileSystem fs = getFileSystem();
            System.out.println("filepath=" + path);
            fs.mkdirs(new Path(path));
            fs.close();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        try {
            //downloadFile("/user/技能图谱 图片版.zip", "D://技能图谱图片版.zip");
            //copyFileToHDFS("D:\\SendMess.rar","/user/SendMess.rar");
            //rmdir("/user/SendMess.rar");
            List<String> fileList = getFileList("/user/");
            for (String file : fileList) {
                System.out.println(file);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}

