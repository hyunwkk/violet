package com.bteam.violet.mapper;

import java.util.List;

import com.bteam.violet.domain.StoryVO;

public interface StoryAttachMapper {
	
	public void insert(StoryVO vo);

	public void delete(String uuid);

	public List<StoryVO> findByBno(Long story_bno);

	public void deleteAll(Long story_bno);

	public List<StoryVO> getOldFiles();

}
