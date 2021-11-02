package com.kh.spring.birthday_HO.currentStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.currentStatus.model.dao.CurStatusDao;
import com.kh.spring.birthday_HO.currentStatus.model.vo.CurStatus;

@Service
public class CurStatusServiceImpl implements CurStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CurStatusDao curStsDao;
	
	@Override
	public ArrayList<CurStatus> selectList() {
		
		return curStsDao.selectList(sqlSession);
	}

}
