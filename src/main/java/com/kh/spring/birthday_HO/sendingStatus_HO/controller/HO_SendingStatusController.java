package com.kh.spring.birthday_HO.sendingStatus_HO.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday_HO.sendingStatus_HO.model.service.HO_SendingStatusService;
import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;

@Controller
public class HO_SendingStatusController {

	@Autowired
	private HO_SendingStatusService sendingStsService;
	
	@RequestMapping(value="sendingcursts.ho")
	public String selectList(Model model) {
		
		ArrayList<HO_SendingStatus> list = sendingStsService.selectList();
		System.out.println("list확인 : " + list);
		
		model.addAttribute("list", list);
		
		return "headoffice/birthday_HO/sending_current_status_HO";
	}
	
	
}
