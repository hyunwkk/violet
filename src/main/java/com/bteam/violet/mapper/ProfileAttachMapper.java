package com.bteam.violet.mapper;

import java.util.List;

import com.bteam.violet.domain.CustVO;

public interface ProfileAttachMapper {
	
	//사진 삽입
	public void insert(CustVO custVO);
	
	//사진 삭제
	public void delete(String uuid);
	
	
	public List<CustVO> findById(String cust_id);
	
	
	public void deleteAll(String cust_id);
	

}
