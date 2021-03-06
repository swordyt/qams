package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qams.response.Response;

@Controller
@RequestMapping("token/system")
public class SystemController {
	@Autowired
	HttpServletRequest request;

	@RequestMapping("systemmange")
	public ModelAndView systemMange(String url) {
		ModelAndView view = new ModelAndView("system");
		System.out.println(request.getParameter("url"));
		if (url != null) {
			view.setViewName("system/" + url);
		}
		return view;
	}

}
