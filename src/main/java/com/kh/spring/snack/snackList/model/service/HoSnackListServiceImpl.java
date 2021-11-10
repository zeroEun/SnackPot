package com.kh.spring.snack.snackList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.snack.snackList.model.dao.HoSnackListDao;
import com.kh.spring.snack.snackList.model.vo.ListSchedule;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

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


	@Override
	public ArrayList<Product> searchSnack(SearchSnack search) {
		return hoSnackListDao.searchSnack(sqlSession, search);
	}


	@Override
	public int selectSnackListNo(String comCode) {
		return  hoSnackListDao.selectSnackListNo(sqlSession, comCode);
	}


	@Override
	public ArrayList<SnackDList> selectSnackDList(int listNo) {
		return hoSnackListDao.selectSnackDList(sqlSession, listNo);
	}


	@Override
	public void insertSanckList(String comCode) {
		
		int result = hoSnackListDao.insertSanckList(sqlSession, comCode);
		
		if(result < 0) {
			throw new CommException("insertSanckList 실패");
		}
		
	}


	@Override
	public ArrayList<SnackDList> selectSnack(SnackSubs subs) {
		return  hoSnackListDao.selectSnack(sqlSession, subs);
	}


	@Override
	public void insertSnackDList(ArrayList<SnackDList> dList) {

		int result = hoSnackListDao.insertSnackDList(sqlSession, dList);
		
		if(result < 0) {
			throw new CommException("insertSnackDList 실패");
		}
	}


	@Override
	public int selectTotalPrice(int listNo) {
		return hoSnackListDao.selectTotalPrice(sqlSession, listNo);
	}


	@Override
	public void deleteSnackDList(int listNo) {
		
		int result = hoSnackListDao.deleteSnackDList(sqlSession, listNo);
		
		if(result < 0) {
			throw new CommException("deleteSnackDList 실패");
		}
	}

}
