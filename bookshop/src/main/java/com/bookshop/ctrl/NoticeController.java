package com.bookshop.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop.biz.NoticeBiz;
import com.bookshop.domain.Notice;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Autowired
	private NoticeBiz noticeService;
	
	@GetMapping("noticeList.do")
	public String noticeList(Model model) {
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "notice_test/noticeList";
	}
	
	@GetMapping("getNotice")
	public String getNotice(@RequestParam("nno") int nno, Model model) {
		Notice notice = noticeService.getNotice(nno);
		model.addAttribute("notice",notice);
		return "notice_test/getNotice";
	}
	
	@GetMapping("insNotice")
	public String insNotice(Model model) {
		model.addAttribute("notice",new Notice());
		return "notice_test/insNotice";
	}
		
	@PostMapping("insProNotice")
	public String insProNotice(Notice notice, Model model) {
		noticeService.insNotice(notice);
		return "redirect:/notice_test/noticeList";
	}
	
	
	@GetMapping("upNotice")
	public String upNotice(@RequestParam("nno") int nno, Model model) {
		Notice notice = noticeService.getNotice(nno);
		model.addAttribute("notice", notice);
		return "notice_test/upNotice";
	}
	/*
	@PostMapping("upProBoard")
	public String upProBard(Board board, Model model) {
		boardService.upBoard(board);
		return "redirect:getBoard.do?bno="+board.getBno();// 수정된 게시물 상세보기로 리다이렉트
			//사용자에게 url주소로 리다이랙트하라는 의미
	}
	
	 @GetMapping("delBoard.do")
	    public String delBoard(@RequestParam("bno") int bno) {
	        boardService.delBoard(bno);
	        return "redirect:boardList.do";
	 }
	 */
	
}
