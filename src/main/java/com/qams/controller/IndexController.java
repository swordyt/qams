package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qams.config.Constant;
import com.qams.config.Constant.CODE;
import com.qams.config.Constant.MESSAGE;
import com.qams.response.Response;
import com.qams.service.UserService;

@Controller
public class IndexController {
	@Autowired
	UserService userService;
	@Autowired
	Response response;

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("login");
		return view;
	}
	@ResponseBody
	@RequestMapping("token/upload")
	public Response upload(HttpServletRequest request) {
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData("上传成功");
		return response;
	}
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Response login(String email, String password) {
		if (email == null || password == null || email.trim() == ""
				|| password.trim() == "") {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		email = email.trim();
		password = password.trim();
		if (email == null || email.equals("") || password == null
				|| password.equals("")) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		Object obj = userService.login(email, password);
		if (obj != null) {
			response.setCode(Constant.CODE.RESCODE_SUCCESS);
			response.setData(obj);
			response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		} else {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
		}
		return response;
	}
}
