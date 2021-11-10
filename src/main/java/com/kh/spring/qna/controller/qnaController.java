package com.kh.spring.qna.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.spring.product.model.service.InvenManagementService;
import com.kh.spring.qna.model.service.QnaService;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;

import com.kh.spring.qna.model.vo.qna;

@Controller
public class qnaController {

	@Autowired
	private QnaService qnaService;

	// 문의 게시판 리스트 조회
	@RequestMapping("list.qna")
	private String qnaList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		

		
		int listCount = qnaService.selectListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<qna> list = qnaService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);


		return "qnaBoard/qnaBoardList";
	}
	
	

}
