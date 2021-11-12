package com.kh.spring.snackpotEmp.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.snackpotEmp.model.dao.SnackpotEmpDao;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;


@Service
public class SnackpotEmpServiceImpl implements SnackpotEmpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnackpotEmpDao sed;
	
	@Override
	public SnackpotEmp loginEmp(BCryptPasswordEncoder bCryptPasswordEncoder, SnackpotEmp se) {
		
		SnackpotEmp loginEmp = sed.loginEmp(sqlSession, se);
		
		if(loginEmp == null) {
			throw new CommException("회원정보가 존재하지 않습니다"); 
		}
		
//		if(!bCryptPasswordEncoder.matches(se.getSempPw(), loginEmp.getSempPw())) {
//			throw new CommException("암호 불일치");
//		}
		
		return loginEmp;
	}

	@Override
	public ArrayList<SnackpotEmp> selectEmpList() {

		return sed.selectEmpList(sqlSession);
	}

	@Override
	public void insertEmp(SnackpotEmp se) {
		int result = sed.insertEmp(sqlSession, se);
		
		if(result < 0) {
			throw new CommException("사원등록에 실패했습니다");
		}
	}

	@Override
	public int checkNum(String sempNum) {
		int result = sed.checkNum(sqlSession, sempNum);
		
		return result;
	}

	@Override
	public SnackpotEmp selectEmp(String sempNum) {
		SnackpotEmp se = sed.selectEmp(sqlSession, sempNum);
		
		return se;
	}

	@Override
	public void updateEmp(SnackpotEmp se) {
		int result = sed.updateEmp(sqlSession, se);
		
		if(result < 0) {
			throw new CommException("사원정보 변경에 실패했습니다");
		}
		
	}

	@Override
	public int deleteEmp(String sempNum) {
		int result = sed.deleteEmp(sqlSession, sempNum);
		
		if(result < 0) {
			throw new CommException("사원 삭제에 실패했습니다");
		}
		return result;
	}

	@Override
	public String searchComCode(String string) {
		
		return sed.searchComCode(sqlSession, string);
	}

}
