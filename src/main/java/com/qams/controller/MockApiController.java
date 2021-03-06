package com.qams.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.domain.MockApi;
import com.qams.response.Response;
import com.qams.service.MockApiService;
import com.qams.util.ParaUtil;

@Controller
@RequestMapping("token/mock")
public class MockApiController {
	@Resource
	HttpServletRequest request;
	@Resource
	Response response;
	@Resource
	MockApiService mockApiService;

	@RequestMapping("addapi")
	@ResponseBody
	public Response addMockapi(MockApi record) {
		if (!ParaUtil.notEmpty(record.getHeaders())
				|| !ParaUtil.notEmpty(record.getName())
				|| !ParaUtil.notEmpty(record.getResultcode())
				|| !ParaUtil.notEmpty(record.getResultvalue())
				|| !ParaUtil.notEmpty(record.getUrl())
				|| !ParaUtil.notNull(record.getMethod())
				|| !ParaUtil.notNull(record.getUrltype())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("数据字段不能为空！");
			return response;
		}
		record.setCreater((Integer) request.getAttribute("userid"));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockApiService.addMockapi(record));
		return response;
	}

	@RequestMapping("getapis")
	@ResponseBody
	public Response getApis(SearchBean search) {
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockApiService.getApis(search));
		return response;
	}
	@RequestMapping("getapi")
	@ResponseBody
	public Response getApi(Integer id) {
		if(!ParaUtil.notNull(id)){
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("id不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockApiService.getApi(id));
		return response;
	}

	@RequestMapping("delapi")
	@ResponseBody
	public Response delApi(MockApi mockApi) {
		if (!ParaUtil.notNull(mockApi.getId())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("id必传！");
			return response;
		}
		mockApi.setStatus(0);
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockApiService.updateApi(mockApi));
		return response;
	}

	@RequestMapping("updateapi")
	@ResponseBody
	public Response updateApi(MockApi mockApi) {
		if (!ParaUtil.notNull(mockApi.getId())
				|| !ParaUtil.notEmpty(mockApi.getName())
				|| !ParaUtil.notEmpty(mockApi.getResultcode())
				|| !ParaUtil.notEmpty(mockApi.getResultvalue())
				|| !ParaUtil.notEmpty(mockApi.getUrl())
				|| !ParaUtil.notNull(mockApi.getMethod())
				|| !ParaUtil.notNull(mockApi.getProjectid())) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("必传字段不能为空！");
			return response;
		}
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		response.setData(mockApiService.updateApi(mockApi));
		return response;
	}

}
