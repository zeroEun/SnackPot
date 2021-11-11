package com.kh.spring.birthday.sendList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

@Repository
public class SendListDao {

	public ArrayList<SendList> selectSendList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectSendList");
	}

	public int deleteSendList(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper.deleteSendStatus", cempSeq);
	}

	public int insertSendList(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.insertSendList", s);
	}

	public SendingStatus selectEmpOne(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.selectEmpOne", cempSeq);
	}

	public int updateSendList(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.updateSendList", s);
	}

}
