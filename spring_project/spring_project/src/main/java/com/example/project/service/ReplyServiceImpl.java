package com.example.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.dao.ReplyDAO;
import com.example.project.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	//주입
	@Inject
	ReplyDAO replyDao;
	
	/*
	 * @Override public List<ReplyVO> list(Integer bno, HttpSession session); return
	 * replyDao.list(bno); }
	 */ 
	

	@Override
	public void create(ReplyVO vo) {
		 replyDao.create(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}

	@Override
	public void delete(Integer rno) {
		replyDao.delete(rno);
		
 		
	}

	@Override
	public List<ReplyVO> list(Integer bno, HttpSession session) {
		List<ReplyVO> items = replyDao.list(bno);
		String userId = (String) session.getAttribute("userId");
		for(ReplyVO vo : items) {
			if(vo.getSecretreply().equals("y")) {
				if(userId == null) {
					vo.setReplytext("비밀댓글");
				}else { 
					String writer = vo.getWriter();
					String replyer = vo.getReplyer();
					
					if(!userId.equals(writer)&&!userId.equals(replyer)) {
						vo.setReplytext("비밀댓글");
					}
				}
			}
		}
 		return items;
	}

}
