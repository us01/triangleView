package com.chain.triangleView.userHome.userHome.service;

import com.chain.triangleView.userHome.userHome.userHomeDao.UserHomeDao;
import com.chain.triangleView.userHome.userHome.vo.HomeMember;
import com.chain.triangleView.userHome.userHome.vo.HomeReview;

import static com.chain.triangleView.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class UserHomeService {

	public HomeMember UserMemberSelect(String userId, String meId) {
		Connection con = getConnection();
		
		HomeMember member = new UserHomeDao().UserMemberSelect(con, userId, meId);
		
		close(con);
		
		return member;
	}

	public ArrayList<HomeReview> UserReviewSelect(String nick) {
		Connection con = getConnection();
		
		ArrayList<HomeReview> reviews = new UserHomeDao().UserReviewSelect(con, nick);
		
		close(con);
		
		return reviews;
	}
	
}
