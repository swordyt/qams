package com.qams.dao;

import java.util.List;

import com.qams.domain.Case;

public interface CaseMapper {
	/**
	 * 通过用例父id获取该id下的所有用例
	 * */
	List<Case> selectCasesByPid(Integer id);

	/**
	 * 插入实体类中非空字段数据
	 * */
	int insertSelective(Case record);

	/**
	 * 通过主键id获取该case
	 * */
	Case selectByPrimaryKey(Integer id);

	/**
	 * 更新该id下的case信息
	 * */
	int updateByPrimaryKeySelective(Case record);

	/**
	 * 通过projectid获取该项目的主目录
	 * */
	Case selectByProjectId(Integer id);
}