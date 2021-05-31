package com.bteam.violet.service;

import java.util.List;

//import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.CustVO;
import com.bteam.violet.domain.SearchCriteria;

public interface CustService {
	
	// 회원가입
	public void register(CustVO custVO) throws Exception;
	
	// 로그인
	public CustVO login(CustVO custVO) throws Exception;
	
	// 전체회원 정보 조회
	public List<CustVO> custList(SearchCriteria scri) throws Exception;
	
	// 회원정보 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
		
	// 회원 존재 여부
	boolean isCust(String cust_id) throws Exception;
	
	// 회원 탈퇴
	public void deletecust(String cust_id);

}
