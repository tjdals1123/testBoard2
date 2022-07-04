package org.jeon.domain;

import lombok.Data;

@Data
public class UserVO {

	private String id;
	private String pw;
	private String userName;
	
	public String toString() {
		return "UserVO [Id = " + id + ",Pw = " + pw + ",UserName = " + userName + "]";
	}
}
