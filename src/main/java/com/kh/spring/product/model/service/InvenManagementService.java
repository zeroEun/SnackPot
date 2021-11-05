package com.kh.spring.product.model.service;

import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;

public interface InvenManagementService {

	void insertSnack(Product p);

	void insertSnackAttach(ProductAttachment pa);
	

}
