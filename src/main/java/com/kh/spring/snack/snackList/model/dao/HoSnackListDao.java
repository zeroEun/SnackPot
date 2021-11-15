package com.kh.spring.snack.snackList.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.model.vo.Product;
import com.kh.spring.snack.snackList.model.vo.ComListInfo;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackList.model.vo.SnackList;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Repository
public class HoSnackListDao {

	public ArrayList<ComListInfo> selectSubsInfo(SqlSessionTemplate sqlSession, HashMap map) {
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
		return sqlSession.delete("snackListMapper.deleteSnackDList", listNo);
	}

	public int deleteSnackDNo(SqlSessionTemplate sqlSession, String snackDNoCheck) {
		return sqlSession.delete("snackListMapper.deleteSnackDNo", snackDNoCheck);
	}

	public int addSanckDList(SqlSessionTemplate sqlSession, SnackDList snackD) {
		return sqlSession.insert("snackListMapper.addSanckDList", snackD);
	}

	public int checkSnackDup(SqlSessionTemplate sqlSession, SnackDList snackD) {
		return sqlSession.selectOne("snackListMapper.checkSnackDup", snackD);
	}

	public int updateSnackAmount(SqlSessionTemplate sqlSession, SnackDList snackD) {
		return sqlSession.update("snackListMapper.updateSnackAmount", snackD);
	}

	public int selectSnackMaxNum(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("snackListMapper.selectSnackMaxNum");
	}

	public int insertOrder(SqlSessionTemplate sqlSession, ComListInfo info) {
		return sqlSession.insert("snackListMapper.insertOrder", info);
	}

	public int insertOrderDetail(SqlSessionTemplate sqlSession, ComListInfo info) {
		return sqlSession.insert("snackListMapper.insertOrderDetail", info);
	}

	public int updateTransStatus(SqlSessionTemplate sqlSession, ComListInfo info) {
		return sqlSession.update("snackListMapper.updateTransStatus", info);
	}

	public ArrayList<SnackList> selectSendingList(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("snackListMapper.selectSendingList", map);
	}

	public SnackList selectSnackList(SqlSessionTemplate sqlSession, int snackListNo) {
		return sqlSession.selectOne("snackListMapper.selectSnackList", snackListNo);
	}

	public int selectOrderNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("snackListMapper.selectOrderNo");
	}

}
