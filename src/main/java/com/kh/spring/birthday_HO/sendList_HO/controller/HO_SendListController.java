package com.kh.spring.birthday_HO.sendList_HO.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday_HO.sendList_HO.model.service.HO_SendListService;
import com.kh.spring.birthday_HO.sendList_HO.model.vo.HO_SendList;

@Controller
public class HO_SendListController {

	@Autowired
	private HO_SendListService sendListService;
	
	@RequestMapping(value="sendingList.ho")
	public String selectList(Model model) {
		
		ArrayList<HO_SendList> list = sendListService.selectSendingList();
		System.out.println("list확인 : " + list);
		
		model.addAttribute("list", list);
		
		return "headoffice/birthday_HO/sending_list_HO";
	}
}
