package com.qams.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.qams.annotation.PermissionAuth;
import com.qams.config.Constant;
import com.qams.config.Permission;
import com.qams.response.FileUploadResponse;
import com.qams.response.ListResponse;
import com.qams.response.Response;
import com.qams.service.UserService;
import com.qams.util.FileUtil;

@Controller
public class IndexController {
	@Autowired
	UserService userService;
	@Autowired
	Response response;
	@Autowired
	FileUploadResponse fileUpload;
	@Value("${upload.path}")
	private String uploadPath;
	@Autowired
	HttpServletRequest request;
	@Autowired
	ListResponse listResponse;

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView view = new ModelAndView();
		view.setViewName("login");
		return view;
	}

	@RequestMapping("/mul")
	public ModelAndView mul() {
		ModelAndView view = new ModelAndView();
		view.setViewName("mul");
		return view;
	}

	@PermissionAuth(auth = { Permission.UL })
	@ResponseBody
	@RequestMapping("token/upload")
	public Response upload(MultipartFile file) throws IOException {
		if (file == null) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			response.setData("文件不能为空");
			return response;
		}
		InputStream in = file.getInputStream();
		String fileMd5 = FileUtil.getMd5ByFile((FileInputStream) in,
				file.getSize());// 计算文件md5
		String fileSuffix = FileUtil.getFileSuffix(file.getOriginalFilename());// 计算文件后缀
		String fileName = fileMd5 + "." + fileSuffix;
		System.out.println(fileName);
		File filePath = new File(uploadPath + fileName);
		response.setCode(Constant.CODE.RESCODE_SUCCESS);
		response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		fileUpload.setKey(fileMd5);
		fileUpload.setName(file.getOriginalFilename());
		fileUpload.setType(fileSuffix);
		response.setData(fileUpload);
		if (filePath.exists()) {
			return response;
		}
		file.transferTo(filePath);
		return response;
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Response login(String email, String password) {
		if (email == null || password == null || email.trim() == ""
				|| password.trim() == "") {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		email = email.trim();
		password = password.trim();
		if (email == null || email.equals("") || password == null
				|| password.equals("")) {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
			return response;
		}
		Object obj = userService.login(email, password);
		if (obj != null) {
			response.setCode(Constant.CODE.RESCODE_SUCCESS);
			response.setData(obj);
			response.setMessage(Constant.MESSAGE.RESMES_SUCCESS);
		} else {
			response.setCode(Constant.CODE.RESCODE_FALSE);
			response.setMessage(Constant.MESSAGE.RESMES_FALSE);
		}
		return response;
	}
}
