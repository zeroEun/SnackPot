package com.kh.spring.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.service.InvenManagementService;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;

@Controller
public class InvenManagementController {

	@Autowired
	private InvenManagementService invenManagementService;

	// 제품등록 페이지로 이동
	@RequestMapping("snackEnrollForm.pm")
	public String snackEnrollForm() {

		return "headoffice/invenManagement/snackEnrollForm";
	}

	// 제품 insert
	@RequestMapping("insert.pm")
	public String insertSnack(Product p, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		System.out.println(file.getOriginalFilename());

		System.out.println(file);
		System.out.println(p);

		ProductAttachment pa = new ProductAttachment();
		if (!file.getOriginalFilename().equals("")) {

			pa = saveFile(file, request, p.getSnackNo());

		}

		invenManagementService.insertSnack(p);
		invenManagementService.insertSnackAttach(pa);

		model.addAttribute("msg","상품 등록이 완료되었습니다.");
        model.addAttribute("url","/");
        
        return "common/alert";	
	}

	//상품 등록 첨부파일
	private ProductAttachment saveFile(MultipartFile file, HttpServletRequest request, int snackNo) {

		ProductAttachment pa = new ProductAttachment();

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/images/";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		System.out.println(changeName);

		try {
			file.transferTo(new File(savePath + changeName));
			pa.setChangeName(changeName);
			pa.setFilePath(savePath);
			pa.setSnackNo(snackNo);
			pa.setOriginName(originName);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
		}

		return pa;
	}

	//출고 리스트로 이동
	@RequestMapping("releaseList.im")
	private String ReleaseList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = invenManagementService.todayReleaseCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Release> list = invenManagementService.todayReleaseList(pi);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);


		return "headoffice/invenManagement/snackReleaseList";
	}
	//입고 리스트로 이동
	@RequestMapping("arrivalList.im")
	private String todayArrivalList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
	
		//int listCount = invenManagementService.todayArrivalCount();
		//System.out.println(listCount);
		
		//PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		//ArrayList<Arrival> list = invenManagementService.todayArrivalList(pi);
		
		//System.out.println(list);
		
		//model.addAttribute("list", list);
		//model.addAttribute("pi", pi);


		return "headoffice/invenManagement/snackArrivalList";
	}

	//출고 등록
	@RequestMapping("releaseInsert.im")
	private String ReleaseEnrollForm(Release r, Model model) {


		System.out.println(r);
		
		invenManagementService.releaseInsert(r);

		model.addAttribute("msg","출고 등록이 완료되었습니다.");
        model.addAttribute("url","/releaseList.im");

		return "common/alert";	
	}

	//입고 등록
	@RequestMapping("arrivalInsert.im")
	private String ArrivalEnrollForm(Arrival a, Model model) {
			//@RequestParam(name = "remark", required = false) String remark) {
		
		System.out.println(a);
		
		invenManagementService.arrivalInsert(a);

		model.addAttribute("msg","입고 등록이 완료되었습니다.");
        model.addAttribute("url","/arrivalList.im");

		return "common/alert";	
	}
	
	
	//입고 목록 Ajax
	@ResponseBody
	@RequestMapping(value="arrivalListAjax.im", produces="application/json; charset=utf-8")
	private String arrivalListajax(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="date") Date beforeDate) {
		
		System.out.println("넘어온 날짜 ==================== " + beforeDate);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		String date = transFormat.format(beforeDate);
		

		int listCount = invenManagementService.todayArrivalCount(date);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Arrival> list = invenManagementService.todayArrivalList(pi, date);
		
		return  new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(list);
	}
	


	/*private String arrivalDate() {
		
		
		return "";
	}*/
	
	
}
