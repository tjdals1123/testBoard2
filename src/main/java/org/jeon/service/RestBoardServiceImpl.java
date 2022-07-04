package org.jeon.service;

import java.util.List;

import org.jeon.domain.BoardVO;
import org.jeon.domain.Criteria;
import org.jeon.mapper.RestBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestBoardServiceImpl implements RestBoardService{

	@Autowired
	private RestBoardMapper mapper;
	
	@Override
	public List<BoardVO> RestBoardList(Criteria cri) {
		
		return mapper.RestBoardList(cri);
	}

	
}
