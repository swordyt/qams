package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qams.config.Constant;
import com.qams.domain.Case;
import com.qams.response.Response;
import com.qams.service.CaseService;

@Controller
@RequestMapping("/cases")
public class CaseController {
	@Autowired
	CaseService caseService;
	@Autowired
	Response response;
	@RequestMapping("/index")
	public ModelAndView testIndex(HttpServletRequest request) {
		// org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver
		System.out.println("index");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/case")
	public ModelAndView testCase(HttpServletRequest request) {
		System.out.println("case");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("case");
		return mav;
	}

	@ResponseBody
	@RequestMapping("/addCase")
	public Response addCase(Case cs,HttpServletRequest request) {
		cs.setUserid((Integer)request.getAttribute("userid"));
		response.setData(caseService.addCase(cs));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}
	@ResponseBody
	@RequestMapping("/updateCase")
	public Response updateCase(Case cs,HttpServletRequest request) {
		cs.setUserid((Integer)request.getAttribute("userid"));
		response.setData(caseService.addCase(cs));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}
	@ResponseBody
	@RequestMapping("/casesTree")
	public Response casesTree() {
		response.setData(caseService.getCases());
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}
}
