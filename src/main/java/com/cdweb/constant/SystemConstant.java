package com.cdweb.constant;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Date;

public class SystemConstant {
	public static final int ACTIVATE_STATUS = 1;
	public static final int INACTIVATE_STATUS = 0;
	public static final int DEFAULT_OFFSET = 0;
	public static final int DEFAULT_NUM_ITEM = 10;
	public static int pageNumber = 0;
	public static final Long MANAGER_ID = 1L;
	public static final Long EMPLOYEE_ID = 2L;
	public static final String CURRENT_YEAR_MONTH_1ST = new SimpleDateFormat("yyyy-MM").format(new Date()) + "-01" + " 00:00:00";
	public static final String CURRENT_YEAR_MONTH_DAY = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	public static final String CURRENT_YEAR_MONTH_1ST_url = new SimpleDateFormat("yyyy-MM").format(new Date()) + "-01" + "%2000:00:00";
	public static final String CURRENT_YEAR_MONTH_DAY_url = new SimpleDateFormat("yyyy-MM-dd%20HH:mm:ss").format(new Date());

	public static void main(String[] args) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date startDay = formater.parse(CURRENT_YEAR_MONTH_1ST);
			System.out.println(startDay);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}
