package com.chain.triangleView.review.review.service;

import com.chain.triangleView.member.member.memberDao.MemberDao;
import com.chain.triangleView.member.member.vo.Attachment;
import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.reviewDao.ReviewDao;
import com.chain.triangleView.review.review.vo.Form;
import com.chain.triangleView.review.review.vo.Review;
import com.chain.triangleView.review.review.vo.RwComment;

import static com.chain.triangleView.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ReviewService {
	
	public ArrayList<Review> logoutMainListSelect() {
		Connection con = getConnection();
		
		ArrayList<Review> reviewList = null;
		reviewList = new ReviewDao().logoutMainListSelect(con);
		
		close(con);
		
		return reviewList;
	}

	public HashMap<String, Object> loadOneRevie(int rwNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> reviewForm = null;
		Form form = new ReviewDao().loadOneForm(con, rwNo);
		
		if(form != null){
			ArrayList<RwComment> rwComment = new ReviewDao().loadOneFormComment(con, rwNo);
			
			reviewForm = new HashMap<String, Object>();
			
			reviewForm.put("form", form);
			reviewForm.put("rwComment", rwComment);
			
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return reviewForm;
	}

	public ArrayList<Review> selectInterestReview(int userNo) {
		Connection con = getConnection();
		
		ArrayList<Review> reviewList = null;
		reviewList = new ReviewDao().selectInterestReview(con, userNo);
		
		close(con);
		
		return reviewList;
	}

	public ArrayList<Review> searchHashSelect(String searchHash) {
		Connection con = getConnection();
		
		ArrayList<Review> searchReviewList = new ReviewDao().searchHashSelect(con, searchHash);
		
		close(con);
		
		return searchReviewList;
	}
	
	public int write2Review(Review rw, Member m, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new ReviewDao().write2Review(con,rw,m);
		int result2 = 0;

		if(fileList != null){
			
			result2 = new ReviewDao().insertWrite2Attachment(con,fileList,m);
		}
		
		if(result1 > 0 && result2>0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int write3Review(Review rw, Member m, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new ReviewDao().write3Review(con,rw,m);
		int result2 = 0;

		if(fileList != null){
			
			result2 = new ReviewDao().insertWrite3Attachment(con,fileList,m);
		}
		
		if(result1 > 0 && result2>0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Review> userHomeReviewSelect(String userId) {
		Connection con = getConnection();
		
		ArrayList<Review> userReviewList = new ReviewDao().userHomeReviewSelect(con, userId);
		
		close(con);
		
		return userReviewList;
	}

	public int addComment(int rwNo, int commentNo, int userNo, String commentContent) {
		Connection con = getConnection();
			
		int result = new ReviewDao().addComment(con, rwNo, commentNo, userNo, commentContent);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int write1Review(Review rw, Member m, ArrayList<Attachment> fileList, String resultHash) {
		Connection con = getConnection();
		
		int result = 0;
		int result1 = new ReviewDao().write1Review(con,rw,m);
		int result2 = 0;
		int result3 = 0;
		
		if(result1 > 0){
			/*int rwNo = new Review().reviewNoCheck(con, rw);*/
			Review rwNoCheck = new ReviewDao().reviewNoCheck(con, m);
			System.out.println("두번쨰체크 : " + rwNoCheck);
			result3 = new ReviewDao().insertHashtag(con,rwNoCheck,resultHash);
		}
		
		if(fileList != null){
			
			result2 = new ReviewDao().insertWrite1Attachment(con,fileList,m);
		}
		
			
		if(result1 > 0 && result2>0 && result3>0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		

		close(con);

		return result;
	
	}
	
}	
