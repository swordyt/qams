package com.qams.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qams.dao.CaseMapper;
import com.qams.dao.ProjectMapper;
import com.qams.dao.UserProjectMapper;
import com.qams.domain.Case;
import com.qams.domain.Project;
import com.qams.domain.UserProject;

@Service
public class ProjectService {
	@Resource
	UserProjectMapper userProjectDao;
	@Resource
	ProjectMapper projectDao;
	@Resource
	CaseMapper caseDao;
	@Resource
	Case cs;

	public List<Project> getProjects(Integer userId) {
		List<Project> projects = new ArrayList<Project>();
		List<UserProject> up = userProjectDao.selectByUserid(userId);
		if (up == null) {
			return null;
		}
		for (UserProject userProject : up) {
			projects.add(projectDao.selectByPrimaryKey(userProject
					.getProjectid()));
		}
		return projects;
	}

	public int addProject(Project p, String rootTree) {
		int id = projectDao.insertSelective(p);
		cs.setType(0);
		cs.setStatus(1);
		cs.setUserid(p.getUserid());
		cs.setProjectid(p.getId());
		cs.setName(rootTree);
		caseDao.insertSelective(cs);
		return p.getId();
	}
}
