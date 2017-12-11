package com.qams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.UrlMappingMapper;
import com.qams.domain.UrlMapping;
import com.qams.response.ListResponse;

@Service
public class PermissionService {
	@Autowired
	UrlMappingMapper urlMappingDao;
	@Autowired
	ListResponse listResponse;

	public ListResponse getPermissions(SearchBean search) {
		List<UrlMapping> listUrl = urlMappingDao.selectAll(search);
		listResponse.setRows(listUrl);
		search.setLimit(0);
		listResponse.setTotal((long) urlMappingDao.selectAll(search).size());
		return listResponse;
	}
}
