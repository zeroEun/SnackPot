package com.kh.spring.snack.snackOrder.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

public interface SnackOrderService {

	Orders selectOrder(String comCode);

	ArrayList<OrderDetail> selectOrderDetail(int orderNo);

	int selectTotalPrice(int orderNo);

	int checkOrderSnackDup(OrderDetail orderD);

	void addOrderDList(OrderDetail orderD);

	void deleteOrderDNo(String orderDNoCheck);

	void updateOrderAmount(OrderDetail orderD);

	ArrayList<WishListDtail> selecComtWishList(int wishNo);

	ArrayList<OrderDetail> checkOrderStock(int orderNo);

	void updateSnackOrder(int orderNo);

	ArrayList<Orders> selectComOrderedList(String comCode);

	ArrayList<Orders> selectHoOrderedList(HashMap map);

}
