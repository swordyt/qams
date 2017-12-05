package com.qams.util;

import org.apache.log4j.Logger;

public class Log {
	private static Logger log = null;

	public static void debug(Object message, Throwable t) {
		getCallClass();
		log.debug(message, t);
	}

	public static void debug(Object message) {
		getCallClass();
		log.debug(message);
	}

	public static void info(Object message, Throwable t) {
		getCallClass();
		log.info(message, t);
	}

	public static void info(Object message) {
		getCallClass();
		log.info(message);
	}

	public static void warn(Object message, Throwable t) {
		getCallClass();
		log.warn(message, t);
	}

	public static void warn(Object message) {
		getCallClass();
		log.warn(message);
	}

	public static void error(Object message, Throwable t) {
		getCallClass();
		log.error(message, t);
	}

	public static void error(Object message) {
		getCallClass();
		log.error(message);
	}

	public static void fatal(Object message, Throwable t) {
		getCallClass();
		log.fatal(message, t);
	}

	public static void fatal(Object message) {
		getCallClass();
		log.fatal(message);
	}

	private static void getCallClass() {
		StackTraceElement stack[] = Thread.currentThread().getStackTrace();
		log = Logger.getLogger(stack[3].getClassName());
	}
}
