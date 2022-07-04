package org.jeon.mapper;

import java.util.List;

import org.jeon.domain.BoardVO;
import org.jeon.domain.Criteria;
import org.jeon.domain.SearchCriteria;

public interface BoardMapper {

	public List<BoardVO> boardList();

	public void insert(BoardVO board);

	public BoardVO read(Integer bno);

	public int update(BoardVO board);

	public int delete(Integer bno);

	public List<BoardVO> listPage(SearchCriteria cri);

	public int countPageNum(SearchCriteria cri);
} 
