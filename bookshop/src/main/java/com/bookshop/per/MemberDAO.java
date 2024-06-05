package com.bookshop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.domain.Member;

@Repository
public class MemberDAO implements MemberMapper{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Member> getMemberList() {
		return sqlSession.selectList("member.getMemberList");
	}

	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne("member.getMember",id);
	}

	@Override
	public int MemberCount() {
		return sqlSession.selectOne("member.MemberCount");
	}

	@Override
	public void insMember(Member member) {
		sqlSession.insert("member.insMember",member);
		
	}

	@Override
	public void delMember(String id) {
		sqlSession.delete("member.delMember",id);
	}

	@Override
	public void ChangeInfo(Member member) {
		sqlSession.update("member.ChangeInfo",member);
	}

	@Override
	public void ChangePoint(Member member) {
		sqlSession.update("member.ChangePoint",member);
	}

	@Override
	public void ChangePw(Member member) {
		sqlSession.update("member.ChangePw",member);
	}
	
	
}