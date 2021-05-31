package com.bteam.violet.mapper;

import java.util.List;

import com.bteam.violet.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();
	
	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	public NoticeVO read(Long notice_bno);
	
	public int delete(Long notice_bno);
	
	public int update(NoticeVO notice);
	
	public int updatehit(Long notice_bno);
	
}
