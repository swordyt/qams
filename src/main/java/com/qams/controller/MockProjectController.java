package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.domain.MockProject;
import com.qams.domain.Role;
import com.qams.response.Response;
import com.qams.service.MockProjectService;
import com.qams.util.ParaUtil;

@Controller
@RequestMapping("token/mockproject")
public class MockProjectController {
	@Autowired
	Response response;
	@Autowired
	HttpServletRequest request;
	@Autowired
	MockProjectService mockProjectService;

	@RequestMapping("add")
	@ResponseBody
	public Response addMockProject(MockProject recode) {
		recode.setCreater((Integer) request.getAttribute("userid"));
		if (!ParaUtil.notEmpty(recode.getName())
				|| !ParaUtil.notEmpty(recode.getProjectleader())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("必填字段不能为空");
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		mockProjectService.addMockProject(recode);
		response.setData(recode.getId());
		return response;
	}

	@RequestMapping("getprojects")
	@ResponseBody
	public Response getMockProject(SearchBean search) {
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockProjectService.getMockProject(search));
		return response;
	}

	@RequestMapping("delmockproject")
	@ResponseBody
	public Response delMockProject(MockProject mockProject) {
		if (!ParaUtil.notNull(mockProject.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("id必传！");
			return response;
		}
		mockProject.setStatus(0);
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockProjectService.updateMockProject(mockProject));
		return response;
	}
}
