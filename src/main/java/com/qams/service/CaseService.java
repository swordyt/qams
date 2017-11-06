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
		cs.setStatus(1);
		int i=caseDao.insertSelective(cs);
		System.out.println(cs.getId());
		return i;
	}
	/**
	 * 删除case
	 * */
	public boolean delCase(Integer id) {
		Case cs=caseDao.selectByPrimaryKey(id);
		cs.setStatus(0);
		if(cs!=null&&caseDao.updateByPrimaryKeySelective(cs) == 1){
			return true;
		}
		return false;
	}
	/**
	 * 更新case
	 * */
	public boolean updateCase(Case cs) {
		Case cse=caseDao.selectByPrimaryKey(cs.getId());
		if(cse == null){
			return false;
		}
		if(cs!=null&&caseDao.updateByPrimaryKeySelective(cs) == 1){
			return true;
		}
		return false;
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
	public List<Case> getCases(Integer id) {
		return caseDao.selectCases(id);
	}
}
