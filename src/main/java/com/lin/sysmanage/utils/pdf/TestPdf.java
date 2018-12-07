package com.lin.sysmanage.utils.pdf;

import com.lin.sysmanage.utils.DateUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestPdf {
    public static void main(String[] args) throws Exception {
        List<String> contentsA = new ArrayList<>();
        contentsA.add("甲方法定代表人：甲方法定代表人");
        contentsA.add("联系电话：123456789");
        contentsA.add("身份证号码：123456789987654321");
        contentsA.add(DateUtil.date2String(new Date(), "yyyy年MM月dd日"));

        List<String> contentsB = new ArrayList<>();
        contentsB.add("乙方法定代表人：乙方法定代表人");
        contentsB.add("联系电话：123456789");
        contentsB.add("身份证号码：123456789987654321");
        contentsB.add(DateUtil.date2String(new Date(), "yyyy年MM月dd日"));

        String input = "D:/temp/report.pdf";//初始文件
        String tempPath = "D:/temp/report_signed.pdf";//甲方签字盖章后的文件路径
        String singImgFilePath1 = "D:/temp/index.png";//甲方章文件       
        //System.out.println("文件base64:"+FileUtil.encodeBase64File(singImgFilePath1));
        PdfParser pdfParser = new PdfParser();
        // pdfParser.startSign(input, input, tempPath, singImgFilePath1, PdfParser.SignType.SIGN_A, contentsA, false);//甲方
        Thread.sleep(100);
        String singImgFilePath2 = "D:/temp/index1.png";//甲方章文件
        String fileOut = "D:/temp/最终合同.pdf";//最终文件路径
        // pdfParser.startSign(input, tempPath, fileOut, singImgFilePath2, PdfParser.SignType.SIGN_B, contentsB, true);//乙方
        String cachList = "user,menu,role";
        List<String> list = new ArrayList<>();
        String[] arrCach = cachList.split(",");
        for (String c : arrCach) {
            System.out.println("缓存集合:" + c);
            list.add(c);
        }
    }
}
