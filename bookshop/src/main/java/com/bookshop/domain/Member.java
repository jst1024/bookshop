package com.bookshop.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String tel;
	private String email;
	private String addr1;
	private String addr2;
	private String postcode;
	private String resdate;
	private int rcnt;
	private int point;
}