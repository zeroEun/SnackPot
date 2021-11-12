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

	public int insertEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		return sqlSession.insert("snackpotEmpMapper.insertEmp", se);
	}

	public int checkNum(SqlSessionTemplate sqlSession, String sempNum) {
		int result = sqlSession.selectOne("snackpotEmpMapper.checkNum", sempNum);
		
		return result;
	}

	public SnackpotEmp selectEmp(SqlSessionTemplate sqlSession, String sempNum) {
		
		SnackpotEmp se = sqlSession.selectOne("snackpotEmpMapper.selectEmp", sempNum);
		
		return se;
	}

	public int updateEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		return sqlSession.update("snackpotEmpMapper.updateEmp", se);
	}

	public int deleteEmp(SqlSessionTemplate sqlSession, String sempNum) {
		
		return sqlSession.update("snackpotEmpMapper.deleteEmp", sempNum);
	}

	public String searchComCode(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("companyMapper.searchComCode", comCode);
	}

}
