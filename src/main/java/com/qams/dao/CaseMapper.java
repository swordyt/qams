package com.qams.dao;

import java.util.List;

import com.qams.domain.Case;

public interface CaseMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Case record);

	int insertSelective(Case record);

	Case selectByPrimaryKey(Integer id);

	List<Case> selectAll();

	List<Case> selectCasesByPid(Integer id);

	Case selectByProjectId(Integer id);

	int updateByPrimaryKeySelective(Case record);

	int updateByPrimaryKey(Case record);
}