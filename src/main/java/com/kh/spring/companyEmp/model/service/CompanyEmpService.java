package com.kh.spring.companyEmp.model.service;

import java.util.ArrayList;

import com.kh.spring.companyEmp.model.vo.CompanyEmp;
import com.kh.spring.companyMember.model.vo.CompanyMember;

public interface CompanyEmpService {

	ArrayList<CompanyEmp> selectEmpList(String comCode);

	int checkNum(String cempNum, String comCode);

	void insertEmp(CompanyEmp ce);

	CompanyEmp selectEmp(String cempNum, String comCode);

	void updateEmp(CompanyEmp ce);

	int deleteEmp(String cempNum, String comCode);


}
