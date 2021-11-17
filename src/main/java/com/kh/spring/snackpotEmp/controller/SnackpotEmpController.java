package com.kh.spring.snackpotEmp.controller;

import java.util.ArrayList;
import java.util.Arrays;

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
import com.kh.spring.snackpotEmp.model.service.SnackpotEmpService;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@SessionAttributes("loginEmp")
@Controller
public class SnackpotEmpController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SnackpotEmpService ses;
	
	@Autowired
	private Company co;
	
	private String sempNum;
	private String sempComName;
	
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
	
	@ResponseBody
	@RequestMapping("modifyCom.sn")
	public String modifyCom(String sempNum, String sempComName) {
		
		this.sempNum = sempNum;
		this.sempComName = sempComName;
		
		String result = "ok";
		return result;
	}
	
	@RequestMapping("modifyCompany.sn")
	public String modifyCompany(Model model) {
		
		//구독이 활성화된 모든 회사 
		ArrayList <Company> list = ses.selectCompanyList();
		SnackpotEmp se = ses.selectEmp(sempNum);
		ArrayList <Company> comList = new ArrayList<Company>();
		
		//사원번호를 이름으로 바꿔서 넘겨주기
		String[] sempNum = new String[list.size()];
		String num = "";
		String sempName = "";
		
		for(int i=0; i<list.size(); i++) {
			
			Company co = list.get(i);
			
			if(!co.getSempNum().equals("미정")) {
				sempNum[i] = co.getSempNum();
			}
			
			num = sempNum[i];
			
			sempName = ses.searchSempName(num);
			
			co.setSempNum(sempName);
			
			comList.add(co);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("semp", se);
		model.addAttribute("sempComName", sempComName);
		
		return "headoffice/snackpotEmp/modifyCompany";
	}
	
	@ResponseBody
	@RequestMapping("updateCompany.sn")
	public String updateCompany(String comName, String sempNum) {
		
		//검색결과
		String searchYn = "";
		String comCode = "";
		//코드 중복 체크용 변수
		String check = "";
		
		//회사명으로 회사 존재 여부 찾기 (여러 개일 경우 자르기)
		if(comName.contains(",")) {
			
			//"," 구분자로 회사명을 새로운 배열에 담기
			String name[] = comName.split(", ");
			for(int i=0; i<name.length; i++) {
				//회사가 존재하는지 서치 
				Company co = ses.searchComName(name[i]);
				
				//존재한다면 comCode 변수에 구분자를 넣어 담아주기
				if(co != null) {
					
					//업데이트 해주기 전에, 먼저 업데이트할 코드를 갖고 있는 직원이 있는지 체크
					check = "%" + co.getComCode() + "%";
					SnackpotEmp se = ses.selectComCodeCheck(check);
					
					//조회한 직원의 사번이 바꿀 직원이랑 같으면 패스, 같지 않으면 지워줘야함
					if(se.getSempNum() != Integer.parseInt(sempNum)) {
						System.out.println("사원정보 겹침!!");
					}
					
					if(i == name.length-1) {
					comCode += co.getComCode();
					}else if(i == 0){
						comCode = co.getComCode() + "/";
					}else {
						comCode += co.getComCode() + "/";
					}
					
				}else {
					//둘 중 하나라도 없으면 null
					comCode = null;
				}
				
			}
			
			//회사가 존재한다면
			if(comCode != null) {
				
				//해당 직원의 sempComCode에 추가 
				int result = ses.updateCompany(comCode, sempNum);
				
				//구독회사 테이블 업데이트
				if(result > 0) {
					
					//기존 회사는 null로 업데이트를 먼저 해줘야함
						//sempNum으로 해당 사원이 맡고있던 기존 회사들 찾기 (여러 개일수도 있으니 리스트 사용)
						ArrayList <Company> comList = ses.selectOriginCom(sempNum);
						
						//null로 업데이트
						for(int x=0; x<comList.size(); x++) {
							System.out.println("널업데이트 : " + comList.get(x).getComCode());
							ses.updateComNull(comList.get(x).getComCode());
						}
					
					for(int i=0; i<name.length; i++) {
						
						//이제 새로 입력한 회사로 추가
						ses.updateSempNum(name[i], sempNum);
						
					}
					
					searchYn = "Y";
				}
			
			}
			
			
		}else {
			Company co = ses.searchComName(comName);
			if(co != null) {
			int result = ses.updateCompany(co.getComCode(), sempNum);
			
				//구독회사 테이블 업데이트 
				if(result > 0) {
					
					ArrayList <Company> comList = ses.selectOriginCom(sempNum);
					
					//null로 업데이트
					for(int x=0; x<comList.size(); x++) {
						ses.updateComNull(comList.get(x).getComCode());
					}
					
					//새로 입력한 회사 추가 
					ses.updateSempNum(co.getComName(), sempNum);
					
					searchYn = "Y";
				}

			}
		}
		
		return searchYn;
	}
	
	@RequestMapping("modifyPw.sn")
	public String modifyPw() {
		return "headoffice/snackpotEmp/modifyPw";
	}
	
	@RequestMapping("updatePw.sn")
	public String updatePw(String originPw, String sempPw, String sempPwcheck, HttpSession session, Model model) {
		
		SnackpotEmp se = new SnackpotEmp(); 
		SnackpotEmp loginEmp = (SnackpotEmp) session.getAttribute("loginEmp");
		
		if(bCryptPasswordEncoder.matches(originPw, loginEmp.getSempPw())) {
			String encPw = bCryptPasswordEncoder.encode(sempPw);
			se.setSempNum(loginEmp.getSempNum());
			se.setSempPw(encPw);
			ses.updatePw(se);
			
			loginEmp.setSempPw(encPw);
			
			model.addAttribute("msg","비밀번호 변경에 성공하였습니다.");
	        model.addAttribute("url","/mainPage.ho");
	        
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않아 변경에 실패했습니다.");
	        model.addAttribute("url","/modifyPw.co");	
			
		}
		
		return "common/alert";
	}
	
	@RequestMapping("companyList.sn")
	public String companyList(HttpSession session, Model model) {
		
		SnackpotEmp loginEmp = (SnackpotEmp) session.getAttribute("loginEmp");
		String comCode = loginEmp.getSempComCode();
		ArrayList <Company> list = new ArrayList<Company>();
		
		//"/" 문자 포함이면 여러 회사를 담당하고 있는 사원
		if(comCode.contains("/")) {
			
			//"/" 구분자로 코드들을 새로운 배열에 담기
			String codes[] = comCode.split("/");
			for(int i=0; i<codes.length; i++) {
				//회사코드로 company 정보 가져오기
				Company co = ses.selectSempCompany(codes[i]);
				list.add(co);
			}
			
		//미정이라면 아무 회사도 담당하고 있지 않은 사원	
		}else if(comCode.equals("미정")){
			
			
		//그 외 -> 한 회사만 담당하고 있는 사원	
		}else {
			Company co = ses.selectSempCompany(comCode);
			list.add(co);
		}
		
		model.addAttribute("list", list);
		
		return "headoffice/snackpotEmp/companyList";
	}
}
