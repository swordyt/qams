package com.qams.dao;

import java.util.List;

import com.qams.domain.Dict;

public interface DictMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Dict record);

	int insertSelective(Dict record);

	Dict selectByPrimaryKey(Integer id);

	List<Dict> selectByNotnull(Dict record);

	int updateByPrimaryKeySelective(Dict record);

	int updateByPrimaryKey(Dict record);
}