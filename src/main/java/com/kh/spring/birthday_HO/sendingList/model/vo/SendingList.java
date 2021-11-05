package com.kh.spring.birthday_HO.sendingList.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class SendingList {

	private String sListNo;
	private String cempDept;
	private String cempJob;
	private String cempName;
	private String cempPhone;
	private Date cempBirth;
	private Date sendMsgDate;
	private String sListStatus;
	private int glistNo;
	private int cempSeq;
}