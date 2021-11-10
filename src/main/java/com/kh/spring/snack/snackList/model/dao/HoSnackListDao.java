package com.kh.spring.snack.snackList.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.model.vo.Product;
import com.kh.spring.snack.snackList.model.vo.ListSchedule;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Repository
public class HoSnackListDao {

	public ArrayList<ListSchedule> selectSubsInfo(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("snackListMapper.selectSubsInfo", map);
	}

	public int listCheck(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackListMapper.countSnackList", comCode);
	}

	public ArrayList<Product> searchSnack(SqlSessionTemplate sqlSession, SearchSnack search) {
		return (ArrayList)sqlSession.selectList("snackListMapper.searchSnack", search);
	}

	public int selectSnackListNo(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackListMapper.selectSnackListNo", comCode);
	}

	public ArrayList<SnackDList> selectSnackDList(SqlSessionTemplate sqlSession, int listNo) {
		return (ArrayList)sqlSession.selectList("snackListMapper.selectSnackDList", listNo);
	}

	public int insertSanckList(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.insert("snackListMapper.insertSanckList", comCode);
	}

	public ArrayList<SnackDList> selectSnack(SqlSessionTemplate sqlSession, SnackSubs subs) {
		return (ArrayList)sqlSession.selectList("snackListMapper.selectSnack", subs);
	}

	public int insertSnackDList(SqlSessionTemplate sqlSession, ArrayList<SnackDList> dList) {
		return sqlSession.update("snackListMapper.insertSnackDList", dList);
	}

	public int selectTotalPrice(SqlSessionTemplate sqlSession, int listNo) {
		return sqlSession.selectOne("snackListMapper.selectTotalPrice", listNo);
	}

	public int deleteSnackDList(SqlSessionTemplate sqlSession, int listNo) {
		return sqlSession.insert("snackListMapper.deleteSnackDList", listNo);
	}

}
