package com.bookshop.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
	private String pid; //상품 아이디
	private String category1; //상품 대분류
	private String category2; //상품 소분류
	private String pname; //상품 이름
	private String subtitle; //서브 타이틀
	private int price; //상품가격
	private String author; //저자
	private String content; //상품설명
	private String company; //출판사
	private int stock; //상품재고
	private String img1; //썸네일
	private String img2; //대표이미지
	private String img3; //상세보기1
	private String img4; //상세보기2
	private float pstar; //상품 리뷰 별점 평균
	private int rcnt; //리뷰 작성 수
	private String pdate; //상품 등록일
}
