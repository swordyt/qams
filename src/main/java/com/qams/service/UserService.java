package com.qams.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.bean.SearchBean;
import com.qams.config.Constant;
import com.qams.dao.ProjectMapper;
import com.qams.dao.RoleProjectRelationMapper;
import com.qams.dao.UserMapper;
import com.qams.domain.Project;
import com.qams.domain.User;
import com.qams.response.ListResponse;
import com.qams.response.LoginResponse;
import com.qams.util.JwtUtil;

@Service
public class UserService {
	@Autowired
	JwtUtil jwt;
	@Autowired
	LoginResponse loginResponse;
	@Autowired
	User user;
	@Autowired
	UserMapper userDao;
	@Autowired
	RoleProjectRelationMapper roleProjectRelDao;
	@Autowired
	ProjectMapper projectDao;
	@Autowired
	ListResponse listResponse;

	public Object login(String email, String password) {
		user.setEmail(email);
		user.setPassword(password);
		User u = userDao.selectByEmailAndPassword(user);
		if (u == null) {
			return null;
		}
		loginResponse.setTokinId(jwt.createJWT(Constant.JWT_ID,
				jwt.generalSubject(u), Constant.JWT_TTL));
		loginResponse.setName(u.getName());
		loginResponse.setUserid(u.getId());
		return loginResponse;
	}

	public List<Project> getProjects(Integer userId) {
		List<Integer> list = new ArrayList<Integer>();
		User user = userDao.selectByPrimaryKey(userId);
		list.add(user.getRoleid());
		List<Project> listProject = roleProjectRelDao.selectByRoleids(list);
		return listProject;
	}

	public Integer addUser(User user) {
		user.setStatus(1);
		userDao.insertSelective(user);
		return user.getId();
	}

	public ListResponse getUsers(SearchBean search) {
		listResponse.setRows(userDao.selectAll(search));
		search.setLimit(0);
		listResponse.setTotal((long) userDao.selectAll(search).size());
		return listResponse;
	}

	public Boolean updateUser(User user) {
		try {
			userDao.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
