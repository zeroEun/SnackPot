package com.kh.spring.birthday.subscribe.controller;

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
	public ModelAndView subscribeForm(Birthday b, ModelAndView mv) {
		
		//사원리스트 불러오기 버튼 눌렀을 때 사원 등록이 되어있는지 유무를 확인하기 위해 가져오는 데이터
		b.setCom_code("A");
		int empCount = bService.countEmp(b.getCom_code());
		

		//현재 생일 구독 서비스를 이용중인지 체크하기 위한 데이터
		int chkResult = bService.subscribeChk(b.getCom_code());
		
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
	public ModelAndView subscribeInfo(String comCode, ModelAndView mv) {
		
		comCode="A"; //임의로 A값 삽입
		Birthday b = bService.subscribeInfo(comCode);
		b.setNotification_msg(b.getNotification_msg().replaceAll("<br>", "\n"));
		System.out.println("텍스트아레아 : " + b.getNotification_msg());
		//System.out.println("bithday1 : "+b.getPer_amount());
		//System.out.println("bithday2 : "+b.getSending_time());
		//System.out.println("bithday3 : "+b.getNotification_msg());
		//System.out.println("comCode : " + comCode);
		
		mv.addObject("b",b).setViewName("company/birthday/birthday_service_info");
		
		return mv;
	}
	
	@RequestMapping("updateSubscribe.birth")
	public ModelAndView updateSubscribe(Birthday b, ModelAndView mv) {
		
		b.setCom_code("A");// 우선 A로 설정
		
		bService.updateSubscribe(b);
		
		mv.addObject("comCode", b.getCom_code()).setViewName("redirect:/");
		
		return mv;
	}
	
}
