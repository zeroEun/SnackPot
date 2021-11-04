package com.kh.spring.product.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String selectList(Model model) {
		
		ArrayList<Product> list = productService.selectList();
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
	
	
	@RequestMapping("insert.wish")
	public String insertWishList(@RequestParam("wishSnackNo") String wishSnackNo , Product p) {
		//System.out.println("wishSnackNo : " + wishSnackNo);
		
		//로그인하면 사원 session에서 회사코드 가져와서 같이 insert해주기
		//String comCode = "KAKAO";
		String comCode = "A211104";
		//마감날짜를 간식구독 테이블에서 가져오기
		int deliveryDate =  Integer.parseInt(productService.selectDeliveryDate(comCode)); //8
		System.out.println("deliveryDate : " + deliveryDate);
		
	/* test */	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		cal.set(Calendar.DAY_OF_MONTH, deliveryDate);
		cal.add(Calendar.MONTH, +1);
		cal.add(Calendar.DATE, -8); 
		System.out.println(sdf.format(cal.getTime()));
		
/*		Date changeDate = null;
	
//		String -> Date 
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			
			changeDate = dtf.parse(deliveryDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//마감 날짜 : 간식리스트 발송일 (D-7)일 보다 하루전 (D-8)
		Calendar cal = Calendar.getInstance();
		cal.setTime(changeDate);
		cal.add(Calendar.MONTH, +1);
		cal.add(Calendar.DATE, -8); 
		
		String wishEndDate = dtf.format(cal.getTime());
	
		System.out.println("deliveryDate : " + deliveryDate);
		System.out.println("wishEndDate : " + wishEndDate);
		
		
		//HashMap으로 insert
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("wishSnackNo" , wishSnackNo);
		map.put("wishEndDate" , wishEndDate);
		map.put("comCode", comCode);
		
		//WISHLIST 간식 중복체크
		int count = productService.chkSnackNo(wishSnackNo);
		
		if(count == 0 ) {
			int result = productService.insertWishList(map);
		}else {
			int result = productService.updateSnackCount(map);
		}
	*/	
		
		return "product/productSnackView";
	
	}

}
