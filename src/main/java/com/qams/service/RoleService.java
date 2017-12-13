package com.qams.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.dao.RoleMapper;
import com.qams.dao.RoleProjectRelationMapper;
import com.qams.dao.RoleUrlRelationMapper;
import com.qams.domain.Project;
import com.qams.domain.Role;
import com.qams.domain.RoleProjectRelation;
import com.qams.domain.RoleUrlRelation;
import com.qams.domain.UrlMapping;
import com.qams.response.ListResponse;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleDao;
	@Resource
	ListResponse listResponse;
	@Autowired
	RoleProjectRelationMapper roleProjectRelationDao;
	@Autowired
	RoleUrlRelationMapper roleUrlRelationDao;

	public Integer addRole(Integer creater,Role role,List<Integer> urlList,List<Integer> projectList) {
		role.setStatus(1);
		roleDao.insertSelective(role);
		Integer id=role.getId();
		for(int i=0;i<urlList.size();i++){
			RoleUrlRelation rur=new RoleUrlRelation();
			rur.setCreater(creater);
			rur.setRoleid(id);
			rur.setUrlid(urlList.get(i));
			rur.setStatus(1);
			roleUrlRelationDao.insertSelective(rur);
		}
		for(int i=0;i<projectList.size();i++){
			RoleProjectRelation rpr=new RoleProjectRelation();
			rpr.setCreater(creater);
			rpr.setProjectid(projectList.get(i));
			rpr.setRoleid(id);
			rpr.setStatus(1);
			roleProjectRelationDao.insertSelective(rpr);
		}
		
		return id;
	}

	public ListResponse getRoles(SearchBean search) {
		listResponse.setRows(roleDao.selectAll(search));
		search.setLimit(0);
		listResponse.setTotal((long) roleDao.selectAll(search).size());
		return listResponse;
	}

	public ListResponse getProjects(Integer roleId) {
		List<Integer> roleIds = new ArrayList<Integer>();
		roleIds.add(roleId);
		List<Project> listProject = roleProjectRelationDao
				.selectByRoleids(roleIds);
		listResponse.setRows(listProject);
		listResponse.setTotal((long) listProject.size());
		return listResponse;
	}

	public Map getProjectsAndPermission(List<Integer> roleIds) {
		Map<String, List> map = new HashMap<String, List>();
		if (roleIds.size() < 1) {
			map.put("urls", null);
			map.put("projects", null);
			return map;
		}
		List<UrlMapping> urls = roleUrlRelationDao.selectByRoleids(roleIds);
		List<Project> projects = roleProjectRelationDao
				.selectByRoleids(roleIds);
		map.put("urls", urls);
		map.put("projects", projects);
		return map;
	}
}
