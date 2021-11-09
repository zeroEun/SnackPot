package com.kh.spring.birthday.sendingStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.sendingStatus.model.dao.SendingStatusDao;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.common.exception.CommException;
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

	@Override
	public int deleteSendStatus(int cempSeq) {
		
		int result = sendingStatusDao.deleteSendStatus(sqlSession, cempSeq);
		
		if(result < 0) {
			throw new CommException("발송현황 선택 삭제 실패");
		}
		
		return result;
	}

	@Override
	public int insertSendStatus(SendingStatus s) {

		int result = sendingStatusDao.insertSendStatus(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송현황 선택 삭제 실패");
		}
		
		return result;
	}

}
