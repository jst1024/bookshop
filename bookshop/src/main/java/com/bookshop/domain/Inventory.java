package com.bookshop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Inventory {
	private int ino;           //입출고번호
	private String product_id; //상품 아이디
	private int orderno;       //주분 번호
	private String member_id;  //회원 아이디
	private int amount;        //입출고량
	private String status;     //상태
	private String pdate;      //입출고 날짜	
	private String iprice;     //입고 가격
	private String oprice;     //출고 가격
}
