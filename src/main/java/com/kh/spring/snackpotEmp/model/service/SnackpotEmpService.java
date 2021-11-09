package com.kh.spring.snackpotEmp.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

public interface SnackpotEmpService {

	SnackpotEmp loginEmp(BCryptPasswordEncoder bCryptPasswordEncoder, SnackpotEmp se);

}
