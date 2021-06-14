package com.bteam.violet.service;

import java.util.List;

import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.StoryVO;

public interface StoryService {
	
	
	public List<StoryVO> listAll();
	
	public List<StoryVO> getAll();
	public List<StoryVO> getinfiniteScrollDown(Long story_bnoToStart);
	
	public void register(StoryVO story);
	
	public StoryVO get(Long story_bno);
	
	public boolean modify(StoryVO story);
	
	public boolean remove(Long story_bno);
	
	public List<StoryVO> getAttachList(Long story_bno);
	
	public List<StoryVO> listGet(String cust_id);
}
