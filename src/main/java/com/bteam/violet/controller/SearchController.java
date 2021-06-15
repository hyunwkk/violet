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
	
	// search 메인 페이지
	@GetMapping("/searchmain")
	public void searchView() {
		log.info("search....");
	}

	// 전체 주변 친구 목록
	@GetMapping("/area")
	public void searcharea(HttpServletRequest request,Model model) throws Exception {
		
//		log.info("area");
//		List <CustVO> list = service.list();
//		for(CustVO c:list) {
//			log.info("c : " + c);
//		}
//		model.addAttribute("list", list );
		model.addAttribute("list", service.list());
	}
	
	
	// 전체 밥 같이 먹을 친구 목록
	@GetMapping("/food")
	public void searchmeal(Model model) throws Exception {
		
		log.info("food");
		
		model.addAttribute("list", service.list());
	}
	
	// 전체 운동 친구 목록
	@GetMapping("/exercise")
	public void searchExercise(Model model) throws Exception {
		
		log.info("exercise...");
		
		model.addAttribute("list", service.list());
	
	}
	
	// 전체 반려동물 친구 목록
	@GetMapping("/pet")
	public void searchPet(Model model) throws Exception {
		
		log.info("pet...");
		
		model.addAttribute("list", service.list());

	}
	
	// 전체 공부친구 목록
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
			
			List <CustVO> list =  service.arealist(cust_area);
			
			
			model.addAttribute("arealist", list);
			
			
		}
		
	// 밥 같이 먹을 친구 조회	
		@GetMapping("/getfood")
		public void getfood(@RequestParam("cust_food") String cust_food, Model model) throws Exception {
			
			log.info("getfood...");

			List <CustVO> list =  service.foodlist(cust_food);
			
			
			model.addAttribute("foodlist", list);
			
		}
		
	// 운동 친구 조회
		@GetMapping("/getexer")
		public void getexer(@RequestParam("cust_exer") String cust_exer, Model model) throws Exception {
			
			log.info("getexer...");

			
			List <CustVO> list =  service.exerlist(cust_exer);
			
			
			model.addAttribute("exerlist", list);
			
		}
		
	// 반려동물 친구 조회	
		@GetMapping("/getpet")
		public void getpet(@RequestParam("cust_pet") String cust_pet, Model model) throws Exception {
			
			log.info("getpet...");

			List <CustVO> list =  service.petlist(cust_pet);
			
			
			model.addAttribute("petlist", list);
			
		}
			
	// 공부 친구 조회	
		@GetMapping("/getstudy")
		public void getstudy(@RequestParam("cust_study") String cust_study, Model model) throws Exception {
			
			log.info("getstudy...");

			
			List <CustVO> list =  service.studylist(cust_study);
			
			// log.info("get(0)" + list.get(0));
			
			model.addAttribute("studylist", list);
			
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
	
	

	
	
	

