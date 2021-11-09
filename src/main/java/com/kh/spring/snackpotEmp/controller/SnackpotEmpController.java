package com.kh.spring.snackpotEmp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.snackpotEmp.model.service.SnackpotEmpService;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@SessionAttributes("loginEmp")
@Controller
public class SnackpotEmpController {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SnackpotEmpService ses;
	
	@RequestMapping("login.sn")
	public String modifyAdmin() {
		return "headoffice/snackpotEmp/loginEmp";
	}
	
	@RequestMapping("loginEmp.sn")
	public String loginEmp(SnackpotEmp se, Model model) {
		SnackpotEmp loginEmp = ses.loginEmp(bCryptPasswordEncoder, se);
		
		model.addAttribute("loginEmp", loginEmp);
		
		return "redirect:/mainPage.ho";
	}
}
