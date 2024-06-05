package com.bookshop.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop.biz.QnaBiz;
import com.bookshop.domain.Qna;
@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	private static final Logger log = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaBiz qnaService;
	
	 @Autowired
	private HttpSession session;
	
	@GetMapping("getQnaList")
	public String getQnaList(Model model) {
		List<Qna> qnaList = qnaService.getQnaList();
		model.addAttribute("qnaList", qnaList);
		return "qna_test/qnaList";
	}
	
	@GetMapping("getQna.do")
	public String getQna(@RequestParam("qno") int qno, HttpServletRequest req, HttpServletResponse res, Model model) {
		Qna qna = qnaService.getQna(qno);
		String id = (String) session.getAttribute("sid");
		
		Cookie viewCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("|"+id+"qna"+qno+"|")) {
					log.info("쿠키 이름 : "+cookies[i].getName());
					viewCookie=cookies[i];
				}	
			}
		} else {
			log.info("아직 방문한 적이 없습니다.");
		}
		
		if(viewCookie==null) {
            try {
            	//쿠키 생성
				Cookie newCookie=new Cookie("|"+id+"qna"+qno+"|","readCount");
				res.addCookie(newCookie);
                //쿠키가 없으니 증가 로직 진행
				model.addAttribute("qna", qnaService.getQna(qno));	
			} catch (Exception e) {
				log.info("쿠키 확인 불가 : "+e.getMessage());
				e.getStackTrace();
			}
        //만들어진 쿠키가 있으면 증가로직 진행하지 않음
		} else {
			model.addAttribute("qna", qnaService.NoVcntQna(qno));
			log.info("viewCookie 확인 로직 : 쿠키 있음");
			String value=viewCookie.getValue();
			log.info("viewCookie 확인 로직 : 쿠키 value : "+value);
		}
		
		return "qna_test/getQna";
	}
	
    @GetMapping("insQna")
    public String insQna(Qna qna, Model model) {
    	return "qna_test/insQna";
    }
	
    @PostMapping("insQnaPro")
    public String insQnaPro(Qna qna, Model model) {
    	String id = (String) session.getAttribute("sid");
		qna.setMember_id(id);
		qna.setResdate(new Date());
		qnaService.insQna(qna);
		return "redirect:getQnaList";
    }
    @GetMapping("upQna")
    public String upQna(@RequestParam("qno") int qno, Model model) {
        Qna qna = qnaService.getQna(qno);
        model.addAttribute("qna", qna);
        return "qna/upQna";
    }

    @PostMapping("upQnaPro")
    public String upQnaPro(Qna qna) {
        qnaService.upQna(qna);
        return "redirect:/qna/getQna.do?qno=" + qna.getQno();
    }

    @GetMapping("delQna")
    public String delQna(@RequestParam("qno") int qno) {
        qnaService.delQna(qno);
        return "redirect:getQnaList.do";
    }

    @GetMapping("insAnswer")
    public String insQnaAnswer(@RequestParam("parno") int parno, Model model) {
        model.addAttribute("parno", parno);
        return "qna/insQnaAnswer";
    }

    @PostMapping("insAnswerPro")
    public String insQnaAnswer(Qna qna, HttpSession session) {
        String id = (String) session.getAttribute("sid");
        if ("admin".equals(id)) { // 관리자인지 확인
            qna.setMember_id(id);
            qnaService.insQna(qna);
        }
        return "redirect:/qna/getQna.do?qno=" + qna.getParno();
    }
}
