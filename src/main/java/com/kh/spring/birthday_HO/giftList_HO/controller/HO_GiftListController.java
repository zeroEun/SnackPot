package com.kh.spring.birthday_HO.giftList_HO.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday_HO.giftList_HO.model.service.HO_GiftListService;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;

@Controller
public class HO_GiftListController {

	@Autowired
	private HO_GiftListService giftListService;
	
	@RequestMapping(value="giftList.ho")
	public String selectGiftList(Model model) {
		
		ArrayList<HO_GiftList> list = giftListService.selectGiftList();
		
		System.out.println("giftList : " + list);
		model.addAttribute("list",list);
		
		return "headoffice/birthday_HO/gift_list_HO";
	}
	
	@ResponseBody
	@RequestMapping(value="checkedGiftList.ho")
	public ArrayList<HO_GiftList> checkedGiftList(HttpServletRequest request){
		
		String[] chkArr = request.getParameterValues("chkArr");
		//System.out.println("chkArr : " + chkArr);
		ArrayList<HO_GiftList> list = new ArrayList<HO_GiftList>();
		HO_GiftList giftOne = new HO_GiftList();
		
		for(int i=0; i<chkArr.length; i++) {
			
			giftOne = giftListService.checkedGiftList(chkArr[i]);
			//System.out.println("giftOne : " + giftOne);
			
			list.add(giftOne);
		}

		//System.out.println("gglist : " + list);
		
		return list;
	}
}
