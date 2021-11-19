package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.ComtyAttachment;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.qna.model.vo.PageInfo;

public interface CommunityService {

//	int selectListCount();
	int selectListCount(String comCode);

	int selectCmntNo(String memId);

	void insertCommunityAttachment(ComtyAttachment att);
	
	ArrayList<Community> selectList(PageInfo pi);

	void insertCommunity(Community cmnt);

	Community selectDetailCmnt(int cno);

//	int updateCmnt(HashMap<String, Object> map);

	int updateViews(int cno);

	void updateRecommend(String cno);

	void updateNrecommend(String cno);

	ArrayList<Reply> selectReplyList(int cmntNo);

	void updateCmnt(Community cmnt);

	void updateAttachment(ComtyAttachment att);

	void deleteCmnt(Community cmnt);

	void deleteCmntAttachment(ComtyAttachment att);

	ArrayList<Community> selectTopList(String comCode);

	ArrayList<Community> selectMyWriter(String memId);



	





	
	

}
