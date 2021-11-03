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

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList");
		
	}

	public String selectDeliveryDate(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.selectDeliveryDate" , comCode);
		
	}

	public int chkSnackNo(SqlSessionTemplate sqlSession, String wishSnackNo) {
		
		return sqlSession.selectOne("productMapper.chkSnackNo" , wishSnackNo);
	}


	public int insertWishList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("productMapper.insertWishList" , map);
	
	}

	public int updateSnackCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("productMapper.updateSnackCount" , map);
	}

}
