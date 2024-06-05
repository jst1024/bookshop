package com.bookshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.domain.Member;
import com.bookshop.per.MemberMapper;

@Service
public class MemberService implements MemberBiz{

	@Autowired
	private MemberMapper memberDAO;

	@Override
	public List<Member> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public Member getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public int MemberCount() {
		return memberDAO.MemberCount();
	}

	@Override
	public void insMember(Member member) {
		memberDAO.insMember(member);
	}

	@Override
	public void delMember(String id) {
		memberDAO.delMember(id);
	}

	@Override
	public void ChangeInfo(Member member) {
		memberDAO.ChangeInfo(member);
	}

	@Override
	public void ChangePoint(Member member) {
		memberDAO.ChangePoint(member);
	}

	@Override
	public void ChangePw(Member member) {
		memberDAO.ChangePw(member);
	}

}