package com.kh.spring.birthday.sendList.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

public interface SendListService {

	ArrayList<SendList> selectSendList();

	int deleteSendList(int cempSeq);

	int insertSendList(SendingStatus s);

	SendingStatus selectEmpOne(int cempSeq);

	int updateSendList(SendingStatus s);

}
