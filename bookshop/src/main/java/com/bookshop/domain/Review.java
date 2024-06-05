package com.bookshop.domain;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review { // 타인의 책상
	private int rno;
	private String product_id;
	private String member_id;
	private String content;
	private String img;
	private Date resdate;
	private float rstar;
	private Product product;
	private Member member;
}
