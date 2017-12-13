package com.qams.dao;

import java.util.List;

import com.qams.bean.SearchBean;
import com.qams.domain.Role;

public interface RoleMapper {
	/**
	 * 根据role id获取role详细信息
	 * */
	Role selectByPrimaryKey(Integer id);

	Integer insertSelective(Role record);

	List<Role> selectAll(SearchBean search);
}