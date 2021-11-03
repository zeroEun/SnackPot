package com.kh.spring.companyMember.model.service;

import com.kh.spring.company.model.vo.Company;

public interface CompanyMemberService {

	int idCheck(String memId);

	int codeCheck(String comCode);

	void insertCompany(Company co);

}
