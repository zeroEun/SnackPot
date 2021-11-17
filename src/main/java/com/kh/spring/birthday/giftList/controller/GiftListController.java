package com.kh.spring.birthday.giftList.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.giftList.model.service.GiftListService;
import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftList;

@Controller
public class GiftListController {

	@Autowired
	private GiftListService giftListService;
	
	@RequestMapping(value="giftList.birth")
	public String selectGiftList(Model model) {
		
		//메인 화면에 나타나는 상품 정보
		ArrayList<GiftList> list = giftListService.selectGiftList();
		
		model.addAttribute("list", list);
		
		//modal창에 나타나는 선물리스트 폴더명
		//List에 String, Object 형식인 Map으로 데이터 삽입 -> 필드명이 key, 데이터값이 value
		//ArrayList<HashMap<String, GiftFolderList>> folderArr = giftListService.selectFolderArr();
		ArrayList<GiftFolder> folder = giftListService.selectFolderArr();
		
		System.out.println("list : " + list);
		System.out.println("folder : " + folder);		
		
		model.addAttribute("folder", folder);
		
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
