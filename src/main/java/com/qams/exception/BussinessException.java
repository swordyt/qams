package com.qams.exception;

public class BussinessException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String code = "000008";

	public BussinessException(String message) {
		super(message);
	}

	public String getCode() {
		return code;
	}

}
