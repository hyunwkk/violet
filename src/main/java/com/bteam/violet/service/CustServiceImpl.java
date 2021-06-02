package com.bteam.violet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bteam.violet.dao.CustDAO;
//import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.CustVO;
import com.bteam.violet.domain.SearchCriteria;


@Service
public class CustServiceImpl implements CustService{
	
	@Inject CustDAO custDAO;

	//회원가입
	@Override
	public void register(CustVO custVO) throws Exception {
		custDAO.register(custVO);
		
	}
	
	// 로그인
	@Override
	public CustVO login(CustVO custVO) throws Exception {
		return custDAO.login(custVO);
	}

	// 전체회원 정보 조회
	@Override
	public List<CustVO> custList(SearchCriteria scri) throws Exception {
		return custDAO.custList(scri);
	}
	
	// 회원정보 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return custDAO.listCount(scri);
	}
	
	
	
	// 회원 존재 여부
	@Override
	public boolean isCust(String cust_id) throws Exception{
		return custDAO.isCust(cust_id);
	}

	

	// 관리자 회원 탈퇴
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	@Override
	public void deletecust(String cust_id){
		custDAO.deletecust(cust_id);
		
	}
	
	//아이디 중복체크
	@Override
	public int idChk(CustVO custVO) throws Exception {
		int result = custDAO.idChk(custVO);
		return result;
	}
	
	//프로필 설정
	@Override
	public void profile(CustVO custVO) throws Exception {
		custDAO.profile(custVO);
	}
	

	//회원 정보 수정
	@Override
	public void custUpdate(CustVO custVO) throws Exception {
		custDAO.custUpdate(custVO);
	}
	
	//회원 탈퇴
	@Override
	public void custDelete(CustVO custVO) throws Exception {
		custDAO.custDelete(custVO);
	}
	
	

	


	

}
