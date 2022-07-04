package org.jeon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jeon.domain.ConversationVO;
import org.jeon.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> getList(int bno);
	
	public void create(ReplyVO vo);
	
	public void update(ReplyVO vo);
	
	public void delete(int rno);

	public List<ConversationVO> conversationList(@Param("date") String date, @Param("userId") String userId);

	public void conversationListInsert(List<ConversationVO> list);
}
