package com.kh.spring.birthday.sendingStatus.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.sendingStatus.model.service.SendingStatusService;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class SendingStatusController {

	@Autowired
	private SendingStatusService sendingStatusService;
	
	@RequestMapping(value="sendingcursts.birth")
	public String sendingcursts(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		
		int birthSubsChk = sendingStatusService.subscribeChk(comCode);
		System.out.println("birthSubsChk : " + birthSubsChk);
		
		int sendingTime = selectSendingTime(comCode);
		System.out.println("발송시점 sendingTime : " + sendingTime);
		
		if(sendingTime < 0) {
			model.addAttribute("msg", "구독 정보가 존재하지 않습니다.");
			
			return "common/alert";
		}else {
			ArrayList<SendingStatus> list = sendingStatusService.sendingcursts(sendingTime);

			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int thisYear = cal.get(Calendar.YEAR);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=0; i<list.size(); i++) {

				cal.setTime(list.get(i).getCempBirth());
				cal.add(Calendar.DATE, -sendingTime);
				
				list.get(i).setSendingMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));
			}

			model.addAttribute("birthSubsChk", birthSubsChk);
			model.addAttribute("list", list);
			
			return "company/birthday/sending_current_status";
		}

	}
	
	private int selectSendingTime(String comCode) {
		
		String sendingTime = sendingStatusService.selectSendingTime(comCode);
		
		int result = 0;
		
		if(sendingTime != null) {
			switch(sendingTime) {
			case "당일" :
				result = 0;
				break;
			case "3일전" :
				result = 3;
				break;
			case "5일전" :
				result = 5;
				break;
			}
		}else {
			result = -1;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="delSendSts.birth")
	public int deleteSendStatus(HttpServletRequest request) {
		
		String[] chkArr = request.getParameterValues("chkArr");
		
		int result = 0;
		int resultSum = 0;
		for(int i=0; i<chkArr.length; i++) {			
			result = sendingStatusService.deleteSendStatus(Integer.parseInt(chkArr[i]));
			resultSum += result;			
		}
		
		if(resultSum == chkArr.length) {
			return resultSum;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="insSendSts.birth")
	public String insertSendStatus(SendingStatus s) {
		
		int result = sendingStatusService.insertSendStatus(s);
		
		int sendingTime = selectSendingTime(s.getComCode());
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int thisYear = cal.get(Calendar.YEAR);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		cal.setTime(s.getCempBirth());
		cal.add(Calendar.DATE, -sendingTime);
			
		s.setSendingMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));

		int result2 = sendingStatusService.insertSendStatus2(s);
		System.out.println("result2 : " + result2);
		
		return String.valueOf(result + result2);
		
	}
	
	/*
	@RequestMapping(value="selectEmpOne.birth")
	public ModelAndView selectEmpOne(int cempSeq, ModelAndView mv) {
		System.out.println("cempSeq : " + cempSeq);
		SendingStatus s = sendingStatusService.selectEmpOne(cempSeq);
		System.out.println("선택 수정 선택 객체 : " + s);
		mv.addObject("s", s).setViewName("redirect:/");
		
		return mv;
		
		
	}*/
	
	@ResponseBody
	@RequestMapping(value="selectEmpOne.birth")
	public SendingStatus selectEmpOne(int cempSeq) {
		System.out.println("cempSeq : " + cempSeq);
		SendingStatus s = sendingStatusService.selectEmpOne(cempSeq);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("cempBirth : " + s.getCempBirth());
		
		s.setCempBirthSdf(sdf.format(s.getCempBirth()));
		System.out.println("cempBirth2 : " + s.getCempBirthSdf());
		System.out.println("선택 수정 선택 객체 : " + s);		
		
		return s;
		
	}
	
	@ResponseBody
	@RequestMapping(value="updSendSts.birth")
	public String updateSendStatus(SendingStatus s) {
		
		int result = sendingStatusService.updateSendStatus(s);
		System.out.println("수정result: " + result);
		
		return String.valueOf(result);
		
	}
}
