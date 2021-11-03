package com.kh.spring.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.exception.CommException;
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
		public String insertSnack(@ModelAttribute Product p, HttpSession session, HttpServletRequest request
									,@RequestParam(name="uploadFile", required = false) MultipartFile file) {
			
			System.out.println(file.getOriginalFilename());
			
			System.out.println(p);
			
			if(!file.getOriginalFilename().equals("")) {
				
				String changeName = saveFile(file, request);
				if(changeName != null) {
					p.setChangeName(changeName);
					
				}
			}
			
			invenManagementService.insertSnack(p);
		
			session.setAttribute("msg", "상품 등록 성공");
			return "headoffice/invenManagement/snackEnrollForm";
		}
		
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources+"/upload_file";
			
			System.out.println("savePath : " + savePath);
			
			String originName = file.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ext;
			
			System.out.println(changeName);
			
			try {
				file.transferTo(new File(savePath +changeName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new CommException("file upload error");
			}
			
			return changeName;
		}


}
