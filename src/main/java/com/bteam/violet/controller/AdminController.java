package com.bteam.violet.controller;

//import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.PageMaker;
import com.bteam.violet.domain.SearchCriteria;
//import com.bteam.violet.domain.CustVO;
import com.bteam.violet.service.CustService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@Inject
	CustService custService;
	
	
	// 전체 회원정보 조회

	@GetMapping("/info")
	public String memberAll(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		// srci는 modelAttribute로 자동으로 Model객체에 추가되서 jsp에서 사용
		// pageMaker에서 계산한 값 Model에 저장		
		log.info("members info");
		
		model.addAttribute("custlist", custService.custList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(custService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/info";
		
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="delete_proc.do", method=RequestMethod.GET)
	public String custDeleteProc(HttpServletRequest request) {
		log.info("관리자 권한으로 강제 회원 탈퇴중입니다.");
		String key = request.getParameter("key");
		log.info("탈퇴한 회원 아이디 :" + key);
		custService.deletecust(key);

		return "redirect:/admin/info";
	}
	
	
	@GetMapping("/header")
	public void header() {
		
	}

}
