package com.bteam.violet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bteam.violet.domain.Criteria;
/*import com.bteam.violet.domain.ReplyPageDTO;*/
import com.bteam.violet.domain.ReplyVO;
import com.bteam.violet.mapper.ReplyMapper;
import com.bteam.violet.mapper.StoryMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

  @Setter(onMethod_= @Autowired)
  private ReplyMapper mapper;
  
  @Setter(onMethod_= @Autowired)
  private StoryMapper storyMapper;

  
  @Transactional
  @Override
  public int register(ReplyVO vo) {

    log.info("register......" + vo);
    

    return mapper.insert(vo);

  }

  @Override
  public ReplyVO get(Long reply_rno) {

    log.info("get......" + reply_rno);

    return mapper.read(reply_rno);

  }

  @Override
  public int modify(ReplyVO vo) {

    log.info("modify......" + vo);

    return mapper.update(vo);

  }

  @Override
  public int remove(Long reply_rno) {

    log.info("remove...." + reply_rno);
    

    return mapper.delete(reply_rno);

  }

  @Override
  public List<ReplyVO> getList(Criteria cri, Long story_bno) {

    log.info("get Reply List of a Board " + story_bno);

    return mapper.getListWithPaging(cri, story_bno);

  }
  


}