package com.kh.spring.birthday.sendList.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday.sendList.model.service.SendListService;
import com.kh.spring.birthday.sendList.model.vo.SendList;

@Controller
public class SendListController {

	@Autowired
	private SendListService sendListService;
	
	@RequestMapping(value="sendList.birth")
	public String selectSendList(Model model) {
		
		ArrayList<SendList> list = sendListService.selectSendList();
		
		model.addAttribute("list", list);
		
		return "company/birthday/sending_list";
	}
}
