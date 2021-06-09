package com.bteam.violet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.bteam.violet.domain.Criteria;
import com.bteam.violet.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(Long story_bno);

	public int delete(Long story_bno);

	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("story_bno") Long story_bno);

	
}
