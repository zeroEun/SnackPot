package com.kh.spring.community.controller;

import java.awt.List;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.ComtyAttachment;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;

@Controller
public class communityController {
	
	@Autowired
	private CommunityService cmntService;
	
	@RequestMapping("list.cm") 
	public String selectCommunityList(Model model ,@RequestParam(value="currentPage" ,required=false , defaultValue="1") int currentPage , HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
	
		int listCount = cmntService.selectListCount(comCode);
		
		System.out.println("listCount : " + listCount);
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
	public String insertContent( Community cmnt,  String title , String seContent ,HttpSession session, ComtyAttachment att,
			@RequestParam(name="uploadFile", required = false) MultipartFile file , HttpServletRequest request) {
				
	
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload_files/cmntAttachment/");
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		String comCode = loginUser.getComCode();
		cmnt.setContent(seContent);
		cmnt.setTitle(title);
		cmnt.setWriter(memId);
		cmnt.setComCode(comCode);
		
		if(!file.getOriginalFilename().equals("")) { //첨부파일이 있으면 				  

			String changeName = saveFile(file, request);			
			
			if(changeName != null) {
				att.setOriginName(file.getOriginalFilename());
				att.setChangeName(changeName);
				att.setFilePath(savePath);
			}	
				cmntService.insertCommunity(cmnt);
				int cmntNo = cmntService.selectCmntNo(memId);
				att.setCommunityNo(cmntNo);
				cmntService.insertCommunityAttachment(att);
		}else {// 첨부파일이 없다면
		
			cmntService.insertCommunity(cmnt);
			
		}
		
//		System.out.println("=============커뮤니티 insert확인===============");
//		System.out.println("*****확인*****" + cmnt.getContent());
//		System.out.println("*****확인*****" + cmnt.getTitle());
//		System.out.println("*****확인*****" + cmnt.getWriter());
//		System.out.println("*****사진확인*****" + att.getOriginName());
//		System.out.println("*****사진확인*****" + att.getChangeName());
//		System.out.println("*****사진확인*****" + att.getFilePath());

		return "redirect:list.cm";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
	
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload_files/cmntAttachment/");
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;					
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (Exception e) {
			System.out.println("파일 업로드 실패");
		}
		
		return changeName;
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
	
	//수정폼으로
	@RequestMapping("updateForm.cm")
	public String updateCmntForm(int cno , Model model) {
		System.out.println("커뮤니티 업데이트할 번호 : " + cno);
		
		Community ulist = cmntService.selectDetailCmnt(cno); 
		model.addAttribute("ulist" , ulist );
		System.out.println("ulist======================>" + ulist);
		
		return "company/community/communityUpdateForm";
		
	}
	//게시글 수정
	@RequestMapping("update.cm")
	public String updateCmnt(Community cmnt , String cno ,String title , String seContent,
			String changeName , String originName , @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		System.out.println("========업데이트 확인============");
		System.out.println("cmnt : " + cmnt);
		System.out.println("cno : " + cno);
		System.out.println("title : " + title);
		System.out.println("seContent : " + seContent);
		System.out.println("changeName : " + changeName);
		System.out.println("originName : " + originName);
		System.out.println("file : " + file);
		
		
		
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("title", title);
//		map.put("seContent", seContent);
//		map.put("cno", cno);
//		
//		int result = cmntService.updateCmnt(map);
//		System.out.println("cno.......>"  + cno);
//		
//		ra.addAttribute("cno" ,cno);
		
		return "redirect:detail.cm";
	}
	 
	//추천
	@RequestMapping("plusCount.recommend")
	 public void updateRecommend(@RequestParam("cno") String cno ) {
		//System.out.println("추천할 게시글 번호는?? : " + cno);
		
		cmntService.updateRecommend(cno);
	}
	//비추천
	@RequestMapping("plusCount.n_recommend")
	 public void updateNrecommend(@RequestParam("cno") String cno ) {
		
		cmntService.updateNrecommend(cno);
	}
	
	/*=================댓글===============================================================================*/	
	
	//댓글 리스트 
	@ResponseBody
	@RequestMapping(value="list.reply" , produces = "application/json; charset=utf-8")
	public ArrayList<Reply> selectReplyList(@RequestParam int cmntNo , HttpSession session) {
		
		System.out.println("cmntNo =====>" +  cmntNo);
		ArrayList<Reply> list = cmntService.selectReplyList(cmntNo);
		
		System.out.println("댓글 리스트? : " + list);
		return list;
	}
	
	
	
	
}
