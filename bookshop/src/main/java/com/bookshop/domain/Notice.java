package com.bookshop.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Notice {
	private int nno;
	private String title;
	private String content;
	private String filename;
	private int visited;
	private Date resdate;
	
}
