package com.qams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.annotation.PermissionAuth;
import com.qams.config.Permission;
import com.qams.response.Response;

@RequestMapping("/token/user")
@Controller
public class UserController {
	@Autowired
	HttpServletRequest request;

	@PermissionAuth(auth = { Permission.CU })
	@ResponseBody
	@RequestMapping("adduser")
	public Response addUser() {
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
}
