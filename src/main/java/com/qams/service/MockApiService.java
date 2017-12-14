package com.qams.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.MockApiMapper;
import com.qams.domain.MockApi;
import com.qams.response.ListResponse;

@Service
public class MockApiService {
	@Autowired
	MockApiMapper mockApiDao;
	@Autowired
	ListResponse listResponse;

	public Integer addMockapi(MockApi record) {
		record.setStatus(1);
		mockApiDao.insertSelective(record);
		return record.getId();
	}

	public ListResponse getApis(SearchBean record) {
		listResponse.setRows(mockApiDao.selectAll(record));
		record.setLimit(0);
		listResponse.setTotal((long) mockApiDao.selectAll(record).size());
		return listResponse;
	}

	public Boolean updateApi(MockApi record) {
		try {
			mockApiDao.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
