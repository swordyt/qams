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

	/**
	 * 更新同时匹配roleid和projectid的有效数据项
	 * */
	Integer updateByRoleidAndProjectidSelective(RoleProjectRelation record);
	/**
	 * 删除该角色id对应的所有数据项
	 * */
	Integer deleteByRoleid(Integer roleId);
}