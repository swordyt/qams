package com.qams.util;

public class ParaUtil {
	public static boolean notNull(Object o) {
		if (o != null) {
			return true;
		}
		return false;
	}

	public static boolean notEmpty(String str) {
		if (notNull(str) && !str.trim().equals("")) {
			return true;
		}
		return false;
	}
}
