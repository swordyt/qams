package com.qams.controller;

import java.beans.IntrospectionException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.xmlbeans.impl.regex.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qams.annotation.PermissionAuth;
import com.qams.bean.ExcelMapping;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.domain.Case;
import com.qams.response.Response;
import com.qams.service.CaseService;
import com.qams.util.XssfExcel;

@Controller
@RequestMapping("/token/cases")
public class CaseController {
	@Autowired
	CaseService caseService;
	@Autowired
	Response response;
	@Autowired
	HttpServletRequest request;
	@Value("${upload.path}")
	private String uploadPath;
	@RequestMapping("/index")
	// 登录后首页
	public ModelAndView testIndex() {
		// org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		return new ModelAndView("home");
	}

	@RequestMapping("/case")
	// 用例管理页
	public ModelAndView testCase() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("case");
		return mav;
	}

	@PermissionAuth(auth = { Permission.CC })
	@ResponseBody
	@RequestMapping("/addCase")
	// 增加case
	public Response addCase(Case cs) throws UnsupportedEncodingException {
		if (cs.getName() == null || cs.getName().equalsIgnoreCase("")) {
			response.setData("名称不能为空！");
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		cs.setCreater((Integer) request.getAttribute("userid"));
		response.setData(caseService.addCase(cs));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}

	@PermissionAuth(auth = { Permission.UC })
	@ResponseBody
	@RequestMapping("/updateCase")
	// 更新case
	public Response updateCase(Case cs) throws UnsupportedEncodingException {
		if (cs.getName() == null || cs.getName().equalsIgnoreCase("")) {
			response.setData("名称不能为空！");
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		boolean flag = caseService.updateCase(cs);
		if (flag) {
			response.setData(flag);
			response.setCode(Constant.CODE.RESCODE_SUCCESS);
			response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
			return response;
		}
		response.setData(flag);
		response.setCode(Constant.CODE.RESCODE_FALSE);
		response.setMessage(Constant.MESSAGE.RESMES_FALSE);
		return response;
	}

	@ResponseBody
	@RequestMapping("/casesTree")
	// 获取casetree
	public Response casesTree(Integer id, Integer projectId) {
		if (id == null && projectId == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		response.setData(caseService.getCases(id, projectId));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}

	@PermissionAuth(auth = { Permission.DC })
	@ResponseBody
	@RequestMapping("/delCase")
	// 删除case
	public Response delCase(Integer id) {
		if (id == null || id == 0) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		response.setData(caseService.delCase(id));
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		return response;
	}

	@RequestMapping("export")
	public ResponseEntity<byte[]> export() throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ClassNotFoundException, ParseException, IntrospectionException, Exception {
		HttpHeaders headers = new HttpHeaders();
		String text="测试用例.xlsx";
		try {
			headers.setContentDispositionFormData("attachment",
					new String(text.getBytes("utf-8"), "ISO8859-1"));
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(uploadPath+"temp/"+text)),
				headers, HttpStatus.CREATED);
	}
}
