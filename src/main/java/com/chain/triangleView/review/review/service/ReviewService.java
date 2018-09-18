package com.chain.triangleView.review.review.service;

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
	
}	
