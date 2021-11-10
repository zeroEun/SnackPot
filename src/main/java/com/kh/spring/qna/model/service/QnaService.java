package com.kh.spring.qna.model.service;

import java.util.ArrayList;

import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.qna;

public interface QnaService {

	int selectListCount();

	ArrayList<qna> selectList(PageInfo pi);

}
