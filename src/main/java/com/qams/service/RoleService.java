package com.qams.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.RoleMapper;
import com.qams.domain.Role;
import com.qams.response.ListResponse;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleDao;
	@Resource
	ListResponse listResponse;

	public ListResponse getRoles(SearchBean search) {
		listResponse.setRows(roleDao.selectAll(search));
		search.setLimit(0);
		listResponse.setTotal((long) roleDao.selectAll(search).size());
		return listResponse;
	}
}
