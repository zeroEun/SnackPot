package com.kh.spring.birthday_HO.giftList_HO.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.giftList_HO.model.dao.HO_GiftListDao;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.GiftAttachment;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;
import com.kh.spring.common.exception.CommException;

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

	@Override
	public void insertGift(HO_GiftList gl) {

		int result = giftListDao.insertGift(sqlSession, gl);
		
		if(result < 0) {
			throw new CommException("선물 상품 등록 실패!");
		}
		
	}

	@Override
	public void insertAttachment(GiftAttachment at) {
		
		int result = giftListDao.insertAttachment(sqlSession, at);
		
		if(result < 0) {
			throw new CommException("선물 사진 등록 실패!");
		}
		
	}

}
