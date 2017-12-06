package com.qams.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.CaseMapper;
import com.qams.dao.ProjectMapper;
import com.qams.dao.RoleProjectMapper;
import com.qams.dao.UserMapper;
import com.qams.domain.Case;
import com.qams.domain.Project;
import com.qams.domain.RoleProject;
import com.qams.domain.User;
import com.qams.response.ListResponse;

@Service
public class ProjectService {
	@Resource
	RoleProjectMapper roleProjectDao;
	@Resource
	ProjectMapper projectDao;
	@Resource
	CaseMapper caseDao;
	@Resource
	Case cs;
	@Resource
	UserMapper userDao;
	@Autowired
	ListResponse listResponse;

	public ListResponse getProjects(SearchBean search) {
		
		List<Project> list = projectDao.selectAll(search);
		for (int i = 0; i < list.size(); i++) {
			Project p = list.get(i);
		}
		listResponse.setRows(list);
		search.setLimit(0);
		listResponse.setTotal((long) projectDao.selectAll(search).size());
		return listResponse;
	}

	public int addProject(Project p, String rootTree) {
		int id = projectDao.insertSelective(p);
		cs.setType(0);
		cs.setStatus(1);
		cs.setCreater(p.getCreater());
		cs.setProjectid(p.getId());
		cs.setName(rootTree);
		caseDao.insertSelective(cs);
		return p.getId();
	}
}
