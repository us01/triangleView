package com.chain.triangleView.review.review.reviewDao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.vo.Form;
import com.chain.triangleView.review.review.vo.Review;
import com.chain.triangleView.review.review.vo.RwComment;

import static com.chain.triangleView.common.JDBCTemplate.*;

public class ReviewDao {
	private Properties prop = new Properties();
	public ReviewDao(){
		String fileName = ReviewDao.class.getResource("/resources/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Review> logoutMainListSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewList = null;
		
		String query = prop.getProperty("logoutMainHotListSelect");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			reviewList = new ArrayList<Review>();
			
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setTodayRwCount(rset.getInt("todayrwcount"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println("reviewList.size() : " + reviewList.size());
		
		return reviewList;
	}

	public Form loadOneForm(Connection con, int rwNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Form form = null;
		
		String query = prop.getProperty("loadOneForm");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rwNo);
			pstmt.setInt(2, rwNo);
			pstmt.setInt(3, rwNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				form = new Form();
				
				form.setNick(rset.getString("nick"));
				form.setRwHash(rset.getString("rwhash"));
				form.setRwCommentCount(rset.getInt("rwcommentcount"));
				form.setRwLikeCount(rset.getInt("rwlikecount"));
				form.setRwComment(rset.getString("rwcomment"));
				form.setWriteDate(rset.getString("rwwritedate"));
				form.setRwTitle(rset.getString("rwtitle"));
				form.setRwContent(rset.getString("rwcontent"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return form;
	}

	public ArrayList<RwComment> loadOneFormComment(Connection con, int rwNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RwComment> rwComment = null;
		
		String query = prop.getProperty("loadOneFormComment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rwNo);
			rset = pstmt.executeQuery();
			
			rwComment = new ArrayList<RwComment>();
			while(rset.next()){
				RwComment comment = new RwComment();
				
				comment.setCommentContent(rset.getString("commentcontent"));
				if(rset.getInt("parentcommentno") > 0){
					comment.setParentCommentNo(true);
				}else{
					comment.setParentCommentNo(false);
				}
				comment.setRwDate(rset.getString("rwdate"));
				comment.setUserNo(rset.getInt("userNo"));
				comment.setNick(rset.getString("nick"));
				
				rwComment.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rwComment;
	}

	public ArrayList<Review> selectInterestReview(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewList = null;
		
		String query = prop.getProperty("selectInterestReview");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			reviewList = new ArrayList<Review>();
			
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				reviewList.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewList;
	}

	public ArrayList<Review> searchHashSelect(Connection con, String searchHash) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> searchReviewList = null;
		
		String query = prop.getProperty("searchHash");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchHash);
			
			rset = pstmt.executeQuery();
			
			searchReviewList = new ArrayList<Review>();
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				searchReviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchReviewList;
	}
	
	public int write2Review(Connection con, Review rw, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWrite2Review");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, rw.getCategoryType());
			pstmt.setString(3, rw.getRwContent());
			pstmt.setString(4, rw.getRwTitle());
			pstmt.setString(5, rw.getRwHash());
			pstmt.setString(6, rw.getRwComment());
			pstmt.setDouble(7, rw.getRwGrade());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int write3Review(Connection con, Review rw, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWrite3Review");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, rw.getCategoryType());
			pstmt.setString(3, rw.getRwContent());
			pstmt.setString(4, rw.getRwTitle());
			pstmt.setString(5, rw.getRwHash());
			pstmt.setString(6, rw.getRwComment());
			pstmt.setDouble(7, rw.getRwGrade());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

}
