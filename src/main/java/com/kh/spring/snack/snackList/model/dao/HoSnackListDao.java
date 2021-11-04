package com.kh.spring.snack.snackList.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.snack.snackList.model.vo.ListSchedule;

@Repository
public class HoSnackListDao {

	public ListSchedule selectSubsInfo(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackListMapper.selectSubsInfo", comCode);
	}

	public int listCheck(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackListMapper.countSnackList", comCode);
	}

}
