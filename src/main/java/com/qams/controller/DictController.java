package com.qams.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.config.Constant;
import com.qams.domain.Dict;
import com.qams.response.Response;
import com.qams.service.DictService;
import com.qams.util.ParaUtil;

@Controller
@RequestMapping("token/dict")
public class DictController {
	@Resource
	HttpServletRequest request;
	@Resource
	Response response;
	@Autowired
	DictService dictService;

	@ResponseBody
	@RequestMapping("getdicts")
	public Response getDicts(Dict record) {
		if (!ParaUtil.notEmpty(record.getTableName())
				|| !ParaUtil.notEmpty(record.getType())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setCode("table_name或者type均不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(dictService.getDicts(record));
		return response;
	}
}
