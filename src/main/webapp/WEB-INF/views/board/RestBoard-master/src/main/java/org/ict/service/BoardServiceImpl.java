package org.ict.service;

import java.util.List;

import org.ict.domain.BoardVO;
import org.ict.domain.Criteria;
import org.ict.domain.SearchCriteria;
import org.ict.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
	
@Service	
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> list() {
		return mapper.list();
		
	}

	@Override
	public void modify(BoardVO board) {
		
		mapper.modify(board);
	}

	@Override
	public void insert(BoardVO board) {

		mapper.insert(board);
	}

	@Override
	public void remove(Long bno) {
		
		mapper.remove(bno);
	}

	@Override
	public BoardVO read(Long bno) {
		
		return mapper.read(bno);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) {
		
		return mapper.listCriteria(cri);
	}

	@Override
	public int totalcount() {
		return mapper.totalcount();
	}

	@Override
	public List<BoardVO> listSearch(Criteria cri, String searchType, String keyword) {
		return mapper.listSearch(cri, searchType, keyword);
	}

	@Override
	public int searchCountPage(SearchCriteria search) {
		return mapper.searchCountPage(search);
	}

}
