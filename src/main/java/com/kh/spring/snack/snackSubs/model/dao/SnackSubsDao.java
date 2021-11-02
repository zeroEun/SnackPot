package com.kh.spring.snack.snackSubs.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.model.vo.Aroma;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.Taste;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Repository
public class SnackSubsDao {

	public ArrayList<SnackSubCategory> selectSubCategory(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("snackCategoryMapper.selectSubCategory", categoryNo);
	}

	public ArrayList<Aroma> selectAroma(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("snackCategoryMapper.selectAroma");
	}

	public ArrayList<Taste> selectTaste(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("snackCategoryMapper.selectTaste");
	}

	public int insertSnackSubs(SqlSessionTemplate sqlSession, SnackSubs snackSubs) {
		return sqlSession.insert("");
	}



	
	
	
}
