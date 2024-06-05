package com.bookshop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.domain.Qna;

@Repository
public class QnaDAO implements QnaMapper{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Qna> getQnaList() {
		return sqlSession.selectList("qna.getQnaList");
	}

	@Override
	public Qna getQna(int qno) {
		return sqlSession.selectOne("qna.getQna", qno);
	}

	@Override
	public void insQna(Qna qna) {
	    int lev;
	    if (qna.getParno() == 0) {
	        lev = 0; // 최상위 글인 경우 plevel을 0으로 설정
	    } else {
	    	lev = getLev(qna.getParno()) + 1; // 부모 글의 plevel을 가져와서 1을 더한 값으로 설정
	    }
	    qna.setLev(lev);
	    sqlSession.insert("qna.insQna", qna);
	}

	@Override
	public void upQna(Qna qna) {
		sqlSession.update("qna.upQna", qna);
	}

	@Override
	public void vcntQna(int qno) {
		sqlSession.update("qna.vcntQna", qno);
	}

	@Override
	public void delQna(int qno) {
		sqlSession.delete("qna.delQna", qno);
	}
	
	@Override
	public int getLev(int parno) {
		return sqlSession.selectOne("qna.getLev", parno);
	}

	@Override
	public List<Qna> getAnswer(int parno) {
		return sqlSession.selectList("qna.getAnswer", parno);
	}

	@Override
	public void delAnswer(int parno) {
		sqlSession.delete("qna.delAnswer",parno);
	}
}
