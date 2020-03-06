package com.lin.sysmanage.utils.pdf;

import com.lin.sysmanage.utils.DateUtil;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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


        String d1 = "2011-12-1";
        String d2 = "2010-12-30";
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.setTime(sdf.parse(d1));
        int year1 = c.get(Calendar.YEAR);
        int month1 = c.get(Calendar.MONTH);

        c.setTime(sdf.parse(d2));
        int year2 = c.get(Calendar.YEAR);
        int month2 = c.get(Calendar.MONTH);

        int result;
        if(year1 == year2) {
            result = month1 - month2;
        } else {
            result = 12*(year1 - year2) + month1 - month2;
        }
        System.out.println(result);


        //SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
        //跨年不会出现问题
        //如果时间为：2016-03-18 11:59:59 和 2016-03-19 00:00:01的话差值为 0
        Date fDate=sdf.parse(d2);
        Date oDate=sdf.parse(d1);
        System.out.println((oDate.getTime()-fDate.getTime()));
        long days=(oDate.getTime()-fDate.getTime())/(1000*3600*24);
        System.out.println(days);
    }
}
