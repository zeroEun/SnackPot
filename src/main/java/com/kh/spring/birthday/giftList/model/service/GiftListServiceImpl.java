package com.kh.spring.birthday.giftList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.giftList.model.dao.GiftListDao;
import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftList;
import com.kh.spring.common.exception.CommException;

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
	public ArrayList<GiftFolder> selectFolderArr() {
		// TODO Auto-generated method stub
		return giftListDao.selectFolderArr(sqlSession);
	}
	
	@Override
	public ArrayList<GiftList> selectCtgry(int ctgryNum) {
		// TODO Auto-generated method stub
		return giftListDao.selectCtgry(sqlSession, ctgryNum);
	}

	@Override
	public int addGiftFolder(String folderName) {

		int result = giftListDao.addGiftFolder(sqlSession, folderName);
		
		if(result < 0) {
			throw new CommException("폴더 추가 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<GiftList> seletFolderInfo(int rowNum) {
		// TODO Auto-generated method stub
		return giftListDao.seletFolderInfo(sqlSession, rowNum);
	}
	
}
