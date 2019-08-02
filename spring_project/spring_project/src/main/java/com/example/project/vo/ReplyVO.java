package com.example.project.vo;

import java.sql.Date;

public class ReplyVO {

	// tbl_reply 참조에서 필드 목록
	private  Integer rno; // 댓글번호
	private Integer bno; //게시판 번호
	private String replytext;//댓글내용
	private String replyer;//댓글 작성자
	private Date regdate;// 등록날짜
	private Date updatedate;//수정날짜
	private String userName;//작성자(회원이름)
	
	//댓글 추가 영역 ==> getter/setter. tostring 수정
	private String secretreply;
	private String writer;
	
	
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	 
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
 
	
	public String getSecretreply() {
		return secretreply;
	}
	public void setSecretreply(String secretreply) {
		this.secretreply = secretreply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", userName=" + userName + ", secretreply="
				+ secretreply + ", writer=" + writer + "]";
	}
 
	
	
	//getter / settr ㅓ ㅡ
	
	
}
