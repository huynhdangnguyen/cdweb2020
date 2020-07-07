package com.cdweb.common;

public class Convert {
	public static boolean convertToBoolean(Integer i) {
		return i != 0 ? true : false;
	}
	
	public static Integer convertToInteger(Boolean i) {
		return i ? 1 : 0;
	}
}
