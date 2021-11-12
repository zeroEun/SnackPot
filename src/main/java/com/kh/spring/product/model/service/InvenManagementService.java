package com.kh.spring.product.model.service;

import java.util.ArrayList;

import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.qna.model.vo.PageInfo;

public interface InvenManagementService {

	void insertSnack(Product p);

	void insertSnackAttach(ProductAttachment pa);

	void arrivalInsert(Arrival a);

	int todayArrivalCount();

	ArrayList<Arrival> todayArrivalList(PageInfo pi);
	

}
