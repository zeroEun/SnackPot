package com.kh.spring.birthday.giftList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftFolderDetail;
import com.kh.spring.birthday.giftList.model.vo.GiftList;

@Repository
public class GiftListDao {

	public ArrayList<GiftList> selectGiftList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectGiftList");
	}
	/*
	public ArrayList<GiftFolder> selectFolderArr(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectFolderArr");
	}*/
	
	public ArrayList<GiftFolder> selectFolderList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectFolderList");
	}

	
	public ArrayList<GiftList> selectCtgry(SqlSessionTemplate sqlSession, int ctgryNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectCtgry", ctgryNum);
	}

	public int addGiftFolder(SqlSessionTemplate sqlSession, String folderName) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.addGiftFolder", folderName);
	}

	public ArrayList<GiftList> selectFolderInfo(SqlSessionTemplate sqlSession, int rowNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectFolderInfo", rowNum);
	}

	public int addGiftDetail(SqlSessionTemplate sqlSession, String[] detailArr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.addGiftDetail", detailArr);
	}

	public GiftFolderDetail checkDuplicate(SqlSessionTemplate sqlSession, String[] detailArr) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.checkDuplicate", detailArr);
	}

	public int deleteGiftFolder(SqlSessionTemplate sqlSession, String glistNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper.deleteGiftFolder", glistNo);
	}

	public int deleteFolderDetail(SqlSessionTemplate sqlSession, String[] delGiftArr) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper.deleteFolderDetail", delGiftArr);
	}

}
