package com.kh.spring.snack.snackSubs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.snack.snackSubs.model.service.SnackSubsService;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Controller
public class SnackSubsController {
	
	@Autowired
	private SnackSubsService snackSubsService;

	@RequestMapping("subsForm.sn")
	public String snackSubsForm(Model model) {
		
		/*categoryNo 1 -> 스낵, 2 -> 음료, 3 -> 간편식;*/
		
		model.addAttribute("snackCategory", snackSubsService.selectSubCategory(1));
		model.addAttribute("drinkCategory", snackSubsService.selectSubCategory(2));
		model.addAttribute("retortCategory", snackSubsService.selectSubCategory(3));
		model.addAttribute("flavour", snackSubsService.selectAroma());
		model.addAttribute("taste", snackSubsService.selectTaste());
		
		return "company/snack/snackSubsForm";
	}
	
	@RequestMapping("insertSubs.sn")
	public String insertSnackSubs(SnackSubs snackSubs, HttpSession session) {
		
		/*
		String snackCategory = "";
		if(snackArr != null) {
			snackCategory = String.join(",", snackArr);
		}*/
		
		//이미 구독 중일 경우 알림 띄우기 화면단에서 validation check?
		
		snackSubsService.insertSnackSubs(snackSubs);
		
		//session.setAttribute("msg", "간식 구독이 성공적으로 완료되었습니다.");
		return "redirect:/";
	}
	
	@RequestMapping("subsInfo.sn")
	public String snackSubsInfo(Model model, HttpSession session) {
		
		//String comCode = session.getAttribute("loginUser").getComCode();
		
		String comCode = "k2111021928";
		
		model.addAttribute("snackCategory", snackSubsService.selectSubCategory(1));
		model.addAttribute("drinkCategory", snackSubsService.selectSubCategory(2));
		model.addAttribute("retortCategory", snackSubsService.selectSubCategory(3));
		model.addAttribute("flavour", snackSubsService.selectAroma());
		model.addAttribute("taste", snackSubsService.selectTaste());
		model.addAttribute("subs", snackSubsService.selectSubsInfo(comCode));
		
		return "company/snack/snackSubsInfo";
	}
	
	@RequestMapping("updateSubs.sn")
	public String updateSnackSubs(SnackSubs snackSubs) {
		
		snackSubsService.updateSnackSubs(snackSubs);
		
		return "redirect:subsInfo.sn";
	}
	
	@RequestMapping("cancelSubs.sn")
	public String cancelSnackSubs(@RequestParam int subsNo) {
		
		System.out.println(subsNo);
		
		snackSubsService.cancelSnackSubs(subsNo);
		
		return "redirect:/";
	}
	
}
