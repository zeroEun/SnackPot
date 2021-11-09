package com.kh.spring.snack.snackList.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.snack.snackList.model.service.HoSnackListService;
import com.kh.spring.snack.snackList.model.vo.ListSchedule;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackSubs.model.service.SnackSubsService;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Controller
public class HoSnackListController {
	
	@Autowired
	private HoSnackListService hoSnackListService;
	
	@Autowired
	private SnackSubsService snackSubsService;
	
	@RequestMapping("listSchedule.sn")
	public String listScheduleForm(Model model) {
	
		//세션에서 로그인 사원의 담당 회사 코드 불러오기, 회사 코드 여러개일 때?
		
		String comCode = "k2111021928,k2111042028";
		
		
		model.addAttribute("schedule", companyInfo(comCode));
		return "headoffice/snack/snackListSchedule";
	}
	
	
	public ArrayList<ListSchedule> companyInfo(String comCode) {
		
		
		//회사 코드로 회사명,  간식 배송 예정일, 신청일, 해당 월 리스트 발송 여부 알아오기
		
				HashMap map = new HashMap();
				String[] comArr = comCode.split(",");
				map.put("comArr", comArr);
				
				ArrayList<ListSchedule> schedule = hoSnackListService.selectSubsInfo(map);
			
				
				//현재 월에 신청한 구독 건은 제외
				//간식 배송예정일 20, 신청일 10/4
				//리스트 발송 예정일 : 배송 예정일 -7, 주문 마감일 : -2 , 배송예정일 : 해당월 20일
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				for(ListSchedule s : schedule) {
					
					Calendar cal = Calendar.getInstance();
					
					//배송 예정일자
					int dDay = Integer.parseInt(s.getDeliveryDate());
					
					//발송일이 7이하일 경우 month에 1더해주기
					
					if(dDay <= 7) {
						cal.set(Calendar.DAY_OF_MONTH, dDay);
						cal.add(Calendar.MONTH, 1);
					}else {
						//오늘 날짜 기준 해당월의 시작일 + dDay
						cal.set(Calendar.DAY_OF_MONTH, dDay);
					}
					
					s.setDeliveryDate(sdf.format(cal.getTime()));
					
					//주문 마감일 : 배송예정일 -2
					cal.add(Calendar.DATE, -2);
					s.setOrderDeadline(sdf.format(cal.getTime()));
					
					//리스트 발송일 : 배송예정일 -5
					cal.add(Calendar.DATE, -5);
					s.setListTransDate(sdf.format(cal.getTime()));
					
					//해당 월 리스트 발송 여부 확인
					//리스트가 존재해도 transStatus 상태값이 N이면 set 'N'
					int result = hoSnackListService.listCheck(s.getComCode());
					
					if(result > 0) {
						s.setStatus("Y");
					}else {
						s.setStatus("N");
					}
					System.out.println(s);
				}
				
				return schedule;
		
		
	}
	
	
	
	@RequestMapping("createListForm.sn")
	public String createSnackListForm(String comCode, ListSchedule schedule, Model model) {
		
		
		//회사 정보 객체 만들어 불러오기 : 회사명, 주문 마감일, 예산, 리스트 번호
		//주문 마감일 구하는 메소드 따로 만들기 가능?ㅜ
		
		//리스트 생성 여부 확인, 발송 여부에 N이 있으면 추가 X 기존 리스트No 불러오기, N이 없으면 insert
		int listNo = hoSnackListService.selectSnackListNo(comCode);
		
		if(listNo > 0) {
			ArrayList<SnackDList> dList =  hoSnackListService.selectSnackDList(listNo);
			model.addAttribute("dList", dList);
			model.addAttribute("listNo", listNo);
			System.out.println(dList);
		}else {
			hoSnackListService.insertSanckList(comCode);
			model.addAttribute("listNo", hoSnackListService.selectSnackListNo(comCode));
		}
		
		
		System.out.println(schedule);
		
		model.addAttribute("s", schedule);
		return "headoffice/snack/createSnackList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectSubCate.sn" , produces="application/json; charset=utf-8")
	public ArrayList<SnackSubCategory> selectSubCategory(@RequestParam int cNo) {
		
		ArrayList<SnackSubCategory> category = snackSubsService.selectSubCategory(cNo);
		
		return category;
	}
	
	@RequestMapping("searchSnack.sn")
	public String searchSnack(String comCode, SearchSnack search,  Model model) {
		
		System.out.println(search);
		
		ArrayList<Product> searchList = hoSnackListService.searchSnack(search);
		
		
		ListSchedule schedule = companyInfo(comCode).get(0);
		System.out.println(schedule);
		
		
		model.addAttribute("s", schedule);
		model.addAttribute("searchList", searchList);
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("createList.sn")
	public String createList(String comCode, int listNo, Model model){
		
		ListSchedule schedule = companyInfo(comCode).get(0);
		model.addAttribute("s", schedule);
		
		SnackSubs subs = snackSubsService.selectSubsInfo(comCode);
		ArrayList<SnackDList> list =  hoSnackListService.selectSnack(subs);
		
		ArrayList<SnackDList> dList = new ArrayList<SnackDList>();

		int budget = subs.getBudget();
		int snackBudget = budget * subs.getSnackRatio()/100;
		int drinkBudget = budget * subs.getDrinkRatio()/100;
		int retortBudget = budget * subs.getRetortRatio()/100;
		
		//랜덤으로 상품번호 가져와서 list에 번호가 있는지 확인
		//있으면 수량 체크(재고 있는지)확인
		//재고가 있으면 수량 * 금액 각 카테고리 번호 확인하여 해당 카테고리 금액에서 마이너스, 예산에서 뺀 금액에 마이너스가 되면 continue
		//insert되면 해당 객체는 리스트에서 삭제(중복 값 피하기 위해)
		
		int total = snackBudget + drinkBudget + retortBudget;
		int amount = 20;
		
		while(total > 0) {
			
			System.out.println( "total: " +  total);
			int r = (int)((Math.random())*151 + 1);
			System.out.println(r);
			
			Iterator<SnackDList> iter = list.iterator();
			while(iter.hasNext()) {
				
				SnackDList s = iter.next();
				
				if(r == s.getSnackNo()) {
					System.out.println("------------일치----------");
					
					if(s.getStock() >= amount) {
						System.out.println(s.getCategoryNo());
						
						switch(s.getCategoryNo()){
						case 1: 
							System.out.println(snackBudget);
							if(snackBudget > 0) {
								snackBudget -= s.getReleasePrice()*amount;
								System.out.println("snackBudget" +snackBudget);
							}break;
						case 2: 
							if(drinkBudget > 0) {
								drinkBudget -= s.getReleasePrice()*amount;
								System.out.println("drinkBudget" +drinkBudget);
							}break;
						case 3: 
							if(retortBudget > 0) {
								retortBudget -= s.getReleasePrice()*amount;
								System.out.println("retortBudget" +retortBudget);
							}break;	
						}
						
						s.setAmount(amount);
						dList.add(s);
						iter.remove(); //중복 제거를 위해 remove
						total = snackBudget + drinkBudget + retortBudget;
						
					}
						
				}
					
			}
				
		}
			
		model.addAttribute("dList", dList);
		model.addAttribute("comCode", comCode);
		model.addAttribute("listNo", listNo);
		return "headoffice/snack/createSnackList";
	
	}
		
	
}
