package com.kh.spring.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}
