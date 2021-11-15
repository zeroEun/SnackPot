package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.CommunityDao;
import com.kh.spring.community.model.vo.Community;
import com.kh.spring.qna.model.vo.PageInfo;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CommunityDao cmntDao;
	
	@Override
	public int selectListCount() {
			
		return cmntDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Community> selectList(PageInfo pi) {
		
		return cmntDao.selectList(sqlSession , pi); 
	}

	@Override
	public void insertCommunity(HashMap<String, Object> map) {
		
		cmntDao.insertCommunity(sqlSession , map);
		
	}

	@Override
	public Community selectDetailCmnt(int cno) {
		
		return cmntDao.selectDetailCmnt(sqlSession , cno); 
	}

	@Override
	public int updateCmnt(HashMap<String, Object> map) {
		
		return cmntDao.updateCmnt(sqlSession , map);
		
	}

	@Override
	public int updateViews(int cno) {
		
		return cmntDao.updateViews(sqlSession , cno);
		
	}



}
