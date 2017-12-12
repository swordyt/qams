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
}