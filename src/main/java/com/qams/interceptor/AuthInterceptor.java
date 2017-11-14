package com.qams.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.qams.annotation.PermissionAuth;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.response.Response;
import com.qams.util.Log;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	Response resp;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Log.info("======Permission start======");
		HttpSession session = request.getSession();
		int auth = (Integer) session.getAttribute("auth");// 获取session中保存的权限
		Log.info("用户权限：" + auth);

		boolean result = true;
		PrintWriter out = null;
		try {
			// 不需要进行权限校验
			if (!handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			}
			PermissionAuth permissionAuth = ((HandlerMethod) handler)
					.getMethodAnnotation(PermissionAuth.class);
			// 声明的权限为null
			if (permissionAuth != null) {
				for (Permission permission : permissionAuth.auth()) {
					Log.info(permission.getValue() + "权限验证start");
					if ((auth & permission.getValue()) != permission.getValue()) {
						result = false;
						Log.info("需要权限"+permission.getValue() + "，权限验证false");
						resp.setCode(Constant.CODE.RESCODE_NOAUTH);
						resp.setMessage(Constant.MESSAGE.RESMES_NOAUTH);
						break;
					}
					Log.info("需要权限："+permission.getValue() + "，权限验证pass");
				}
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

}
