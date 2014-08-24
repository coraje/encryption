package kr.co.hitcom.taglib;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtil {
	
	/**
	 * Gets the day from now.
	 *
	 * @param amount the amount
	 * @param format the format
	 * @return the day from now
	 * @throws ClassNotFoundException 
	 * @throws NoSuchFieldException 
	 * @throws IllegalAccessException 
	 * @throws SecurityException 
	 * @throws IllegalArgumentException 
	 */
	public static String getDayFromNow(String field, int amount, String format) throws Exception {
		int fieldValue = (Integer)Class.forName("java.util.Calendar").getField(field).get(null);
		Calendar calendar = Calendar.getInstance();
		calendar.add(fieldValue, amount);
		
		DateFormat df = new SimpleDateFormat(format);
		
		return df.format(calendar.getTime());
	}
	
	/**
	 * Gets the hour from now.
	 *
	 * @param amount the amount
	 * @return the hour from now
	 */
	public static int getHourFromNow(int amount) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.HOUR, amount);
		return calendar.get(Calendar.HOUR_OF_DAY);
	}
	
}
