package kr.co.hitcom.taglib;

import java.util.Date;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;

public class StringConvert {

    /**
     * 리턴 문자를 br 태그로 변환 한다.
     * 
     * @param comment 변환할 스트링
     * @return 변환된 스트링
     */
    public static String enterToBr(String comment) {
        
        if (comment == null) {
            return "";
        }
        
        comment = StringUtils.replace(comment, "\r\n", "</br>");
        comment = StringUtils.replace(comment, "\n", "</br>");
        
        return comment;
    }
    
    /**
     * 리턴 문자를 공백 문자로 쌍따옴표를 장은 따옴표로 변환 한다.
     *
     * @param comment 변환할 문자열.
     * @return 변환된 문자열.
     */
    public static String convertHtmlSp(String comment) {

        if(comment == null) {
          comment = "";
          return comment;
        }

        comment = StringUtils.replace(comment, "\"", "'");
        comment = StringUtils.replace(comment, "\r\n", " ");
        comment = StringUtils.replace(comment, "\n", " ");
        return comment;
    }
    
    /**
     * long 타입의 시간을 String으로 변환.
     *
     * @param time 1970년 1월 1일 부터의 시간
     * @param pattern 변환 패턴
     * @return 변환된 문자열
     */
    public static String getStrDate(long time, String pattern) {
        Date date = new Date();
        date.setTime(time);
        
        if (date == null) {
            return "";
        }
        
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (pattern, java.util.Locale.KOREA);
        String dateString = formatter.format(date);
        return dateString;
    }
    
    /**
     * Escape java script.
     *
     * @param comment the comment
     * @return the string
     */
    public static String escapeJavaScript(String comment) {
        if(comment == null) {
            comment = "";
            return comment;
        }
        
        comment = StringEscapeUtils.escapeJavaScript(comment);
        return comment;
    }
}
