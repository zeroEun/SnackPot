package com.kh.spring.snack.snackOrder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.snack.snackList.model.service.HoSnackListService;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackOrder.model.service.SnackOrderService;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

@SessionAttributes("o")
@Controller
public class SnackOrderController {

	@Autowired
	private SnackOrderService snackOrderService;
	
	@Autowired
	private HoSnackListService hoSnackListService;
	
	@RequestMapping("comSnackList.sn")
	public String selectComSnackList(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		Orders order  = snackOrderService.selectOrder(comCode);
		ArrayList<OrderDetail> dList = null;
		
		if(order != null) {
			dList = snackOrderService.selectOrderDetail(order.getOrderNo());
		}
		
		model.addAttribute("o", order);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@ResponseBody
	@RequestMapping("totalPrice.sn")
	public int selectTotalPrice(int orderNo) {
		
		return snackOrderService.selectTotalPrice(orderNo);
	}
	
	@RequestMapping("comSearchSnack.sn")
	public String comSearchSnack(SearchSnack search, Model model, HttpSession session) {
	
		int orderNo = ((Orders)session.getAttribute("o")).getOrderNo();
		
		ArrayList<Product> searchList = hoSnackListService.searchSnack(search);
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@ResponseBody
	@RequestMapping(value="checkOrderSnackDup.sn", produces="application/json; charset=utf-8")
	public int checkOrderSnackDup(int orderNo, int snackNo) {
		
		OrderDetail orderD = new OrderDetail();
		orderD.setOrderNo(orderNo);
		orderD.setSnackNo(snackNo);
		
		return snackOrderService.checkOrderSnackDup(orderD);
	}
	
	@RequestMapping("addOrderDList.sn")
	public String addOrderDList(OrderDetail orderD) {
		
		snackOrderService.addOrderDList(orderD);
		
		return "redirect:comSnackList.sn";
	}
	
	@RequestMapping("deleteOrderDNo.sn")
	public String deleteOrderDNo(String orderDNoCheck, int orderNo, Model model) {
		
		snackOrderService.deleteOrderDNo(orderDNoCheck);
		
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@RequestMapping("updateOrderAmount.sn")
	public String updateOrderAmount(OrderDetail orderD, Model model) {
		
		snackOrderService.updateOrderAmount(orderD);
		
		return "redirect:comSnackList.sn";
	}
	
}
