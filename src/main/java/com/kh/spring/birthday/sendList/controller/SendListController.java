package com.kh.spring.birthday.sendList.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.sendList.model.service.SendListService;
import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class SendListController {

	@Autowired
	private SendListService sendListService;
	
	@RequestMapping(value="sendList.birth")
	public String selectSendList(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		
		int birthSubsChk = sendListService.subscribeChk(comCode);
		System.out.println("birthSubsChk : " + birthSubsChk);
		
		int sendingTime = selectSendingTime(comCode);
		System.out.println("발송시점 sendingTime : " + sendingTime);
		
		if(sendingTime < 0) {
			model.addAttribute("msg", "구독 정보가 존재하지 않습니다.");
			
			return "common/alert";
		}else {
			ArrayList<SendList> list = sendListService.selectSendList(comCode);
			System.out.println("list : " + list);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int thisYear = cal.get(Calendar.YEAR);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=0; i<list.size(); i++) {

				cal.setTime(list.get(i).getCempBirth());
				cal.add(Calendar.DATE, -sendingTime);
				
				list.get(i).setSendMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));
			}

			ArrayList<GiftFolder> giftFolder = sendListService.selectGiftFolder();
			System.out.println("giftFolder : " + giftFolder);
			model.addAttribute("birthSubsChk", birthSubsChk);
			model.addAttribute("giftFolder", giftFolder);
			model.addAttribute("list", list);
			
			return "company/birthday/sending_list";
		}
	}
	
	private int selectSendingTime(String comCode) {
		
		String sendingTime = sendListService.selectSendingTime(comCode);
		
		int result = 0;
		
		if(sendingTime != null) {
			switch(sendingTime) {
			case "당일" :
				result = 0;
				break;
			case "3일전" :
				result = 3;
				break;
			case "5일전" :
				result = 5;
				break;
			}
		}else {
			result = -1;
		}
		
		return result;
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
	public String insertSendList(SendList s) {
		
		int result = sendListService.insertSendList(s);
		
		int sendingTime = selectSendingTime(s.getComCode());
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int thisYear = cal.get(Calendar.YEAR);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		cal.setTime(s.getCempBirth());
		cal.add(Calendar.DATE, -sendingTime);
			
		s.setSendMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));

		int result2 = sendListService.insertSendList2(s);
		System.out.println("result2 : " + result2);
		
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
	
	@ResponseBody
	@RequestMapping(value="updateGiftList.birth")
	public String updateGiftList(String[] selectArray) {
		
		
		GiftFolder gf = new GiftFolder();
		
		int result = 0;

		for(int i=0; i<selectArray.length; i++) {
			if(i%2==0) {
				gf.setGlistNo(selectArray[i]);
			}else {
				gf.setCempSeq(Integer.parseInt(selectArray[i]));
				System.out.println("gf : " + gf);
				result += sendListService.updateGiftList(gf);
			}
		}
		System.out.println("나누기 안 한  result : " + result);
		result = result / (selectArray.length/2);
		System.out.println("나누기 한 result : " + result);
		
		return String.valueOf(result);
		
	}
}
