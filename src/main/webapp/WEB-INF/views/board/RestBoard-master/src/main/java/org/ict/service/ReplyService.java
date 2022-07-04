package org.ict.service;

import java.util.List;

import org.ict.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(int bno);
	
	public void removeReply(int rno);
	
	public void modifyReply(ReplyVO vo);
	
}
