package com.kh.spring.birthday.giftList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.giftList.model.vo.GiftList;

@Repository
public class GiftListDao {

	public ArrayList<GiftList> selectGiftList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectGiftList");
	}

	public ArrayList<GiftList> selectCtgry(SqlSessionTemplate sqlSession, int ctgryNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectCtgry", ctgryNum);
	}

	public ArrayList<GiftList> giftSortList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.giftSortList");
	}

}
