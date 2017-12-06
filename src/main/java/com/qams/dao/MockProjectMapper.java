package com.qams.dao;

import java.util.List;

import com.qams.bean.SearchBean;
import com.qams.domain.MockProject;

public interface MockProjectMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(MockProject record);

	int insertSelective(MockProject record);

	MockProject selectByPrimaryKey(Integer id);

	List<MockProject> selectAll(SearchBean record);

	int updateByPrimaryKeySelective(MockProject record);

	int updateByPrimaryKey(MockProject record);
}