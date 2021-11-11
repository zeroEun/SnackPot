package com.kh.spring.snackpotEmp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("enrollEmp.sn")
	public String enrollEmp() {
		return "headoffice/snackpotEmp/enrollEmp";
	}
	
	@RequestMapping("empList.sn")
	public String empList(Model model) {
		
		ArrayList <SnackpotEmp> list = ses.selectEmpList();
	
		model.addAttribute("list", list);
		
		return "headoffice/snackpotEmp/empList";
	}
	
	@RequestMapping("loginEmp.sn")
	public String loginEmp(SnackpotEmp se, Model model) {
//		String encPwd = bCryptPasswordEncoder.encode(se.getSempPw());
//		System.out.println("비밀번호 : " + encPwd);
		
		SnackpotEmp loginEmp = ses.loginEmp(bCryptPasswordEncoder, se);
		model.addAttribute("loginEmp", loginEmp);
		
		return "redirect:/mainPage.ho";
	}
}
