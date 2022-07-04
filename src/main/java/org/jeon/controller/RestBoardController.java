package org.jeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jeon.domain.BoardVO;
import org.jeon.domain.Criteria;
import org.jeon.service.RestBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/restboard")
public class RestBoardController {
	
	@Autowired
	private RestBoardService service;
	
	@GetMapping(value = "/restList/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String,Object>> boardList(@PathVariable("page") int page)  {
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		Map<String,Object> result = new HashMap<String, Object>();;
		
		Criteria cri = new Criteria();
		
		cri.setPage(page);
		
		List<BoardVO> list = service.RestBoardList(cri);
		
		try {
			
		entity = new ResponseEntity<Map<String,Object>>(result, HttpStatus.OK);
		
		} catch(Exception e) {
			
			e.printStackTrace();
			
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		
		return entity;
	}
}

















