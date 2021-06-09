package com.bteam.violet.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class StoryVO {
	
	private Long story_bno;
	private String story_text;
	private String cust_id;
	private Date story_regdate;
	private Date story_updatedate;
	
	private List<StoryVO> attachList;
	
    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;
}
