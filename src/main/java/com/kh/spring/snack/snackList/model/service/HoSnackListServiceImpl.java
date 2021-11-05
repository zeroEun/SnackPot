package com.kh.spring.snack.snackList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public int listCheck(String comCode) {
		return hoSnackListDao.listCheck(sqlSession, comCode);
	}


	@Override
	public ArrayList<ListSchedule> selectSubsInfo(HashMap map) {
		return hoSnackListDao.selectSubsInfo(sqlSession, map);
	}

}
