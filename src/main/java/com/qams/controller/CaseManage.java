package com.qams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CaseManage {
	@RequestMapping("case")
	public String testCase() {
		return "index";
	}
}
