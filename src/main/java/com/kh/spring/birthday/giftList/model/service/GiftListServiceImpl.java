package com.kh.spring.birthday.giftList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.giftList.model.dao.GiftListDao;
import com.kh.spring.birthday.giftList.model.vo.GiftList;

@Service
public class GiftListServiceImpl implements GiftListService {

	@Autowired
	private GiftListDao giftListDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<GiftList> selectGiftList() {
		// TODO Auto-generated method stub
		return giftListDao.selectGiftList(sqlSession);
	}

	@Override
	public ArrayList<GiftList> selectCtgry(int ctgryNum) {
		// TODO Auto-generated method stub
		return giftListDao.selectCtgry(sqlSession, ctgryNum);
	}

	@Override
	public ArrayList<GiftList> giftSortList() {
		// TODO Auto-generated method stub
		return giftListDao.giftSortList(sqlSession);
	}
}
