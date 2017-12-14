package com.qams.dao;

import java.util.List;

import com.qams.bean.SearchBean;
import com.qams.domain.User;

public interface UserMapper {
	//
	User selectByPrimaryKey(Integer id);

	/**
	 * 通过邮箱和密码查询用户详细信息
	 * */
	User selectByEmailAndPassword(User record);

	Integer insertSelective(User record);

	List<User> selectAll(SearchBean search);

	void updateByPrimaryKeySelective(User record);
}