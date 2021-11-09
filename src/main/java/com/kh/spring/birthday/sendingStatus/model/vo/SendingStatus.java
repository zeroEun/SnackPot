package com.kh.spring.birthday.sendingStatus.model.vo;

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
public class SendingStatus {

	private int curStatusNo;
	private int cempSeq;
	private String cempDept;
	private String cempJob;
	private String cempName;
	private String cempPhone;
	private String cempEmail;
	private Date cempBirth;
	private Date sendingMsgDate;
	private Date selectDate;
}
