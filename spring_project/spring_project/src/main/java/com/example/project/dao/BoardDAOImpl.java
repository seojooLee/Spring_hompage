package com.example.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.vo.BoardVO;

@Repository //db에 접근할 수 있는 빈 등록
public class BoardDAOImpl implements BoardDAO {
	
	@Inject //주입
	SqlSession sqlSession;
		
	
	
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert("board.insert", vo);

	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("board.view", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update("board.updateArticle", vo);

	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("board.deleteArticle", bno);

	}

	/*
	 * @Override public List<BoardVO> listAll() throws Exception { return
	 * sqlSession.selectList("board.listAll"); }
	 */
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("board.increaseViewcnt", bno);

	}

	@Override
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
 		
		Map<String, String> map = new HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		return sqlSession.selectList("board.listAll",map);
		 
	}

	 
	   @Override 
		public int countArticle(String searchOption, String keyword) throws Exception{
		   
		   Map<String, String> map = new HashMap<String, String>();
		   map.put("searchOption", searchOption);
		   map.put("keyword", keyword);
		   return sqlSession.selectOne("board.countArticle",map);
		   
 		   
	   }
	 

}
