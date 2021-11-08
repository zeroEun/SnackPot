package com.kh.spring.birthday.sendingStatus.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

public interface SendingStatusService {

	ArrayList<SendingStatus> selectsList();

}
