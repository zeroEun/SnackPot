package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.kh.spring.product.model.vo.Product;

public interface ProductService {

	ArrayList<Product> selectList(int dtc);
	
	ArrayList<Product> selectDrinkList(int dtc);

	ArrayList<Product> selectFoodList(int dtc);

	String selectDeliveryDate(String comCode);
	
	int chkWishList(String comCode);

	int insertWishList(HashMap<String, Object> map);
	
	int selectSubWishNo(String comCode);
	
	int insertWishDetail(HashMap<String, Object> map);
	
	int chkSnackNo(String wishSnackNo);

	int updateSnackCount(HashMap<String, Object> map);

	

	



	





	



}
