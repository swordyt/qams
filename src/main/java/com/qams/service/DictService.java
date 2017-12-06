package com.qams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qams.dao.DictMapper;
import com.qams.domain.Dict;

@Service
public class DictService {
	@Autowired
	DictMapper dictDao;

	public List<Dict> getDicts(Dict record) {
		return dictDao.selectByNotnull(record);
	}
}
