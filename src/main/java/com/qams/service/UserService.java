package com.qams.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.config.Constant;
import com.qams.dao.ProjectMapper;
import com.qams.dao.RoleProjectRelationMapper;
import com.qams.dao.UserMapper;
import com.qams.domain.Project;
import com.qams.domain.RoleProject;
import com.qams.domain.RoleProjectRelation;
import com.qams.domain.User;
import com.qams.response.LoginResponse;
import com.qams.response.Response;
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

	public Object login(String email, String password) {
		user.setEmail(email);
		user.setPassword(password);
		User u = userDao.selectByEmailAndPassword(user);
		if (u == null) {
			return null;
		}
		;
		loginResponse.setTokinId(jwt.createJWT(Constant.JWT_ID,
				jwt.generalSubject(u), Constant.JWT_TTL));
		return loginResponse;
	}

	public List<Project> getProjects(Integer userId) {
		User user = userDao.selectByPrimaryKey(userId);
		List<RoleProjectRelation> listRoleProject = roleProjectRelDao.selectByRoleid(user
				.getRoleid());
		List<Project> listProject = new ArrayList<Project>();
		for (RoleProjectRelation rp : listRoleProject) {
			listProject.add(projectDao.selectByPrimaryKey(rp.getProjectid()));
		}
		return listProject;
	}
}
