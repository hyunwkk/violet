package com.bteam.violet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bteam.violet.domain.CustVO;
import com.bteam.violet.mapper.SearchMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RequiredArgsConstructor
@Service
public class SearchServiceImpl implements SearchService{

	private final SearchMapper mapper;

	// 내 주변 친구 조회
	@Override
	public List<CustVO> list() throws Exception {

		return mapper.list();
	}

	// 내 주변 친구 조회
	@Override
	public List<CustVO> arealist(String cust_area) throws Exception {

		return mapper.arealist(cust_area);
	}

	// 밥 같이 먹을 친구 조회
	@Override
	public List<CustVO> foodlist(String cust_food) throws Exception {

		return mapper.foodlist(cust_food);

	}
	
	// 운동 친구 조회
	@Override
	public List<CustVO> exerlist(String cust_exer) throws Exception {

		return mapper.exerlist(cust_exer);
	}

	// 반려동물 친구 조회
	@Override
	public List<CustVO> petlist(String cust_pet) throws Exception {

		return mapper.petlist(cust_pet);
	}

	// 공부 친구 조회
	@Override
	public List<CustVO> studylist(String cust_study) throws Exception {

		return mapper.studylist(cust_study);
	}

	// 프로필 리스트
	@Override
	public List<CustVO> profilelist(String cust_id) throws Exception {
		
		return mapper.profilelist(cust_id);
	}

	
	// 프로필
	@Override
	public CustVO profile(String cust_id) throws Exception {

		return mapper.profile(cust_id);
	}

}
