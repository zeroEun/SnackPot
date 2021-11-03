package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.dao.ProductDao;
import com.kh.spring.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public ArrayList<Product> selectList() {
		return productDao.selectList(sqlSession);
	}

	@Override
	public String selectDeliveryDate(String comCode) {
		
		return productDao.selectDeliveryDate(sqlSession , comCode);
	}

	@Override
	public int chkSnackNo(String wishSnackNo) {
		
		return productDao.chkSnackNo(sqlSession , wishSnackNo);
	}

	
	@Override
	public int insertWishList(HashMap<String, Object> map) {
		int result = productDao.insertWishList(sqlSession , map);
		
		return result;
	}

	@Override
	public int updateSnackCount(HashMap<String, Object> map) {
		
		int result1 = productDao.updateSnackCount(sqlSession , map);
		
		return result1;
	}
}
