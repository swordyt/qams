package com.qams.dao;

import java.util.List;

import com.qams.bean.SearchBean;
import com.qams.domain.MockApi;

public interface MockApiMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(MockApi record);

	int insertSelective(MockApi record);

	MockApi selectByPrimaryKey(Integer id);

	List<MockApi> selectAll(SearchBean record);

	int updateByPrimaryKeySelective(MockApi record);

	int updateByPrimaryKeyWithBLOBs(MockApi record);

	int updateByPrimaryKey(MockApi record);
}