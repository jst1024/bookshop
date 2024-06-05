package com.bookshop.per;

import java.util.List;

import com.bookshop.domain.Member;

public interface MemberMapper {
	public List<Member> getMemberList();
	public Member getMember(String id);     
	public int MemberCount();               
	public void insMember(Member member);   
	public void delMember(String id);       
	public void ChangeInfo(Member member);      
	public void ChangePoint(Member member);   
	public void ChangePw(Member member) ;     
}