package com.kh.spring.birthday.sendingStatus.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
