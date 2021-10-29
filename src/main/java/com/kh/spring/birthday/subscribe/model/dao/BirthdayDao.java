package com.kh.spring.birthday.subscribe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.birthday.subscribe.model.vo.Birthday;

public class BirthdayDao {

	public int subscribe(SqlSessionTemplate sqlSession, Birthday b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.subscribe", b);
	}

	public Birthday subscribeInfo(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.subscribeInfo", comCode);
	}

	public int subscribeChk(SqlSessionTemplate sqlSession, String com_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.subscribeChk", com_code);
	}

}
