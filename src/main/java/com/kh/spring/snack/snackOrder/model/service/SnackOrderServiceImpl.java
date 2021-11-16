package com.kh.spring.snack.snackOrder.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
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

	@Override
	public int checkOrderSnackDup(OrderDetail orderD) {
		return snackOrderDao.checkOrderSnackDup(sqlSession, orderD);
	}

	@Override
	public void addOrderDList(OrderDetail orderD) {
		
		int result = snackOrderDao.addOrderDList(sqlSession, orderD);
		
		if(result < 0) {
			throw new CommException("addOrderDList 실패");
		}
		
	}

	@Override
	public void deleteOrderDNo(String orderDNoCheck) {
		
		int result = snackOrderDao.deleteOrderDNo(sqlSession, orderDNoCheck);
		
		if(result < 0) {
			throw new CommException("deleteOrderDNo 실패");
		}
	}

	@Override
	public void updateOrderAmount(OrderDetail orderD) {
		
		int result = snackOrderDao.updateOrderAmount(sqlSession, orderD);
		
		if(result < 0) {
			throw new CommException("updateOrderAmount 실패");
		}
	}

}
