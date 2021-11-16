package com.kh.spring.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.dao.InvenManagementDao;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;

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
			throw new CommException("상품 등록에 실패했습니다.");
		}
		
		
	}

	@Override
	public void insertSnackAttach(ProductAttachment pa) {
		int result = invenManagementDao.insertSnackAttach(sqlSession, pa);
		
		if(result < 0) {
			throw new CommException("상품 이미지 등록에 실패했습니다.");
		}
		
	}

	@Override
	public void arrivalInsert(Arrival a) {
		int result = invenManagementDao.arrivalInsert(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("입고 등록에 실패했습니다.");
		}
		
	}

	@Override
	public int todayArrivalCount() {
		// TODO Auto-generated method stub
		return invenManagementDao.todayArrivalCount(sqlSession);
	}

	@Override
	public ArrayList<Arrival> todayArrivalList(PageInfo pi) {
		// TODO Auto-generated method stub
		return invenManagementDao.todayArrivalList(sqlSession, pi);
	}

	@Override
	public int todayReleaseCount() {
		// TODO Auto-generated method stub
		return invenManagementDao.todayReleaseCount(sqlSession);
	}

	@Override
	public ArrayList<Release> todayReleaseList(PageInfo pi) {
		// TODO Auto-generated method stub
		return invenManagementDao.todayReleaseList(sqlSession, pi);
	}

	@Override
	public void releaseInsert(Release r) {
		int result = invenManagementDao.releaseInsert(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("입고 등록에 실패했습니다.");
		}
		
		
		
	}

}
