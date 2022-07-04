package org.ict.domain;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private String updatedate;
	
}
