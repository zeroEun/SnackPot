package com.kh.spring.companyEmp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyEmpController {

	@RequestMapping("empManage.em")
	public String empManage() {
		return "company/companyEmp/empList";
	}
}
