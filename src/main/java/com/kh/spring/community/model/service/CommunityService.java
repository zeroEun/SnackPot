package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.qna.model.vo.PageInfo;

public interface CommunityService {

	int selectListCount();

	ArrayList<Community> selectList(PageInfo pi);

	void insertCommunity(HashMap<String, Object> map);

	Community selectDetailCmnt(int cno);

	int updateCmnt(HashMap<String, Object> map);

	int updateViews(int cno);

	void updateRecommend(String cno);

	void updateNrecommend(String cno);

	/*댓글===========================================================================================*/
	ArrayList<Reply> selectReplyList(int cmntNo);

	

}
