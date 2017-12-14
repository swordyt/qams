package com.qams.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.domain.Role;
import com.qams.response.Response;
import com.qams.service.RoleService;
import com.qams.util.ParaUtil;

@Controller
@RequestMapping("/token/role")
public class RoleController {
	@Resource
	RoleService roleService;
	@Resource
	HttpServletRequest request;
	@Resource
	Response response;
	@Autowired
	Role role;

	@ResponseBody
	@RequestMapping("addrole")
	public Response addRole(Role role, String permissionJson,
			String projectJson) {
		if (!ParaUtil.notEmpty(role.getName()) || !ParaUtil.notEmpty(permissionJson)
				|| !ParaUtil.notEmpty(projectJson)) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("必填字段不能为空！");
			return response;
		}
		JSONArray urlList = JSON.parseArray(permissionJson);
		JSONArray projectList = JSON.parseArray(projectJson);
		Iterator<Object> itUrl = urlList.iterator();
		Iterator<Object> itPro = projectList.iterator();
		List<Integer> urlIds = new ArrayList<Integer>();
		List<Integer> proIds = new ArrayList<Integer>();
		while (itUrl.hasNext()) {
			String urlId = (String) itUrl.next();
			urlIds.add(Integer.parseInt(urlId));
		}
		while (itPro.hasNext()) {
			String proId = (String) itPro.next();
			proIds.add(Integer.parseInt(proId));
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(roleService.addRole((Integer) request.getAttribute(Constant.ATTR.USERID),role, urlIds, proIds));
		return response;
	}

	@ResponseBody
	@RequestMapping("getroles")
	public Response getRoles(SearchBean search) {
		if (!ParaUtil.notNull(search.getLimit())
				|| !ParaUtil.notNull(search.getOffset())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("limit或offset字段均不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(roleService.getRoles(search));
		return response;
	}

	/**
	 * 获取该角色可操作的项目
	 * */
	@ResponseBody
	@RequestMapping("getprojects")
	public Response getProjects(SearchBean search) {
		if (!ParaUtil.notNull(search.getLimit())
				|| !ParaUtil.notNull(search.getOffset())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("limit或offset字段均不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(roleService.getProjects((Integer) request
				.getAttribute(Constant.ATTR.ROLEID)));
		return response;
	}

	/**
	 * 获取该角色可操作的项目和权限
	 * */
	@ResponseBody
	@RequestMapping("getproandper")
	public Response getProjectAndPermission(String roleIds) {
		if (roleIds == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("roleid 必传");
			return response;
		}
		List<Integer> roles = new ArrayList<Integer>();
		int i = 0;
		for (Object obj : JSONArray.parseArray(roleIds).toArray()) {
			roles.add(Integer.parseInt((String) obj));
		}

		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(roleService.getProjectsAndPermission(roles));
		return response;
	}
	/**
	 * 删除指定id角色
	 * */
	@ResponseBody
	@RequestMapping("delrole")
	public Response getProjectAndPermission(Role role) {
		if (!ParaUtil.notNull(role.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("id必传！");
			return response;
		}
		role.setStatus(0);
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(roleService.updateRole(role));
		return response;
	}
	/**
	 * 更新指定id角色
	 * */
	@ResponseBody
	@RequestMapping("updaterole")
	public Response updateRole(Role role) {
		if (!ParaUtil.notNull(role.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("id必传！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(roleService.updateRole(role));
		return response;
	}
}
