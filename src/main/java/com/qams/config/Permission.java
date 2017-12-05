package com.qams.config;

public enum Permission {
	/**
	 * 创建用例
	 * */
	CC(1),
	/**
	 * 更新用例
	 * */
	UC(2),
	/**
	 * upload
	 * */
	UL(3),
	/**
	 * 创建项目
	 * */
	CP(4),
	/**
	 * 更新项目
	 * */
	UP(5),
	/**
	 * 创建用户
	 * */
	CU(6),
	/**
	 * 创建角色
	 * */
	CR(7),
	/**
	 * 更新用户
	 * */
	UU(8),
	/**
	 * 更新角色
	 * */
	UR(9),
	/**
	 * 删除用例
	 * */
	DC(10);
	private int auth;

	private Permission(int auth) {
		this.auth = auth;
	}

	public int getValue() {
		return auth;
	}
}
