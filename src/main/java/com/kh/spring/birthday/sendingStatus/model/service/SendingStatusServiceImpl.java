package com.kh.spring.birthday.sendingStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.sendingStatus.model.dao.SendingStatusDao;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
@Service
public class SendingStatusServiceImpl implements SendingStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SendingStatusDao sendingStatusDao;
	
	@Override
	public ArrayList<SendingStatus> selectsList() {
		// TODO Auto-generated method stub
		return sendingStatusDao.selectsList(sqlSession);
	}

}
