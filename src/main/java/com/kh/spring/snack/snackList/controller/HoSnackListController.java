package com.kh.spring.snack.snackList.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.snack.snackList.model.service.HoSnackListService;
import com.kh.spring.snack.snackList.model.vo.ListSchedule;
import com.kh.spring.snack.snackSubs.model.service.SnackSubsService;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Controller
public class HoSnackListController {
	
	@Autowired
	private HoSnackListService hoSnackListService;
	
	@Autowired
	private SnackSubsService snackSubsService;
	
	@RequestMapping("listSchedule.sn")
	public String listScheduleForm(Model model) {
	
		//세션에서 로그인 사원의 담당 회사 코드 불러오기, 회사 코드 여러개일 때?
		
		String comCode = "k2111021928,k2111042028";
		
		//회사 코드로 회사명,  간식 배송 예정일, 신청일, 해당 월 리스트 발송 여부 알아오기
		
		HashMap map = new HashMap();
		String[] comArr = comCode.split(",");
		map.put("comArr", comArr);
		
		ArrayList<ListSchedule> schedule = hoSnackListService.selectSubsInfo(map);
	
		
		//현재 월에 신청한 구독 건은 제외
		//간식 배송예정일 20, 신청일 10/4
		//리스트 발송 예정일 : 배송 예정일 -7, 주문 마감일 : -2 , 배송예정일 : 해당월 20일
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(ListSchedule s : schedule) {
			
			Calendar cal = Calendar.getInstance();
			
			//배송 예정일자
			int dDay = Integer.parseInt(s.getDeliveryDate());
			
			//발송일이 7이하일 경우 month에 1더해주기
			
			if(dDay <= 7) {
				cal.set(Calendar.DAY_OF_MONTH, dDay);
				cal.add(Calendar.MONTH, 1);
			}else {
				//오늘 날짜 기준 해당월의 시작일 + dDay
				cal.set(Calendar.DAY_OF_MONTH, dDay);
			}
			
			s.setDeliveryDate(sdf.format(cal.getTime()));
			
			//주문 마감일 : 배송예정일 -2
			cal.add(Calendar.DATE, -2);
			s.setOrderDeadline(sdf.format(cal.getTime()));
			
			//리스트 발송일 : 배송예정일 -5
			cal.add(Calendar.DATE, -5);
			s.setListTransDate(sdf.format(cal.getTime()));
			
			//해당 월 리스트 발송 여부 확인
			int result = hoSnackListService.listCheck(s.getComCode());
			
			if( result > 0) {
				s.setStatus("Y");
			}else {
				s.setStatus("N");
			}
			System.out.println(s);
		}
		
		
		model.addAttribute("schedule", schedule);
		return "headoffice/snack/snackListSchedule";
	}
	
	
	@RequestMapping("createListForm.sn")
	public String createSnackListForm(ListSchedule schedule, Model model) {
		
		String comCode = schedule.getComCode();
		SnackSubs subs = snackSubsService.selectSubsInfo(comCode);
		
		System.out.println(schedule);
		
		model.addAttribute("s", schedule);
		model.addAttribute("subs", subs);
		return "headoffice/snack/createSnackList";
	}
}
