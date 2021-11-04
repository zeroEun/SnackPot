package com.kh.spring.companyMember.model.vo;

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
public class CompanyMember {
	
	private String memId;
	private String memPw;
	private String memName;
	private String memPhone;
	private String memEmail;
	private String comCode;
	private String admin;
	private String memStatus;

}
