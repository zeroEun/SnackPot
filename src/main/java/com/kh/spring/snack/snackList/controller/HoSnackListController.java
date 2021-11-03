package com.kh.spring.snack.snackList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HoSnackListController {

	
	@RequestMapping("listSchedule.sn")
	public String listScheduleForm() {
	
		//세션에서 로그인 사원의 담당 회사 코드 불러오기
		
		String comCode = "k2111021928";
		
		//회사 코드로 회사명,  간식 배송 예정일, 리스트 발송 여부 알아오기
		//해당 월 추출
		
		
		
		
		return "headoffice/snack/snackListSchedule";
	}
	
	
	@RequestMapping("createListForm.sn")
	public String createSnackListForm() {
		
		return "headoffice/snack/createSnackList";
	}
}
