package org.ict.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board/")
public class BaordController {

	@RequestMapping("/list")
		public void list() {
		
	}
	
	@RequestMapping("/register")
	public void register(){
		
	}
	
	@RequestMapping("/get")
	public String get() {
		
		return "/board/get";
	}
	
	@RequestMapping("/modify")
	public void modify() {
		
	}
	

}
