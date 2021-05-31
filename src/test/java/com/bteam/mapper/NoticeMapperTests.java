package com.bteam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bteam.violet.domain.NoticeVO;
import com.bteam.violet.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(notice -> log.info(notice));
	}
	
	@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setNotice_title("수원대학교");
		notice.setNotice_content("응용통계학과");
		notice.setNotice_writer("hyunwkk");
		
		mapper.insert(notice);
		
		log.info(notice);
		
	}
	
	@Test
	public void testInsertSelectKey() {
		
		NoticeVO notice = new NoticeVO();
		notice.setNotice_title("서울대학교");
		notice.setNotice_content("사회복지학과");
		notice.setNotice_writer("admin");
		
		mapper.insertSelectKey(notice);
		
		log.info(notice);
	}
	
	@Test
	public void testRead() {
		
		NoticeVO notice = mapper.read(5L);
		
		log.info(notice);
	}
	
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.delete(15L));
	}
	
	@Test
	public void testUpdate() {
		
		NoticeVO notice = new NoticeVO();
		
		notice.setNotice_bno(14L);
		notice.setNotice_title("관리자 공지입니다.");
		notice.setNotice_content("내용 수정");
		notice.setNotice_writer("admin");
		
		int count = mapper.update(notice);
		log.info("UPDATE COUNT: " + count);
	}
	
	
}
