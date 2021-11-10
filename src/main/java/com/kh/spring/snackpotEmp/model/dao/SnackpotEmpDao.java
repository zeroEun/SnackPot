package com.kh.spring.snackpotEmp.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@Repository
public class SnackpotEmpDao {

	public SnackpotEmp loginEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		SnackpotEmp loginEmp = sqlSession.selectOne("snackpotEmpMapper.loginEmp", se);
		
		return loginEmp;
	}

	public ArrayList<SnackpotEmp> selectEmpList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("snackpotEmpMapper.selectEmpList");
	}

}
