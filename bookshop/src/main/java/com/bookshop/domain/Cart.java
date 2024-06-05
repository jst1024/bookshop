package com.bookshop.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Cart {
	private int cno;
	private String product_id;
	private String member_id;
	private String pname;
	private int amount;
	private int price;
	private Date cartdate;
	private Product product;
	private Member member;
}
