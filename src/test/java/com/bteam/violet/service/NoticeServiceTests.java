package com.bteam.violet.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bteam.violet.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private NoticeService service;
	
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		NoticeVO notice = new NoticeVO();
		notice.setNotice_title("violet 사용법");
		notice.setNotice_content("친구을 쉽게 찾아보세요!");
		notice.setNotice_writer("admin");
		
		service.register(notice);
	}
	
	@Test
	public void testGetList() {
		
		service.getList().forEach(notice -> log.info(notice));
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get(20L));
	}
	
	
	@Test
	public void testUpdate() {
		
		NoticeVO notice = service.get(20L);
		
		if (notice == null) {
			return;
					
		}
		notice.setNotice_title("violet 대표입니다.");
		log.info("MODIFY RESULT: " + service.modify(notice));
	}
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT : " + service.remove(10L));
	}
}
