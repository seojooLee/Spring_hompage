package com.example.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.dao.MemberDAOImpl;
import com.example.project.vo.MemberVO;

@Service //service빈으로 등록
public class MemberServiceImpl implements MemberService {
	
	@Inject //주입
	MemberDAOImpl memberDao;

	@Override
	public List<MemberVO> memberList() {
		return memberDao.memberList();
	}

	@Override
	public void insertMember(MemberVO vo) {
		memberDao.insertMember(vo);

	}

	@Override
	public MemberVO viewMember(String userId) {
		return memberDao.viewMember(userId);
	}

	@Override
	public void deleteMember(String userId) {
		memberDao.deletemember(userId);
 
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);
	}

	@Override
	public boolean checkPw(String userId, String userPw) {
		return memberDao.checkPw(userId, userPw);
		
 	}

}
