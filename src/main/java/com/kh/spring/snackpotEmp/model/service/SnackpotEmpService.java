package com.kh.spring.snackpotEmp.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

public interface SnackpotEmpService {

	SnackpotEmp loginEmp(BCryptPasswordEncoder bCryptPasswordEncoder, SnackpotEmp se);

	ArrayList<SnackpotEmp> selectEmpList();

	void insertEmp(SnackpotEmp se);

	int checkNum(String sempNum);

	SnackpotEmp selectEmp(String sempNum);

	void updateEmp(SnackpotEmp se);

	int deleteEmp(String sempNum);

	String searchComCode(String string);

	ArrayList<Company> selectCompanyList();

	String searchSempName(String num);

	Company searchComName(String string);

	int updateCompany(String comCode, String sempNum);

	void updateSempNum(String string, String sempNum);

	ArrayList<Company> selectOriginCom(String sempNum);

	void updateComNull(String comCode);

	void updatePw(SnackpotEmp se);

	Company selectSempCompany(String string);

	SnackpotEmp selectComCodeCheck(String check);

}
