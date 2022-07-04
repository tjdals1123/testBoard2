package org.jeon.service;

import java.util.List;

import org.jeon.domain.ConversationVO;
import org.jeon.domain.ReplyVO;
import org.jeon.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;

	@Override
	public void addReply(ReplyVO vo) {
		
		mapper.create(vo);
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		
		return mapper.getList(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) {

		mapper.update(vo);
	}

	@Override
	public void removeReply(int rno) {

		mapper.delete(rno);
	}

	@Override
	public List<ConversationVO> conversation(String date,String userId) {
		
		return mapper.conversationList(date,userId);
	}

	@Override
	public void conversationListInsert(List<ConversationVO> list) {
		
		mapper.conversationListInsert(list);
	}
	
	
	
}
