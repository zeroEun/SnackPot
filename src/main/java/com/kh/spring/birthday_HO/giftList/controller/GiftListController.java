package com.kh.spring.birthday_HO.giftList.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday_HO.giftList.model.service.GiftListService;
import com.kh.spring.birthday_HO.giftList.model.vo.GiftList;

@Controller
public class GiftListController {

	@Autowired
	private GiftListService giftListService;
	
	@RequestMapping(value="giftList.ho")
	public String selectGiftList(Model model) {
		
		ArrayList<GiftList> list = giftListService.selectGiftList();
		
		System.out.println("giftList : " + list);
		model.addAttribute("list",list);
		
		return "headoffice/birthday_HO/gift_list_HO";
	}
}
