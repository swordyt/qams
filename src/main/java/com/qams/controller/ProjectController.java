package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.annotation.PermissionAuth;
import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.dao.ProjectMapper;
import com.qams.domain.Project;
import com.qams.response.Response;
import com.qams.service.ProjectService;
import com.qams.util.ParaUtil;

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
	public Response getProjects(SearchBean search) {
		if (search.getSearch() == null || search.getSearch().equals("")) {
			search.setSearch(null);
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(projectService.getProjects(search));
		return response;
	}

	@ResponseBody
	@RequestMapping("addproject")
	public Response addProject(Project p, String rootTree) {
		if (rootTree == null || p == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		p.setStatus(1);
		p.setCreater((Integer) request.getAttribute("userid"));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(projectService.addProject(p, rootTree));
		return response;
	}

	@ResponseBody
	@RequestMapping("delproject")
	public Response delProject(Project p) {
		if (!ParaUtil.notNull(p.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		p.setStatus(0);
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(projectService.updateProject(p));
		return response;
	}

	@ResponseBody
	@RequestMapping("updateproject")
	public Response updateProject(Project p) {
		if (!ParaUtil.notNull(p.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(projectService.updateProject(p));
		return response;
	}

}
