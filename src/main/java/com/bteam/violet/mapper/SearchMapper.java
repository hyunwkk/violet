package com.bteam.violet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bteam.violet.domain.CustVO;


public interface SearchMapper {

	// 전체 친구 리스트
	List<CustVO> list();


	// 주변 친구 조회
	public List<CustVO> arealist(@Param("cust_area") String cust_area);

	// 밥 같이 먹을 친구 조회
	public List<CustVO> foodlist(@Param("cust_food") String cust_food);
	
	// 운동 친구 조회
	public List<CustVO> exerlist(@Param("cust_exer") String cust_exer);
	
	// 반려동물 친구 조회
	public List<CustVO> petlist(@Param("cust_pet") String cust_pet);

	// 공부 친구 조회
	public List<CustVO> studylist(@Param("cust_study") String cust_study);
	
	// 프로필 리스트
 	public List<CustVO> profilelist(@Param("cust_id") String cust_id);
	
 	// 프로필
	public CustVO profile(String cust_id) throws Exception;

	
}
