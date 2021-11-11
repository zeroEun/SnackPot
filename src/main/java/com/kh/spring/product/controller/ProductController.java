package com.kh.spring.product.controller;

import java.lang.ProcessBuilder.Redirect;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.product.model.service.ProductService;
import com.kh.spring.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	//스낵류(1)
	@RequestMapping("list.pro")
	public String selectList(Model model ,@RequestParam(value="dtc")int dtc) {
		
		ArrayList<Product> list = productService.selectList(dtc);
//		System.out.println("product list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("ctdNo" , "1");
		System.out.println(model.toString());
		
		return "product/productSnackView";
	}
	
	//음료류 (2)
	@RequestMapping("list.drink")
	public String selectDrinkList(Model model , @RequestParam(value="dtc")int dtc) {
		System.out.println("dtc : " + dtc);// 세부카테고리 받아오기
		
		ArrayList<Product> list = productService.selectDrinkList(dtc);
		model.addAttribute("list", list);
		model.addAttribute("ctdNo" , "2");
	
		return "product/productSnackView";
	}
	
	//간편식 (3)
	@RequestMapping("list.food")
	public String selectConvenienceFood(Model model , @RequestParam(value="dtc")int dtc) {
		System.out.println("dtc : " + dtc);// 세부카테고리 받아오기
		
		ArrayList<Product> list = productService.selectFoodList(dtc); 
		model.addAttribute("list", list);
		model.addAttribute("ctdNo" , "3");
		
		return "product/productSnackView";
	}
	
	
	@RequestMapping("insert.wish")
	public String insertWishList(@RequestParam("wishSnackNo") String wishSnackNo , Product p) {
		//System.out.println("wishSnackNo : " + wishSnackNo);
		
		/*로그인하면 사원 session에서 회사코드 가져와서 같이 insert해주기*/
		//String comCode = "KAKAO";
		String comCode = "KH01";
		
		/*마감날짜를 간식구독 테이블에서 가져오기*/
		int deliveryDate =  Integer.parseInt(productService.selectDeliveryDate(comCode)); //8
		System.out.println("deliveryDate : " + deliveryDate);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		cal.set(Calendar.DAY_OF_MONTH, deliveryDate);
		cal.add(Calendar.MONTH, +1);
		cal.add(Calendar.DATE, -8); 
		
		String wishEndDate = sdf.format(cal.getTime()); //위시리스트마감일(YYYY-MM-DD)
		System.out.println("wishEndDate : " + wishEndDate );
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("comCode", comCode);
		map.put("wishEndDate" , wishEndDate); 
		map.put("wishSnackNo" , wishSnackNo);
		
		/*위시리스트테이블에  회사위시리스트가 이미 있는지 체크하기*/
		int wishListChk = productService.chkWishList(comCode); //회사코드와 상태값이 'N' 이면  1 
		System.out.println("wishListChk : " + wishListChk);
		
		if(wishListChk == 0) { // 아직 위시리스트가 생성되지않았다
			int result = productService.insertWishList(map);
			
			if(result > 0) { // 담은 간식이 있다
				int SubWishNo = productService.selectSubWishNo(comCode); //위시리스트에서 구독번호 알아오기
				System.out.println("SubWishNo : " + SubWishNo);
				map.put("SubWishNo", SubWishNo);
		
				int result1 = productService.insertWishDetail(map); //구독번호를 통해서 상세테이블에 상품 담기
			
			}
			
		}else if(wishListChk == 1) {//이미 위시리스트가 생성되어있다
			//간식이 중복되어있는지 확인해야한다
			int count = productService.chkSnackNo(wishSnackNo);
			System.out.println("count : " + count);
			
			if(count == 0) { //간식중복이 아니라면
				
				int SubWishNo = productService.selectSubWishNo(comCode);
				System.out.println("SubWishNo : " + SubWishNo);
				map.put("SubWishNo", SubWishNo);
				
				int result2 = productService.updateWishEndDate(map); //배송예정일이 바뀔수도 있기때문에 update
				int result = productService.insertWishDetail(map);
			}else {
				int result2 = productService.updateWishEndDate(map);
				int result = productService.updateSnackCount(map);
				
			}
			
		}
	
		return "product/productSnackView";
	
	}
	
/*=========================================================================================================*/
	
	/*위시리스트 view*/
	@RequestMapping("wishList")
	public String wishListView(Model model, HttpSession session ) {
		
		/*로그인한 유저의 회사*/
		//String comCode = "KAKAO";
		String comCode = "KH01";
		
		int companyChk = productService.chkWishList(comCode); //회사코드와 상태값이 'N' 이면  1 
		
		if(companyChk == 0 ) {
		
			session.setAttribute("msg", "위시리스트가 존재하지 않습니다. 간식을 담아주세요");
			return "redirect:/";	
		}else {
		
			ArrayList<Product> list = productService.selectWishDetailList(comCode);
			model.addAttribute("list" , list);
			
			return  "product/wishListMainView";
		}
	}
	
	/*위시리스트 수량*/
	//수량증가
	@RequestMapping("updateCount.wish")
	public String updatePlusCount(@RequestParam("snackNo") String snackNo , @RequestParam("addCount") String addCount ,
			 					  @RequestParam("wishNo") String wishNo ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("snackNo", snackNo);
		map.put("addCount", addCount);
		map.put("wishNo", wishNo);
		
		int result = productService.updatePlusCount(map);
		
		return  "product/wishListMainView";
	}
	
	/*위시리스트 간식 삭제 - wishNo랑 같이 가져가서 삭제해야함*/
	@RequestMapping("delete.wish")
	public String deleteSnack(@RequestParam("snackNo") String snackNo , @RequestParam("wishNo") String wishNo){
		
		System.out.println("삭제할 스낵번호랑 구독번호 : " + snackNo + wishNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("snackNo", snackNo);
		map.put("wishNo", wishNo);
		
		int result = productService.deleteSnack(map);
		
		return  "product/wishListMainView"; 
	}
	
	
	// 스케줄러 테스트
	/*
	 * 1. 현재 날짜를 가져와서 WISHLIST에 보내기
	 * 2. 동일하면 WISHLIST STATUS를 'N'-> 'Y'로
	 * */
	//@Scheduled(cron = "*/10 * * * * *") --> 10초마다
	//@Scheduled(cron = "0 50 17 1/1 * ?") --> 매일 5시 50분 마다 실행 (0시0분으로 바꿔서 다시해보기)
//	public void updateClosingDate() {
//		//테스트 
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
//		Calendar cal = Calendar.getInstance();
//			
//		String today = sdf.format(cal.getTime());
//		System.out.println("today 오늘의 날짜? : " + today); 
//		
//		productService.updateClosingDate(today);
//		
//		
//	}
	
	
}
