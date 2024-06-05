package com.bookshop.per;

import java.util.List;

import com.bookshop.domain.Notice;

public interface NoticeMapper {
	public List<Notice> getNoticeList();
	public Notice getNotice(int nno);
	public void insNotice(Notice notice);
	public void upNotice(Notice notice);
	public void vcntNotice(int nno);
	public void delNotice(int nno);
}
