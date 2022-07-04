package org.jeon.service;

import java.util.List;


import org.jeon.domain.BoardVO;
import org.jeon.domain.ConversationVO;
import org.jeon.domain.Criteria;
import org.jeon.domain.SearchCriteria;
import org.jeon.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		 
		return mapper.boardList();
	}

	@Override
	public void register(BoardVO board) {

		mapper.insert(board);
	}

	@Override
	public BoardVO get(Integer bno) {
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Integer bno) {
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getListCriteria(SearchCriteria cri) {
		
		return mapper.listPage(cri);
	}

	@Override
	public int getCountPageNum(SearchCriteria cri) {
		
		return mapper.countPageNum(cri);
	}



}


