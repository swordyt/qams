package com.qams.dao;

import java.util.List;

import com.qams.domain.RoleProject;

public interface RoleProjectMapper {
	/**
	 * 通过角色id查询该角色相关连的项目
	 * */
	List<RoleProject> selectByRoleid(Integer roleId);
}