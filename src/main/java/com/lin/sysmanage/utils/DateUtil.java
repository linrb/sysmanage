package com.lin.sysmanage.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    
    private static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";
    
    /**
     * 将date类型准成指定format格式的字符串
     *
     * @param date    日期
     * @param format 指定格式
     * @return
     */
    public static String date2String(Date date, String format) {
        String dateStr = new SimpleDateFormat(format).format(date.getTime());
        return dateStr;
    }

    /**
     * 将字符串转成指定格式的date类型
     *
     * @param dateStr 日期
     * @param format  指定格式
     * @return
     */
    public static Date string2Date(String dateStr, String format) {
        Date strDate = null;
        try {
            strDate = new SimpleDateFormat(format).parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return strDate;
    }
   

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss"
     */
    public static String getDate(String pattern) {       
        String dateStr = new SimpleDateFormat(pattern).format(new Date());
        return  dateStr;
    }

}
