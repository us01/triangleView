package com.chain.triangleView.review.review.vo;

import java.io.Serializable;
import java.sql.Date;

public class RwComment implements Serializable{
	private String commentContent;
	private Boolean parentCommentNo;
	private String rwDate;
	private int userNo;
	private String nick;
	
	public RwComment() {
		super();
	}

	public RwComment(String commentContent, Boolean parentCommentNo, String rwDate, int userNo, String nick) {
		super();
		this.commentContent = commentContent;
		this.parentCommentNo = parentCommentNo;
		this.rwDate = rwDate;
		this.userNo = userNo;
		this.nick = nick;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Boolean getParentCommentNo() {
		return parentCommentNo;
	}

	public void setParentCommentNo(Boolean parentCommentNo) {
		this.parentCommentNo = parentCommentNo;
	}

	public String getRwDate() {
		return rwDate;
	}

	public void setRwDate(String rwDate) {
		this.rwDate = rwDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "RwComment [commentContent=" + commentContent + ", parentCommentNo=" + parentCommentNo + ", rwDate="
				+ rwDate + ", userNo=" + userNo + ", nick=" + nick + "]";
	}
	
}
