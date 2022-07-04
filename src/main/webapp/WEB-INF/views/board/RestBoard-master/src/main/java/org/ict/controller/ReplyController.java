package org.ict.controller;

import java.util.List;

import org.ict.domain.ReplyVO;
import org.ict.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	@PostMapping(value="" , consumes = "application/json"
					, produces = {MediaType.TEXT_PLAIN_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		
		log.info(vo);
		
		ResponseEntity<String> entity = null;
		
		try {
			service.addReply(vo);
			entity =new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@PostMapping(value="/all/{bno}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
												MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> list (@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		List<ReplyVO> list = service.listReply(bno);
		log.info(list);
		try {
			entity = new ResponseEntity<>(
					list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		log.info(entity);
		return entity;
	}
	
	@DeleteMapping(value ="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete (@PathVariable("rno")Integer rno) {
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH},
					consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") int rno){
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	

}













