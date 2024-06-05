package com.bookshop.biz;

import java.util.List;

import com.bookshop.domain.Qna;

public interface QnaBiz {
	public List<Qna> getQnaList();
	public Qna getQna(int qno);
	public void insQna(Qna qna);
	public void upQna(Qna qna);
	public void vcntQna(int qno);
	public Qna NoVcntQna(int qno);
	public void delQna(int qno);
	public int getLev(int parno);
	public List<Qna> getAnswer(int parno);
	public void delAnswer(int parno);
}
