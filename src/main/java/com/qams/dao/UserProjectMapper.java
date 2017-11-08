package com.qams.dao;

import java.util.List;

import com.qams.domain.Project;
import com.qams.domain.UserProject;

public interface UserProjectMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(UserProject record);

	int insertSelective(UserProject record);

	UserProject selectByPrimaryKey(Integer id);

	List<UserProject> selectByUserid(Integer userId);

	int updateByPrimaryKeySelective(UserProject record);

	int updateByPrimaryKey(UserProject record);
}