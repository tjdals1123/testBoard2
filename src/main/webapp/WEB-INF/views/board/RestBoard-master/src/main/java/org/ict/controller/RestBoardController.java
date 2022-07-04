package org.ict.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.Media;

import org.ict.domain.BoardVO;
import org.ict.domain.Criteria;
import org.ict.domain.PageMaker;
import org.ict.domain.SearchCriteria;
import org.ict.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/board/*")
public class RestBoardController {

	@Autowired
	BoardService service;
	
	@GetMapping(value="/list"  ,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BoardVO>> list() {
		
		ResponseEntity<List<BoardVO>> entity = null;
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			
			list = service.list();
			entity = new ResponseEntity<List<BoardVO>>(list, HttpStatus.OK);
			
			
		} catch(Exception e){
			entity = new ResponseEntity<List<BoardVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping(value="/register", consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody BoardVO board) {
		
		ResponseEntity<String> entity = null;
		try {
			service.insert(board);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
	
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping(value="/get/{bno}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<BoardVO> read(@PathVariable("bno") Long bno) {
		
		
		BoardVO board;
		
		ResponseEntity<BoardVO> entity = null;
		
		try {
			
			board = service.read(bno);
			
			entity = new ResponseEntity<BoardVO>(board, HttpStatus.OK);
			
			
		}catch(Exception e) {
			
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value="/delete/{bno}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> remove(@PathVariable("bno") Long bno) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.remove(bno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping(value="/modify", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE}
					,consumes="application/json")
	public ResponseEntity<String> modify( @RequestBody BoardVO board){
		
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.modify(board);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping(value="/list/{page}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> listCriteria(@PathVariable("page")int page) {
		
		Criteria cri = new Criteria();
		
		cri.setPage(page);
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<BoardVO> list = service.listCriteria(cri);
		
		result.put("list", list);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		pageMaker.setTotalBoard(service.totalcount());
		
		result.put("pageMaker", pageMaker);
		
		log.info(pageMaker);
		try {
			
			entity = new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
			
		} catch(Exception e) {
			
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		 
		return entity;
	}
	
	@GetMapping(value="list/{page}/{searchType}/{keyword}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> listSearch(@PathVariable("page") int page,
															@PathVariable("searchType") String searchType,
															@PathVariable("keyword") String keyword) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> result = new HashMap<>();
		
		Criteria cri = new Criteria();
		
		cri.setPage(page);
		
		
		SearchCriteria search = new SearchCriteria();

		
		search.setSearchType(searchType);
		
		search.setKeyword(keyword);
		
		List<BoardVO> list = service.listSearch(cri, searchType, keyword);
		
		
		
		int count = service.searchCountPage(search);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		pageMaker.setTotalBoard(count);
		
		result.put("list", list);
		result.put("search", search);
		result.put("pageMaker", pageMaker);
		try {
			
			entity = new ResponseEntity<Map<String,Object>>(result, HttpStatus.OK);
		} catch(Exception e) {
			
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}
	
}




























