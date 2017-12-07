package com.qams.dao;

import com.qams.domain.UrlMapping;

public interface UrlMappingMapper {
	int insertSelective(UrlMapping record);

	UrlMapping selectByPrimaryKey(Integer id);

	UrlMapping selectByUrl(String url);
}