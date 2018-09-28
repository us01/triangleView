package com.chain.triangleView.review.review.service;

import com.chain.triangleView.member.member.vo.Attachment;
import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.reviewDao.ReviewDao;
import com.chain.triangleView.review.review.vo.CardFormImages;
import com.chain.triangleView.review.review.vo.Form;
import com.chain.triangleView.review.review.vo.Review;
import com.chain.triangleView.review.review.vo.RwComment;

import static com.chain.triangleView.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

public class ReviewService {
	
	public ArrayList<Review> logoutMainListSelect() {
		Connection con = getConnection();
		
		ArrayList<Review> reviewList = null;
		reviewList = new ReviewDao().logoutMainListSelect(con);
		
		close(con);
		
		return reviewList;
	}

	public HashMap<String, Object> loadOneRevie(int rwNo, int userNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> reviewForm = new HashMap<String, Object>();
		ArrayList<CardFormImages> cardImageList = null;
		Form form = new ReviewDao().loadOneForm(con, rwNo, userNo);
		
		if(form != null){
			reviewForm.put("form", form);
			
			if(form.getRwContentType() == 1){
				cardImageList = new ReviewDao().loadOneFormCardImg(con, rwNo);
				
				if(cardImageList != null){
					reviewForm.put("cardImageList", cardImageList);
				}
			}
			ArrayList<RwComment> rwComment = new ReviewDao().loadOneFormComment(con, rwNo);
			
			reviewForm.put("rwComment", rwComment);
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
	
	public int write2Review(Review rw, Member m, ArrayList<Attachment> fileList, String[] resultHashSplit, String categoryHashResult) {
		Connection con = getConnection();

		int result = 0;
		int result1 = new ReviewDao().write2Review(con,rw,m);
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;

		if(result1 > 0){
			Review rwNoCheck = new ReviewDao().reviewNoCheck(con, m);   

			for(int i =1; i < resultHashSplit.length; i++){
				String resultHash = resultHashSplit[i];
				result3 = new ReviewDao().insertHashtag(con,rwNoCheck,resultHash);
			}
			
			result4 = new ReviewDao().insertHashtag(con,rwNoCheck,categoryHashResult);

			if(fileList != null){
				result2 = new ReviewDao().insertWrite2Attachment(con,fileList,m,rwNoCheck);
			}
		}

		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);

		return result;
	}   

	public int write3Review(Review rw, Member m, ArrayList<Attachment> fileList, String[] resultHashSplit, String categoryHashResult) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new ReviewDao().write3Review(con,rw,m);
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;

		
		if(result1 > 0){
			Review rwNoCheck = new ReviewDao().reviewNoCheck(con, m);	
			for(int i =0; i < resultHashSplit.length; i++){
				String resultHash = resultHashSplit[i];
				result3 = new ReviewDao().insertHashtag(con,rwNoCheck,resultHash);
			}
			result4 = new ReviewDao().insertHashtag(con,rwNoCheck,categoryHashResult);
		}
		
		if(fileList != null){
			
			result2 = new ReviewDao().insertWrite3Attachment(con,fileList,m);
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0){
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

	public int write1Review(Review rw, Member m, ArrayList<Attachment> fileList, String[] resultHashSplit, String categoryHashResult) {
		Connection con = getConnection();
		
		int result = 0;
		int result1 = new ReviewDao().write1Review(con,rw,m);
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		if(result1 > 0){
			Review rwNoCheck = new ReviewDao().reviewNoCheck(con, m);	
			for(int i =1; i < resultHashSplit.length; i++){
				String resultHash = resultHashSplit[i];
				result3 = new ReviewDao().insertHashtag(con,rwNoCheck,resultHash);
			}
			result4 = new ReviewDao().insertHashtag(con,rwNoCheck,categoryHashResult);
		}
		
		if(fileList != null){
			
			result2 = new ReviewDao().insertWrite1Attachment(con,fileList,m);
		}
		
			
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		

		close(con);

		return result;
	
	}

	public ArrayList<RwComment> loadOneFormComment(int rwNo) {
		Connection con = getConnection();
		
		ArrayList<RwComment> rwComment = new ReviewDao().loadOneFormComment(con, rwNo);
		
		close(con);
		
		return rwComment;
	}	
}	
