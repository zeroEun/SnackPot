package com.kh.spring.companyMember.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class CompanyMemberController {
	
	@Autowired
	private Company co;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "companyMember/companyMemberEnrollForm";
	}
	
	@RequestMapping("insertComMem.co")
	public String insertMember(@ModelAttribute CompanyMember m, String memType, String comName, String comAddress, HttpSession session) {
		
		String encPwd = bCryptPasswordEncoder.encode(m.getMemPw());
		m.setMemPw(encPwd);
		
		if(memType.equals("member")) {
			m.setAdmin("N");
		}else {
			m.setAdmin("Y");
			co.setComName(comName);
			co.setComAddress(comAddress);
			co.setComAdmin(m.getMemId());
			
			//회사코드 만들기
			String first = comName.substring(0, 1);
			Date today = new Date ( );
			SimpleDateFormat formatter = new SimpleDateFormat ( "YYMMddHHmm", Locale.KOREA );
	        String time = formatter.format (today);
	        String comCode = first.concat(time);
	        System.out.println("회사코드 : " + comCode);
	        
	        co.setComCode(comCode);
			
		}
		
		session.setAttribute("msg", "회원가입 성공");
		return "redirect:/";
	}
	
}
