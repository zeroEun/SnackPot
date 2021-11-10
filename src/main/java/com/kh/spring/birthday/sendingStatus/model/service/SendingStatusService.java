package com.kh.spring.birthday.sendingStatus.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

public interface SendingStatusService {

	ArrayList<SendingStatus> selectsList();

	int deleteSendStatus(int i);

	int insertSendStatus(SendingStatus s);

	SendingStatus selectEmpOne(int cempSeq);

	int updateSendStatus(SendingStatus s);

}
