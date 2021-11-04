package com.kh.spring.companyMember.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.vo.CompanyMember;

public interface CompanyMemberService {

	int idCheck(String memId);

	int codeCheck(String comCode);

	void insertCompany(Company co);

	void insertCompanyMember(CompanyMember m);

	void insertCompanyAdmin(CompanyMember m);

	CompanyMember loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, CompanyMember m);

}
