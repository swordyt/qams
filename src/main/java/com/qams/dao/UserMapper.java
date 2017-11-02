package com.qams.dao;

import com.qams.domain.User;
import com.qams.domain.UserKey;

public interface UserMapper {
	int deleteByPrimaryKey(UserKey key);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(UserKey key);

	User selectByEmailAndPassword(User record);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);
}