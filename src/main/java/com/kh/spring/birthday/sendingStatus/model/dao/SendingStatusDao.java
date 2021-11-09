package com.kh.spring.birthday.sendingStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

@Repository
public class SendingStatusDao {

	public ArrayList<SendingStatus> selectsList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectsList");
	}

	public int deleteSendStatus(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper.deleteSendStatus", cempSeq);
	}

	public int insertSendStatus(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.insertSendStatus", s);
	}

}
