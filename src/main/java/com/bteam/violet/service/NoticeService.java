package com.bteam.violet.service;

import java.util.List;

import com.bteam.violet.domain.NoticeVO;


public interface NoticeService {
	
	// 공지사항 등록
	public void register(NoticeVO notice);
	
	// 공지사항 글 가져오기
	public NoticeVO get(Long notice_bno);
	
	// 공지사항 수정
	public boolean modify(NoticeVO notice);
	
	// 공지사항 제거
	public boolean remove(Long notice_bno);
	
	// 공지사항 조회
	public List<NoticeVO> getList();
	
	// 공지사항 조회수 증가
	public NoticeVO getcount(Long notice_bno);
	
	
}
