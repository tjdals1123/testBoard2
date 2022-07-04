package org.jeon.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private String writer;
	private String content;
	private String title;
	private Date regdate;
	private Date updatedate;
}
