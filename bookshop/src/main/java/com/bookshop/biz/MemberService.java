package com.bookshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.domain.Member;
import com.bookshop.per.MemberMapper;

@Service
public class MemberService implements MemberBiz {

	private MemberMapper memberDAO;

	@Autowired
	public MemberService(MemberMapper memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public List<Member> getMemberList() {
		return memberDAO.getMemberList();
	}

}
