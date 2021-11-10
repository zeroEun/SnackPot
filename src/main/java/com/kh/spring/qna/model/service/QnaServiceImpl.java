package com.kh.spring.qna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.spring.qna.model.dao.QnaDao;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QnaDao qnaDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return qnaDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<qna> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return qnaDao.selectList(sqlSession, pi);
	}
	
}
