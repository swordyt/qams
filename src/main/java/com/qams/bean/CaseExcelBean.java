package com.qams.bean;

import java.util.List;

import com.qams.domain.Case;

public class CaseExcelBean {
	private List<Case> css;
	private String headerProjectName;
	private String exportUser;
	private String exportCaseNum;
	private String time;

	public List<Case> getCss() {
		return css;
	}

	public void setCss(List<Case> css) {
		this.css = css;
	}

	public String getHeaderProjectName() {
		return headerProjectName;
	}

	public void setHeaderProjectName(String headerProjectName) {
		this.headerProjectName = headerProjectName;
	}

	public String getExportUser() {
		return exportUser;
	}

	public void setExportUser(String exportUser) {
		this.exportUser = exportUser;
	}

	public String getExportCaseNum() {
		return exportCaseNum;
	}

	public void setExportCaseNum(String exportCaseNum) {
		this.exportCaseNum = exportCaseNum;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
