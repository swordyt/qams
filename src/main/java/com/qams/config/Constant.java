package com.qams.config;

public class Constant {
	/**
	 * 数据请求返回码
	 * */
	public class CODE {
		public static final String RESCODE_SUCCESS = "000000"; // 成功
		public static final String RESCODE_FALSE = "000001"; // 成功(有返回信息)
		public static final String RESCODE_EXCEPTION = "000002"; // 请求抛出异常
		public static final String RESCODE_NOLOGIN = "000003"; // 未登陆状态
		public static final String RESCODE_NOEXIST = "000004"; // 查询结果为空
		public static final String RESCODE_NOAUTH = "000005"; // 无操作权限
	}

	/**
	 * message消息
	 * */
	public class MESSAGE {
		public static final String RESMES_SUCCESS = "成功";
		public static final String RESMES_FALSE = "失败";
		public static final String RESMES_EXCEPTION = "服务异常";
		public static final String RESMES_NOLOGIN = "请登陆。";
		public static final String RESMES_NOEXIST = "查询结果为空";
		public static final String RESMES_NOAUTH = "无操作权限";
	}

	/**
	 * jwt
	 * */
	public static final String JWT_ID = "jwt";
	public static final String JWT_SECRET = "7786df7fc3a34e26a61c034d5ec8245d";
	public static final int JWT_TTL = 60 * 60 * 1000; // millisecond
	public static final int JWT_REFRESH_INTERVAL = 55 * 60 * 1000; // millisecond
	public static final int JWT_REFRESH_TTL = 12 * 60 * 60 * 1000; // millisecond
}
