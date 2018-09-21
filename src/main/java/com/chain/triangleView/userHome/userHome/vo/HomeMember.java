package com.chain.triangleView.userHome.userHome.vo;

public class HomeMember {
	private int userNo;    //회원번호
	private String userId;  //회원아이디
	private String nick;    //회원닉네임
	private int reviewCount; //게시글 수
	private int followCount; //팔로우 수
	private int followingCount; //팔로워 수
	private int userType; //유저타입(일반/기업)   
	private String intro;   //자기소개
	
	public HomeMember() {
		super();
	}

	public HomeMember(int userNo, String userId, String nick, int reviewCount, int followCount, int followingCount,
			int userType, String intro) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.nick = nick;
		this.reviewCount = reviewCount;
		this.followCount = followCount;
		this.followingCount = followingCount;
		this.userType = userType;
		this.intro = intro;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getFollowCount() {
		return followCount;
	}

	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}

	public int getFollowingCount() {
		return followingCount;
	}

	public void setFollowingCount(int followingCount) {
		this.followingCount = followingCount;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", nick=" + nick + ", reviewCount=" + reviewCount
				+ ", followCount=" + followCount + ", followingCount=" + followingCount + ", userType=" + userType
				+ ", intro=" + intro + "]";
	}

}