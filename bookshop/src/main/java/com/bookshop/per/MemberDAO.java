package com.bookshop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.domain.Member;

@Repository
public class MemberDAO implements MemberMapper {

	private SqlSession sqlSession;

	@Autowired
	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Member> getMemberList() {
		return sqlSession.selectList("getMemberList");
	}

}
