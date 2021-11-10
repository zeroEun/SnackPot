package com.kh.spring.birthday_HO.sendingList.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday_HO.sendingList.model.service.SendingListService;
import com.kh.spring.birthday_HO.sendingList.model.vo.SendingList;

@Controller
public class SendingListController {

	@Autowired
	private SendingListService sendListService;
	
	@RequestMapping(value="sendingList.ho")
	public String selectList(Model model) {
		
		ArrayList<SendingList> list = sendListService.selectSendingList();
		System.out.println("list확인 : " + list);
		
		model.addAttribute("list", list);
		
		return "headoffice/birthday_HO/sending_list_HO";
	}
}
