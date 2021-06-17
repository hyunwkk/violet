package com.bteam.mapper;


import javax.inject.Inject;

//import static org.junit.Assert.assertEquals;

//import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
//import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bteam.violet.dao.CustDAO;
import com.bteam.violet.domain.CustVO;
import com.bteam.violet.service.CustService;

import io.swagger.annotations.Info;

//import com.bteam.violet.domain.CustVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CustMapperTest {
	
	CustVO custVO;
	
	@Inject CustDAO custDAO;
	
	@Before
	public void setUp() {
		custVO = new CustVO();
		custVO.setCust_id("admin");
		custVO.setCust_password("admin");
	}
	
	@Inject
	//@Autowired
	//@Qualifier("sqlSession")
	SqlSession sqlSession;
	
	@Test
	public void logintest() {
		log.info("login..");
		log.info("testing...! " + sqlSession.selectOne("com.bteam.violet.mapper.testmapper.demo"));
		//assertEquals(1,sql.selectOne("com.bteam.violet.mapper.testmapper.demo"));
	}
	
	@Test
	public void logintest2() {
		log.info("login..");
		log.info("testing...! " + sqlSession.selectOne("com.bteam.violet.mapper.testmapper.login2"));
		//assertEquals(1,sql.selectOne("com.bteam.violet.mapper.testmapper.demo"));
	}
	
	
	@Test
	public void logintest3() {
		log.info("login..");
		log.info("testing...! " + sqlSession.selectOne("com.bteam.violet.mapper.testmapper.login", custVO));
		//assertEquals(1,sql.selectOne("com.bteam.violet.mapper.testmapper.demo"));
	}
	
	/*@Test
	public void custlogin() {
		log.info("custlogin....!!!!!");
		log.info("testing!!!" + sqlSession.selectOne("CustMapper.login", custVO));
	}*/
	
	@Test
	public void infotest() {
		log.info("members Info....");
		log.info("info : " + sqlSession.selectList("CustMapper.info", custVO));
	}
	
	
	@Test
	public void logint() {
		log.info("members Info....");
		log.info("info : " + sqlSession.selectOne("CustMapper.login", custVO));
	}
	

	

}
