package org.jeon.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.jeon.domain.BoardVO;
import org.jeon.domain.ConversationVO;
import org.jeon.domain.Criteria;
import org.jeon.domain.PageMaker;
import org.jeon.domain.ReplyVO;
import org.jeon.domain.SearchCriteria;
import org.jeon.service.BoardService;
import org.jeon.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.mysql.cj.xdevapi.JsonArray;

import lombok.extern.log4j.Log4j;

@Component
@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	@Autowired
	private ReplyService rservice;
	
	@RequestMapping("/list")
	public void boardList(Model model, SearchCriteria cri) {
		
		log.info(cri);
		model.addAttribute("boardlist", service.getListCriteria(cri));
		model.addAttribute("page", cri.getPage());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.getCountPageNum(cri));
		model.addAttribute("pageMaker", pageMaker);
		log.info(cri);
		
	}
	
	@GetMapping("/register")
	public String register() {
		
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(Integer bno, SearchCriteria cri, Model model) {
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("board", service.get(bno));
		
	}
	
	@GetMapping("/modify")
	public String modify(Model model, Integer bno) {
		
		BoardVO board = service.get(bno);
		
		model.addAttribute("board", board);
		
		return "/board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr, SearchCriteria cri) {
		
		service.modify(board);
		
		rttr.addFlashAttribute("bno", board.getBno());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/get?bno=" + board.getBno();
	}

	@GetMapping("/remove")
	public String remove(Integer bno, RedirectAttributes rttr) {
		
		service.remove(bno);
		
		rttr.addFlashAttribute("bno", bno);
		
		return "redirect:/board/list";
	}
	

	@GetMapping("/ajaxTest")
	@Scheduled(cron = "0/1 * * * * *")
	public void ajaxTest() throws IOException {
			
//			String  jsonInString = "";
//			RestTemplate restTemplate = new RestTemplate();
//			ObjectMapper mapper = new ObjectMapper();	
//
//			LocalDate now = LocalDate.now();
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//			String formatedNow = now.format(formatter);
//
//			//URL url = new URL("http://localhost:8080/replies/conversation/2022-07-01/tjdals1122");
//			
//			String url = "http://localhost:8080/replies/conversation/"+formatedNow+"/tjdals1122";
//			HttpHeaders header = new HttpHeaders();
//			HttpEntity<?> entity = new HttpEntity<>(header);
//			UriComponents uri = UriComponentsBuilder.fromHttpUrl(url).build();
//			
//			ResponseEntity<?> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Object.class);
//			
////			result.put("statusCode", resultMap.getStatusCodeValue());
////			result.put("header", resultMap.getHeaders());
////			result.put("body", resultMap.getBody());
//			
//			jsonInString = mapper.writeValueAsString(resultMap.getBody());
//			List<ConversationVO> list = mapper.readValue(jsonInString, new TypeReference<List<ConversationVO>>() {});
//			
//			rservice.conversationListInsert(list);
//			
//			System.out.println("Conversation API 호출 완료");
//			
//		return "/board/ajaxTest";
		
		System.out.println("매초마다 실행");
	}
	
	@GetMapping("/ajaxTest2")
	public String ajaxTest2() {
		
		return "/restBoard/restBoard";

	}
}

























