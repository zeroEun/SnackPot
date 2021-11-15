package com.kh.spring.snack.snackOrder.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.snack.snackOrder.model.dao.SnackOrderDao;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

@Service
public class SnackOrderServiceImpl implements SnackOrderService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnackOrderDao snackOrderDao;
	
	@Override
	public Orders selectOrder(String comCode) {
		return snackOrderDao.selectOrder(sqlSession, comCode);
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetail(int orderNo) {
		return snackOrderDao.selectOrderDetail(sqlSession, orderNo);
	}

	@Override
	public int selectTotalPrice(int orderNo) {
		return snackOrderDao.selectTotalPrice(sqlSession, orderNo);
	}

}
