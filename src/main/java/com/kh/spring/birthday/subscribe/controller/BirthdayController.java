package com.kh.spring.birthday.subscribe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.birthday.subscribe.model.service.BirthdayService;
import com.kh.spring.birthday.subscribe.model.vo.Birthday;

@Controller
public class BirthdayController {

	@Autowired
	private BirthdayService bService;
	
	@RequestMapping("subscribeForm.birth")
	public String subscribeForm() {
		
		return "birthday/birthday_service_subs";
	}
	
	
	
	@RequestMapping("subscribe.birth")
	public String subscribe(Birthday b, HttpSession session) {
		
		//먼저 테이블 상에 해당 회사코드를 가지고 있는 데이터가 있는지 조회
		int result = bService.subscribeChk(b.getCom_code());		
		
		if(result != 0) {
			session.setAttribute("msg", "이미 구독 정보가 존재합니다.");
			return "redirect:/";//매핑 구독 신청 버튼 있는 페이지로 변경
		}else {
			bService.subscribe(b);
			
			session.setAttribute("msg", "생일 구독 신청 성공");
			return "redirect:/";
		}
		
	}
	
	@RequestMapping("subscribeInfo.birth")
	public ModelAndView subscribeInfo(String comCode, ModelAndView mv) {
		
		comCode="A"; //임의로 A값 삽입
		Birthday b = bService.subscribeInfo(comCode);
		//System.out.println("comCode : " + comCode);
		
		mv.addObject("b",b).setViewName("birthday/birthday_service_info");
		
		return mv;
	}
	
}
