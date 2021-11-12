package com.kh.spring.birthday_HO.sendingStatus_HO.model.vo;

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
public class HO_SendingStatus {

	private int curStatusNo;
	private String cempDept;
	private String cempJob;
	private String cempName;
	private String cempPhone;
	private Date cempBirth;
	private Date sendingMsgDate;
	private Date selectDate;
}