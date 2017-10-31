package com.qams.interceptor;

import io.jsonwebtoken.Claims;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.qams.bean.User;
import com.qams.config.Constant;
import com.qams.dao.BcdcSignBankcardMapper;
import com.qams.domain.BcdcSignBankcard;
import com.qams.util.JwtUtil;

public class TestInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	JwtUtil jwt;
	@Autowired
	User user;
	String jwtString;
	@Autowired
	BcdcSignBankcardMapper map;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		user.setId(10000011);
		jwtString = jwt.createJWT(Constant.JWT_ID, jwt.generalSubject(user),
				Constant.JWT_TTL);
		System.out.println(jwtString);
		BcdcSignBankcard bean = map.selectByPrimaryKey("20161130000000000001");
		System.out.println("BCDC" + bean.getCardIdxNo());
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println(jwt.parseJWT(jwtString).get("sub"));
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		Claims claims = jwt.parseJWT(jwtString);
		super.afterCompletion(request, response, handler, ex);
	}
}
