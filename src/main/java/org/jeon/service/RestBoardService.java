package org.jeon.service;

import java.util.List;

import org.jeon.domain.BoardVO;
import org.jeon.domain.Criteria;
import org.springframework.stereotype.Service;

public interface RestBoardService {
	
	public List<BoardVO> RestBoardList(Criteria cri);

}
