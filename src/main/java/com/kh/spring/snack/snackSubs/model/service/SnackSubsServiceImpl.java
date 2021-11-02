package com.kh.spring.snack.snackSubs.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.vo.Aroma;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.Taste;
import com.kh.spring.snack.snackSubs.model.dao.SnackSubsDao;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Service
public class SnackSubsServiceImpl implements SnackSubsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnackSubsDao snackSubsDao;

	
	@Override
	public ArrayList<SnackSubCategory> selectSubCategory(int categoryNo) {
		return snackSubsDao.selectSubCategory(sqlSession, categoryNo);
	}

	@Override
	public ArrayList<Aroma> selectAroma() {
		return snackSubsDao.selectAroma(sqlSession);
	}

	@Override
	public ArrayList<Taste> selectTaste() {
		return snackSubsDao.selectTaste(sqlSession);
	}

	@Override
	public void insertSnackSubs(SnackSubs snackSubs) {
		
		int result = snackSubsDao.insertSnackSubs(sqlSession, snackSubs);
		
		if(result < 0 ) {
			throw new CommException("구독 신청 실패");
		}
		
	}


}
