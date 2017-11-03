package com.qams.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.dao.CaseMapper;
import com.qams.domain.Case;

@Service
public class CaseService {
	@Resource
	CaseMapper caseDao;

	/**
	 * 插入case
	 * */
	public int addCase(Case cs) {
		cs.setType(1);
		return caseDao.insertSelective(cs);
	}

	/**
	 * 获取case详情
	 * */
	public Case getCase(Integer id) {
		return caseDao.selectByPrimaryKey(id);
	}

	/**
	 * 获取目录树
	 * */
	public List<Case> getCases() {
		return caseDao.selectAll();
	}
}
