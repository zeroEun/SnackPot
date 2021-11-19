package com.kh.spring.birthday.subscribe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.birthday.subscribe.model.service.BirthdayService;
import com.kh.spring.birthday.subscribe.model.vo.Birthday;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class BirthdayController {

	@Autowired
	private BirthdayService bService;
	
	@RequestMapping("subscribeForm.birth")
	public ModelAndView subscribeForm(ModelAndView mv, HttpSession session) {
		
		//사원리스트 불러오기 버튼 눌렀을 때 사원 등록이 되어있는지 유무를 확인하기 위해 가져오는 데이터
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		System.out.println("생일 구독 comCode : "+comCode);
		int empCount = bService.countEmp(comCode);		

		//현재 생일 구독 서비스를 이용중인지 체크하기 위한 데이터
		int chkResult = bService.subscribeChk(comCode);
		
		mv.addObject("countEmp", empCount);
		mv.addObject("chkResult", chkResult);
		mv.setViewName("company/birthday/birthday_service_subs");
		
		return mv;
	}
	
	
	
	@RequestMapping("subscribe.birth")
	public ModelAndView subscribe(Birthday b, ModelAndView mv) {
		
		b.setNotification_msg(b.getNotification_msg().replaceAll("\n", "<br>"));
		
		bService.subscribe(b);
		mv.addObject("b", b).setViewName("redirect:/");
			
		return mv;
	}
	
	@RequestMapping("subscribeInfo.birth")
	public ModelAndView subscribeInfo(ModelAndView mv, HttpSession session) {

		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		System.out.println("생일 구독 정보 comCode : "+comCode);
		int chkResult = bService.subscribeChk(comCode);
		
		if(chkResult > 0) {

			Birthday b = bService.subscribeInfo(comCode);
			
			b.setNotification_msg(b.getNotification_msg().replaceAll("<br>", "\n"));
			
			mv.addObject("chkResult", chkResult);
			mv.addObject("b", b);
			mv.setViewName("company/birthday/birthday_service_info");
			
			return mv;
			
		}else {
			//mv.addObject("chkResult", chkResult);
			//mv.setViewName("company/birthday/birthday_service_info");
			mv.addObject("msg", "구독 정보가 존재하지 않습니다.");
			mv.setViewName("common/alert");
			
			return mv;
		}

	}
	
	@RequestMapping("updateSubscribe.birth")
	public ModelAndView updateSubscribe(Birthday b, ModelAndView mv) {
		
		b.setCom_code("A");// 우선 A로 설정
		
		bService.updateSubscribe(b);
		
		mv.addObject("comCode", b.getCom_code()).setViewName("redirect:/");
		
		return mv;
	}
	
}
