package com.chain.triangleView.review.review.vo;

import java.io.Serializable;

public class Form implements Serializable{
	private String rwContent;
	private String writeDate;
	private String rwComment; 
	private String rwTitle;
	private int rwLikeCount;
	private int rwCommentCount;
	private String rwHash;
	private String nick;
	private int rwNo;
	
	public Form() {
		super();
	}

	public Form(String rwContent, String writeDate, String rwComment, String rwTitle, int rwLikeCount,
			int rwCommentCount, String rwHash, String nick, int rwNo) {
		super();
		this.rwContent = rwContent;
		this.writeDate = writeDate;
		this.rwComment = rwComment;
		this.rwTitle = rwTitle;
		this.rwLikeCount = rwLikeCount;
		this.rwCommentCount = rwCommentCount;
		this.rwHash = rwHash;
		this.nick = nick;
		this.rwNo = rwNo;
	}

	public String getRwContent() {
		return rwContent;
	}

	public void setRwContent(String rwContent) {
		this.rwContent = rwContent;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getRwComment() {
		return rwComment;
	}

	public void setRwComment(String rwComment) {
		this.rwComment = rwComment;
	}

	public String getRwTitle() {
		return rwTitle;
	}

	public void setRwTitle(String rwTitle) {
		this.rwTitle = rwTitle;
	}

	public int getRwLikeCount() {
		return rwLikeCount;
	}

	public void setRwLikeCount(int rwLikeCount) {
		this.rwLikeCount = rwLikeCount;
	}

	public int getRwCommentCount() {
		return rwCommentCount;
	}

	public void setRwCommentCount(int rwCommentCount) {
		this.rwCommentCount = rwCommentCount;
	}

	public String getRwHash() {
		return rwHash;
	}

	public void setRwHash(String rwHash) {
		this.rwHash = rwHash;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getRwNo() {
		return rwNo;
	}

	public void setRwNo(int rwNo) {
		this.rwNo = rwNo;
	}

	@Override
	public String toString() {
		return "Form [rwContent=" + rwContent + ", writeDate=" + writeDate + ", rwComment=" + rwComment + ", rwTitle="
				+ rwTitle + ", rwLikeCount=" + rwLikeCount + ", rwCommentCount=" + rwCommentCount + ", rwHash=" + rwHash
				+ ", nick=" + nick + ", rwNo=" + rwNo + "]";
	}

}
