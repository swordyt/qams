package com.qams.dao;

import com.qams.domain.Role;

public interface RoleMapper {
	/**
	 * 根据role id获取role详细信息
	 * */
	Role selectByPrimaryKey(Integer id);
}