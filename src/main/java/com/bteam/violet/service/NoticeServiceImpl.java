package com.bteam.violet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.violet.domain.NoticeVO;
import com.bteam.violet.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeVO notice) {
		log.info("register : " + notice);
		mapper.insertSelectKey(notice);
		
	}

	@Override
	public NoticeVO get(Long notice_bno) {
		
		log.info("get : " + notice_bno);
		
		return mapper.read(notice_bno);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify : " + notice);
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(Long notice_bno) {
		log.info("remove : " + notice_bno);
		return mapper.delete(notice_bno) == 1;
	}

	@Override
	public List<NoticeVO> getList() {

		log.info("getList..........");
		return mapper.getList();
	}

	@Override
	public NoticeVO getcount(Long notice_bno) {
		mapper.updatehit(notice_bno);
		return null;
	}



}

