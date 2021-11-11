package com.kh.spring.birthday.sendList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.sendList.model.dao.SendListDao;
import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.common.exception.CommException;

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

	@Override
	public int deleteSendList(int cempSeq) {

		int result = sendListDao.deleteSendList(sqlSession, cempSeq);
		
		if(result < 0) {
			throw new CommException("발송현황 선택 삭제 실패");
		}
		
		return result;
	}

	@Override
	public int insertSendList(SendingStatus s) {

		int result = sendListDao.insertSendList(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송현황 추가하기 실패");
		}
		
		return result;
	}

	@Override
	public SendingStatus selectEmpOne(int cempSeq) {
		// TODO Auto-generated method stub
		return sendListDao.selectEmpOne(sqlSession, cempSeq);
	}

	@Override
	public int updateSendList(SendingStatus s) {

		int result = sendListDao.updateSendList(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송현황 수정하기 실패");
		}
		
		return result;
	}
}
