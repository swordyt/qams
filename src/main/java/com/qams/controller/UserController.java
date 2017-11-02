package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qams.config.Constant;
import com.qams.response.Response;
import com.qams.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	Response response;

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		System.out.println("index");
		view.setViewName("login");
		return view;
	}

	@ResponseBody
	@RequestMapping("/login")
	public Response login(String email,String password) {
		email=email.trim();
		password=password.trim();
		if(email == null || email.equals("") || password == null
				|| password.equals("")){
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		Object obj=userService.login(email,password);
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
