package com.lin.sysmanage.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    /**
     * 将date类型准成指定format格式的字符串
     *
     * @param day    日期
     * @param format 指定格式
     * @return
     */
    public static String date2String(Date day, String format) {
        String dateStr = new SimpleDateFormat(format).format(day.getTime());
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

}
