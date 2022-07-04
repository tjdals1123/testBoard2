package org.ict.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ict.domain.BoardVO;
import org.ict.domain.Criteria;
import org.ict.domain.SearchCriteria;

public interface BoardMapper {

	public List<BoardVO> list();
	
	public List<BoardVO> listCriteria(Criteria cri);
	
	public void modify(BoardVO board);
	
	public void insert(BoardVO board);
	
	public void remove(Long bno);

	public BoardVO read(Long bno);
	
	public int totalcount();

	public List<BoardVO> listSearch(@Param("cri")Criteria cri
									, @Param("searchType") String searchType 
									, @Param("keyword") String keyword);

	public int searchCountPage(SearchCriteria search);
}
