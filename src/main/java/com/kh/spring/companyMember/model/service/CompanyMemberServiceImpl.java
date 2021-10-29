package com.kh.spring.companyMember.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.companyMember.model.dao.CompanyMemberDao;

@Service
public class CompanyMemberServiceImpl implements CompanyMemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CompanyMemberDao cmd;

	@Override
	public int idCheck(String memId) {
		
		int result = cmd.idCheck(sqlSession, memId);
		
		return result;
	}
	
}
