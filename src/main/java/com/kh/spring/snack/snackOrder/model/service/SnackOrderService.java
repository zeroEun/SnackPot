package com.kh.spring.snack.snackOrder.model.service;

import java.util.ArrayList;

import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

public interface SnackOrderService {

	Orders selectOrder(String comCode);

	ArrayList<OrderDetail> selectOrderDetail(int orderNo);

	int selectTotalPrice(int orderNo);

}
