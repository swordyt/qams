package com.qams.dao;

import java.util.List;

import com.qams.domain.RoleUrlRelation;
import com.qams.domain.UrlMapping;

public interface RoleUrlRelationMapper {
	int insertSelective(RoleUrlRelation record);

	RoleUrlRelation selectByPrimaryKey(Integer id);

	/** 通过传入的record,个字段不为null,and 匹配 */
	List<RoleUrlRelation> selectByAll(RoleUrlRelation record);

	List<UrlMapping> selectByRoleids(List<Integer> roleIds);

	/**
	 * 更新同时匹配roleid和urlid的有效数据
	 * */
	Integer updateByRoleidAndUrlidSelective(RoleUrlRelation record);

	/**
	 * 删除和roleid匹配的所有项
	 * */
	Integer deleteByRoleid(Integer roleId);
}