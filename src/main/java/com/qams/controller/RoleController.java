package com.qams.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.bean.SearchBean;
import com.qams.config.Constant;
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
}
