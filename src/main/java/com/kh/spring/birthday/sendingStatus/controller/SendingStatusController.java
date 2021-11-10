package com.kh.spring.birthday.sendingStatus.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.sendingStatus.model.service.SendingStatusService;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

@Controller
public class SendingStatusController {

	@Autowired
	private SendingStatusService sendingStatusService;
	
	@RequestMapping(value="sendingcursts.birth")
	public String selectsList(Model model) {
		
		ArrayList<SendingStatus> list = sendingStatusService.selectsList();
		
		model.addAttribute("list", list);
		
		return "company/birthday/sending_current_status";
		
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
		
		return String.valueOf(result);
		
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
