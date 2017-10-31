package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CaseManage {
	@RequestMapping("/case")
	public ModelAndView  testCase(HttpServletRequest request) {
		String path = request.getParameter("path") + "";
        ModelAndView mav = new ModelAndView();
        mav.setViewName(path);
        return mav;
	}
}
