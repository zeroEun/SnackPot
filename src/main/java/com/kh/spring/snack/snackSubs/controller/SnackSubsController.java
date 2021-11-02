package com.kh.spring.snack.snackSubs.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.product.model.vo.Aroma;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.Taste;
import com.kh.spring.snack.snackSubs.model.service.SnackSubsService;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Controller
public class SnackSubsController {
	
	@Autowired
	private SnackSubsService snackSubsService;

	@RequestMapping("subsForm.sn")
	public String snackSubsForm(Model model) {
		
		/*categoryNo 1 -> 스낵, 2 -> 음료, 3 -> 간편식*/
		ArrayList<SnackSubCategory> snackCategory = snackSubsService.selectSubCategory(1);
		ArrayList<SnackSubCategory> drinkCategory = snackSubsService.selectSubCategory(2);
		ArrayList<SnackSubCategory> retortCategory = snackSubsService.selectSubCategory(3);
		ArrayList<Aroma> flavour = snackSubsService.selectAroma();
		ArrayList<Taste> taste = snackSubsService.selectTaste();
		
		model.addAttribute("snackCategory", snackCategory);
		model.addAttribute("drinkCategory", drinkCategory);
		model.addAttribute("retortCategory", retortCategory);
		model.addAttribute("flavour", flavour);
		model.addAttribute("taste", taste);
		
		return "company/snack/snackSubsForm";
	}
	
	@RequestMapping("insertSubs.sn")
	public String insertSnackSubs(SnackSubs snackSubs) {
		
		
		/*
		String snackCategory = "";
		if(snackArr != null) {
			snackCategory = String.join(",", snackArr);
		}*/
		
		
		System.out.println(snackSubs);
		
		snackSubsService.insertSnackSubs(snackSubs);
		
		return "redirect:/";
	}
	
}
