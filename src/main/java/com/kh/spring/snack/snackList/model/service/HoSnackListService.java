package com.kh.spring.snack.snackList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.snack.snackList.model.vo.ListSchedule;

public interface HoSnackListService {

	ArrayList<ListSchedule> selectSubsInfo(HashMap map);

	int listCheck(String comCode);

}
