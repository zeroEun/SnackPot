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
		
		if(!bCryptPasswordEncoder.matches(se.getSempPw(), loginEmp.getSempPw())) {
			throw new CommException("암호 불일치");
		}
		
		return loginEmp;
	}

	@Override
	public ArrayList<SnackpotEmp> selectEmpList() {

		return sed.selectEmpList(sqlSession);
	}

}
