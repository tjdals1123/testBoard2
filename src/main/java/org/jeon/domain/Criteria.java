package org.jeon.domain;

import lombok.Data;

@Data
public class Criteria {

	private int page;
	private int number;
	
	 //페이지 * 페이지당 숫자가 실제 limit 구문에 들어갈 시작점이 됨.
	// mybatis는 getter를 가져다 쓸 수 있음.
	
	public Criteria() {
		
		this.page = 1;
		this.number = 10;
	}
	
	public int getPageStart() {
		return (this.page -1) * number;
	}
	
}
