package com.bteam.violet.dao;

import java.util.List;
import java.util.Map;

//import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.CustVO;
import com.bteam.violet.domain.SearchCriteria;

public interface CustDAO {
	
	// 회원가입
	public void register(CustVO custVO) throws Exception;
	
	// 로그인
	public CustVO login(CustVO custVO) throws Exception;
	
	// 전체회원 정보 조회
	public List<CustVO> custList(SearchCriteria scri) throws Exception;
	
	// 회원정보 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;	
	
	// 회원 존재 여부
	boolean isCust(String cust_id);
	
	//관리자 회원 탈퇴
	public void deletecust(String cust_id);
	
	// 프로필 설정
	public void profile(Map<String, Object> params) throws Exception;
	
	// 프로필 보기
	public CustVO myProfile(String cust_id) throws Exception;
	
	// 아이디 중복 체크
	public int idChk(CustVO custVO) throws Exception;

	// 회원정보 수정
	public void custUpdate(CustVO custVO)throws Exception;

	// 회원 탈퇴
	public void custDelete(CustVO custVO)throws Exception;
	
	// 아이디 찾기
	public String custFindId(CustVO custVO) throws Exception;

	// 비번 찾기
	public String custFindPassword(CustVO custVO) throws Exception;
	
	public List<CustVO> searchprofile(CustVO custVO) throws Exception;
	
	// 비밀번호 변경
	public void updatePassword(CustVO custVO) throws Exception;

}
