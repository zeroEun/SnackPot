package com.kh.spring.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;

@Repository
public class InvenManagementDao {

	public int insertSnack(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.insertSnack", p);
	}

	public int insertSnackAttach(SqlSessionTemplate sqlSession, ProductAttachment pa) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.insertSnackAttach", pa);
	}

	public int arrivalInsert(SqlSessionTemplate sqlSession, Arrival a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.arrivalInsert", a);
	}

	public int todayArrivalCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.todayArrivalCount");
	}

	public ArrayList<Arrival> todayArrivalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("invenMapper.todayArrivalList", null, rowBounds);
	}

	public int todayReleaseCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.todayReleaseCount");
	}

	public ArrayList<Release> todayReleaseList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("invenMapper.todayReleaseList", null, rowBounds);
	}

	public int releaseInsert(SqlSessionTemplate sqlSession, Release r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.releaseInsert", r);
	}
	
	

}
