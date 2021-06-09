package com.bteam.violet.service;

import java.util.List;

import com.bteam.violet.domain.Criteria;
/*import com.bteam.violet.domain.ReplyPageDTO;*/
import com.bteam.violet.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);

	public ReplyVO get(Long reply_rno);

	public int modify(ReplyVO vo);

	public int remove(Long reply_rno);

	public List<ReplyVO> getList(Criteria cri, Long story_bno);
	

}
