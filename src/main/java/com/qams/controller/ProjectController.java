package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.config.Constant;
import com.qams.dao.ProjectMapper;
import com.qams.domain.Project;
import com.qams.response.Response;
import com.qams.service.ProjectService;

@Controller
@RequestMapping("token/project")
public class ProjectController {
	@Autowired
	ProjectService projectService;
	@Autowired
	Response response;
	@Autowired
	HttpServletRequest request;

	@ResponseBody
	@RequestMapping("getprojects")
	public Response getProjects() {
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

	@ResponseBody
	@RequestMapping("addproject")
	public Response addProject(Project p,
			String rootTree) {
		if (rootTree == null || p == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		p.setStatus(1);
		p.setUserid((Integer) request.getAttribute("userid"));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(projectService.addProject(p, rootTree));
		return response;
	}
}
