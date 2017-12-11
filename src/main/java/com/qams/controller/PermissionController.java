package com.qams.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.response.Response;
import com.qams.service.PermissionService;

@Controller
@RequestMapping("token/permission")
public class PermissionController {
	@Resource
	HttpServletRequest request;
	@Resource
	PermissionService permissionService;
	@Resource
	Response response;
	
	@ResponseBody
	@RequestMapping("getpermissions")
	public Response getPermissions(SearchBean search) {
		if (search.getSearch() == null || search.getSearch().equals("")) {
			search.setSearch(null);
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(permissionService.getPermissions(search));
		return response;
	}
}
