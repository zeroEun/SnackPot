package com.kh.spring.qna.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class qna {
	
	private int qNo;
	private String writer;
	private String qTitle;
	private String qContent;
	private Date createDate;
	private String aTitle;
	private String aContent;
	private Date aDate;
	
	

}
