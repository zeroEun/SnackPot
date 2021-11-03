package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.kh.spring.product.model.vo.Product;

public interface ProductService {

	ArrayList<Product> selectList();

	String selectDeliveryDate(String comCode);

	int chkSnackNo(String wishSnackNo);

	int insertWishList(HashMap<String, Object> map);
	
	int updateSnackCount(HashMap<String, Object> map);

}
