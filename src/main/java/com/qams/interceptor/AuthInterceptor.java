package com.qams.interceptor;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.qams.annotation.PermissionAuth;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.dao.RoleUrlRelationMapper;
import com.qams.dao.UrlMappingMapper;
import com.qams.domain.RoleUrlRelation;
import com.qams.domain.UrlMapping;
import com.qams.response.Response;
import com.qams.util.Log;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	Response resp;
	@Autowired
	RoleUrlRelationMapper roleUrlRelationDao;
	@Autowired
	UrlMappingMapper urlMappingDao;
	@Autowired
	RoleUrlRelation roleUrlRelation;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Log.info("======Permission start======");
		boolean result = true;
		HttpSession session = request.getSession();
		Integer roleId = (Integer) session.getAttribute("role");// 获取session中保存的权限
		Log.info("用户角色：" + roleId);
		/** 未登录用户无需验证访问权限 */
		if (roleId == null) {
			return result;
		}
		PrintWriter out = null;
		try {
			Log.info("拦截请求：" + request.getServletPath());
			UrlMapping urlMapping = urlMappingDao.selectByUrl(request
					.getServletPath());
			roleUrlRelation.setRoleid(roleId);
			roleUrlRelation.setUrlid(urlMapping.getId());
			if (roleUrlRelationDao.selectByAll(roleUrlRelation).size() < 1) {
				resp.setCode(Constant.CODE.RESCODE_NOAUTH);
				resp.setMessage(Constant.MESSAGE.RESMES_NOAUTH);
				Log.warn("请求未通过：" + request.getServletPath());
				result = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.setCode(Constant.CODE.RESCODE_EXCEPTION);
			resp.setMessage(Constant.MESSAGE.RESMES_EXCEPTION);
			result = false;
		}
		if (!result) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			out = response.getWriter();
			out.append(JSONObject.toJSONString(resp));
			out.close();
		}
		Log.info("======Permission end======");
		return result;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle>>>" + request.getServletPath());
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion>>>" + request.getServletPath());
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterConcurrentHandlingStarted>>>"
				+ request.getServletPath());
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
}
