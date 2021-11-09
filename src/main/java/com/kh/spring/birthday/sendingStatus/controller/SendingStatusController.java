package com.kh.spring.birthday.sendingStatus.controller;

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
}
