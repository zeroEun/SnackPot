package com.kh.spring.snackpotEmp.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@Repository
public class SnackpotEmpDao {

	public SnackpotEmp loginEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		SnackpotEmp loginEmp = sqlSession.selectOne("snackpotEmpMapper.loginEmp", se);
		
		return loginEmp;
	}

}
