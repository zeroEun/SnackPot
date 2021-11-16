package com.kh.spring.snack.snackOrder.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
