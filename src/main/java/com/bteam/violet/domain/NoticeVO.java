package com.bteam.violet.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private Long notice_bno;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private Date regdate;
	private int hit;

}
