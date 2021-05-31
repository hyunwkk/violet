package com.bteam.violet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bteam.violet.domain.CustVO;
import com.bteam.violet.service.CustService;

//import lombok.extern.log4j.Log4j;

@Controller
//@Log4j
@RequestMapping("/cust/*")
public class CustController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustController.class);

	
	@Inject
	CustService custService;
	
	// 회원가입 get
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String postRegister(CustVO custVO) throws Exception {
		logger.info("testing..."+custVO);
		logger.info("post register");
		custService.register(custVO);
		logger.info("register access!");
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void getlogin() {
		
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(CustVO custVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		logger.info("cust info"+ custVO);
		
		HttpSession session = req.getSession();
		CustVO login = custService.login(custVO);
		logger.info("post loging");
		
		
		if(login == null) {
			logger.info("login fail...");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
		}else {
			logger.info("session id :" + session.getId());
			if(login.getCust_different()== 1) {
				logger.info("관리자 로그인");
				session.setAttribute("admin", login);
			}else {
				logger.info("일반회원 로그인");
				session.setAttribute("member", login);
			}
			
		}

		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		logger.info("logout ok!");
		return "redirect:/";
	}
	

}
