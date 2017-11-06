package com.qams.interceptor;

import io.jsonwebtoken.Claims;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.qams.config.UrlMapping;
import com.qams.dao.UserMapper;
import com.qams.domain.UserKey;
import com.qams.response.Response;
import com.qams.util.JwtUtil;

public class TestInterceptor extends HandlerInterceptorAdapter {
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
		boolean flag = true;
		Integer userId=null;
		try {
			String token = request.getParameter("tokenId");// 获取客服端token
			if (token == null) {// 如果为携带tokenId参数，将从cookie中获取
				Cookie[] cookies = request.getCookies();
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("tokenId")) {
						token = cookie.getValue();
					}
				}

			}
			if (token == null) {
				flag = false;
			} else {
				Claims claims = jwt.parseJWT(token);
				Long expTime = Long.parseLong(claims.get("exp") + "") * 1000; // 获取token中保存过期时间
				userId = Integer.parseInt(jwt.parseSubject(jwt,token, "userId")+"");
				Long now = System.currentTimeMillis();
				userKey.setId(userId);
				// 查询userid在数据库中是否存在
				// 判断token时间是否过期
				if (userDao.selectByPrimaryKey(userKey) == null
						|| (now - expTime) > 0) {
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
		}
		request.setAttribute("userid", userId);
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// System.out.println(jwt.parseJWT(jwtString).get("sub"));
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// Claims claims = jwt.parseJWT(jwtString);
		super.afterCompletion(request, response, handler, ex);
	}
}
