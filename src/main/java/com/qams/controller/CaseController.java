package com.qams.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qams.config.Constant;
import com.qams.domain.Case;
import com.qams.response.Response;
import com.qams.service.CaseService;

@Controller
@RequestMapping("/token/cases")
public class CaseController {
	@Autowired
	CaseService caseService;
	@Autowired
	Response response;

	@RequestMapping("/index")
	// 登录后首页
	public ModelAndView testIndex(HttpServletRequest request) {
		// org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		return new ModelAndView("home");
	}

	@RequestMapping("/case")
	// 用例管理页
	public ModelAndView testCase(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("case");
		return mav;
	}

	@ResponseBody
	@RequestMapping("/addCase")
	// 增加case
	public Response addCase(Case cs, HttpServletRequest request)
			throws UnsupportedEncodingException {
		if (cs.getName() == null || cs.getName().equalsIgnoreCase("")) {
			response.setData("名称不能为空！");
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		cs.setUserid((Integer) request.getAttribute("userid"));
		response.setData(caseService.addCase(cs));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}

	@ResponseBody
	@RequestMapping("/updateCase")
	// 更新case
	public Response updateCase(Case cs) throws UnsupportedEncodingException {
		if (cs.getName() == null || cs.getName().equalsIgnoreCase("")) {
			response.setData("名称不能为空！");
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		boolean flag = caseService.updateCase(cs);
		if (flag) {
			response.setData(flag);
			response.setCode(Constant.CODE.RESCODE_SUCCESS);
			response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
			return response;
		}
		response.setData(flag);
		response.setCode(Constant.CODE.RESCODE_FALSE);
		response.setMessage(Constant.MESSAGE.RESMES_FALSE);
		return response;
	}

	@ResponseBody
	@RequestMapping("/casesTree")
	// 获取casetree
	public Response casesTree(Integer id, Integer projectId) {
		if (id == null && projectId == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		response.setData(caseService.getCases(id, projectId));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}

	@ResponseBody
	@RequestMapping("/delCase")
	// 删除case
	public Response delCase(Integer id) {
		if (id == null || id == 0) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		response.setData(caseService.delCase(id));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}
}
