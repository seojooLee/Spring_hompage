package com.example.project.dao;

import java.util.List;

import com.example.project.vo.MemberVO;

public interface MemberDAO {
	//회원목록
	public List<MemberVO> memberList();
	
	//회원등록
	public void insertMember(MemberVO vo);
	
	//회원상세보기
	public MemberVO viewMember(String userId);
	
	
	//회원삭제
	public void deletemember(String userId);
	
	//회원수정	
	public void updateMember(MemberVO vo);
	
	//회원삭제시 아이디와 비번 일치시에 삭제
	public boolean checkPw(String userId, String userPw);
}
