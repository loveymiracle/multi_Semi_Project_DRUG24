package com.multi.semipjt.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int mno;
	private String id;
	private String password;
	private String role;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String kakaoToken;
	private String status;
	private Date enrollDate;
	private Date modifyDate;
	
}
