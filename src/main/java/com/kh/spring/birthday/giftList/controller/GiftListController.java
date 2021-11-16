package com.kh.spring.birthday.giftList.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.giftList.model.service.GiftListService;
import com.kh.spring.birthday.giftList.model.vo.GiftList;

@Controller
public class GiftListController {

	@Autowired
	private GiftListService giftListService;
	
	@RequestMapping(value="giftList.birth")
	public String selectGiftList(Model model) {
		
		ArrayList<GiftList> list = giftListService.selectGiftList();
		
		model.addAttribute("list", list);
		
		return "company/birthday/gift_list";
	}
	
	@ResponseBody
	@RequestMapping(value="selectCtgry.birth")
	public ArrayList<GiftList> selectCtgry(int ctgryNum){
		
		System.out.println("넘겨받은 ctgryNum : " + ctgryNum);
		
		ArrayList<GiftList> list = new ArrayList<GiftList>();
		
		list = giftListService.selectCtgry(ctgryNum);
		System.out.println("카테고리list : " + list);
		
		return list;
	}
	
}
