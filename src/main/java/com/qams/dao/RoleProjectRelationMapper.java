package com.qams.dao;

import java.util.List;

import com.qams.domain.Project;
import com.qams.domain.RoleProjectRelation;

public interface RoleProjectRelationMapper {
	int insertSelective(RoleProjectRelation record);

	RoleProjectRelation selectByPrimaryKey(Integer id);

	/**
	 * 根据传入的角色ID，获取该角色对应的项目
	 * */
	List<Project> selectByRoleids(List<Integer> roleId);
	
}