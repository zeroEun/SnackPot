package com.kh.spring.birthday_HO.currentStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.currentStatus.model.vo.CurStatus;

@Repository
public class CurStatusDao {

	public ArrayList<CurStatus> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectList");
	}

}
