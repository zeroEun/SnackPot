package com.kh.spring.snackpotEmp.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.snackpotEmp.model.service.SnackpotEmpService;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@SessionAttributes("loginEmp")
@Controller
public class SnackpotEmpController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SnackpotEmpService ses;
	
	private String sempNum;
	
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
	
	@RequestMapping("insertEmp.sn")
	public String insertEmp(@ModelAttribute SnackpotEmp se, Model model) {
		
		se.setSempStatus("Y");
		ses.insertEmp(se);
		
		model.addAttribute("msg","사원등록이 완료되었습니다.");
        model.addAttribute("url","/empList.sn");
        
		return "common/alert";
	}
	
	@ResponseBody
	@RequestMapping("checkNum.sn")
	public String checkNum(String sempNum) {
		
		int result = ses.checkNum(sempNum);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("modifyEmp.sn")
	public String modifyEmp(String sempNum) {
		
		this.sempNum = sempNum;
		
		String result = "ok";
		return result;
	}

	@RequestMapping("modify.sn")
	public String modify(Model model) {
		
		SnackpotEmp se = ses.selectEmp(sempNum);
		
		model.addAttribute("semp", se);
		
		return "headoffice/snackpotEmp/modifyEmp";
	}
	
	@RequestMapping("updateEmp.sn")
	public String updateEmp(@ModelAttribute SnackpotEmp se, Model model) {
		
		ses.updateEmp(se);
		
		model.addAttribute("msg","사원정보 변경이 완료되었습니다.");
        model.addAttribute("url","/empList.sn");
		
		return "common/alert";	
	}
	
	@ResponseBody
	@RequestMapping("deleteEmp.sn")
	public String deleteEmp(String sempNum) {
		
		int result = ses.deleteEmp(sempNum);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("logout.sn")
	public String logoutMember(SessionStatus status) { 
		status.setComplete(); 
		return "redirect:/login.sn";
	}
	
	@RequestMapping("empCompanyList.sn")
	public String empCompanyList(Model model) {
		
		ArrayList <SnackpotEmp> list = ses.selectEmpList();
		
		ArrayList<SnackpotEmp> empComList = new ArrayList<SnackpotEmp>();
		
		String[] sempComCode = new String[list.size()];
		
		String comCode = "";
		
		String encCode = "";
		
		for(int i=0; i<list.size(); i++) {
			
			//본사직원 객체 생성해서 리스트 값들 담아주기
			SnackpotEmp se = list.get(i);
			
			//객체에서 담당회사코드만 꺼내서 따로 선언해준 스트링 배열에 담기
			sempComCode[i] = se.getSempComCode();
			
			//해당 열 사원의 담당회사코드 가져오기
			comCode = sempComCode[i];
			
			//"/" 문자 포함이면 여러 회사를 담당하고 있는 사원
			if(comCode.contains("/")) {
				
				//"/" 구분자로 코드들을 새로운 배열에 담기
				String codes[] = comCode.split("/");
				for(int x=0; x<codes.length; x++) {
					//한글변환코드 변수에 각 코드들의 회사명 담아주기
					encCode = ses.searchComCode(codes[x]);
					
					if(x == codes.length-1) {
						sempComCode[i] += encCode;
					}else if(x == 0){
						sempComCode[i] = encCode + ", ";
					}else {
						sempComCode[i] += encCode + ", ";
					}
					
				}
				
			//미정이라면 아무 회사도 담당하고 있지 않은 사원	
			}else if(comCode.equals("미정")){
				sempComCode[i] = comCode;
				
			//그 외 -> 한 회사만 담당하고 있는 사원	
			}else {
				encCode = ses.searchComCode(comCode);
				sempComCode[i] = encCode;
			}
			
			se.setSempComCode(sempComCode[i]);
			
			//바꾼 회사코드를 담은 객체를 새로운 어레이리스트 이식
			empComList.add(se);
			
		}
		
		model.addAttribute("list", empComList);
		
		return "headoffice/snackpotEmp/empCompanyList";
	}
}
