package com.kh.spring.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.Community;
import com.kh.spring.qna.model.vo.PageInfo;

@Repository
public class CommunityDao {

	public int selectListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("cmntMapper.selectListCount");
	}

	public ArrayList<Community> selectList(SqlSession sqlSession, PageInfo pi) {
	
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("cmntMapper.selectList" , null, rowBounds);
		
	}

	public void insertCommunity(SqlSession sqlSession, HashMap<String, Object> map) {
		
		sqlSession.insert("cmntMapper.insertCommunity" , map);
		
	}

	public Community selectDetailCmnt(SqlSession sqlSession, int cno) {
		
		return sqlSession.selectOne("cmntMapper.selectDetailCmnt" , cno);
	}


	public int updateCmnt(SqlSession sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("cmntMapper.updateCmnt" , map);
	}

	public int updateViews(SqlSession sqlSession, int cno) {
	
		return sqlSession.update("cmntMapper.updateViews" , cno);
		
	}


}
