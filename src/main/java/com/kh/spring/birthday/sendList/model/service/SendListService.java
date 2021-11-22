package com.kh.spring.birthday.sendList.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

public interface SendListService {

	ArrayList<SendList> selectSendList();

	int deleteSendList(int cempSeq);

	int insertSendList(SendList s);

	SendingStatus selectEmpOne(int cempSeq);

	int updateSendList(SendingStatus s);

	int subscribeChk(String comCode);

	String selectSendingTime(String comCode);

	int insertSendList2(SendList s);

}
