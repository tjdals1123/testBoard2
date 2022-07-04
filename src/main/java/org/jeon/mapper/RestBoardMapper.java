package org.jeon.mapper;

import java.util.List;

import org.jeon.domain.BoardVO;
import org.jeon.domain.Criteria;

public interface RestBoardMapper {
	
	public List<BoardVO> RestBoardList(Criteria cri);

}
