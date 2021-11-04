package com.kh.spring.snack.snackList.model.service;

import com.kh.spring.snack.snackList.model.vo.ListSchedule;

public interface HoSnackListService {

	ListSchedule selectSubsInfo(String comCode);

	int listCheck(String comCode);

}
