package com.kh.spring.companyMember.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
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
	public String findId() {
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
		return "company/companyMember/companyMemberModify";
	}
	
	@RequestMapping("modifyAdmin.co")
	public String modifyAdmin() {
		return "company/companyMember/companyAdminModify";
	}
	
	@RequestMapping("modifyPw.co")
	public String modifyPw() {
		return "company/companyMember/companyMemberModifyPw";
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
	
	@ResponseBody
	@RequestMapping("findIdSelect.co")
	public String findIdSelect(@ModelAttribute CompanyMember m, String memName, String memPhone) {
		
		String id = "";
		try {
		id = cms.findId(memName, memPhone);
		}catch(Exception e) {
			id = null;
		}
		
		return id;
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
		
		//담당자면 세션에 회사명, 회사주소 담기
		if(loginUser.getAdmin().equals("Y")) {
			
			String comCode = loginUser.getComCode();
			co = cms.selectCompany(comCode);
			loginUser.setComName(co.getComName());
			loginUser.setComAddress(co.getComAddress());
		}
		model.addAttribute("loginUser", loginUser); 
		return "redirect:/"; 
	}
	
	@RequestMapping("logout.co")
	public String logoutMember(SessionStatus status) { 
		status.setComplete(); 
		return "redirect:/";
	}
	
	//alert창 컨트롤러단에서 띄우기 위한 작업 
	public static void init(HttpServletResponse response) {
        response.setContentType("text/html; charset=euc-kr");
        response.setCharacterEncoding("euc-kr");
    }
	
	public static void alert(HttpServletResponse response, String alertText) {
        init(response);
        PrintWriter out;
		try {
			out = response.getWriter();  
			out.println("<script>alert('" + alertText + "');</script> ");
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
	@RequestMapping("updateAdmin.co")
	public String updateAdmin(@ModelAttribute CompanyMember m, HttpSession session, HttpServletResponse response) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		if (bCryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {
			
			//회원정보 업데이트
			cms.updateMember(m);	
			
			//회사정보 업데이트
			co.setComCode(loginUser.getComCode());
			co.setComName(m.getComName());
			co.setComAddress(m.getComAddress());
			cms.updateCompany(co);
			
			this.alert(response, "회원정보 변경에 성공하였습니다.");
		}else {
			session.setAttribute("msg", "비밀번호가 일치하지 않아 변경에 실패했습니다.");
		}
		return "common/menubar";
	}
	
	@RequestMapping("updateMember.co")
	public String updateMember(@ModelAttribute CompanyMember m, HttpSession session, HttpServletResponse response) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		if (bCryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {
			cms.updateMember(m);	
			this.alert(response, "회원정보 변경에 성공하였습니다.");
		}else {
			session.setAttribute("msg", "비밀번호가 일치하지 않아 변경에 실패했습니다.");
		}
		return "common/menubar";
	}
}
