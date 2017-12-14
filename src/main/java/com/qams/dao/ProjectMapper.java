package com.qams.dao;

import java.util.List;

import com.qams.bean.SearchBean;
import com.qams.domain.Project;

public interface ProjectMapper {
	/**
	 * 通过项目id获取项目的详细信息
	 * */
	Project selectByPrimaryKey(Integer id);

	/**
	 * 插入实体类中非null数据，并返回数据id
	 * */
	int insertSelective(Project record);

	/** 获取project 中status=1的所有项 */
	List<Project> selectAll(SearchBean search);

	void updateByPrimaryKeySelective(Project record);
}