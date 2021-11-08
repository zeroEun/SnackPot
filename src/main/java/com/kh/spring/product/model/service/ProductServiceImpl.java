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
	public ArrayList<Product> selectList(int dtc) {
		return productDao.selectList(sqlSession , dtc);
	}
	
	@Override //음료리스트
	public ArrayList<Product> selectDrinkList(int dtc) {
		
		return productDao.selectDrinkList(sqlSession , dtc);
	}

	@Override
	public ArrayList<Product> selectFoodList(int dtc) {
		
		return productDao.selectFoodList(sqlSession , dtc);
	}

	@Override
	public String selectDeliveryDate(String comCode) {
		
		return productDao.selectDeliveryDate(sqlSession , comCode);
	}
	
	@Override
	public int chkWishList(String comCode) {
		
		return productDao.chkWishList(sqlSession , comCode);
		
	}
	
	@Override
	public int insertWishList(HashMap<String, Object> map) {
		int result = productDao.insertWishList(sqlSession , map);
		
		return result;
	}

	@Override
	public int selectSubWishNo(String comCode) {
		
		return productDao.selectSubWishNo(sqlSession , comCode);
	}
	
	@Override
	public int insertWishDetail(HashMap<String, Object> map) {
		int result1 = productDao.insertWishDetail(sqlSession , map);
		
		return result1;
	}

	@Override
	public int chkSnackNo(String wishSnackNo) {
		
		return productDao.chkSnackNo(sqlSession , wishSnackNo);
	}

	@Override
	public int updateSnackCount(HashMap<String, Object> map) {
		
		int result = productDao.updateSnackCount(sqlSession , map);
		
		return result;
	}

	@Override
	public ArrayList<Product> selectWishDetailList(String comCode) {
		
		return productDao.selectWishDetailList(sqlSession , comCode);
		
	}

	@Override
	public int updateWishEndDate(HashMap<String, Object> map) {
		
		int result2 = productDao.updateWishEndDate(sqlSession , map);
		return result2;
	}

//	@Override
//	public int updatePlusCount(String snackCountUp) {
//		
//		int result = productDao.updatePlusCount(sqlSession , snackCountUp);
//		
//		return result;
//	}

	
	


}
