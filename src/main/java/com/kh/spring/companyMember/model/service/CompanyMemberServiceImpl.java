package com.kh.spring.companyMember.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.company.model.vo.Company;
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

	@Override
	public int codeCheck(String comCode) {
		int result = cmd.codeCheck(sqlSession, comCode);
		
		return result;
	}

	@Override
	public void insertCompany(Company co) {
		int result = cmd.insertCompany(sqlSession, co);
		
		if(result < 0) {
			throw new CommException("회사등록에 실패했습니다");
		}
	}
	
}
