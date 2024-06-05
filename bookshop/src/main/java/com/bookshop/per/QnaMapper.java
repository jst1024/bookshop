package com.bookshop.per;

import java.util.List;

import com.bookshop.domain.Qna;

public interface QnaMapper {
	public List<Qna> getQnaList();
	public Qna getQna(int qno);
	public void insQna(Qna qna);
	public void upQna(Qna qna);
	public void vcntQna(int qno);
	public void delQna(int qno);
	public int getLev(int parno);
	public List<Qna> getAnswer(int parno);
	public void delAnswer(int parno);
}
