package com.bteam.violet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(CustVO custVO) throws Exception {
		int result = custService.idChk(custVO);
		return result;
	}
	
	// 회원가입 get
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@PostMapping(value="/custReg")
	public String postRegister(CustVO custVO) throws Exception {
		System.out.println("testing..."+custVO);
		logger.info("post register");
		//birth format edit
		String temp_birth = custVO.getCust_birth().replaceAll("-", "");
		
		custVO.setCust_birth(temp_birth);
		
		logger.info("###### : " + custVO.toString());
		
		int result = custService.idChk(custVO);
		try {
			if(result == 1) {
				return "/cust/register";
			}else if(result == 0) {
				custService.register(custVO);
			}
			// 입력한 아이디 존재시 다시 회원가입페이지로
			// 존재하지않으면 가입완료
		} catch (Exception e) {
			logger.error("error: " + e);
		}
		
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
		logger.info("post loging : " + login);
		
		
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
	
	//회원정보수정 get
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		
		return "cust/mypage";
	}

	// 회원정보수정 post
	@RequestMapping(value = "/custUpdate")
	public String registerUpdate(CustVO custVO, HttpSession session) throws Exception {
		logger.info("수정중");
		custService.custUpdate(custVO);
		logger.info("회원정보 수정 : " + custVO);
		return "redirect:/";
	}
	
	// 회원 탈퇴 get
		@RequestMapping(value="/delete", method = RequestMethod.GET)
		public String custDelete() throws Exception{
			return "cust/delete";
		}
		
		// 회원 탈퇴 post
//		@RequestMapping(value="/custDelete", method = RequestMethod.POST)
		@RequestMapping(value="/custDelete")
		public String custDelete(CustVO custVO, HttpSession session, RedirectAttributes rttr) throws Exception{
			
			CustVO member = (CustVO) session.getAttribute("member");
			String sessionPassword = member.getCust_password();
			String voPassword = custVO.getCust_password();
			
			if(!(sessionPassword.equals(voPassword))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/cust/delete";
			}
			logger.info("고객님이 회원탈퇴 하였습니다.");
			custService.custDelete(custVO);
			session.invalidate();
			return "redirect:/";
		}

}
