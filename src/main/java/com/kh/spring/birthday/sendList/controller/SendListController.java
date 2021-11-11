package com.kh.spring.birthday.sendList.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.sendList.model.service.SendListService;
import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

@Controller
public class SendListController {

	@Autowired
	private SendListService sendListService;
	
	@RequestMapping(value="sendList.birth")
	public String selectSendList(Model model) {
		
		ArrayList<SendList> list = sendListService.selectSendList();
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		
		return "company/birthday/sending_list";
	}
	
	@ResponseBody
	@RequestMapping(value="delSendList.birth")
	public int deleteSendList(HttpServletRequest request) {
		
		String[] chkArr = request.getParameterValues("chkArr");
		
		int result = 0;
		int resultSum = 0;
		for(int i=0; i<chkArr.length; i++) {			
			result = sendListService.deleteSendList(Integer.parseInt(chkArr[i]));
			resultSum += result;			
		}
		
		if(resultSum == chkArr.length) {
			return resultSum;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="insSendList.birth")
	public String insertSendList(SendingStatus s) {
		
		int result = sendListService.insertSendList(s);
		
		return String.valueOf(result);
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectEmpOne2.birth")
	public SendingStatus selectEmpOne(int cempSeq) {
		System.out.println("cempSeq : " + cempSeq);
		SendingStatus s = sendListService.selectEmpOne(cempSeq);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("cempBirth : " + s.getCempBirth());
		
		s.setCempBirthSdf(sdf.format(s.getCempBirth()));
		System.out.println("cempBirth2 : " + s.getCempBirthSdf());
		System.out.println("선택 수정 선택 객체 : " + s);		
		
		return s;
		
	}
	
	@ResponseBody
	@RequestMapping(value="updSendList.birth")
	public String updateSendStatus(SendingStatus s) {
		
		int result = sendListService.updateSendList(s);
		System.out.println("수정result: " + result);
		
		return String.valueOf(result);
		
	}
}
