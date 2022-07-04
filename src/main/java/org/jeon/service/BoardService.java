package org.jeon.service;

import java.util.List;

import org.jeon.domain.BoardVO;
import org.jeon.domain.ConversationVO;
import org.jeon.domain.Criteria;
import org.jeon.domain.SearchCriteria;


public interface BoardService {
	
	public List<BoardVO> getList();

	public void register(BoardVO board);

	public BoardVO get(Integer bno);

	public boolean modify(BoardVO board);

	public boolean remove(Integer bno); 
	
	public List<BoardVO> getListCriteria(SearchCriteria cri);
	
	public int getCountPageNum(SearchCriteria cri);
	
}
