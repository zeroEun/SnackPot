package com.kh.spring.companyMember.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Repository
public class CompanyMemberDao {

	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
	
		int result = sqlSession.selectOne("companyMemberMapper.idCheck", memId);
		
		return result;
	}

	public int codeCheck(SqlSessionTemplate sqlSession, String comCode) {
		
		int result = sqlSession.selectOne("companyMemberMapper.codeCheck", comCode);
		
		return result;
	}

	public int insertCompany(SqlSessionTemplate sqlSession, Company co) {
		
		return sqlSession.insert("companyMapper.insertCompany", co);
	}

	public int insertCompanyMember(SqlSessionTemplate sqlSession, CompanyMember m) {

		return sqlSession.insert("companyMemberMapper.insertCompanyMember", m);
	}

	public int insertCompanyAdmin(SqlSessionTemplate sqlSession, CompanyMember m) {
	
		return sqlSession.insert("companyMemberMapper.insertCompanyAdmin", m);
	}

	public CompanyMember loginMember(SqlSessionTemplate sqlSession, CompanyMember m) {
		
		CompanyMember mem = sqlSession.selectOne("companyMemberMapper.loginMember", m);
		
		return mem;
	}

}
