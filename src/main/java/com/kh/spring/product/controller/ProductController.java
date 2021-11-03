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
	
	//상품리스트 가져오기
	@RequestMapping("list.pro")
	public String selectList(Model model) {
		
		ArrayList<Product> list = productService.selectList();
		System.out.println("product list : " + list);
		model.addAttribute("list", list);
		
		return "product/productSnackView";
	}
	
	
	@RequestMapping("insert.wish")
	public String insertWishList(@RequestParam("wishSnackNo") String wishSnackNo , Product p) {
		//System.out.println("wishSnackNo : " + wishSnackNo);
		
		//로그인하면 사원 session에서 회사코드 가져와서 같이 insert해주기
		String comCode = "KAKAO";
		
		//마감날짜를 간식구독 테이블에서 가져오기
		String deliveryDate = productService.selectDeliveryDate(comCode);
		Date changeDate = null;
	
		//String -> Date
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
		cal.add(Calendar.DATE, -8); 
		
		String wishEndDate = dtf.format(cal.getTime());
	
//		System.out.println("deliveryDate : " + deliveryDate);
//		System.out.println("wishEndDate : " + wishEndDate);
		
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
		
		
		return "product/productSnackView";
	
	}

}
