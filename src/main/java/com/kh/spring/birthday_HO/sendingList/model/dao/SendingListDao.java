package com.kh.spring.birthday_HO.sendingList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.sendingList.model.vo.SendingList;

@Repository
public class SendingListDao {

	public ArrayList<SendingList> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectSendingList");
	}

}
