package com.bteam.violet.mapper;

import java.util.List;

import com.bteam.violet.domain.CustVO;

public interface ProfileAttachMapper {
	
	public void insert(CustVO custVO);
	
	public void delete(String uuid);
	
	public List<CustVO> findById(String cust_id);
	
	public void deleteAll(String cust_id);
	

}
