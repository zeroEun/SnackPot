package com.kh.spring.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.dao.InvenManagementDao;
import com.kh.spring.product.model.vo.Product;

@Service
public class InvenManagementServiceImpl implements InvenManagementService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InvenManagementDao invenManagementDao;
	
	@Override
	public void insertSnack(Product p) {
		int result = invenManagementDao.insertSnack(sqlSession, p);
		
		if(result < 0) {
			throw new CommException("등록에 실패했습니다.");
		}
		
	}

}
