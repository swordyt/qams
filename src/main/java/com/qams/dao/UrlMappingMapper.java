package com.qams.dao;

import java.util.List;

import com.qams.bean.SearchBean;
import com.qams.domain.UrlMapping;

public interface UrlMappingMapper {
	int insertSelective(UrlMapping record);

	UrlMapping selectByPrimaryKey(Integer id);

	UrlMapping selectByUrl(String url);

	List<UrlMapping> selectAll(SearchBean search);
}