package com.qams.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.RoleMapper;
import com.qams.dao.RoleProjectRelationMapper;
import com.qams.domain.Project;
import com.qams.domain.Role;
import com.qams.response.ListResponse;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleDao;
	@Resource
	ListResponse listResponse;
	@Autowired
	RoleProjectRelationMapper roleProjectRelationDao;

	public ListResponse getRoles(SearchBean search) {
		listResponse.setRows(roleDao.selectAll(search));
		search.setLimit(0);
		listResponse.setTotal((long) roleDao.selectAll(search).size());
		return listResponse;
	}

	public ListResponse getProjects(Integer roleId) {
		List<Project> listProject = roleProjectRelationDao
				.selectByRoleid(roleId);
		listResponse.setRows(listProject);
		listResponse.setTotal((long) listProject.size());
		return listResponse;
	}
}
