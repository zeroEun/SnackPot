package com.kh.spring.companyMember.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.service.CompanyMemberService;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@SessionAttributes("loginUser")
@Controller
public class CompanyMemberController {
	
	@Autowired
	private CompanyMemberService cms;
	
	@Autowired
	private Company co;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("findId.co")
	public String findID() {
		return "company/companyMember/companyMemberFindId";
	}
	
	@RequestMapping("findPw.co")
	public String findPw() {
		return "company/companyMember/companyMemberFindPw";
	}
	
	@RequestMapping("enrollForm.co")
	public String enrollForm() {
		return "company/companyMember/companyMemberEnrollForm";
	}
	
	@RequestMapping("login.co")
	public String login() {
		return "company/companyMember/companyMemberLogin";
	}
	
	@RequestMapping("modifyMember.co")
	public String modifyMember() {
		return "company/companyMember/companyMemberLogin";
	}
	
	@RequestMapping("modifyAdmin.co")
	public String modifyAdmin() {
		return "company/companyMember/companyMemberLogin";
	}
	 
	@ResponseBody
	@RequestMapping("idCheck.co")
	public String idCheck(String memId) {
		
		int result = cms.idCheck(memId);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("codeCheck.co")
	public String codeCheck(String comCode) {
		
		int result = cms.codeCheck(comCode);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("insertComMem.co")
	public String insertMember(@ModelAttribute CompanyMember m, String comCodeMem, String memType, String comName, String comAddress, HttpSession session) {
		
		//암호회된 비밀번호
		String encPwd = bCryptPasswordEncoder.encode(m.getMemPw());
		m.setMemPw(encPwd);
		
		m.setMemStatus("Y");
		
		//회원과 관리자에 따라 구분 
		if(memType.equals("member")) {
			m.setAdmin("N");
			m.setComCode(comCodeMem);
			cms.insertCompanyMember(m);
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
	        System.out.println("괸리자 : " + m);
	        
	        m.setComCode(comCode);
	        co.setComCode(comCode);
			cms.insertCompany(co);
			cms.insertCompanyAdmin(m);
		}
		
		session.setAttribute("msg", "회원가입 성공");
		return "redirect:/";
	}
	
	@RequestMapping("loginMember.co")
	public String loginMember(CompanyMember m, Model model) {
		
		CompanyMember loginUser;

			loginUser = cms.loginMember(bCryptPasswordEncoder, m);
			model.addAttribute("loginUser", loginUser); 
			return "redirect:/"; 
	}
	
	@RequestMapping("logout.co")
	public String logoutMember(SessionStatus status) { 
		status.setComplete(); 
		return "redirect:/";
	}
}
