package org.jeon.service;

import java.util.List;

import org.jeon.domain.ConversationVO;
import org.jeon.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(int bno);
	
	public void modifyReply(ReplyVO vo);
	
	public void removeReply(int rno);

	public List<ConversationVO> conversation(String date, String userId);
	
	public void conversationListInsert(List<ConversationVO> list);
}
