package com.bookshop.domain;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Qna {
	private int qno;
	private int lev;
	private int parno;
	private String title;
	private String content;
	private String img;
	private String member_id;
	private int visited;
	private Date resdate;
	private Member member;
}
