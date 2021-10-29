package com.kh.spring.companyMember.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyMemberDao {

	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		
		int result = sqlSession.selectOne("companyMemberMapper.idCheck", memId);
		
		return result;
	}

}
