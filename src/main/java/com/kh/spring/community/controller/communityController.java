package com.kh.spring.community.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.Community;
import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;

@Controller
public class communityController {
	
	@Autowired
	private CommunityService cmntService;
	
	@RequestMapping("list.cm") // 회원 아이디를 같이 넣어줘야한다 (회사코드 join)
	public String selectCommunityList(Model model ,@RequestParam(value="currentPage" ,required=false , defaultValue="1") int currentPage) {
		
		int listCount = cmntService.selectListCount();
		//System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Community> list = cmntService.selectList(pi);
		System.out.println("list====> " + list);
		
		model.addAttribute("list" , list);
		model.addAttribute("pi" , pi);
		
		return "company/community/communityMainView";
	}
	
	@RequestMapping("enrollForm.cm")
	public String enrollForm() {
		return "company/community/communityEnrollForm";
	}
	
	@RequestMapping("insert.cm")//
	public String insertContent( Community cmnt,  String title , String seContent , Model model , HttpServletRequest req , 
					HttpSession session,  @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		
		//		System.out.println("스마트에디터 title ==> " + title);
//		System.out.println("스마트에디터 seContent ==> " + seContent);
//	
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("title", title);
//		map.put("seContent", seContent);
//		map.put("memId", memId);
		cmnt.setContent(seContent);
		cmnt.setTitle(title);
		cmnt.setWriter(memId);
		
		//cmntService.insertCommunity(map);
		
		return "redirect:list.cm";
	}
	
	@RequestMapping("detail.cm")
	public String selectDetailCmnt(int cno , Model model ) {
		//조회수 올리기
		int result = cmntService.updateViews(cno);
		
		Community dlist = cmntService.selectDetailCmnt(cno);
		model.addAttribute("dlist" , dlist);
		System.out.println("dlist -----> " + dlist);
		
		return "company/community/communityDetailView";
	}
	
	@RequestMapping("updateForm.cm")
	public String updateCmntForm(int cno , Model model) {
		System.out.println("커뮤니티 업데이트할 번호 : " + cno);
		
		Community dlist = cmntService.selectDetailCmnt(cno); 
		model.addAttribute("dlist" , dlist );
		
		return "company/community/communityUpdateForm";
	}
	
	@RequestMapping("update.cm")
	public String updateCmnt(int cno ,String title , String seContent , RedirectAttributes ra ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("seContent", seContent);
		map.put("cno", cno);
		
		int result = cmntService.updateCmnt(map);
		System.out.println("cno.......>"  + cno);
		
		ra.addAttribute("cno" ,cno);
		
		return "redirect:detail.cm";
	}
	
	
}
