package com.kh.spring.companyEmp.model.vo;

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
public class CompanyEmp {

	private int cempSeq;
	private String cempName;
	private String cempDept;
	private String cempJob;
	private String cempEmail;
	private int cempPhone;
	private int cempBirth;
	private String comCode;
	private int cempNum;
	
}
