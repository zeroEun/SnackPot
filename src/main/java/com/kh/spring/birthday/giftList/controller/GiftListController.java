package com.kh.spring.birthday.giftList.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spring.birthday.giftList.model.service.GiftListService;
import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftFolderDetail;
import com.kh.spring.birthday.giftList.model.vo.GiftList;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class GiftListController {

	@Autowired
	private GiftListService giftListService;
	
	@RequestMapping(value="giftList.birth")
	public String selectGiftList(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		String perAmount = giftListService.selectPerAmount(comCode);
		
		if(perAmount != "") {
			int perAmountMax = Integer.parseInt(perAmount);
			
			//메인 화면에 나타나는 상품 정보
			ArrayList<GiftList> list = giftListService.selectGiftList(perAmountMax);
			
			model.addAttribute("list", list);
			
			//modal창에 나타나는 선물리스트 폴더명
			//List에 String, Object 형식인 Map으로 데이터 삽입 -> 필드명이 key, 데이터값이 value
			//ArrayList<HashMap<String, GiftFolderList>> folderArr = giftListService.selectFolderArr();
			//ArrayList<GiftFolder> folder = giftListService.selectFolderArr();
			
			System.out.println("list : " + list);
			System.out.println("최대금액comCode : " + comCode);
			System.out.println("최대금액perAmount : " + perAmount);
			//System.out.println("folder : " + folder);		
			
			//model.addAttribute("folder", folder);
			return "company/birthday/gift_list";
			
		}else {
			//perAmount값이 없으면 구독을 안 하고 있는 것
			model.addAttribute("msg", "구독 정보가 존재하지 않습니다.");
			
			return "common/alert";
		}
	
	}
	
	@ResponseBody
	@RequestMapping(value="selectFolderList.birth", produces="application/json; charset=utf-8")
	public String selectFolderList(){
		
		ArrayList<GiftFolder> folderList = giftListService.selectFolderList();
		System.out.println("folderList : " + folderList);
		
		return new Gson().toJson(folderList);
	}
	
	@ResponseBody
	@RequestMapping(value="selectCtgry.birth")
	public ArrayList<GiftList> selectCtgry(int ctgryNum, HttpSession session){
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		String perAmount = giftListService.selectPerAmount(comCode);
		int perAmountMax = Integer.parseInt(perAmount);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("perAmountMax", perAmountMax);
		map.put("ctgryNum", ctgryNum);
		
		System.out.println("넘겨받은 ctgryNum : " + ctgryNum);
		System.out.println("넘겨받은 map : " + map);
		
		ArrayList<GiftList> list = new ArrayList<GiftList>();
		
		list = giftListService.selectCtgry(map);
		System.out.println("카테고리list : " + list);
		System.out.println("카테고리comCode : " + comCode);
		System.out.println("카테고리perAmount : " + perAmount);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="addGiftFolder.birth", produces="application/json; charset=utf-8")
	public String addGiftFolder(String folderName) {
		
		System.out.println("fName : " + folderName);
		
		int result = 0;
		
		if(folderName != "") {
			result = giftListService.addGiftFolder(folderName);
		}
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			return new Gson().toJson(folderName);
		}else {
			return new Gson().toJson("");
		}		
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectFolderInfo.birth")
	public ArrayList<GiftList> selectFolderInfo(int rowNum){
		
		System.out.println("rowNum : " + rowNum);
		
		ArrayList<GiftList> list = new ArrayList<GiftList>();
		
		list = giftListService.selectFolderInfo(rowNum);
		System.out.println("seletFolderInfo : " + list);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="addGiftDetail.birth")
	public String addGiftDetail(String[] detailArr) {
		
		System.out.println(detailArr[0]);
		System.out.println(detailArr[1]);
		int result = giftListService.addGiftDetail(detailArr);
		System.out.println("result:" + result);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="checkDuplicate.birth")
	public int checkDuplicate(String[] detailArr) {
		
		System.out.println(detailArr[0]);
		System.out.println(detailArr[1]);
		GiftFolderDetail result = giftListService.checkDuplicate(detailArr);
		System.out.println("result:" + result);
		
		if(result != null) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="delGiftFolder.birth")
	public String deleteGiftFolder(String glistNo) {
		
		System.out.println("folderNo : " + glistNo);
		
		int result = giftListService.deleteGiftFolder(glistNo);

		System.out.println("result : " + result);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="delFolderDetail.birth")
	public String deleteFolderDetail(String[] delGiftArr) {
		
		System.out.println("delGiftArr : " + delGiftArr);
		
		int result = giftListService.deleteFolderDetail(delGiftArr);

		System.out.println("result : " + result);
		
		return String.valueOf(result);
	}
}
