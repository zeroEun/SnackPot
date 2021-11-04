package com.kh.spring.snack.snackList.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.snack.snackList.model.dao.HoSnackListDao;
import com.kh.spring.snack.snackList.model.vo.ListSchedule;

@Service
public class HoSnackListServiceImpl implements HoSnackListService {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Autowired
	private HoSnackListDao hoSnackListDao;

	@Override
	public ListSchedule selectSubsInfo(String comCode) {
		return hoSnackListDao.selectSubsInfo(sqlSession, comCode);
	}

	@Override
	public int listCheck(String comCode) {
		return hoSnackListDao.listCheck(sqlSession, comCode);
	}

}
