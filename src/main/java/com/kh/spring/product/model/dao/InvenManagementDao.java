package com.kh.spring.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;

@Repository
public class InvenManagementDao {

	public int insertSnack(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.insertSnack", p);
	}

	public int insertSnackAttach(SqlSessionTemplate sqlSession, ProductAttachment pa) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.insertSnackAttach", pa);
	}
	
	

}
