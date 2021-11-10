package com.kh.spring.birthday.sendList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.sendList.model.vo.SendList;

@Repository
public class SendListDao {

	public ArrayList<SendList> selectSendList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectSendList");
	}

}
