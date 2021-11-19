package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;

public interface InvenManagementService {

	void insertSnack(Product p);

	void insertSnackAttach(ProductAttachment pa);

	void arrivalInsert(Arrival a);

	int todayArrivalCount(String date);

	ArrayList<Arrival> todayArrivalList(PageInfo pi, String date);

	int todayReleaseCount();

	ArrayList<Release> todayReleaseList(PageInfo pi);

	void releaseInsert(Release r);
	

}
