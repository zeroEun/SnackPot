package com.kh.spring.snack.snackOrder.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

@Repository
public class SnackOrderDao {

	public Orders selectOrder(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackOrderMapper.selectOrder", comCode);
	}

	public ArrayList<OrderDetail> selectOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("snackOrderMapper.selectOrderDetail", orderNo);
	}

	public int selectTotalPrice(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("snackOrderMapper.selectTotalPrice", orderNo);
	}

	public int checkOrderSnackDup(SqlSessionTemplate sqlSession, OrderDetail orderD) {
		return sqlSession.selectOne("snackOrderMapper.checkOrderSnackDup", orderD);
	}

	public int addOrderDList(SqlSessionTemplate sqlSession, OrderDetail orderD) {
		return sqlSession.insert("snackOrderMapper.addOrderDList", orderD);
	}

	public int deleteOrderDNo(SqlSessionTemplate sqlSession, String orderDNoCheck) {
		return sqlSession.delete("snackOrderMapper.deleteOrderDNo", orderDNoCheck);
	}

	public int updateOrderAmount(SqlSessionTemplate sqlSession, OrderDetail orderD) {
		return sqlSession.update("snackOrderMapper.updateOrderAmount", orderD);
	}

	public ArrayList<WishListDtail> selecComtWishList(SqlSessionTemplate sqlSession, int wishNo) {
		return (ArrayList)sqlSession.selectList("snackOrderMapper.selecComtWishList", wishNo);
	}

	public ArrayList<OrderDetail> checkOrderStock(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("snackOrderMapper.checkOrderStock", orderNo);
	}

	public int updateSnackOrder(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("snackOrderMapper.updateSnackOrder", orderNo);
	}

	public ArrayList<Orders> selectComOrderedList(SqlSessionTemplate sqlSession, String comCode) {
		return (ArrayList)sqlSession.selectList("snackOrderMapper.selectComOrderedList", comCode);
	}

	public ArrayList<Orders> selectHoOrderedList(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("snackOrderMapper.selectHoOrderedList", map);
	}

	public Orders selectOrderForNo(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("snackOrderMapper.selectOrderForNo", orderNo);
	}

	public int insertRelease(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.insert("snackOrderMapper.insertRelease", orderNo);
	}

	public int updateOrderRelease(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("snackOrderMapper.updateOrderRelease", orderNo);
	}

	public int updateOrderStatus(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("snackOrderMapper.updateOrderStatus", orderNo);
	}

	public int insertNewOrder(SqlSessionTemplate sqlSession, HashMap order) {
		return sqlSession.insert("snackOrderMapper.insertNewOrder", order);
	}

}
