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

}
