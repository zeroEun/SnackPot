package com.kh.spring.snack.snackList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.product.model.vo.Product;
import com.kh.spring.snack.snackList.model.vo.ListSchedule;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackList.model.vo.SnackList;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

public interface HoSnackListService {

	ArrayList<ListSchedule> selectSubsInfo(HashMap map);

	int listCheck(String comCode);

	ArrayList<Product> searchSnack(SearchSnack search);

	int selectSnackListNo(String comCode);

	ArrayList<SnackDList> selectSnackDList(int listNo);

	void insertSanckList(String comCode);

	ArrayList<SnackDList> selectSnack(SnackSubs subs);

	void insertSnackDList(ArrayList<SnackDList> dList);

	int selectTotalPrice(int listNo);

	void deleteSnackDList(int listNo);

	void deleteSnackDNo(String snackDNoCheck);

	void addSanckDList(SnackDList snackD);

	int checkSnackDup(SnackDList sncakD);

	void updateSnackAmount(SnackDList snackD);

	int selectSnackMaxNum();

	void insertOrder(ListSchedule schedule);

	void insertOrderDetail(int listNo);

	void updateTransStatus(int listNo);

	ArrayList<SnackList> selectSendingList(HashMap map);

}
