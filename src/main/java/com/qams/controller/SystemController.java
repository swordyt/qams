package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("token/system")
public class SystemController {
	@RequestMapping("systemmange")
	public ModelAndView systemMange(HttpServletRequest request,String url) {
		ModelAndView view=new ModelAndView("system");
		System.out.println(request.getParameter("url"));
		if(url !=null){
			view.setViewName("system/"+url);
		}
		return view;
	}
}
