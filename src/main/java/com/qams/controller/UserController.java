package com.qams.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.annotation.PermissionAuth;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.response.Response;
import com.qams.service.UserService;

@RequestMapping("/token/user")
@Controller
public class UserController {
	@Autowired
	HttpServletRequest request;
	@Resource
	UserService userService;
	@Autowired
	Response response;

	@PermissionAuth(auth = { Permission.CU })
	@ResponseBody
	@RequestMapping("adduser")
	public Response addUser() {
		String s;
		return null;
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

	@ResponseBody
	@RequestMapping("getprojects")
	public Response getProjects() {
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(userService.getProjects((Integer) request.getAttribute("userid")));
		return response;
	}
}
