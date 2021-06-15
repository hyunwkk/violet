package com.bteam.violet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.StoryVO;
import com.bteam.violet.mapper.StoryAttachMapper;
import com.bteam.violet.mapper.StoryMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoryServiceImpl implements StoryService {

	
	@Override
	public List<StoryVO> listAll() {
		log.info("listAll......................");
		
		return mapper.listAll();
	}

	@Override
	public List<StoryVO> getAll() {
		log.info("getAll---------------------");
		
		return mapper.getAll();
	}


	@Setter(onMethod_= @Autowired)
	private StoryMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private StoryAttachMapper attachMapper;
	


	@Transactional
	@Override
	public void register(StoryVO story) {
		log.info("register......." + story);
		
		mapper.insertSelectKey(story);
		
		if(story.getAttachList() == null || story.getAttachList().size() <= 0) {
			return;
		}
		story.getAttachList().forEach(attach -> {
			attach.setStory_bno(story.getStory_bno());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public StoryVO get(Long story_bno) {
		log.info("get................." + story_bno);
		
		return mapper.read(story_bno);
	}


	@Transactional
	@Override
	public boolean modify(StoryVO story) {
	
	log.info("modify......" + story);
	
	attachMapper.deleteAll(story.getStory_bno());
	
	boolean modifyResult = mapper.update(story) == 1;
	
	if(modifyResult && story.getAttachList() != null && story.getAttachList().size() > 0) {
		story.getAttachList().forEach(attach -> {
			attach.setStory_bno(story.getStory_bno());
			attachMapper.insert(attach);
		});
	}
	
	return mapper.update(story) == 1;
	}

	
	@Transactional
	@Override
	public boolean remove(Long story_bno) {
		log.info("remove............." + story_bno);
		
		attachMapper.deleteAll(story_bno);
		
		return mapper.delete(story_bno) == 1;
	}
	
	
	@Override
	public List<StoryVO> getAttachList(Long story_bno) {

		log.info("get Attach list by bno" + story_bno);

		return attachMapper.findByBno(story_bno);
	}



	@Override
	public List<StoryVO> getinfiniteScrollDown(Long story_bnoToStart) {
		return mapper.getinfiniteScrollDown(story_bnoToStart);
	}
	
	
   @Override
   public List<StoryVO> listGet(String cust_id) {
      return mapper.listGet(cust_id);
   }
	
	
	
	
	
	
	
	
	
	
	

}
