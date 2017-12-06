package com.qams.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.MockProjectMapper;
import com.qams.domain.MockProject;
import com.qams.response.ListResponse;

@Service
public class MockProjectService {
	@Resource
	MockProjectMapper mockProjectDao;
	@Resource
	ListResponse listResponse;

	public Integer addMockProject(MockProject p) {
		p.setStatus(1);
		return mockProjectDao.insertSelective(p);
	}

	public ListResponse getMockProject(SearchBean search) {
		
		listResponse.setRows(mockProjectDao.selectAll(search));
		search.setLimit(0);
		listResponse.setTotal((long) mockProjectDao.selectAll(search).size());
		return listResponse;
	}
}
