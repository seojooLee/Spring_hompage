package com.example.project.vo;

import java.util.Date;

public class BoardVO {
	//사용할 데이터 정보 관리 ==> 테이블의 필드 목록만큼 만듬
	
	private int bno; //글번호
	private String title; //글제목
	private String content; //글내용
	private String writer; //작성자
	private Date regdate; //작성날짜
	private int viewcnt; //조회수 ==> getter/setter 추가
	private String userName; // 사용자 이름
	private int recnt;//게시판 글 옆에 댓글 갯수 표시
	//getter/setter
	//toString 자동추가 ==>
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserName() {
		return userName;
	}
	
	
	
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", userName=" + userName + "]";
	}
	
	
}
