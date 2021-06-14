package com.bteam.violet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.StoryVO;

public interface StoryMapper {
	
	public List<StoryVO> listAll();
	
	public List<StoryVO> getAll();
	public List<StoryVO> getinfiniteScrollDown(Long story_bnoToStart);
	
	public void insert(StoryVO story);
	
	public Integer insertSelectKey(StoryVO story);
	
	public StoryVO read(Long story_bno);
	
	public int delete(Long stroy_bno);
	
	public int update(StoryVO story);

	public List<StoryVO> findByBno(Long story_bno);
	
	public List<StoryVO> listGet(String cust_id);
	
	
}
