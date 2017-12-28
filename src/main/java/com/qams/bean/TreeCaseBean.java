package com.qams.bean;

import java.util.Date;

import com.qams.domain.Case;

public class TreeCaseBean extends Case {
	private Case cs;
	private Integer childrenNum;

	public Integer getChildrenNum() {
		return childrenNum;
	}

	public void setChildrenNum(Integer childrenNum) {
		this.childrenNum = childrenNum;
	}

	public TreeCaseBean(Case cs) {
		this.cs = cs;
	}

	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return this.cs.getId();
	}

	@Override
	public void setId(Integer id) {
		// TODO Auto-generated method stub
		this.cs.setId(id);
	}

	@Override
	public Integer getProjectid() {
		// TODO Auto-generated method stub
		return this.cs.getProjectid();
	}

	@Override
	public void setProjectid(Integer projectid) {
		// TODO Auto-generated method stub
		this.cs.setProjectid(projectid);
	}

	@Override
	public Integer getPid() {
		// TODO Auto-generated method stub
		return this.cs.getPid();
	}

	@Override
	public void setPid(Integer pid) {
		// TODO Auto-generated method stub
		this.cs.setPid(pid);
	}

	@Override
	public Integer getType() {
		// TODO Auto-generated method stub
		return this.cs.getType();
	}

	@Override
	public void setType(Integer type) {
		// TODO Auto-generated method stub
		this.cs.setType(type);
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return this.cs.getName();
	}

	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		this.cs.setName(name);
	}

	@Override
	public Integer getLevel() {
		// TODO Auto-generated method stub
		return this.cs.getLevel();
	}

	@Override
	public void setLevel(Integer level) {
		// TODO Auto-generated method stub
		this.cs.setLevel(level);
	}

	@Override
	public String getDescription() {
		// TODO Auto-generated method stub
		return this.cs.getDescription();
	}

	@Override
	public void setDescription(String description) {
		// TODO Auto-generated method stub
		this.cs.setDescription(description);
	}

	@Override
	public String getStep() {
		// TODO Auto-generated method stub
		return this.cs.getStep();
	}

	@Override
	public void setStep(String step) {
		// TODO Auto-generated method stub
		this.cs.setStep(step);
	}

	@Override
	public String getFile() {
		// TODO Auto-generated method stub
		return this.cs.getFile();
	}

	@Override
	public void setFile(String file) {
		// TODO Auto-generated method stub
		this.cs.setFile(file);
	}

	@Override
	public Integer getStatus() {
		// TODO Auto-generated method stub
		return this.cs.getStatus();
	}

	@Override
	public void setStatus(Integer status) {
		// TODO Auto-generated method stub
		this.cs.setStatus(status);
	}

	@Override
	public Integer getCreater() {
		// TODO Auto-generated method stub
		return this.cs.getCreater();
	}

	@Override
	public void setCreater(Integer creater) {
		// TODO Auto-generated method stub
		this.cs.setCreater(creater);
	}

	@Override
	public Date getCreatetime() {
		// TODO Auto-generated method stub
		return this.cs.getCreatetime();
	}

	@Override
	public void setCreatetime(Date createtime) {
		// TODO Auto-generated method stub
		this.cs.setCreatetime(createtime);
	}

	@Override
	public Date getUpdateTime() {
		// TODO Auto-generated method stub
		return this.cs.getUpdateTime();
	}

	@Override
	public void setUpdateTime(Date updateTime) {
		// TODO Auto-generated method stub
		this.cs.setUpdateTime(updateTime);
	}
	
}
