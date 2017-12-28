package com.qams.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.qams.bean.TreeCaseBean;
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
		int i = caseDao.insertSelective(cs);
		return i;
	}

	/**
	 * 删除case
	 * */
	public boolean delCase(Integer id) {
		Case cs = caseDao.selectByPrimaryKey(id);
		cs.setStatus(0);
		if (cs != null && caseDao.updateByPrimaryKeySelective(cs) == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 更新case
	 * */
	public boolean updateCase(Case cs) {
		Case cse = caseDao.selectByPrimaryKey(cs.getId());
		if (cse == null) {
			return false;
		}
		if (cs != null && caseDao.updateByPrimaryKeySelective(cs) == 1) {
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
	public List<TreeCaseBean> getCases(Integer id, Integer projectId) {
		List<Case> list = new ArrayList<Case>();
		List<TreeCaseBean> csBean = new ArrayList<>();
		if (id != null) {
			list = caseDao.selectCasesByPid(id);
		} else {
			Case cs = null;
			cs = caseDao.selectByProjectId(projectId);
			if (cs == null) {
				return null;
			}
			list = caseDao.selectCasesByPid(cs.getId());
			list.add(cs);
		}

		for (int i = 0; i < list.size(); i++) {
			TreeCaseBean csb = new TreeCaseBean(list.get(i));
			if (csb.getType() == 0) {
				csb.setChildrenNum(caseDao.selectRealcasesByPid(csb.getId()).size());
			}
			csBean.add(csb);
		}
		return csBean;
	}
}
