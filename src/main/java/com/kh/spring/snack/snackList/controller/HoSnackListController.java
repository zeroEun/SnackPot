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
import com.kh.spring.snack.snackList.model.vo.SnackList;
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
	
	//구독 회사의 리스트 정보(스케줄)를 생성하는 메소드 comListInfo
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
		
		//회사 정보 객체 만들어 불러오기 : 회사명, 주문 마감일, 예산, 총 금액, 리스트 번호
		
		//리스트 생성 여부 확인, 발송 여부에 N이 있으면 추가 X 기존 리스트No 불러오기, N이 없으면 insert
		int listNo = selectSnackListNo(comCode);
		ArrayList<SnackDList> dList = null;
		
		if(listNo > 0) {
			dList =  hoSnackListService.selectSnackDList(listNo);
		}else {
			hoSnackListService.insertSanckList(comCode);
			listNo = selectSnackListNo(comCode);
		}
		
		schedule.setListNo(listNo);
		schedule.setTotalPrice(selectTotalPrice(listNo));
		
		System.out.println(schedule);
		model.addAttribute("dList", dList);
		model.addAttribute("s", schedule);
		return "headoffice/snack/createSnackList";
	}
	
	//간식 리스트 번호 불러오는 메소드, 리스트 번호가 없을 경우 0 리턴
	public int selectSnackListNo(String comCode) {
		
		return hoSnackListService.selectSnackListNo(comCode);
	}
	
	//해당 간식 리스트의 총 금액을 불러오는 메소드
	public int selectTotalPrice(int listNo) {
		
		return hoSnackListService.selectTotalPrice(listNo);
	}
	
	
	@RequestMapping("createList.sn")
	public String createList(String comCode, int listNo, int defaultAmount, Model model){
		
		deleteSnackDList(listNo);
		insertSnackDList(comCode, listNo, defaultAmount);
		ArrayList<SnackDList> dList =  hoSnackListService.selectSnackDList(listNo);
		
		ListSchedule schedule = companyInfo(comCode).get(0);
		schedule.setTotalPrice(selectTotalPrice(listNo));
		schedule.setComCode(comCode);
		schedule.setListNo(listNo);
		
		model.addAttribute("s", schedule);
		model.addAttribute("dList", dList);
		return "headoffice/snack/createSnackList";
	
	}
	
	//간식 상세 리스트 삭제 메소드
	public void deleteSnackDList(int listNo) {
		hoSnackListService.deleteSnackDList(listNo);
	}
	
	//리스트 생성 버튼 클릭시 간식 리스트 생성 후 간식 상세 리스트 insert하는 메소드
	public void insertSnackDList(String comCode, int listNo, int defaultAmount) {
		
		SnackSubs subs = snackSubsService.selectSubsInfo(comCode);
		ArrayList<SnackDList> list =  hoSnackListService.selectSnack(subs);
		ArrayList<SnackDList> dList = new ArrayList<SnackDList>();

		int maxNum = hoSnackListService.selectSnackMaxNum()-1;
		System.out.println("maxNum" + maxNum);
		
		
		int budget = subs.getBudget();
		int snackBudget = budget * subs.getSnackRatio()/100;
		int drinkBudget = budget * subs.getDrinkRatio()/100;
		int retortBudget = budget * subs.getRetortRatio()/100;
		
		//랜덤으로 상품번호 가져와서 list에 번호가 있는지 확인
		//있으면 수량 체크(재고 있는지)확인
		//재고가 있으면 수량 * 금액 각 카테고리 번호 확인하여 해당 카테고리 금액에서 마이너스, 예산에서 뺀 금액에 마이너스가 되면 continue
		//insert되면 해당 객체는 리스트에서 삭제(중복 값 피하기 위해)
		
		int total = snackBudget + drinkBudget + retortBudget;
		int amount = defaultAmount;
		
		while(total > 0) {
			
			if(list.isEmpty()) break; //예산 초과 시 해당 항목을 지워 무한루프 방지, 재고가 간식 양보다 적을 경우는 삭제가 안되는데 어떻게 하지?
			
			//랜덤 범위 과자번호 MAX불러오기
			System.out.println( "total: " +  total);
			int r = (int)((Math.random())*maxNum + 1);
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
							if(snackBudget > 0) {
								snackBudget -= s.getReleasePrice()*amount;
							}else{
								iter.remove(); 
								continue;
							}break;
						case 2: 
							if(drinkBudget > 0) {
								drinkBudget -= s.getReleasePrice()*amount;
							}else{
								iter.remove();
								continue;
							}break;
						case 3: 
							if(retortBudget > 0) {
								retortBudget -= s.getReleasePrice()*amount;
							}else{
								iter.remove();
								continue;
							}break;	
						}
						s.setAmount(amount);
						s.setSnackListNo(listNo);
						dList.add(s);
						iter.remove(); //중복 제거를 위해 remove
						total = snackBudget + drinkBudget + retortBudget;
					}
						
				}
					
			}
				
		}
		
		hoSnackListService.insertSnackDList(dList);
		
	}
	
	//검색 카테고리 불러오는 메소드
	@ResponseBody
	@RequestMapping(value="selectSubCate.sn" , produces="application/json; charset=utf-8")
	public ArrayList<SnackSubCategory> selectSubCategory(@RequestParam int cNo) {
		
		ArrayList<SnackSubCategory> category = snackSubsService.selectSubCategory(cNo);
		
		return category;
	}
	
	//검색 결과 리스트 반환 메소드
	@RequestMapping("searchSnack.sn")
	public String searchSnack(String comCode, int listNo, SearchSnack search, Model model) {
		
		System.out.println(search);
		
		ArrayList<Product> searchList = hoSnackListService.searchSnack(search);
		ArrayList<SnackDList> dList =  hoSnackListService.selectSnackDList(listNo);
		
		
		ListSchedule schedule = companyInfo(comCode).get(0);
		schedule.setTotalPrice(selectTotalPrice(listNo));
		schedule.setComCode(comCode);
		schedule.setListNo(listNo);
		
		
		model.addAttribute("dList", dList);
		model.addAttribute("s", schedule);
		model.addAttribute("searchList", searchList);
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("deleteSnackDNo.sn")
	public String deleteSnackDNo(String comCode, int listNo, String snackDNoCheck, Model model) {
		
		System.out.println(snackDNoCheck);
		hoSnackListService.deleteSnackDNo(snackDNoCheck);
		
		ArrayList<SnackDList> dList =  hoSnackListService.selectSnackDList(listNo);
		ListSchedule schedule = companyInfo(comCode).get(0);
		schedule.setTotalPrice(selectTotalPrice(listNo));
		schedule.setComCode(comCode);
		schedule.setListNo(listNo);
		
		model.addAttribute("dList", dList);
		model.addAttribute("s", schedule);
		
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("addDList.sn")
	public String addSanckDList(String comCode, SnackDList snackD, Model model) {
		
		System.out.println("snackD" + snackD);
		hoSnackListService.addSanckDList(snackD);
		int listNo = snackD.getSnackListNo();
		
		ArrayList<SnackDList> dList =  hoSnackListService.selectSnackDList(listNo);
		ListSchedule schedule = companyInfo(comCode).get(0);
		schedule.setTotalPrice(selectTotalPrice(listNo));
		schedule.setComCode(comCode);
		schedule.setListNo(listNo);
		
		model.addAttribute("dList", dList);
		model.addAttribute("s", schedule);
		
		return "headoffice/snack/createSnackList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="checkSnackDup.sn", produces="application/json; charset=utf-8")
	public int checkSnackDup(int listNo, int snackNo) {
		
		SnackDList sncakD = new SnackDList();
		sncakD.setSnackListNo(listNo);
		sncakD.setSnackNo(snackNo);
		
		return hoSnackListService.checkSnackDup(sncakD);
	}
	
	
	@RequestMapping("updateSnackAmount.sn")
	public String updateSnackAmount(String comCode, int listNo, SnackDList snackD, Model model) {
		
		hoSnackListService.updateSnackAmount(snackD);
		
		ArrayList<SnackDList> dList =  hoSnackListService.selectSnackDList(listNo);
		ListSchedule schedule = companyInfo(comCode).get(0);
		schedule.setTotalPrice(selectTotalPrice(listNo));
		schedule.setComCode(comCode);
		schedule.setListNo(listNo);
		
		model.addAttribute("dList", dList);
		model.addAttribute("s", schedule);
		
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("sendSnackList.sn")
	public String sendSnackList(ListSchedule schedule, Model model) {
		
		System.out.println(schedule);
		int listNo = schedule.getListNo();
		
		insertOrder(schedule);
		insertOrderDetail(listNo);
		updateTransStatus(listNo);
		
		return "redirect:/listSchedule.sn";
	}
	
	
	public void insertOrder(ListSchedule schedule) {
		
		hoSnackListService.insertOrder(schedule);
	}
	
	public void insertOrderDetail(int listNo) {
		
		hoSnackListService.insertOrderDetail(listNo);
	}
	
	public void updateTransStatus(int listNo) {
		
		hoSnackListService.updateTransStatus(listNo);
	}
	
	@RequestMapping("sendingList.sn")
	public String snackSendingList(Model model) {
		
		String comCode = "k2111021928,k2111042028";
		
		model.addAttribute("sendingList", selectSendingList(comCode));
		
		return "headoffice/snack/snackSendingList";
	}
	
	public ArrayList<SnackList> selectSendingList(String comCode){
		
		HashMap map = new HashMap();
		String[] comArr = comCode.split(",");
		map.put("comArr", comArr);
		
		return hoSnackListService.selectSendingList(map);
	}
}
