package com.bteam.violet.service;

import java.util.List;

import com.bteam.violet.domain.CustVO;

public interface SearchService {
	
	// 친구 목록 조회
	public List<CustVO> list() throws Exception;
	
	// 내 주변 친구 목록 조회
	public List<CustVO> arealist(String cust_area) throws Exception;

	// 밥 같이 먹을 친구 목록 조회
	public List<CustVO> foodlist(String cust_food) throws Exception;
	
	// 운동 친구 조회
	public List<CustVO> exerlist(String cust_exer) throws Exception;
	
	// 반려동물 친구 조회
	public List<CustVO> petlist(String cust_pet) throws Exception;

	// 공부 친구 조회
	public List<CustVO> studylist(String cust_study) throws Exception;
	
	// 프로필리스트
	public List<CustVO> profilelist(String cust_id) throws Exception;
	
	// 프로필
	public CustVO profile(String cust_id) throws Exception;



}
