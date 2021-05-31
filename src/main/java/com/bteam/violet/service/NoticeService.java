package com.bteam.violet.service;

import java.util.List;

import com.bteam.violet.domain.NoticeVO;


public interface NoticeService {
	
	public void register(NoticeVO notice);
	
	public NoticeVO get(Long notice_bno);
		
	public boolean modify(NoticeVO notice);
	
	public boolean remove(Long notice_bno);
	
	public List<NoticeVO> getList();
	
	public NoticeVO getcount(Long notice_bno);
	
	
}
