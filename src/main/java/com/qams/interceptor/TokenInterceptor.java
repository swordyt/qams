package com.qams.interceptor;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import io.jsonwebtoken.Claims;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.qams.config.UrlMapping;
import com.qams.dao.UserMapper;
import com.qams.domain.User;
import com.qams.domain.UserKey;
import com.qams.response.Response;
import com.qams.util.JwtUtil;
import com.qams.util.NetworkUtil;

public class TokenInterceptor extends HandlerInterceptorAdapter {
	private static final Logger Log = Logger.getLogger(TokenInterceptor.class);
	@Autowired
	JwtUtil jwt;
	@Autowired
	UserMapper userDao;
	@Autowired
	UserKey userKey;
	String jwtString;
	@Autowired
	Response res;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Log.info("======Token start======");
		recodeLog(request);
		boolean flag = true;
		Integer userId = null;
		User user = null;
		try {
			String token = request.getParameter("tokenId");// 获取客服端token
			if (token == null) {// 如果为携带tokenId参数，将从cookie中获取
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("tokenId")) {
							token = cookie.getValue();
						}
					}
				}

			}
			if (token == null) {
				flag = false;
			} else {
				Claims claims = jwt.parseJWT(token);
				Long expTime = Long.parseLong(claims.get("exp") + "") * 1000; // 获取token中保存过期时间
				userId = Integer.parseInt(jwt
						.parseSubject(jwt, token, "userId") + "");
				Long now = System.currentTimeMillis();
				userKey.setId(userId);
				// 查询userid在数据库中是否存在
				// 判断token时间是否过期
				user = userDao.selectByPrimaryKey(userKey);
				if (user == null || (now - expTime) > 0) {
					flag = false;
				}
			}
			//
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		if (!flag) {
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			response.sendRedirect(basePath + UrlMapping.IndexController_Index);
		} else {
			request.setAttribute("userid", userId);
			HttpSession session = request.getSession();
			session.setAttribute("userid", userId);
			session.setAttribute("auth", user.getAuth());
			Log.info("userid=" + userId);
			Log.info("用户权限：" + user.getAuth());
		}
		Log.info("======Token end======");
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println(handler);
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// Claims claims = jwt.parseJWT(jwtString);
		super.afterCompletion(request, response, handler, ex);
	}

	private void recodeLog(HttpServletRequest request) throws IOException {
		Log.info(request.getRequestURL());
		String ip = NetworkUtil.getIpAddress(request);
		Log.info("ip=" + ip);
		String parameter = JSONObject.toJSONString(request.getParameterMap());
		Log.info("parameter=" + parameter);
	}
}
