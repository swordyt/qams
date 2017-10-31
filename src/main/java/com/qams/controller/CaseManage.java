package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cases")
public class CaseManage {
	@RequestMapping("/index")
	public ModelAndView  testIndex(HttpServletRequest request) {
//		org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver
		System.out.println("index");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
	}
	@RequestMapping("/case")
	public ModelAndView  testCase(HttpServletRequest request) {
//		org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver
		System.out.println("case");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("case");
        return mav;
	}
}
