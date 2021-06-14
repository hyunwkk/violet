package com.bteam.violet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bteam.violet.domain.CustVO;
import com.bteam.violet.service.CustService;
import com.bteam.violet.service.SearchService;

import lombok.extern.log4j.Log4j2;


@Log4j2
@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	@Inject
	SearchService service;
	
	
	@Inject
	CustService custService;
	

	@GetMapping("/searchmain")
	public void searchView() {
		log.info("search....");
	}


	@GetMapping("/area")
	public void searcharea(HttpServletRequest request,Model model) throws Exception {
		
		log.info("area");
		model.addAttribute("list", service.list());
	}
	
	
	
	@GetMapping("/food")
	public void searchmeal(Model model) throws Exception {
		
		log.info("food");
		
		model.addAttribute("list", service.list());
	}
	
	@GetMapping("/exercise")
	public void searchExercise(Model model) throws Exception {
		
		log.info("exercise...");
		
		model.addAttribute("list", service.list());
	
	}
	
	@GetMapping("/pet")
	public void searchPet(Model model) throws Exception {
		
		log.info("pet...");
		
		model.addAttribute("list", service.list());

	}
	
	@GetMapping("/study")
	public void searchStudy(Model model) throws Exception {

		log.info("study...");
		
		model.addAttribute("list", service.list());

	}
	

	// 목록 조회
	
	// 주변 친구 조회	
		@GetMapping("/getarea")
		public void getarea(@RequestParam("cust_area") String cust_area, Model model) throws Exception {
			
			log.info("getarea...");
			
			model.addAttribute("list", service.arealist(cust_area));
			//model.addAttribute("profile", custService.myProfile(cust_id));

			
			
		}
		
	// 밥 같이 먹을 친구 조회	
		@GetMapping("/getfood")
		public void getfood(@RequestParam("cust_food") String cust_food, Model model) throws Exception {
			
			log.info("getfood...");

			
			model.addAttribute("foodlist", service.foodlist(cust_food));
			
		}
		
	// 운동 친구 조회
		@GetMapping("/getexer")
		public void getexer(@RequestParam("cust_exer") String cust_exer, Model model) throws Exception {
			
			log.info("getexer...");

			
			model.addAttribute("exerlist", service.exerlist(cust_exer));
			
		}
		
	// 반려동물 친구 조회	
		@GetMapping("/getpet")
		public void getpet(@RequestParam("cust_pet") String cust_pet, Model model) throws Exception {
			
			log.info("getpet...");

			
			model.addAttribute("petlist", service.petlist(cust_pet));
			
		}
			
	// 공부 친구 조회	
		@GetMapping("/getstudy")
		public void getstudy(@RequestParam("cust_study") String cust_study, Model model) throws Exception {
			
			log.info("getstudy...");

			
			model.addAttribute("studylist", service.studylist(cust_study));
			
		}
	
	// 개인프로필 조회
		@GetMapping("/profile")
		public void getprofile(@RequestParam("cust_id") String cust_id, Model model) throws Exception {
			
			log.info("profile...");

			
			/*model.addAttribute("profile", service.profile(cust_id));*/
			model.addAttribute("profile", custService.myProfile(cust_id));
			
		}
		
		// 아이디로 첨부파일과 관련된 데이터 json 반환
		@GetMapping(value="/getAttachList",
				produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<CustVO>> getAttachList(String cust_id) {
			log.info("getAttachList : "  + cust_id);
			
			return new ResponseEntity<>(custService.getAttachList(cust_id), HttpStatus.OK);
		}



		
	
	}
	
	

	
	
	

