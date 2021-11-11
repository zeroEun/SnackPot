package com.kh.spring.birthday_HO.giftList_HO.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.giftList_HO.model.dao.HO_GiftListDao;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;

@Service
public class HO_GiftListServiceImpl implements HO_GiftListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HO_GiftListDao giftListDao;
	
	@Override
	public ArrayList<HO_GiftList> selectGiftList() {
		// TODO Auto-generated method stub
		return giftListDao.selectGiftList(sqlSession);
	}

	@Override
	public HO_GiftList checkedGiftList(String giftNo) {
		// TODO Auto-generated method stub
		return giftListDao.checkedGiftList(sqlSession, giftNo);
	}

}
