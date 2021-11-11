package com.kh.spring.birthday_HO.sendingStatus_HO.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;

@Repository
public class HO_SendingStatusDao {

	public ArrayList<HO_SendingStatus> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.selectStatusList");
	}

}
