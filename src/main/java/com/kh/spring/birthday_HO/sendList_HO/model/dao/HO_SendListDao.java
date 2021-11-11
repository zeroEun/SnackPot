package com.kh.spring.birthday_HO.sendList_HO.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.sendList_HO.model.vo.HO_SendList;

@Repository
public class HO_SendListDao {

	public ArrayList<HO_SendList> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.selectSendList");
	}

}
