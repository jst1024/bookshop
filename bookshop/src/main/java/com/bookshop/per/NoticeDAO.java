package com.bookshop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.domain.Notice;

@Repository
public class NoticeDAO implements NoticeMapper{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Notice> getNoticeList() {
		return sqlSession.selectList("notice.getNoticeList");
	}

	@Override
	public Notice getNotice(int nno) {
		return sqlSession.selectOne("notice.getNotice", nno);
	}

	@Override
	public void insNotice(Notice notice) {
		sqlSession.insert("notice.insNotice", notice);
	}

	@Override
	public void upNotice(Notice notice) {
		sqlSession.update("notice.insNotice", notice);
	}

	@Override
	public void vcntNotice(int nno) {
		sqlSession.update("notice.vcntNotice", nno);
	}

	@Override
	public void delNotice(int nno) {
		sqlSession.delete("notice.delNotice", nno);
	}
	
	
	
}
