package com.kh.spring.birthday.sendList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.sendList.model.dao.SendListDao;
import com.kh.spring.birthday.sendList.model.vo.SendList;

@Service
public class SendListServiceImpl implements SendListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SendListDao sendListDao;

	@Override
	public ArrayList<SendList> selectSendList() {
		// TODO Auto-generated method stub
		return sendListDao.selectSendList(sqlSession);
	}
}
