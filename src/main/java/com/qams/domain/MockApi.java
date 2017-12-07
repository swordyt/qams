package com.qams.domain;

import java.util.Date;

import org.springframework.stereotype.Repository;
@Repository
public class MockApi {
	private Integer id;
	
	private Integer projectid;

	private String name;

	private Integer method;

	private Integer urltype;

	private String url;

	private String resultcode;

	private Integer resulttype;

	private String headers;

	private Integer status;

	private Integer creater;

	private Date createtime;

	private Date updatetime;

	private String resultvalue;

	public Integer getProjectid() {
		return projectid;
	}

	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}

	public Integer getCreater() {
		return creater;
	}

	public void setCreater(Integer creater) {
		this.creater = creater;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Integer getMethod() {
		return method;
	}

	public void setMethod(Integer method) {
		this.method = method;
	}

	public Integer getUrltype() {
		return urltype;
	}

	public void setUrltype(Integer urltype) {
		this.urltype = urltype;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public String getResultcode() {
		return resultcode;
	}

	public void setResultcode(String resultcode) {
		this.resultcode = resultcode == null ? null : resultcode.trim();
	}

	public Integer getResulttype() {
		return resulttype;
	}

	public void setResulttype(Integer resulttype) {
		this.resulttype = resulttype;
	}

	public String getHeaders() {
		return headers;
	}

	public void setHeaders(String headers) {
		this.headers = headers == null ? null : headers.trim();
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public String getResultvalue() {
		return resultvalue;
	}

	public void setResultvalue(String resultvalue) {
		this.resultvalue = resultvalue == null ? null : resultvalue.trim();
	}
}