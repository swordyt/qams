package com.qams.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.annotation.PermissionAuth;
import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.domain.User;
import com.qams.response.Response;
import com.qams.service.UserService;
import com.qams.util.ParaUtil;

@RequestMapping("/token/user")
@Controller
public class UserController {
	@Autowired
	HttpServletRequest request;
	@Resource
	UserService userService;
	@Autowired
	Response response;

	@ResponseBody
	@RequestMapping("getusers")
	public Response getUsers(SearchBean search) {
		if (!ParaUtil.notNull(search.getLimit())
				|| !ParaUtil.notNull(search.getOffset())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("limit或offset字段均不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(userService.getUsers(search));
		return response;
	}

	@ResponseBody
	@RequestMapping("adduser")
	public Response addUser(User user) {
		response.setCode(Constant.CODE.RESCODE_FALSE);
		response.setMessage(Constant.MESSAGE.RESMES_FALSE);
		if (!ParaUtil.notEmpty(user.getEmail())
				|| !ParaUtil.notEmpty(user.getName())
				|| !ParaUtil.notEmpty(user.getPassword())
				|| !ParaUtil.notNull(user.getRoleid())) {
			response.setData("字段均不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(userService.addUser(user));
		return response;
	}

	@PermissionAuth(auth = { Permission.CR })
	@ResponseBody
	@RequestMapping("addrole")
	public Response addRole() {
		return null;
	}

	@PermissionAuth(auth = { Permission.UU })
	@ResponseBody
	@RequestMapping("updateuser")
	public Response updateUser() {
		return null;
	}

	@PermissionAuth(auth = { Permission.UR })
	@ResponseBody
	@RequestMapping("updaterole")
	public Response updateRole() {
		return null;
	}

	/**
	 * 获取该用户可操作的项目
	 * */
	@ResponseBody
	@RequestMapping("getprojects")
	public Response getProjects() {
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(userService.getProjects((Integer) request
				.getAttribute("userid")));
		return response;
	}

	/**
	 * 删除指定用户
	 * */
	@ResponseBody
	@RequestMapping("deluser")
	public Response delUser(User user) {
		if (!ParaUtil.notNull(user.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		user.setStatus(0);
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(userService.updateUser(user));
		return response;
	}
}
