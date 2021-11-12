package com.kh.spring.snackpotEmp.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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

}
