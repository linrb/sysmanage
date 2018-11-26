package com.lin.sysmanage.utils.pdf;

import com.lin.sysmanage.utils.DateUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestPdf {
    public static void main(String[] args) {
        List<String> contentsA = new ArrayList<>();
        contentsA.add("甲方法定代表人：甲方法定代表人");
        contentsA.add("联系电话：123456789");
        contentsA.add("身份证号码：123456789987654321");
        contentsA.add(DateUtil.date2String(new Date(), "yyyy 年  MM 月  dd 日"));

        List<String> contentsB = new ArrayList<>();
        contentsB.add("乙方法定代表人：乙方法定代表人");
        contentsB.add("联系电话：123456789");
        contentsB.add("身份证号码：123456789987654321");
        contentsB.add(DateUtil.date2String(new Date(), "yyyy 年  MM 月  dd 日"));

        String input = "D:/temp/report.pdf";//初始文件
        String tempPath = "D:/temp/report_signed.pdf";//甲方签字盖章后的文件路径

        String filePath = "D:/temp/index.png";//章文件
        String fileOut = "D:/temp/合同.pdf";//最终文件路径
        PdfParser pdfParser = new PdfParser();
        pdfParser.startSign(input, input, tempPath, filePath, PdfParser.SignType.SIGN_A, contentsA, false);//甲方

        pdfParser.startSign(input, tempPath, fileOut, filePath, PdfParser.SignType.SIGN_B, contentsB, true);//乙方
    }
}