package org.jeon.controller;

import java.util.List;

import org.jeon.domain.ConversationVO;
import org.jeon.domain.ReplyVO;
import org.jeon.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	private ReplyService service;
	

	@PostMapping(value="", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.addReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping(value="/all/{bno}", produces = {MediaType.APPLICATION_XML_VALUE,
											MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") int bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try {
			
			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	
	}
	
	@GetMapping(value="/conversation/{date}/{userId}", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ConversationVO>> conversation(@PathVariable("date") String date, @PathVariable("userId") String userId){
	
	ResponseEntity<List<ConversationVO>> entity = null;
	
	try {
	
	entity = new ResponseEntity<>(service.conversation(date, userId), HttpStatus.OK);
	
	} catch(Exception e) {
	
	e.printStackTrace();
	entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	return entity;

}
	
	@DeleteMapping(value="/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(
			@PathVariable("rno") int rno){
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(rno);
			entity = 
				new ResponseEntity<String>(
						"SUCCESS", HttpStatus.OK);
		} catch(Exception e ) {
			e.printStackTrace();
			entity = 
				new ResponseEntity<>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(method= {RequestMethod.PUT, 
							RequestMethod.PATCH},
				value= "/{rno}",
				consumes="application/json",
				produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(
		@RequestBody ReplyVO vo, @PathVariable("rno") int rno){
		
		ResponseEntity<String> entity = null;
		
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			entity = 
				new ResponseEntity<String>(
						"SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	