package com.bookshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop.domain.Notice;
import com.bookshop.per.NoticeMapper;

@Service
public class NoticeService implements NoticeBiz{
	@Autowired
	private NoticeMapper noticeDAO;

	@Override
	public List<Notice> getNoticeList() {
		return noticeDAO.getNoticeList();
	}
	@Transactional
	@Override
	public Notice getNotice(int nno) {
		noticeDAO.vcntNotice(nno);
		return noticeDAO.getNotice(nno);
	}

	@Override
	public void insNotice(Notice notice) {
		noticeDAO.insNotice(notice);
	}

	@Override
	public void upNotice(Notice notice) {
		noticeDAO.upNotice(notice);
	}

	@Override
	public void vcntNotice(int nno) {
		noticeDAO.vcntNotice(nno);
	}

	@Override
	public void delNotice(int nno) {
		noticeDAO.delNotice(nno);
	}
	
	
}
