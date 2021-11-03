package com.kh.spring.birthday_HO.sendingList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.sendingList.model.dao.SendingListDao;
import com.kh.spring.birthday_HO.sendingList.model.vo.SendingList;

@Service
public class SendingListServiceImpl implements SendingListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SendingListDao sendListDao;
	
	@Override
	public ArrayList<SendingList> selectSendingList() {
		// TODO Auto-generated method stub
		return sendListDao.selectList(sqlSession);
	}

}
