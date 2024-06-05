package com.bookshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop.domain.Qna;
import com.bookshop.per.QnaMapper;

@Service
public class QnaService implements QnaBiz{
	@Autowired
	private QnaMapper qnaDAO;

	@Override
	public List<Qna> getQnaList() {
		return qnaDAO.getQnaList();
	}
	@Transactional
	@Override
	public Qna getQna(int qno) {
		qnaDAO.vcntQna(qno);
		return qnaDAO.getQna(qno);
	}

	@Override
	public void insQna(Qna qna) {
        int lev;
        if (qna.getParno() == 0) {
            lev = 0; // 최상위 글인 경우 plevel을 0으로 설정
        } else {
            lev = qnaDAO.getLev(qna.getParno()) + 1; // 부모 글의 plevel을 가져와서 1을 더한 값으로 설정
        }
        qna.setLev(lev);
        qnaDAO.insQna(qna);
    }

	@Override
	public void upQna(Qna qna) {
		qnaDAO.upQna(qna);
	}

	@Override
	public void vcntQna(int qno) {
		qnaDAO.vcntQna(qno);
	}
	
	@Override
	public Qna NoVcntQna(int qno) {
		return qnaDAO.getQna(qno);
	}
	@Transactional
	@Override
	public void delQna(int qno) {
		qnaDAO.delAnswer(qno);
		qnaDAO.delQna(qno);
	}
	@Override
	public int getLev(int parno) {
		return qnaDAO.getLev(parno);
	}
	@Override
	public List<Qna> getAnswer(int parno) {
		return qnaDAO.getAnswer(parno);
	}
	@Override
	public void delAnswer(int parno) {
		qnaDAO.delAnswer(parno);
	}
	
	
}
