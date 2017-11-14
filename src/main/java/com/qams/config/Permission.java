package com.qams.config;

public enum Permission {
	CC(1), // create case
	CP(2), // create project
	/**
	 *edit case
	 * */
	EC(3);
	private int auth;

	private Permission(int auth) {
		this.auth = (int) Math.pow(2, auth);
	}

	public int getValue() {
		return auth;
	}
}
