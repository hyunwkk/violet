package com.bteam.violet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bteam.violet.domain.NoticeVO;
import com.bteam.violet.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());

	}
	
	@GetMapping("/register")
	public void getregister() {
		
	}
	
	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		
		log.info("register: " + notice);
		
		service.register(notice);
		
		rttr.addFlashAttribute("result", notice.getNotice_bno());
		
		return "redirect:/notice/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("notice_bno") Long notice_bno, Model model) {
		log.info("/get or modfiy");

		service.getcount(notice_bno);
		model.addAttribute("notice", service.get(notice_bno));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO notice, RedirectAttributes rttr, Model model) {
		log.info("modify: " + notice);
		
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_bno") Long notice_bno, RedirectAttributes rttr) {
		log.info("remove " + notice_bno);
		if(service.remove(notice_bno)) {
			rttr.addFlashAttribute("result", "success");			
		}
		return "redirect:/notice/list";
	}
	
	
	

}
