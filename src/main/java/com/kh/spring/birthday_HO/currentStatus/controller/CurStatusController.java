package com.kh.spring.birthday_HO.currentStatus.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday_HO.currentStatus.model.service.CurStatusService;
import com.kh.spring.birthday_HO.currentStatus.model.vo.CurStatus;

@Controller
public class CurStatusController {

	@Autowired
	private CurStatusService curStsService;
	
	@RequestMapping(value="sendingcursts.ho")
	public String selectList(Model model) {
		
		ArrayList<CurStatus> list = curStsService.selectList();
		System.out.println("list확인 : " + list);
		
		model.addAttribute("list", list);
		
		return "headoffice/birthday_HO/sending_current_status";
	}
	
	
}
