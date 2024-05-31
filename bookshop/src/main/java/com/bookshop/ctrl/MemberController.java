package com.bookshop.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop.biz.MemberBiz;
import com.bookshop.domain.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	private MemberBiz memberService;

	@Autowired
	public MemberController(MemberBiz memberService) {
		this.memberService = memberService;
	}

	@GetMapping("memberList.do")
	public String memberList(Model model) {
		List<Member> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "member/memberList";
	}
}
