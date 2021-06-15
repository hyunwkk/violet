package com.bteam.violet.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bteam.violet.dao.CustDAO;
//import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.CustVO;
import com.bteam.violet.domain.SearchCriteria;
import com.bteam.violet.mapper.ProfileAttachMapper;

import lombok.extern.log4j.Log4j;



@Log4j
@Service
public class CustServiceImpl implements CustService{
	
	@Inject CustDAO custDAO;
	
	@Inject ProfileAttachMapper attachMapper;

	//회원가입
	@Transactional
	@Override
	public void register(CustVO custVO) throws Exception {
		
		
		custDAO.register(custVO);
		
		if(custVO.getAttachList() == null || custVO.getAttachList().size() <= 0) {
			return;
		}
		
		custVO.getAttachList().forEach(attach -> {
			
			attach.setCust_id(custVO.getCust_id());
			attachMapper.insert(attach);
			System.out.println("service register 타고있는중..." + attach);
			
		});
		
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
	public void profile(Map<String, Object> params) throws Exception {
		System.out.println("넘어온 값 : " + params);
		custDAO.profile(params);
	}
	
	
	@Override
	public CustVO myProfile(String cust_id) throws Exception {
		System.out.println("프로필 serviceimpl");
		return custDAO.myProfile(cust_id);
	}
	
	//회원 정보 수정
	@Override
	public void custUpdate(CustVO custVO) throws Exception {
		
		attachMapper.deleteAll(custVO.getCust_id());
		
		custDAO.custUpdate(custVO);
		
		if (custVO.getAttachList() != null && custVO.getAttachList().size() > 0) {
			
			custVO.getAttachList().forEach(attach -> {
				
				attach.setCust_id(custVO.getCust_id());
				attachMapper.insert(attach);
			});
		}
		
	}
	
	//회원 탈퇴
	@Transactional
	@Override
	public void custDelete(CustVO custVO) throws Exception {
		log.info("remove files ... " + custVO);
		/*attachMapper.deleteAll(custVO);*/
		custDAO.custDelete(custVO);
	}
	
	
	@Override
	public List<CustVO> getAttachList(String cust_id) {
		log.info("get Attach list by cust_id" + cust_id);
		return attachMapper.findById(cust_id);
	}


	// 아이디 찾기
	@Override
	public String getLoginId(CustVO custVO) throws Exception {
		return custDAO.getLoginId(custVO);
	}

	@Override
	public List<CustVO> searchprofile(CustVO custVO) throws Exception {
		return custDAO.searchprofile(custVO);
	}
	
	/*// 비밀번호 찾기
	@Override
	public String getLoginPassword(CustVO custVO) throws Exception {
		return custDAO.getLoginPassword(custVO);
	}
*/
   // 비밀번호 변경
   @Override
   public void updatePassword(CustVO custVO) throws Exception {
      custDAO.updatePassword(custVO);
   }

}
