package com.kh.spring.snack.snackList.model.vo;

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
public class SnackList {
	
	private int snackListNo;
	private String comCode;
	private String comName;
	private String transStatus;
	private String transDate;
}
