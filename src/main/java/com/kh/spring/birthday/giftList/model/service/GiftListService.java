package com.kh.spring.birthday.giftList.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftList;

public interface GiftListService {

	ArrayList<GiftList> selectGiftList();

	ArrayList<GiftList> selectCtgry(int ctgryNum);

	ArrayList<GiftFolder> selectFolderArr();

	int addGiftFolder(String folderName);

	ArrayList<GiftList> seletFolderInfo(int rowNum);

}
