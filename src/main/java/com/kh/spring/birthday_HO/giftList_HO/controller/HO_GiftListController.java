package com.kh.spring.birthday_HO.giftList_HO.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.birthday_HO.giftList_HO.model.service.HO_GiftListService;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.GiftAttachment;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;
import com.kh.spring.common.exception.CommException;

@Controller
public class HO_GiftListController {

	@Autowired
	private HO_GiftListService giftListService;
	
	@RequestMapping(value="giftList.ho")
	public String selectGiftList(Model model) {
		
		ArrayList<HO_GiftList> list = giftListService.selectGiftList();
		
		System.out.println("giftList : " + list);
		model.addAttribute("list",list);
		
		return "headoffice/birthday_HO/gift_list_HO";
	}
	
	@ResponseBody
	@RequestMapping(value="checkedGiftList.ho")
	public ArrayList<HO_GiftList> checkedGiftList(HttpServletRequest request){
		
		String[] chkArr = request.getParameterValues("chkArr");
		//System.out.println("chkArr : " + chkArr);
		ArrayList<HO_GiftList> list = new ArrayList<HO_GiftList>();
		HO_GiftList giftOne = new HO_GiftList();
		
		for(int i=0; i<chkArr.length; i++) {
			
			giftOne = giftListService.checkedGiftList(chkArr[i]);
			//System.out.println("giftOne : " + giftOne);
			
			list.add(giftOne);
		}

		//System.out.println("gglist : " + list);
		
		return list;
	}
	
	@RequestMapping(value="insertGift.ho")
	public String insertGift(HttpServletRequest request, HO_GiftList gl, GiftAttachment at,
							@RequestParam(name="insertImgFile") MultipartFile file) {
		
		System.out.println("HO_GiftList : " + gl);
		System.out.println("file Origin Name : "+file.getOriginalFilename());
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images");
		System.out.println("어디저장? " + savePath);
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(changeName);
			}
			
			giftListService.insertGift(gl);
			giftListService.insertAttachment(at);
		}
		
		return "redirect:giftList.ho";
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\images\\";
		
		System.out.println("savePath : " + savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf(".")); //파일명에서 .뒤의 확장자만 가져옴
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException();
		}
		
		return changeName;
	}
	
	
	
}
