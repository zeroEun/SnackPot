package com.kh.spring.product.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.spring.product.model.vo.Product;

@Repository
public class ProductDao {

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, int dtc) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", dtc);
		
	}

	public ArrayList<Product> selectDrinkList(SqlSessionTemplate sqlSession, int dtc) {
	
		return (ArrayList)sqlSession.selectList("productMapper.selectDrinkList" , dtc);
	}

	public ArrayList<Product> selectFoodList(SqlSessionTemplate sqlSession, int dtc) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectFoodList" , dtc);
	}


	public String selectDeliveryDate(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.selectDeliveryDate" , comCode);
		
	}
	
	public int chkWishList(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.chkWishList" , comCode);
		
	}
	
	public int insertWishList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("productMapper.insertWishList" , map);
	}

	public int selectSubWishNo(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.selectSubWishNo" , comCode);
	}


	public int insertWishDetail(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("productMapper.insertWishDetail" , map);
	}
	

	public int chkSnackNo(SqlSessionTemplate sqlSession, String wishSnackNo) {
		
		return sqlSession.selectOne("productMapper.chkSnackNo" , wishSnackNo);
	}
	

	public int updateSnackCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("productMapper.updateSnackCount" , map);
	}


	

}
