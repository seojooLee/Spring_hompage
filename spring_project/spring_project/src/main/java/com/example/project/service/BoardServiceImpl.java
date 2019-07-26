package com.example.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.dao.BoardDAO;
import com.example.project.vo.BoardVO;

@Service //빈등록
public class BoardServiceImpl implements BoardService {

	@Inject //주입
	BoardDAO boardDao;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		boardDao.create(vo);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		boardDao.update(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}

		//5-1 전체 목록 보기 
	/*
	 * @Override public List<BoardVO> listAll() throws Exception { return
	 * boardDao.listAll(); }
	 */                                                                                                                                                                                                                                                                                                                 
        
	//검색어를 이용한 목록
	/*
	 * @Override public List<BoardVO> listAll(String searchOption, String keyword)
	 * throws Exception { return boardDao.listAll(searchOption, keyword); }
	 */
	
	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		return boardDao.listAll(start, end, searchOption, keyword);
	
	}
	  


	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno) !=null) {
			update_time=(Long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		if(current_time-update_time > 5*1000) {
			boardDao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return boardDao.countArticle(searchOption, keyword);
  	}

	
}
