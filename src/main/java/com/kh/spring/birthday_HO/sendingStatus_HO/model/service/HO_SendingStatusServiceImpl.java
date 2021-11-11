package com.kh.spring.birthday_HO.sendingStatus_HO.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.sendingStatus_HO.model.dao.HO_SendingStatusDao;
import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;

@Service
public class HO_SendingStatusServiceImpl implements HO_SendingStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HO_SendingStatusDao sendingStsDao;
	
	@Override
	public ArrayList<HO_SendingStatus> selectList() {
		
		return sendingStsDao.selectList(sqlSession);
	}

}
