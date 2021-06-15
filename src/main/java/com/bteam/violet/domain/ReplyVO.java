package com.bteam.violet.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long reply_rno;
	private Long story_bno;
	private String reply;
	private String cust_id;
	private Date reply_regdate;
	private Date reply_updatedate;

}
