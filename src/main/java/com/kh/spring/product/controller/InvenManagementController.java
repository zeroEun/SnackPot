package com.kh.spring.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.product.model.service.InvenManagementService;
import com.kh.spring.product.model.vo.Product;

@Controller
public class InvenManagementController {
	
	@Autowired
	private InvenManagementService invenManagementService;
	
	//제품등록 페이지로 이동
	@RequestMapping("snackEnrollForm.pm")
	public String snackEnrollForm() {

		
	return "headoffice/invenManagement/snackEnrollForm";
	}
	
	//제품 insert
		@RequestMapping("insert.pm")
		public String insertSnack(@ModelAttribute Product p, HttpSession session) {
			
			invenManagementService.insertSnack(p);
			
			session.setAttribute("msg", "상품 등록 성공");
			return "redirect:/";
		}


}
