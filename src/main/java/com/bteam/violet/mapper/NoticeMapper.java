package com.bteam.violet.mapper;

import java.util.List;

import com.bteam.violet.domain.NoticeVO;

public interface NoticeMapper {

	// 공지사항 조회
	public List<NoticeVO> getList();
	
	// 공지사항 등록
	public void insert(NoticeVO notice);
	
	// 공지사항 증가입력
	public void insertSelectKey(NoticeVO notice);
	
	// 공지사항 글 가져오기
	public NoticeVO read(Long notice_bno);
	
	// 공지사항 삭제
	public int delete(Long notice_bno);
	
	// 공지사항 수정
	public int update(NoticeVO notice);
	
	// 공지사항 조회수 증가
	public int updatehit(Long notice_bno);
	
}
