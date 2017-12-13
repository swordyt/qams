package com.qams.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import com.qams.exception.BussinessException;
import com.qams.response.Response;

public class ExceptionHandler implements HandlerExceptionResolver {
	@Resource
	Response resp;

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = null;
		if (ex instanceof BussinessException) {
			resp.setCode(((BussinessException) ex).getCode());
			resp.setCode(ex.getMessage());
		}
		try {
			out = response.getWriter();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
