package com.kh.spring.snack.snackOrder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.snack.snackOrder.model.service.SnackOrderService;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

@Controller
public class SnackOrderController {

	@Autowired
	private SnackOrderService snackOrderService;
	
	@RequestMapping("comSnackList.sn")
	public String selectComSnackList(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
			
		Orders order  = snackOrderService.selectOrder(comCode);
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(order.getOrderNo());
		
		model.addAttribute("o", order);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@ResponseBody
	@RequestMapping("totalPrice.sn")
	public int selectTotalPrice(int orderNo) {
		
		return snackOrderService.selectTotalPrice(orderNo);
	}
	
	
	
}
