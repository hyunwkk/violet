package com.bteam.violet.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.bteam.violet.domain.StoryVO;
import com.bteam.violet.service.StoryService;

import com.bteam.violet.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/story/*")
@AllArgsConstructor
public class StoryController {
	
	private StoryService service;
	
	
	// 내 스토리 
	@GetMapping("/getmystory")
	public void listAllGET(Model model) {
		log.info("list");
		model.addAttribute("list", service.listAll());
	}
	
	// 전체 스토리
	@GetMapping("/getAll")
	public void gets(Model model) {
		log.info("getAll");
		model.addAttribute("story", service.getAll());
	}
	
	// 무한 스크롤
	@PostMapping("/getinfiniteScrollDown")
	public @ResponseBody List<StoryVO>
	getinfiniteScrollDownPOST(@RequestBody StoryVO storyVO) {
		
		Long story_bnoToStart = storyVO.getStory_bno() -1;
		return service.getinfiniteScrollDown(story_bnoToStart);
	}
	
	// 스토리 등록
	@PostMapping("/register")
	public String register(StoryVO story, RedirectAttributes rttr) {
		
		log.info("register : " + story);
		
		if(story.getAttachList() != null) {
			story.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(story);
		
		rttr.addFlashAttribute("result", story.getStory_bno());
		
		return "redirect:/story/getAll";
	}
	
	@GetMapping("/register")
	public void register() {
	}
	
	// 스토리 수정
	@PostMapping("/modify")
	public String modify(StoryVO story, RedirectAttributes rttr) {
		log.info("modify:" + story);

		if (service.modify(story)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/story/getAll";
	}
	@GetMapping("/modify")
	public void getAll(@RequestParam("story_bno") Long story_bno,Model model) {
		
		log.info("/modify");
		model.addAttribute("story", service.get(story_bno));
	}
	
	
	// 스토리 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("story_bno") Long story_bno, RedirectAttributes rttr) {

		log.info("remove..." + story_bno);

		List<StoryVO> attachList = service.getAttachList(story_bno);

		if (service.remove(story_bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/story/getAll";
	}
	
	// 스토리 조회
	@GetMapping("/get")
	public void get(@RequestParam("story_bno") Long story_bno, Model model) {
		model.addAttribute("story", service.get(story_bno));
		
	}
	

	// 이미지 업로드
	@GetMapping(value = "/getAttachList",
		    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<StoryVO>> getAttachList(Long story_bno) {
	
		log.info("getAttachList " + story_bno);
	
		return new ResponseEntity<>(service.getAttachList(story_bno), HttpStatus.OK);

}
	
	private void deleteFiles(List<StoryVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {
	        Path file  = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }
	    });
	  }
	
		
	// 스토리 관리자 삭제
	   @PostMapping("/adminremove")
	   public String adminremove(@RequestParam("story_bno") Long story_bno, RedirectAttributes rttr) {

	      
	      log.info("remove..." + story_bno);

	      List<StoryVO> attachList = service.getAttachList(story_bno);

	      if (service.remove(story_bno)) {

	         // delete Attach Files
	         deleteFiles(attachList);

	         rttr.addFlashAttribute("result", "success");
	      }
	      return "redirect:/admin/info";
	   }
	   
	   @GetMapping("/storylist")
	   public void storyListGET(@RequestParam("cust_id") String cust_id, Model model) {
	      log.info("list");
	      model.addAttribute("list", service.listGet(cust_id));
	   }
	
	

}
