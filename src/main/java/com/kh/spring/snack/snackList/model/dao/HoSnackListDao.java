package com.kh.spring.snack.snackList.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.snack.snackList.model.vo.ListSchedule;

@Repository
public class HoSnackListDao {

	public ArrayList<ListSchedule> selectSubsInfo(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("snackListMapper.selectSubsInfo", map);
	}

	public int listCheck(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackListMapper.countSnackList", comCode);
	}

}
