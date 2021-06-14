package com.bteam.violet.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bteam.violet.domain.CustVO;
import com.bteam.violet.service.CustService;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cust/*")
public class CustController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustController.class);

	
	@Inject
	CustService custService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
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
		logger.info("=======================================================");
		
		if (custVO.getAttachList() != null) {
			custVO.getAttachList().forEach(attach -> log.info(attach));
		}
		
		logger.info("=======================================================");
		String temp_birth = custVO.getCust_birth().replaceAll("-", "");
		
		custVO.setCust_birth(temp_birth);
		
		logger.info("###### : " + custVO.toString());
		
		int result = custService.idChk(custVO);
		try {
			if(result == 1) {
				return "/cust/register";
			}else if(result == 0) {
				String inputPass = custVO.getCust_password();
				String pwd = pwdEncoder.encode(inputPass);
				custVO.setCust_password(pwd);
				
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
		boolean pwdMatch = pwdEncoder.matches(custVO.getCust_password(), login.getCust_password());
		logger.info("post loging : " + login);
		
		
		if(login.getCust_different()== 0 && pwdMatch == true) {
			logger.info("일반회원 로그인");
			session.setAttribute("member", login);
		} else if(login.getCust_different()== 1 && pwdMatch == true) {
			logger.info("관리자 로그인");
			session.setAttribute("admin", login);
		}
		else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		return "redirect:/";
		
	}
	
	
	// 아이디/비밀번호 찾기 페이지 get
	@RequestMapping(value="/custfind", method = RequestMethod.GET)
	public String custFind() throws Exception{
		return "cust/custfind";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/getLoginId", method = RequestMethod.POST)
	@ResponseBody
	public String getloginId(CustVO custVO) {
		String cust_id = "";
		try {
			cust_id = custService.getLoginId(custVO);
		} catch (Exception e) {
			logger.error("아이디 찾기 오류!!!");
			e.printStackTrace();
		}
		return cust_id;
	}
	
	/*// 비밀번호 찾기
	@RequestMapping(value="/getLoginPassword", method = RequestMethod.POST)
	@ResponseBody
	public String getloginPassword(CustVO custVO) {
		
		CustVO cust_password = custService.getLoginPassword(custVO);
		boolean pwdMatch = pwdEncoder.matches(custVO.getCust_password(), cust_password.getCust_password());
		String cust_password = "";
		try {
			cust_password = custService.getLoginPassword(custVO);
		} catch (Exception e) {
			logger.error("비밀번호 찾기 오류!!!");
			e.printStackTrace();
		}
		return cust_password;
	}
*/
	
	
	
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
		session.invalidate();
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
			
			logger.info("고객님이 회원탈퇴 하였습니다.");
			custService.custDelete(custVO);
			session.invalidate();
			return "redirect:/";
		}
		
		// 패스워드 체크
		@ResponseBody
		@RequestMapping(value="/passChk", method = RequestMethod.POST)
		public boolean passChk(CustVO custVO) throws Exception{
			System.out.println("패스워드 체크하고있니?");
			CustVO login = custService.login(custVO);
			boolean pwdChk = pwdEncoder.matches(custVO.getCust_password(), login.getCust_password());
			System.out.println("패스워드 체크중" + pwdChk);
			return pwdChk;
		}
		
		
		// 프로필 메인
		@RequestMapping(value="/profile", method = RequestMethod.GET)
		public void profile() {
			
		}
		
		// 프로필 생성
		@RequestMapping(value="/profilecreate", method = RequestMethod.GET)
		public void profilecreate() {
			
			logger.info("profile...");
			
		}
		
		// 프로필 생성 post
		@RequestMapping(value="/profilecreatepost", method = RequestMethod.POST)
		public String pprofilecreatepost(@RequestParam Map<String, Object> params, CustVO custVO, HttpSession session) throws Exception {
			
			CustVO member = (CustVO) session.getAttribute("member"); // 로그인한 멤버 세션 가져와서 CustVO에 member로 저장
			logger.info("가져오는 세션값 :" + member);
			logger.info("id:"+ member.getCust_id());
			Object id = member.getCust_id(); 
			params.put("cust_id", id); // params에 id map으로 저장
			logger.info("들고오는 값 : " + params);
			logger.info("profile creating..");
			custService.profile(params); 
			
			return "redirect:/";
		}
		
		
		//프로필 보기
		@RequestMapping(value="/myprofile", method = RequestMethod.GET)
		public String myProfile(CustVO custVO, Model model, HttpSession session) throws Exception {
			logger.info("my profile!");
			CustVO member = (CustVO) session.getAttribute("member");
			model.addAttribute("profile", custService.myProfile(member.getCust_id()));
			logger.info("my profile! :" + custService.myProfile(member.getCust_id()));
			return "cust/myprofile";
		}
		
		// 아이디로 첨부파일과 관련된 데이터 json 반환
		@GetMapping(value="/getAttachList",
				produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<CustVO>> getAttachList(String cust_id) {
			log.info("getAttachList : "  + cust_id);
			
			return new ResponseEntity<>(custService.getAttachList(cust_id), HttpStatus.OK);
		}
		
		
		//프로필 수정
		@RequestMapping(value="/profileupdate", method = RequestMethod.GET)
		public void profileupdate() {
			
		}
		
		@RequestMapping(value="/profileupdatepost", method = RequestMethod.POST)
		public String pprofileupdatepost(@RequestParam Map<String, Object> params, CustVO custVO, HttpSession session) throws Exception {
			
			CustVO member = (CustVO) session.getAttribute("member"); // 로그인한 멤버 세션 가져와서 CustVO에 member로 저장
			logger.info("가져오는 세션값 :" + member);
			logger.info("id:"+ member.getCust_id());
			Object id = member.getCust_id(); 
			params.put("cust_id", id); // params에 id값 추가
			logger.info("들고오는 값 : " + params);
			logger.info("profile update..");
			custService.profile(params); 
			

			return "redirect:/";
		}
		
		
		//비밀번호 변경get
		   @RequestMapping(value="/updatepassword", method = RequestMethod.GET)
		   public String updatePasswordView() throws Exception{
		      return "cust/updatepassword";
		   }

		   //비밀번호 변경post
		   @RequestMapping(value="/updatePassword")
		   public String updatePassword(CustVO custVO, HttpSession session) throws Exception{
		      String inputPass = custVO.getNew_password();
		      String pwd = pwdEncoder.encode(inputPass);
		      custVO.setNew_password(pwd);
		      
		      custService.updatePassword(custVO);
		      session.invalidate();
		      return "redirect:/";
		   }

}
