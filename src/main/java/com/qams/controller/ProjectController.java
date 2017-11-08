package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.config.Constant;
import com.qams.response.Response;
import com.qams.service.ProjectService;

@Controller
@RequestMapping("token/project")
public class ProjectController {
	@Autowired
	ProjectService projectService;
	@Autowired
	Response response;

	@ResponseBody
	@RequestMapping("getprojects")
	public Response getProjects(HttpServletRequest request) {
		Object obj = request.getAttribute("userid");
		if (obj == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(projectService.getProjects((Integer) obj));
		return response;
	}
}
