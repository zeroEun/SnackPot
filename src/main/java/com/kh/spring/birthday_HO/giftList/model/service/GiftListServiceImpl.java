package com.kh.spring.birthday_HO.giftList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.giftList.model.dao.GiftListDao;
import com.kh.spring.birthday_HO.giftList.model.vo.GiftList;

@Service
public class GiftListServiceImpl implements GiftListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GiftListDao giftListDao;
	
	@Override
	public ArrayList<GiftList> selectGiftList() {
		// TODO Auto-generated method stub
		return giftListDao.selectGiftList(sqlSession);
	}

}
